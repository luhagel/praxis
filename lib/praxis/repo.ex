defmodule Praxis.Repo do
  use Ecto.Repo,
    otp_app: :praxis,
    adapter: Ecto.Adapters.Postgres
end
