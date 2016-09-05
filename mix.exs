defmodule JsonSchemaValidator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :json_schema_validator,
      version: "0.2.0",
      elixir: "~> 1.3",
      name: "Json Schema Validator",
      source_url: "https://github.com/findmypast/json-schema-validator",
      homepage_url: "https://github.com/findmypast/json-schema-validator",

      deps: deps(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      # if you want to use espec,
      # test_coverage: [tool: ExCoveralls, test_task: "espec"]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_json_schema, "~> 0.4"},
      {:excoveralls, "~> 0.5"},
      {:ex_doc, "~> 0.13"}
    ]
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
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/findmypast/json-schema-validator"}
    ]
  end

end
