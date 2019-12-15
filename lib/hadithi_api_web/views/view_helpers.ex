defmodule HadithiApiWeb.ViewHelpers do
  @moduledoc """
  Convenience methods for handling view properties
  """

  @doc false
  @spec naive_to_unix(NaiveDateTime.t() | nil) :: String.t() | nil
  def naive_to_unix(%NaiveDateTime{} = date) do
    date
    |> NaiveDateTime.to_erl()
    |> :calendar.datetime_to_gregorian_seconds()
    |> Kernel.-(62_167_219_200)
  end
end
