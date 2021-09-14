defmodule Services.Mode1.MockApiTest do
  use ExUnit.Case

  require Logger
  import ExUnit.CaptureLog

  describe "get_mock/1" do
    test "success" do
      Mox.stub(Services.Mode1.MockApiMock, :request, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
    end

    test "success response default" do
      Mox.stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi.ResponseDefault)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "DEFAULT"}
    end

#    test "success with api" do
#      Mox.stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi)
#
#      assert Services.Mode1.MockApi.get_mock(200) == {:ok, %{"title" => "Hello..."}}
#    end

    test "success with log" do
      Mox.stub(Services.Mode1.MockApiMock, :request, fn _url ->
        Logger.error("Getting request")

        {:ok, "OK"}
      end)

      assert capture_log(fn -> Services.Mode1.MockApi.get_mock(200) end) =~ "Getting request"
    end
  end
end