swith_option = fn option ->
  number = case Integer.parse(option) do
    {int, _rest} -> int
    :error -> nil
  end

  case number do
    1 -> Crud.new()
    2 -> Crud.list()
    _ ->
      IO.puts("Opção invalida!")
  end
end


show_options = fn  ->
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
  def new do
    value = IO.gets("Digite o nome: ")
    file_path = "db"
    {:ok, file} = File.open(file_path, [:append]);

    case IO.write(file, value) do
      :ok ->
        File.close(file)
        IO.puts("Nome salvo com sucesso!")
      {:error, reason} ->
        IO.puts("Falha ao salvar!")
        File.close(file)
    end
  end

  def list do
    file_path = "db"
    case File.read(file_path) do
      {:ok, body} ->
        IO.inspect(String.split(body, "\n") |> Enum.filter(fn row -> row != "" end))
      {:error, reason} -> IO.puts("Falha ao listar registro!")
    end
  end
end

show_options.();
