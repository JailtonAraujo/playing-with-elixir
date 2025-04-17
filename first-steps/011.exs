#The File module contains functions that allow us to open files as IO devices.
#By default, files are opened in binary mode, which requires developers to use the
#specific IO.binread/2 and IO.binwrite/2 functions from the IO module:

defmodule Recursion do
  def percorrer([head | tail]) do
    {_key, value} = head;
    IO.inspect(value);
    percorrer(tail)
  end

  def percorrer([]) do :ok end
end

peoples = [
  jailton: %{name: "Jailton", age: 25},
  fausto: %{name: "fausto", age: 29}
]

Recursion.percorrer(peoples)

{:ok, file} = File.open("file", [:write])
IO.puts(file, "Jailton")
IO.puts(file, "Marco")
IO.puts(file, "vini")
File.close(file)
File.read("file")
