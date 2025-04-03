# Recursion #
#Elixir does not provide loop constructs. Instead we leverage recursion and high-level functions for working with collections. This chapter will explore the former.

defmodule Recursion do
  def print_multiple_time(msg, n) when n > 0 do
    IO.puts(msg);
    print_multiple_time(msg, n - 1)
  end

  def print_multiple_time(_msg, 0) do
    :ok
  end
end

Recursion.print_multiple_time("Hello World", 3);

defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

IO.puts Math.sum_list([1,2,3], 0)
IO.inspect Math.double_each([1,2,3])

#The Enum module, which we're going to see in the next chapter already provides many conveniences for working with lists. For instance, the examples above could be written as:

IO.puts Enum.reduce([1,2,3], 2, fn x, acc -> x + acc end)

IO.inspect Enum.map([1,2,3], fn x -> x * 2 end)

#Or, using the capture syntax:

IO.puts Enum.reduce([1,2,3], 0, &+/2)

IO.inspect Enum.map([1,2,3], &(&1 * 2))
