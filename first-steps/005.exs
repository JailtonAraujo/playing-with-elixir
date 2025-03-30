#Anonymous functions in Elixir are delimited by the keywords fn and end:
add = fn a,b -> a + b end
IO.puts(add.(1, 2))

#The &1 represents the first argument passed into the function. Therefore both is_arity_2 anonymous functions defined above are equivalent.
fun = &(&1 + 1)
IO.puts(fun.(5))

print = fn text -> IO.puts(text) end
print.("Print text with function.")

sum = fn a, b -> a + b end
divider = fn a, b -> a / b end
minus = fn a, b -> a - b end
multi = fn a, b -> a + b end

option = IO.gets("
[1] Sum
[2] Divider
[3] Minus
[4] Multi
Chose a option:") |> String.trim() |> String.to_integer()

if !is_integer(option) do
  IO.puts("Is not a number")
end

num_1 = IO.gets("Enter first number: ") |> String.trim() |> String.to_integer()
num_2 = IO.gets("Enter second number: ") |> String.trim() |> String.to_integer()

cond do
  !is_number(num_1) ->
    print.("The number #{num_1} is invalid!")
  !is_number(num_2) ->
    print.("The number #{num_2} is invalid!")
  true -> :ignore
end

case option do
  1 ->
    print.("Result of sum is: #{sum.(num_1, num_2)}")
  2 ->
    print.("Result of divider is: #{divider.(num_1, num_2)}")
  3 ->
    print.("Result of minus is: #{minus.(num_1, num_2)}")
  4 ->
    print.("Result of multi is: #{multi.(num_1, num_2)}")
  _->
    IO.write("Invalido")
end
