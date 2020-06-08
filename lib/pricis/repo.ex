defmodule Pricis.Repo do
  use Ecto.Repo,
    otp_app: :pricis,
    adapter: Ecto.Adapters.Postgres
end
