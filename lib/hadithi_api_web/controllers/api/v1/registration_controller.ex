defmodule HadithiApiWeb.Api.V1.RegistrationController do
  @moduledoc """
  Registrations controller
  """

  use HadithiApiWeb, :controller

  alias HadithiApi.Accounts

  action_fallback(HadithiApiWeb.FallbackController)

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.sign_up(user_params) do
      conn
      |> put_status(:created)
      |> put_view(HadithiApiWeb.UserView)
      |> render("show.json", user: user)
    end
  end
end
