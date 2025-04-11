# Spawning processes
# The basic mechanism for spawning new processes is the auto-imported spawn/1 function:
parent = self()

pid = spawn(fn  ->
  receive do
    {map} ->
      %{msg: msg, name: name} = map;
     IO.puts("#{msg} - #{name}")
     "#{inspect(self())}"
  end
  send(parent, {"Child here"})
end)

map = %{msg: "Hello World", pid: self(), name: "Jailton"}
send(pid, {map})

receive do
  {value} ->
    IO.puts("Received from child #{value}")
end


# IO.inspect(Process.alive?(pid))
# IO.inspect(self())
