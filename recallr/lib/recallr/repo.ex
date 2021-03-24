defmodule Recallr.Repo do
  use Ecto.Repo,
    otp_app: :recallr,
    adapter: Ecto.Adapters.Postgres
end
