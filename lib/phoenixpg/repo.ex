defmodule Phoenixpg.Repo do
  use Ecto.Repo,
    otp_app: :phoenixpg,
    adapter: Ecto.Adapters.Postgres
end
