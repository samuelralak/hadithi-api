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
      inserted_at: naive_to_unix(user.inserted_at),
      updated_at: naive_to_unix(user.updated_at)
    }
  end
end
