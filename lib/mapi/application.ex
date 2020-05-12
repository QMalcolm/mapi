defmodule Mapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mapi.Repo,
      # Start the Telemetry supervisor
      MapiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mapi.PubSub},
      # Start the Endpoint (http/https)
      MapiWeb.Endpoint
      # Start a worker by calling: Mapi.Worker.start_link(arg)
      # {Mapi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mapi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MapiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
