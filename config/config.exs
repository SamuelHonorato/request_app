# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

alias Services.Mode2.{HttpoisonClient, TeslaClient}

# Configures the endpoint
config :request_app, RequestAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Qr3l9xppDsFIx4DTY446/MHkKYFHH+UoWpAjmDTpBUksNiYDKUYsC/t1LW7MGsCd",
  render_errors: [view: RequestAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RequestApp.PubSub,
  live_view: [signing_salt: "E6lbvHhl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

# [TeslaClient, HttpoisonClient]
config :request_app, :http_client, TeslaClient

config :request_app, :request, Services.Mode1.MockApi

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
