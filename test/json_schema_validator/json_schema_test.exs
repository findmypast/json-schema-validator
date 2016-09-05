defmodule JsonSchemaValidator.JsonSchemaTest do
  use ExUnit.Case, async: false
  alias JsonSchemaValidator.JsonSchema, as: Sut

  setup do
  %{
      "$schema" => "http://json-schema.org/draft-04/schema#",
      "type" => "object",
      "properties" => %{
        "surname" => %{"type" => "string"},
        "description" => %{"type" => "string"},
      },
      "required" => ["surname"],
      "additionalProperties" => false
   }
  end

  defp act(json, inputs) do
    json
      |> Sut.validate(inputs)
  end

  test "calling validate with nil returns a failure response", inputs do
    json = nil

    result = act(json, inputs)

    assert elem(result,0) == :error
  end

  test "calling validate with empty json returns a failure response.", inputs do
    json = %{}

    result = act(json, inputs)

    assert elem(result,0) == :error
  end

  test "calling validate with just surname and description", inputs do
    json = %{
      "surname" => "elliott",
      "description" => ""
    }

    result = act(json, inputs)

    assert elem(result,0) == :ok
  end

  test "calling validate so that unknown fields are not allowed", inputs do
    json = %{
      "surname" => "elliott",
      "description" => "",
      "blissful" => "not quite"
    }

    result = act(json, inputs)

    assert elem(result,0) == :error
  end

  test "calling validate when description is not set.", inputs do
    json = %{
      "surname" => "elliott"
    }

    result = act(json, inputs)

    assert elem(result,0) == :ok
  end

  test "partial example usage code compiles correctly" do
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

    result = Sut.validate(json_to_validate, schema)

    assert elem(result,0) == :ok

  end

end
