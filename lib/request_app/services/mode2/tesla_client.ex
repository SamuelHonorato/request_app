defmodule Services.Mode2.TeslaClient do
  require Logger

  use Tesla

#  plug Tesla.Middleware.BaseUrl, "http://localhost:4000"
#  plug Tesla.Middleware.Headers, [{"authorization", "token xyz"}]
  plug Tesla.Middleware.JSON

  def get_mock(url) do
    Logger.info("Request by Tesla")

    case get(url) do
      {:ok, %Tesla.Env{status: status_code, body: body}} ->
        %HTTPStruct{status_code: status_code, body: body}
      _ ->
        :error
    end
  end
end
