defmodule CoinScrape.Repo do
  use Ecto.Repo,
    otp_app: :coin_scrape,
    adapter: Ecto.Adapters.Postgres
end
