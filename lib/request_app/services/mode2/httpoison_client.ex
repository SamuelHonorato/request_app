defmodule Services.Mode2.HttpoisonClient do
  require Logger

  def get_mock(url) do
    Logger.info("Request by HTTPoison Client")

    case HTTPoison.get!(url) do
      %HTTPoison.Response{status_code: status_code, body: body} ->
        %HTTPStruct{status_code: status_code, body: Poison.decode!(body)}
      _ ->
        :error
    end
  end
end
