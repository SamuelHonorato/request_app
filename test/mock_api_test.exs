defmodule Services.Mode1.MockApiTest do
  use ExUnit.Case

  import Mox

  require Logger
  import ExUnit.CaptureLog

  describe "get_mock/1 with setup" do
    setup :verify_on_exit!

    test "success with expect and verify/0" do
      expect(Services.Mode1.MockApiMock, :request, 1, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
    end
  end

  describe "get_mock/1" do
    test "success with expect and verify/0" do
      expect(Services.Mode1.MockApiMock, :request, 1, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}

      verify!()
    end

    test "success with expect and verify/1" do
      expect(Services.Mode1.MockApiMock, :request, 1, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}

      verify!(Services.Mode1.MockApiMock)
    end

    test "success" do
      stub(Services.Mode1.MockApiMock, :request, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
    end

    test "success response default" do
      stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi.ResponseDefault)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "DEFAULT"}
    end

#    test "success with api" do
#      stub_with(Services.Mode1.MockApiMock, Services.Mode1.MockApi)
#
#      assert Services.Mode1.MockApi.get_mock(200) == {:ok, %{"title" => "Hello..."}}
#    end

    test "success with log" do
      stub(Services.Mode1.MockApiMock, :request, fn url ->
        Logger.error("Getting request: #{url}")

        {:ok, "OK"}
      end)

      assert capture_log(fn -> Services.Mode1.MockApi.get_mock(200) end) =~ "Getting request: /api/mock?status_code=200"
    end

    test "success with expect" do
      Services.Mode1.MockApiMock
      |> expect(:request, fn _url -> {:ok, "OK"} end)

      assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
    end

    test "success with process" do
      Services.Mode1.MockApiMock
      |> expect(:request, fn _url -> {:ok, "OK"} end)

      parent_pid = self()

      task =
        Task.async(fn ->
          allow(Services.Mode1.MockApi, parent_pid, _task_async_pid = self())

          assert Services.Mode1.MockApi.get_mock(200) == {:ok, "OK"}
        end)

      Task.await(task)
    end
  end
end
