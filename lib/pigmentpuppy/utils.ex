defmodule Pigmentpuppy.Utils do
  def rgb_to_hex(rgb) do
    rgb 
    |> Enum.map(fn x -> (x * 255) |> round |> Integer.to_string(16) end) 
    |> List.to_string
    |> String.downcase
  end

  def hex_to_rgb(str) when byte_size(str) == 6 do
    str
    |> String.trim
    |> String.split("", trim: true)
    |> Enum.chunk_every(2)
    |> Enum.map(&Enum.join/1)
    |> parse_hex
  end

  # Hex triplets, like "#fff"
  def hex_to_rgb(str) when byte_size(str) == 3 do
    str
    |> String.trim
    |> String.split("", trim: true)
    |> Enum.map(&String.duplicate(&1, 2))
    |> parse_hex
  end

  def hex_to_rgb(_), do: :error

  defp parse_hex([_, _, _] = hex) do
    hex
    |> Enum.map(&Integer.parse(&1, 16))
    |> Enum.map(&elem(&1, 0))
    |> Enum.map(fn c -> (c / 255) |> Float.round(2) end)
  end
end
