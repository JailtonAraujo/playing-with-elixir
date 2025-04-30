defmodule KV do
  {:ok, agent} = Agent.start_link(fn -> [] end);
  IO.inspect(agent);
  Agent.update(agent, fn list -> ["jailton" | list] end);
  list = Agent.get(agent, fn list -> list end);
  IO.inspect(list)
  Agent.stop(agent)
end
