defmodule MockAPITest do
  use ExUnit.Case

  import ExUnit.CaptureLog
  import Mox

  require Logger

  setup :verify_on_exit!

  describe "get_mock/1" do
    test "success" do
      Mox.stub(Services.Mode1.MockApiMock, :request, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
    end

    test "success response default" do
      Mox.stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi.ResponseDefault)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "DEFAULT"}
    end

    test "success with api" do
      Mox.stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, %{"title" => "Hello..."}}
    end
  end
end