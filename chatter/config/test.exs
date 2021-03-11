use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :chatter, Chatter.Repo,
  database: "chatter",
  username: "test_user",
  password: "workbox-rodeo-forecast-rectify-taxiderm",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter, ChatterWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn
config :chatter, :sql_sandbox, true

config :wallaby, driver: Wallaby.Chrome
