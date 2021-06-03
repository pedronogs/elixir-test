defmodule CoinScrapeWeb.ScrapingController do
  use CoinScrapeWeb, :controller

  def index(conn, _params) do
    test = %{teste: "oi", eoq: :oi}

    json(conn, test)
  end
end
