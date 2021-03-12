# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :praxis,
  ecto_repos: [Praxis.Repo]

# Configures the endpoint
config :praxis, PraxisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TBmpr8QH6jCfdSj5J0vHu7yTFuT3vH3IZjqYjgYYEG6e6061b76wipC6W2NidpQQ",
  render_errors: [view: PraxisWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Praxis.PubSub,
  live_view: [signing_salt: "RT+xWknW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :kaffy,
   otp_app: :praxis,
   ecto_repo: Praxis.Repo,
   router: PraxisWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
