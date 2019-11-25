defmodule HadithiApi.Repo do
  use Ecto.Repo,
    otp_app: :hadithi_api,
    adapter: Ecto.Adapters.Postgres
end
