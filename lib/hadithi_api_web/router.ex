defmodule HadithiApiWeb.Router do
  use HadithiApiWeb, :router

  pipeline :auth do
    plug(HadithiApi.Auth.Pipeline)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HadithiApiWeb.Api, as: :api do
    pipe_through([:api, :auth])

    scope "/v1", V1, as: :v1 do
      # My Profile
      get("/me", MeController, :show)
      put("/me", MeController, :update)
      patch("/me", MeController, :update)

      # Twitter
      get("/twitter/request_token", TwitterAuthController, :request_token)
      post("/twitter/access_token", TwitterAuthController, :access_token)

      # Registrations
      post("/sign_up", RegistrationController, :create)

      # Authentication
      post("/sign_in", AuthenticationController, :create)
      delete("/sign_out", AuthenticationController, :delete)

      # Timezone data
      get("/timezone/list", TimezoneDataController, :index)
    end
  end
end
