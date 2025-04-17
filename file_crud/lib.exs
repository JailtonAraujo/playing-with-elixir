swith_option = fn option ->
  number = case Integer.parse(option) do
    {int, _rest} -> int
    :error -> nil
  end

  case number do
    1 -> Crud.new()
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

    case IO.puts(file, String.trim("\n#{value}")) do
      :ok ->
        File.close(file)
        IO.puts("Nome salvo com sucesso!")
      {:error, reason} ->
        IO.puts("Falha ao salvar!")
        File.close(file)
    end
  end
end

show_options.();
