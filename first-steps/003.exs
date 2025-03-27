#Pattern matching
#The match operator is not only used to match against simple values, but it is also useful for destructuring more complex data types. For example, we can pattern match on tuples:
tuple = {"jailton", "Araujo", "Santos"}

{firstName, middleName, lastName} = tuple
IO.puts("First name: #{firstName}")
IO.puts("Middle name: #{middleName}")
IO.puts("last name: #{lastName}")

#A list also supports matching on its own head and tail:
list = [1,2,3,4]
[head | tail] = list
IO.puts("head of a lista: #{head}")
