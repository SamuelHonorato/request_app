defmodule Mode2Playground do

  alias Services.Mode2.MockApi

  def run do
    case MockApi.get_mock(_status_code = 200) do
      {:ok, body} -> {:ok, body}
      {:errors, :not_found, body} -> {:errors, :not_found, body}
      response_error -> response_error
    end
  end
end

Mode2Playground.run()
|> IO.inspect(label: "Response")
