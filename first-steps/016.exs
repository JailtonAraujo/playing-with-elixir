#try, catch, and rescue
#Elixir has three error mechanisms: errors, throws, and exits.
#In this chapter, we will explore each of them and include remarks about when each should be used.

try do
  raise "oops"
rescue
  RuntimeError -> "Error!"
end


try do
  Enum.each(-50..50, fn x ->
    if rem(x, 13) == 0, do: throw(x)
  end)
  "Got nothing"
catch
  x -> "Got #{x}"
end

try do
  exit("I am exiting")
catch
  :exit, _ -> "not really"
end
