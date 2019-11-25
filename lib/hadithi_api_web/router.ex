defmodule HadithiApiWeb.Router do
  use HadithiApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HadithiApiWeb do
    pipe_through :api
  end
end
