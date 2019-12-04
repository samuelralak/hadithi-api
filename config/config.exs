# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Default Secret Key
secret_key = :crypto.strong_rand_bytes(60) |> Base.url_encode64() |> binary_part(0, 60)

config :hadithi_api,
  ecto_repos: [HadithiApi.Repo]

# Configures the endpoint
config :hadithi_api, HadithiApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hGyb6Ib4vjXJFaMCsnBneMzSNkp9ga40SPCnAX1QVlO1aprVOyH0oa1eMq7uksYx",
  render_errors: [view: HadithiApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HadithiApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian Auth configuration
config :hadithi_api, HadithiApi.Auth.Guardian,
  issuer: "Hadithi",
  secret_key: System.get_env("GUARDIAN_SECRET_KEY") || secret_key

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
