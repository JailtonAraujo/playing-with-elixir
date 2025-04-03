#Enumerables and Streams
#While Elixir allows us to write recursive code, most operations we perform on collections is done with the help of the Enum and Stream modules. Let's learn how.


## Enumerables ##
IO.inspect Enum.map([1,2,3], fn x -> x + 1 end)

IO.inspect Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k + v end)

IO.puts Enum.reduce(1..3, 0, &+/2)

IO.inspect Enum.map(1..3, &(&1 + 1))

odd? = fn x -> rem(x, 2) != 0 end
IO.inspect Enum.filter(1..6, odd?)

IO.inspect Enum.map(1..6, &(&1 + 2)) |> Enum.filter(odd?) |> Enum.sum()

#Streams
#As an alternative to Enum, Elixir provides the Stream module which supports lazy operations:
IO.inspect Stream.map(1..6, &(&1 + 2)) |> Stream.filter(odd?) |> Enum.sum()
