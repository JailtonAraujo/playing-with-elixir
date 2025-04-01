defmodule Math do
  def sum(a, b) do
    do_som(a, b)
  end

  defp do_som(a, b) do
    a + b
  end

  def is_valid(number) do
    is_integer(number) && number <= 20
  end
end

IO.puts Math.sum(2, 3)
IO.puts Math.is_valid(25)
