defmodule HadithiApiWeb.UserView do
  use HadithiApiWeb, :view
  import DenariusWeb.ViewHelpers

  alias __MODULE__

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name,
      timezone: user.timezone,
      has_completed_profile: user.has_completed_profile,
      has_connected_twitter: user.has_connected_twitter,
      inserted_at: naive_to_unix(user.inserted_at),
      updated_at: naive_to_unix(user.updated_at)
    }
  end
end
