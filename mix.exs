defmodule JsonSchemaValidator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :json_schema_validator,
      version: "0.2.1",
      elixir: "~> 1.3",
      name: "Json Schema Validator",
      source_url: "https://github.com/findmypast/json-schema-validator",
      homepage_url: "https://github.com/findmypast/json-schema-validator",
      deps: deps(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test],
      dialyzer: [plt_add_deps: :transitive]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_json_schema, "~> 0.4"},
      {:excoveralls, "~> 0.5", only: [:dev]},
      {:ex_doc, "~> 0.13", only: [:dev]},
      {:dialyxir, "~> 0.3", only: [:dev]},
      {:credo, "~> 0.4", only: [:dev, :test]}
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
      maintainers: ["Dave Elliott", "Steven Blowers"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/findmypast/json-schema-validator"}
    ]
  end

end
