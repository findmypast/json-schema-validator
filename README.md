# JsonSchemaValidator

**A wrapper for validating JSON using JSON schemas**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `json_schema_validator` to your list of dependencies in `mix.exs`:
  
      ```elixir
    def deps do
      [{:json_schema_validator, git: "git@github.com:findmypast/json-schema-validator.git", tag: "0.1.0"}]
    end
    ```

  2. Run mix deps.get


##Example Usage

```
  alias JsonSchemaValidator.JsonSchema, as: JsonSchema
  
  defp example do
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
    
    json_to_validate = %{
      "surname" => "elliott",
      "description" => ""
    }

    JsonSchema.validate(json_to_validate, schema)
    
  end
```


