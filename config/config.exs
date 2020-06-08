# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pricis,
  ecto_repos: [Pricis.Repo]

# Configures the endpoint
config :pricis, PricisWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oc1/9kYTPV4jO5IrHscZ0PYoB9cFhi98pu8IThkkzODt6vyjB8cYSMkKM1tTvDNg",
  render_errors: [view: PricisWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pricis.PubSub,
  live_view: [signing_salt: "Gu3a4gNK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
