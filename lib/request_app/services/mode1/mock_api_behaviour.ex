defmodule Services.Mode1.MockApi.Behaviour do
  @callback request(url :: String.t()) :: {:ok, term()} | {:error, :not_found, term()} | :error
end