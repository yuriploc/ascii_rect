defmodule AsciiRect.Repo do
  use Ecto.Repo,
    otp_app: :ascii_rect,
    adapter: Ecto.Adapters.Postgres
end
