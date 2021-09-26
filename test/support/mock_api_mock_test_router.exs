defmodule Services.Mode2.MockApi.MockApiMockTestRouter do
  use Plug.Router

  # We need to manually import the assertions since we're not
  # inside an ExUnit test case.
  import ExUnit.Assertions

  plug :match
  plug :dispatch
  plug :fetch_query_params

  get "/api/mock" do
    params = conn.query_params

    assert is_binary(params["status_code"])

    response = %{data: %{title: "Bye bye..."}}

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end
end