defmodule RequestAppWeb.MockView do
  use RequestAppWeb, :view

  def render("index_200.json", %{}), do: %{data: %{title: "Hello..."}}
  def render("index_404.json", %{}), do: %{errors: ["Object not found"]}
  def render(_, %{}), do: %{errors: ["Unmapped status"]}
end
