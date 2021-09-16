defmodule Helpers.FormatDateTimeHelper do

  def year(%DateTime{year: year}), do: String.slice("#{year}", 2..4)
  def month(%DateTime{month: month}), do: add_left_zero(month)
  def day(%DateTime{day: day}), do: add_left_zero(day)
  def hour(%DateTime{hour: hour}), do: add_left_zero(hour)
  def minute(%DateTime{minute: minute}), do: add_left_zero(minute)

  def add_left_zero(value), do: (if value < 10, do: "0#{value}", else: "#{value}")
end
