defmodule HadithiApiWeb.Api.V1.TwitterAuthController do
  @moduledoc """
  Twitter Authorization controller
  """

  use HadithiApiWeb, :controller

  def access_token(conn, _) do
    conn
    |> put_view(HadithiApiWeb.TwitterAuthView)
    |> render("access_token.json", access_token: %{})
  end

  def request_token(conn, _) do
    conn
    |> put_view(HadithiApiWeb.TwitterAuthView)
    |> render("request_token.json", request_token: %{})
  end
end
