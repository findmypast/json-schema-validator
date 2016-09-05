defmodule JsonSchemaValidator.JsonSchema do
  @moduledoc """
    Validates a JSON string given a JSON schema
  """

  alias ExJsonSchema.Validator

  @doc """
    Validates a JSON string given a JSON schema.

    Returns `{:ok}` if the schema has validated correctly.
    Returns `{:error,
      [
        %{
          error: "String with Error Description",
          property: "String with property involved in error"
        }
      ]
    }`

    ## Examples

        iex> schema = %{
        ...>   "$schema" => "http://json-schema.org/draft-04/schema#",
        ...>   "type" => "object",
        ...>   "properties" => %{
        ...>     "surname" => %{"type" => "string"}
        ...>   },
        ...>   "required" => ["surname"],
        ...>   "additionalProperties" => false
        ...> }
        iex> JsonSchemaValidator.JsonSchema.validate(%{"surname" => "Smith"}, schema)
        {:ok}

        iex> schema = %{
        ...>   "$schema" => "http://json-schema.org/draft-04/schema#",
        ...>   "type" => "object",
        ...>   "properties" => %{
        ...>     "surname" => %{"type" => "string"}
        ...>   },
        ...>   "required" => ["surname"],
        ...>   "additionalProperties" => false
        ...> }
        iex> JsonSchemaValidator.JsonSchema.validate(%{"sorename" => "Smith"}, schema)
        {:error,
            [
              %{error: "Schema does not allow additional properties.",
                property: "#/sorename"},
              %{error: "Required property surname was not present.",
                property: "#"}
            ]
        }
  """
  @spec validate(map, map) :: {:ok} | {:error, list}
  def validate(json, schema) do
    schema
      |> Validator.validate(json)
      |> format_response
  end

  defp format_response(:ok) do
    success_response
  end

  defp format_response({:error, error_details}) do
    error_details
      |> Enum.map(fn(x) -> error_tuple_to_map(x) end)
      |> error_response
  end

  defp success_response do
    {:ok}
  end

  defp error_response(errors) do
    {:error, errors}
  end

  defp error_tuple_to_map({message, property}) do
    %{property: property, error: message}
  end

end
