defmodule GTFS.Mixfile do
  use Mix.Project

  def project do
    [app: :gtfs,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:csv, "~> 1.4.0"}]
  end

  def description do
    """
    A library for parsing a GTFS folder into a hierarchy of structured data
    """
  end

  defp package do
    [
      name: :gtfs,
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*", "license*"],
      maintainers: ["Benjamin Eckel"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bhelx/gtfs"}]
  end
end
