defmodule User do
  defstruct name: "John", age: 27

  def new do
    %User{name: "Jailton", age: 22}
  end
end

IO.puts(User.new().name)

defmodule Main do
  def fill_user do
    %User{name: "Jailton", age: 25}
  end
end
