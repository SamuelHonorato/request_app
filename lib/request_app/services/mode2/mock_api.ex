defmodule Services.Mode2.MockApi do
  require Logger

  @base_url "http://localhost:4000"

  def get_mock(status_code) do
    Logger.info("Request by Generic HTTP Client")

    query_params = URI.encode_query(%{"status_code" => status_code})
    url = "#{@base_url}/api/mock?#{query_params}"

    case http_client().get_mock(url) do
      %HTTPStruct{status_code: 200, body: body} -> {:ok, body}
      %HTTPStruct{status_code: 404, body: body} -> {:error, :not_found, body}
      _ -> :error
    end
  end

  def get_mock_with_base_url(status_code, base_url \\ @base_url) do
    Logger.info("Request by HTTPoison Base Client")

    query_params = URI.encode_query(%{"status_code" => status_code})
    url = "#{base_url}/api/mock?#{query_params}"

    case HTTPoison.get!(url) do
      %HTTPoison.Response{status_code: status_code, body: body} ->
        %HTTPStruct{status_code: status_code, body: Poison.decode!(body)}
      _ ->
        :error
    end
  end

  defp http_client, do: Application.get_env(:request_app, :http_client)
end
