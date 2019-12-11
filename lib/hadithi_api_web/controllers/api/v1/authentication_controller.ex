defmodule HadithiApiWeb.Api.V1.AuthenticationController do
  @moduledoc """
  Authentication controller
  """

  use HadithiApiWeb, :controller

  alias HadithiApi.Auth
  alias HadithiApi.Auth.Token

  plug(Guardian.Plug.EnsureAuthenticated, [handler: __MODULE__] when action in [:delete])

  action_fallback(HadithiApiWeb.FallbackController)

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Auth.authenticate_user(user_params),
         token <- Token.new(conn, user) do
      conn
      |> put_resp_header("authorization", "Bearer #{token.access_token}")
      |> put_resp_header("x-expires", "#{token.expires_in}")
      |> put_view(HadithiApiWeb.TokenView)
      |> render("show.json", token: token)
    end
  end

  def delete(conn, _) do
    conn
    |> HadithiApi.Auth.Guardian.Plug.sign_out()
    |> send_resp(200, "")
  end
end
