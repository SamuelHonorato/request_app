defmodule Services.Mode1.MockApi do
  require Logger

  alias Services.Mode1.HTTPoisonBaseClient

  @behaviour Services.Mode1.MockApi.Behaviour

  @api Application.get_env(:request_app, :request, Services.Mode1.MockApi)

  def get_mock(status_code) do
    Logger.info("Request by HTTPoison Base Client")

    query_params = URI.encode_query(%{"status_code" => status_code})

    @api.request("/api/mock?" <> query_params)
  end

  @impl Services.Mode1.MockApi.Behaviour
  def request(url) do
    case HTTPoisonBaseClient.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: %{"data" => data}}} -> {:ok, data}
      {:ok, %HTTPoison.Response{status_code: 404, body: %{"errors" => errors}}} -> {:error, :not_found, errors}
      _ -> :error
    end
  end
end
