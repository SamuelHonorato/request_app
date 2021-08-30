defmodule RequestAppWeb.MockController do
  use RequestAppWeb, :controller

  def index(conn, %{"status_code" => status_code_str}) do
    {status_code, _} = Integer.parse(status_code_str)

    conn
    |> put_status(status_code)
    |> render("index_#{status_code}.json", %{})
  end
end
