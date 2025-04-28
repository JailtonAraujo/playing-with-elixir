#Sigils
#Elixir provides double-quoted strings as well as a concept called charlists,
#which are defined using the ~c"hello world" sigil syntax. In this chapter, we will learn more about sigils and how to define our own.


#Regular expressions
#The most common sigil in Elixir is ~r, which is used to create regular expressions:

regex = ~r/foo|bar/
IO.puts("foo" =~ regex)
IO.puts("bar" =~ regex)
IO.puts("ba" =~ regex)

IO.puts("HELLO" =~ ~r/hello/)
IO.puts("HELLO" =~ ~r/hello/i)

#Strings
#The ~s sigil is used to generate strings, like double quotes are. The ~s sigil is useful when a string contains double quotes:

IO.puts(~s(this is a string with "double" quotes, not 'single' ones))

#Word lists
#The ~w sigil is used to generate lists of words (words are just regular strings). Inside the ~w sigil, words are separated by whitespace.

IO.puts(~w(foo bar bat))
IO.puts(~w(foo bar bat)a)
