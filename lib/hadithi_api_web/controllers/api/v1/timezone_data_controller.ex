defmodule HadithiApiWeb.Api.V1.TimezoneDataController do
  @moduledoc """
  Timezone Data Controller
  """

  use HadithiApiWeb, :controller

  plug(Guardian.Plug.EnsureAuthenticated, handler: __MODULE__)

  action_fallback(HadithiApiWeb.FallbackController)

  def index(conn, _) do
    tzdata = Tzdata.canonical_zone_list()

    conn
    |> put_view(HadithiApiWeb.TimezoneView)
    |> render("index.json", tzdata: tzdata)
  end
end
