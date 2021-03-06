use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kira, KiraWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Disabling any HTTP calls with Tesla
config :tesla, adapter: Tesla.Mock

# Deactivating cron jobs
config :kira, Kira.Scheduler, jobs: []

# Configure your database
config :kira, Kira.Repo,
  username: System.get_env("POSTGRES_USER") || "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  database: System.get_env("POSTGRES_DB") || "kira_test",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
