

show_options = fn  ->
  IO.gets("
  #### CHOSE OPTION ####
  [1] - NEW
  [2] - LIST
  [3] - GET_BY_NAME
  [4] - REMOVE
  >>> ")
end

defmodule Crud do
  def new (value) do
    file_path = "db"
    {:ok, file} = File.open("db", [:append]);
    IO.puts(file, value)
    File.close(file)
  end
end

opition = show_options.();
