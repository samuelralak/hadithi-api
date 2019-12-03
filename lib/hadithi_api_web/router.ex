defmodule HadithiApiWeb.Router do
  use HadithiApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HadithiApiWeb.Api, as: :api do
    pipe_through([:api])

    scope "/v1", V1, as: :v1 do
      # Twitter
      get("/twitter/request_token", TwitterAuthController, :request_token)
      post("/twitter/access_token", TwitterAuthController, :access_token)

      # Registrations
      post("/sign_up", RegistrationController, :create)
    end
  end
end
