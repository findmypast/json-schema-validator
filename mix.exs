defmodule JsonSchemaValidator.Mixfile do
  use Mix.Project

  def project do
    [app: :json_schema_validator,
     version: "0.1.0",
     elixir: "~> 1.3",
     deps: deps(),
     description: description(),
     package: package()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
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
    [{:ex_json_schema, "~> 0.4"}]
  end

  defp description do
    """
    A thin wrapper around a Json Schema Validator.
    """
  end

  defp package do
    [
      name: :json_schema_validator,
      files: ["lib", "mix.exs", "README*", "readme*"],
      maintainers: ["Dave Elliott", "Kimberley McCann"],
      licenses: [],
      links: %{"GitHub" => "https://github.com/findmypast/json-schema-validator"}
    ]
  end

end
