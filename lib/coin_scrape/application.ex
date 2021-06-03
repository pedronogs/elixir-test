defmodule CoinScrape.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CoinScrape.Repo,
      # Start the Telemetry supervisor
      CoinScrapeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CoinScrape.PubSub},
      # Start the Endpoint (http/https)
      CoinScrapeWeb.Endpoint
      # Start a worker by calling: CoinScrape.Worker.start_link(arg)
      # {CoinScrape.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoinScrape.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CoinScrapeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
