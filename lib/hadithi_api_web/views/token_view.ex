defmodule HadithiApiWeb.TokenView do
  use HadithiApiWeb, :view
  alias HadithiApiWeb.TokenView

  alias __MODULE__

  @doc false
  def render("show.json", %{token: token}) do
    %{data: render_one(token, TokenView, "token.json")}
  end

  def render("token.json", %{token: token}) do
    %{
      access_token: token.access_token,
      expires_in: token.expires_in,
      token_type: token.token_type
    }
  end
end
