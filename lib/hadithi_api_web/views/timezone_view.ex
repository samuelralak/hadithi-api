defmodule HadithiApiWeb.TimezoneView do
  use HadithiApiWeb, :view

  alias __MODULE__

  def render("index.json", %{tzdata: tzdata}) do
    %{data: render_many(tzdata, TimezoneView, "timezone.json")}
  end

  def render("timezone.json", %{timezone: timezone}), do: timezone
end
