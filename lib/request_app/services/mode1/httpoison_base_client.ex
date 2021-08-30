defmodule Services.Mode1.HTTPoisonBaseClient do
  require Logger

  use HTTPoison.Base

  @base_url "http://localhost:4000"

  def process_request_url(url) do
    @base_url <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
  end
end
