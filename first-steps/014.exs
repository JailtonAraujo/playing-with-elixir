#Comprehensions
#In Elixir, it is common to loop over an Enumerable, often filtering out some results and mapping values into another list.
#Comprehensions are syntactic sugar for such constructs: they group those common tasks into the for special form.


for n <- [1, 2, 3, 4], do: IO.puts(n * n)

for n <- 1..6, do: IO.puts(n * n)
