defmodule HadithiApiWeb.Api.V1.RegistrationController do
  @moduledoc """
  Registrations controller
  """

  use HadithiApiWeb, :controller

  alias HadithiApi.Accounts
  alias HadithiApi.Auth
  alias HadithiApi.Auth.Token

  action_fallback(HadithiApiWeb.FallbackController)

  def create(conn, %{"user" => user_params}) do
    with {:ok, %{user: user}} <- Accounts.sign_up(user_params),
         {:ok, user} <- Auth.authenticate_user(%{email: user.email, password: user.password}),
         token <- Token.new(conn, user) do
      conn
      |> put_status(:created)
      |> put_resp_header("authorization", "Bearer #{token.access_token}")
      |> put_resp_header("x-expires", "#{token.expires_in}")
      |> put_view(HadithiApiWeb.TokenView)
      |> render("show.json", token: token)
    end
  end
end
