use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :request_app, RequestAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :request_app, :request, Services.Mode1.MockApiMock
