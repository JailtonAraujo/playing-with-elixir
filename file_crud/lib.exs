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
    4 ->
      Crud.delete()
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

  def delete do
    file_path = "db";
    name = IO.gets("Informe o nome a deletar: ") |> String.trim()

    if (exists(name)) do
      case File.read(file_path) do
        {:ok, body} ->
          records = String.split(body, "\n") |> Enum.filter(fn row -> row != "" end)
          record_to_delete = Enum.find(records, &(&1 == name));

          if (is_nil(record_to_delete)) do
            IO.puts("Nome não encontrado: #{record_to_delete}")
          else
            new_rocords = Enum.filter(records, fn row -> row != record_to_delete end);
            {:ok, file} = File.open(file_path, [:write]);
            File.close(file);
            {:ok, file} = File.open(file_path, [:append]);
            Enum.join(new_rocords, "\n") |> (fn records_split -> IO.puts(file, records_split) end).()
            #Enum.each(new_rocords, fn row -> IO.write(file, row) end);
            IO.puts("Deletado com sucesso!");
          end
        {:error} ->
          IO.puts("Falha ao carregar registros!")
      end
    else
      IO.puts("Nome não encontrado: #{name}")
    end
  end
end

show_options.()
