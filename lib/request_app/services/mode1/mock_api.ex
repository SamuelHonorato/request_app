defmodule Services.Mode1.MockApi do
  require Logger

  alias Services.Mode1.HTTPoisonBaseClient

  def get_mock(status_code) do
    Logger.info("Request by HTTPoison Base Client")

    query_params = URI.encode_query(%{"status_code" => status_code})

    case HTTPoisonBaseClient.get!("/api/mock?" <> query_params) do
      %HTTPoison.Response{status_code: 200, body: %{"data" => data}} -> {:ok, data}
      %HTTPoison.Response{status_code: 404, body: %{"errors" => errors}} -> {:error, :not_found, errors}
      _ -> :error
    end
  end
end
