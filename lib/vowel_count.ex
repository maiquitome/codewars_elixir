defmodule VowelCount do
  # def get_count(str), do: Regex.scan(~r/a|e|i|o|u/, str) |> length

  def get_count(str) do
    Regex.replace(~r/[^aeiou]/, str, "")
    |> String.length()

    # str
    # |> String.replace(~r/[^aeiou]/, "")
    # |> String.length()
  end
end
