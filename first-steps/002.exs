#Elixir uses square brackets to specify a list of values. Values can be of any type:
list = [1, 2, 3, true, false]
IO.puts(length(list))

#Two lists can be concatenated or subtracted using the ++ and -- operators respectively:
#List operators never modify the existing list. Concatenating to or removing elements from a list returns a new list.
list1 = ["jailton", 1, true]
list2 = ["Araujo", false, 5, 1]

IO.puts("list1 + list2: #{length(list1 ++ list2)}")
IO.puts("list1 - list2: #{length(list1 -- list2)}")
IO.puts("list1 + 2: #{length(list1 ++ [2])}")

#The head is the first element of a list and the tail is the remainder of the list. They can be retrieved with the functions hd and tl.
list3 = [1, 2, 3, 4, 5, ]
IO.puts("First element: #{hd(list3)}")
IO.puts("Reminder elements: #{tl(list3)}")

#Elixir uses curly brackets to define tuples. Like lists, tuples can hold any value:
tuple = {:jailton, "araujo", "santos"}
IO.puts("tuple size: #{tuple_size(tuple)}")
IO.puts("first element of tuple: #{elem(tuple, 0)}")

#String operations to list
IO.puts(length(String.split("Jailton Araujo")))

String.split_at("Jailton Araujo", 6)
