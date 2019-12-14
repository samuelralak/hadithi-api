defmodule HadithiApiWeb.Api.V1.MeController do
  @moduledoc """
  Me Controller
  """

  use HadithiApiWeb, :controller

  alias HadithiApi.Accounts
  alias HadithiApi.Auth.Guardian.Plug, as: SessionManager

  plug(Guardian.Plug.EnsureAuthenticated, handler: __MODULE__)

  action_fallback(HadithiApiWeb.FallbackController)

  def show(conn, _) do
    user = current_user(conn)

    conn
    |> put_view(HadithiApiWeb.UserView)
    |> render("show.json", user: user)
  end

  def update(conn, %{"user" => user_params}) do
    user = current_user(conn)

    with {:ok, user} <- Accounts.update_user(user, user_params) do
      conn
      |> put_view(HadithiApiWeb.UserView)
      |> render("show.json", user: user)
    end
  end

  ## Private Functions

  defp current_user(conn) do
    conn
    |> SessionManager.current_resource()
    |> Map.fetch!("id")
    |> Accounts.get_user!()
  end
end
