defmodule Pigmentpuppy.Application do
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      worker(Pigmentpuppy.Periodically, [])
    ]

    opts = [strategy: :one_for_one, name: Pigmentpuppy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
