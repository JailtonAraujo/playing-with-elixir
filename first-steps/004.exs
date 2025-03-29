#case allows us to compare a value against many patterns until we find a matching one:

case {1, 2, 3} do
  {1, 3} ->
    IO.puts("not match")
  {2, 5} ->
    IO.puts("not match")
  {1, 2, 3} ->
    IO.puts("match")
    _->
      IO.puts("No one match")
end

#If the condition given to if returns false or nil, the body given between do-end is not executed and instead it returns nil.
number = "My name"

if String.starts_with?(number, "Myw") do
  IO.puts("Is true")
else
  IO.puts("No match in if condition")
end

#. If you need to check across several conditions and find the first one that does not evaluate to nil or false, cond is a useful construct:
#This is equivalent to else if clauses in many imperative languages - although used less frequently in Elixir.

condition = 25

cond do
  condition == 2 ->
    IO.puts("Is 2")
  condition == 20 ->
    IO.puts("Is 20")
  condition == 25 ->
    IO.puts("Is 25")
  condition == 26 ->
    IO.puts("Is 26")
  true ->
    IO.puts("No one condition")

end
