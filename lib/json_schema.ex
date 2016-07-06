defmodule JsonSchemaValidator.JsonSchema do

  @success_response %{success: true}
  @failure_response %{success: false}

  def validate(json, schema) do
    schema
      |> ExJsonSchema.Validator.validate(json)
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
    @success_response
  end

  defp error_response(errors) do
    @failure_response
      |> Map.put(:errors, errors)
  end

  defp error_tuple_to_map({message, property}) do
    %{property: property, error: message}
  end

end
