IO.puts("Hello World From Elixir.")

IO.puts("O resto da divisão: #{rem(10, 2)}")

#You can invoke the round function to get the closest integer to a given float, or the trunc function to get the integer part of a float.
IO.puts("Trunc up: #{round(3.58)}")
IO.puts("Trunc down: #{trunc(3.58)}")

#check the type of a value
IO.puts("Is a integer: #{is_integer(2.3)}")
IO.puts("Is a float: #{is_float(2.3)}")
IO.puts("Is a string: #{is_bitstring("String")}")

#Elixir also provides three boolean operators: or, and, and not. These operators are strict in the sense that they expect something that evaluates to a boolean (true or false) as their first argument:
IO.puts("true and true: #{true and true}")
IO.puts("true and false: #{true and false}")
IO.puts("false and false: #{false and false}")
IO.puts("true or false: #{true or false}")
IO.puts("true and true: #{true and !false}")

#Elixir also provides the concept of nil, to indicate the absence of a value, and a set of logical operators that also manipulate nil: ||/2, &&/2, and !/1. For these operators, false and nil are considered "falsy", all other values are considered "truthy":
#As a rule of thumb, use and, or and not when you are expecting booleans. If any of the arguments are non-boolean, use &&, || and !.
IO.puts("1 || true: #{1 || true}")
IO.puts("false || 11: #{false || 11}")
IO.puts("nil && 13: #{nil && 13}")
IO.puts("true && 17: #{true && 17}")
IO.puts("false && 15: #{false && 15}")

#An atom is a constant whose value is its own name. Some other languages call these symbols. They are often useful to enumerate over distinct values, such as:
:jailton
IO.puts("My name is: " <> "#{:jailton}")

#Strings in Elixir are delimited by double quotes, and they are encoded in UTF-8:
first_name = "Jailton"
las_name = "de Araujo Santos"
IO.puts("My first name is: #{first_name} and my last name is #{las_name} so my full name is: #{first_name <> " " <> las_name}")

IO.puts("Size of my first name: #{byte_size(first_name)}")
IO.puts("Lenght of my first name: #{String.length(first_name)}")
IO.puts("My first name in upcase: #{String.upcase(first_name)}")
