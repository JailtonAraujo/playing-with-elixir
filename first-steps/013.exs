#Protocols
#Protocols are a mechanism to achieve polymorphism in Elixir where you want the behavior to vary depending on the data type.

defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end

IO.inspect(Utility.type("123"))
