defmodule DirectionsReduction do
  @moduledoc """
  ## Examples

  ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"] -> ["WEST"]

  ["NORTH", "SOUTH", "EAST", "WEST"] -> []

  ["NORTH", "WEST", "SOUTH", "EAST"] -> ["NORTH", "WEST", "SOUTH", "EAST"]

  ~W(SOUTH WEST NORTH NORTH NORTH EAST WEST NORTH NORTH EAST) -> ~W(SOUTH WEST NORTH NORTH NORTH NORTH NORTH EAST)

  ~W(NORTH SOUTH SOUTH EAST WEST NORTH WEST) -> ~W(WEST)

  """
  def reduce(directions) do
    # EXAMPLE:
    # directions = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]

    initial_acc = []

    # Reduces the given list from the right with a function.
    List.foldr(directions, initial_acc, fn direction, acc ->
      # direction |> IO.inspect(label: "direction")
      # acc |> IO.inspect(label: "acc")
      reduce(direction, acc)
    end)
  end

  # ****** START ******
  # 1.
  # direction: "WEST"
  # acc: []
  # do: ["WEST"]
  defp reduce(direction, [] = _acc), do: [direction] #|> IO.inspect(label: "do")

  # ****** END ******
  # 7.
  # direction: "NORTH"
  # acc: ["SOUTH", "WEST"]
  # do: ["WEST"]
  defp reduce("NORTH", ["SOUTH" | tail] = _acc), do: tail #|> IO.inspect(label: "do")

  # 5.
  # direction: "SOUTH"
  # acc: ["NORTH", "WEST"]
  # do: ["WEST"]
  defp reduce("SOUTH", ["NORTH" | tail] = _acc), do: tail #|> IO.inspect(label: "do")

  defp reduce("WEST", ["EAST" | tail] = _acc), do: tail #|> IO.inspect(label: "do")

  # 4.
  # direction: "EAST"
  # acc: ["WEST", "NORTH", "WEST"]
  # do: ["NORTH", "WEST"]
  defp reduce("EAST", ["WEST" | tail] = _acc), do: tail #|> IO.inspect(label: "do")

  # 2.
  # direction: "NORTH"
  # acc: ["WEST"]
  # do: ["NORTH", "WEST"]

  # 3.
  # direction: "WEST"
  # acc: ["NORTH", "WEST"]
  # do: ["WEST", "NORTH", "WEST"]

  # 6.
  # direction: "SOUTH"
  # acc: ["WEST"]
  # do: ["SOUTH", "WEST"]
  defp reduce(direction, [next | tail] = _acc), do: [direction, next | tail] #|> IO.inspect(label: "do")
end
