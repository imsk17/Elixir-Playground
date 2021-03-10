# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixpg,
  ecto_repos: [Phoenixpg.Repo]

# Configures the endpoint
config :phoenixpg, PhoenixpgWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Dx3BAYOt0q2nzr5KzP75rGsN0bNg5+SkthDrIiBtbIVe5HgtqkFO3846vORoIX/p",
  render_errors: [view: PhoenixpgWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Phoenixpg.PubSub,
  live_view: [signing_salt: "Z2eIUdmy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
