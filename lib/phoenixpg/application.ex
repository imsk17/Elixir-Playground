defmodule Phoenixpg.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Phoenixpg.Repo,
      # Start the Telemetry supervisor
      PhoenixpgWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phoenixpg.PubSub},
      # Start the Endpoint (http/https)
      PhoenixpgWeb.Endpoint
      # Start a worker by calling: Phoenixpg.Worker.start_link(arg)
      # {Phoenixpg.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phoenixpg.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixpgWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
