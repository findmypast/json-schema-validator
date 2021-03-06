# JsonSchemaValidator

[![Hex pm](http://img.shields.io/hexpm/v/json_schema_validator.svg?style=flat)](https://hex.pm/packages/json_schema_validator)
[![hex.pm downloads](https://img.shields.io/hexpm/dt/json_schema_validator.svg?style=flat)](https://hex.pm/packages/json_schema_validator)

**A wrapper for validating JSON using JSON schemas**

[Release Log](https://github.com/findmypast/json-schema-validator/blob/master/RELEASE_LOG.md)  
[API Documentation](https://hexdocs.pm/json_schema_validator)


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `json_schema_validator` to your list of dependencies in `mix.exs`:

      ```elixir
    def deps do
      [{:json_schema_validator, "~> 0.2.1"}]
    end
    ```

  2. Run mix deps.get


##Example Usage

```elixir
  alias JsonSchemaValidator.JsonSchema, as: JsonSchema

  defp example do
  #An example of the schema that we will use to validate the json
    schema = %{
        "$schema" => "http://json-schema.org/draft-04/schema#",
        "type" => "object",
        "properties" => %{
          "surname" => %{"type" => "string"},
          "description" => %{"type" => "string"},
        },
        "required" => ["surname"],
        "additionalProperties" => false
    }

    #The json to be validated
    json_to_validate = %{
      "surname" => "elliott",
      "description" => ""
    }

    result = JsonSchema.validate(json_to_validate, schema)

    case result do
      {:ok} -> IO.inspect("success")
      {:error, results} -> IO.inspect(results)
    end

  end
```

Success response:
```elixir
{:ok}
```

Error response:
```elixir
{:error,[%{error: "Schema does not allow additional properties.", property: "#/test"}]}
```
