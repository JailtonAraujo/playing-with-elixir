swith_option = fn option ->
  number =
    case Integer.parse(option) do
      {int, _rest} -> int
      :error -> nil
    end

  case number do
    1 ->
      Crud.new()

    2 ->
      Crud.list()

    3 ->
      Crud.get_by_name()

    _ ->
      IO.puts("Opção invalida!")
  end
end

show_options = fn ->
  option = IO.gets("
  #### CHOSE OPTION ####
  [1] - NEW
  [2] - LIST
  [3] - GET_BY_NAME
  [4] - REMOVE
  >>> ")
  swith_option.(option)
end

defmodule Crud do
  defp exists(name) do
    file_path = "db"

    case File.read(file_path) do
      {:ok, body} ->
        records = String.split(body, "\n") |> Enum.filter(fn row -> row != "" end)
        found_record = Enum.find(records, &(&1 == name))

        if is_nil(found_record) do
          false
        else
          true
        end

      {:error} ->
        IO.puts("Falha ao carregar registros")
    end
  end

  def new do
    value = IO.gets("Digite o nome: ")

    if exists(String.trim(value)) do
      IO.puts("Nome já existe: #{value}")
    else
      file_path = "db"
      {:ok, file} = File.open(file_path, [:append])

      case IO.write(file, value) do
        :ok ->
          File.close(file)
          IO.puts("Nome salvo com sucesso!")

        {:error, reason} ->
          IO.puts("Falha ao salvar!")
          IO.inspect(reason)
          File.close(file)
      end
    end
  end

  def list do
    file_path = "db"

    case File.read(file_path) do
      {:ok, body} ->
        String.split(body, "\n")
        |> Enum.filter(fn row -> row != "" end)
        |> Enum.each(fn row -> IO.puts(row) end)

      {:error, reason} ->
        IO.puts("Falha ao listar registro!")
        IO.inspect(reason)
    end
  end

  def get_by_name do
    file_path = "db"
    value = IO.gets("Insira o nome a pesquisar:") |> String.trim()

    case File.read(file_path) do
      {:ok, body} ->
        records = String.split(body, "\n") |> Enum.filter(fn row -> row != "" end)
        found_record = Enum.find(records, &(&1 == value))

        if is_nil(found_record) do
          IO.puts("Registro não encontrado com nome: #{value}")
        else
          IO.puts("Nome encontrado: #{found_record}")
        end

      {:error} ->
        IO.puts("Falha ao carregar registros")
    end
  end
end

show_options.()
