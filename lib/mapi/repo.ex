defmodule Mapi.Repo do
  use Ecto.Repo,
    otp_app: :mapi,
    adapter: Ecto.Adapters.Postgres
end
