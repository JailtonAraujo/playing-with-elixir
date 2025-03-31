import Map

#Keyword lists are a data-structure used to pass options to functions.
nuns = "1 2 3 4 5"
IO.inspect(nuns)

nuns_splited = String.split(nuns, " ")
IO.inspect(nuns_splited)

#The String.split/3 function allows the parts option to be set to the maximum number of entries in the result:
splited_in_partes = String.split("1 2 3 4 5", " ", [parts: 3])
IO.inspect(splited_in_partes)

splited_in_partes = String.split("1  2  3  4  5", " ", [parts: 3, trim: true])
IO.inspect(splited_in_partes)

list = [first_name: "jailton", middle_name: "Araujo"]
IO.inspect(list)

IO.inspect(list ++ [last_name: "Santos"])

#Select an item of the list
IO.inspect(list[:first_name])
IO.inspect([a: a] = [a: 1])

#Maps as key-value pairs
#Whenever you need to store key-value pairs, maps are the "go to" data structure in Elixir. A map is created using the %{} syntax:

IO.write("\n\n### Maps as key-value pairs ###\n\n")

map = %{:a => 1, :b => 2}
IO.inspect(map)
IO.inspect(map[:a])
IO.inspect(%{:a => a} = %{:a => 1, :b => 2})

my_map = %{:a => 1, :b => 2}
IO.inspect(get(my_map, :b));

IO.inspect(put(my_map, :c, 3))

IO.inspect(to_list(my_map))
