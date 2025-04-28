defmodule User do
  defstruct name: "John", age: 27

  def new name, age do
    %User{name: name, age: age}
  end
end

IO.puts(User.new("Jailton", 55).name)

defmodule Main do
  def fill_user do
    %User{name: "Jailton", age: 25}
  end
end
