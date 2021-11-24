defmodule MastodonClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :mastodon_client,
      version: "0.1.0",
      elixir: "~> 1.11",
      name: "mastodon_client",
      description: "Lightweight HTTP client for Mastodon and Pleroma based on Tesla.",
      source_url: "https://gitlab.com/soapbox-pub/mastodon_client",
      package: package(),
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"GitLab" => "https://gitlab.com/soapbox-pub/mastodon_client"}
    ]
  end

  def docs do
    [
      main: "readme",
      extras: [
        "README.md",
        "LICENSE.md"
      ],
      groups_for_modules: groups_for_modules(),
      source_ref: "v0.1.0"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.18", optional: true},
      {:jason, "~> 1.2", optional: true},
      {:ex_doc, ">= 0.24.2", only: :dev, runtime: false}
    ]
  end

  defp groups_for_modules do
    []
  end
end
