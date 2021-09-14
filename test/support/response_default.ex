defmodule Services.Mode1.MockApi.ResponseDefault do

  @behaviour Services.Mode1.MockApi.Behaviour

  def request(_url), do: {:ok, "DEFAULT"}
end