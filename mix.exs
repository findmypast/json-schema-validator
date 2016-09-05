defmodule JsonSchemaValidator.Mixfile do
  use Mix.Project

  def project do
    [app: :json_schema_validator,
     version: "0.2.0",
     elixir: "~> 1.3",
     deps: deps(),
     description: description(),
     package: package()]
  end

  def application do
    []
  end

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
