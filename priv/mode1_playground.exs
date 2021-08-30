defmodule Mode1Playground do
  alias Services.Mode1.MockApi

  def run do
    case MockApi.get_mock(_status_code = 200) do
      {:ok, body} -> {:ok, body}
      {:errors, :not_found, body} -> {:errors, :not_found, body}
      response_error -> response_error
    end
  end
end

Mode1Playground.run()
|> IO.inspect(label: "Response")
