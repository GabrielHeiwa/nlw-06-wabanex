defmodule Wabanex.IMC do
  def calculate(%{"filename" => filename}) do
    filename
    |> File.read()
    |> handle_read_file()
  end

  defp handle_read_file({:ok, content}) do
    data =
      content
      |> String.split("\n")
      |> Enum.map(&parse_line_to_map/1)
      # |> Enum.map(fn line_data -> parse_line_to_map(line_data) end)
      |> Enum.into(%{})

    {:ok, data}
  end

  defp handle_read_file({:error, _reason}) do
    {:error, "Error to open file!"}
  end

  defp parse_line_to_map(line_data) do
    line_data
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / (height * height)}
end
