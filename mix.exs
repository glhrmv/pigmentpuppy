defmodule Pigmentpuppy.MixProject do
  use Mix.Project

  def project do
    [
      app: :pigmentpuppy,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :extwitter]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:oauther, "~> 1.1"},
      {:extwitter, "~> 0.8"},
      {:vivid, "~> 0.4.2"},
      {:vivid_png, "~> 0.1.1"}
    ]
  end
end
