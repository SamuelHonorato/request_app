defmodule Helpers.FormatDateTimeHelperTest do
  use RequestAppWeb.ConnCase, async: true

  alias Helpers.FormatDateTimeHelper

  describe "format date time" do

    setup do
      date_time =
        %DateTime{year: 2021, month: 2, day: 29, zone_abbr: "AMT",
          hour: 23, minute: 0, second: 7, microsecond: {0, 0},
          utc_offset: -14400, std_offset: 0, time_zone: "America/Manaus"}

      %{date_time: date_time}
    end

    test "year/1 returns format year", %{date_time: date_time} do
      assert FormatDateTimeHelper.year(date_time) == "21"
    end

    test "month/1 returns format month", %{date_time: date_time} do
      assert FormatDateTimeHelper.month(date_time) == "02"
    end

    test "day/1 returns format day", %{date_time: date_time} do
      assert FormatDateTimeHelper.day(date_time) == "29"
    end

    test "hour/1 returns format hour", %{date_time: date_time} do
      assert FormatDateTimeHelper.hour(date_time) == "23"
    end

    test "minute/1 returns format minute", %{date_time: date_time} do
      assert FormatDateTimeHelper.minute(date_time) == "00"
    end

  end
end
