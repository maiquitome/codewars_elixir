# Return an array containing the numbers from 1 to N, where N is the parametered value. N will never be less than 1 (in C#, N might be less then 1).

# Replace certain values however if any of the following conditions are met:

# If the value is a multiple of 3: use the value "Fizz" instead
# If the value is a multiple of 5: use the value "Buzz" instead
# If the value is a multiple of 3 & 5: use the value "FizzBuzz" instead
# Method calling example:

# fizzbuzz(3) -->  [1, 2, "Fizz"]

defmodule FizzBuzz do
  def val(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
  def val(n) when rem(n, 3) == 0, do: "Fizz"
  def val(n) when rem(n, 5) == 0, do: "Buzz"
  def val(n), do: n

  def fizzbuzz(n) do
    # Enum.map(1..n, fn x -> val(x) end)
    Enum.map(1..n, &val/1)
  end
end

# def fizzbuzz(number) do
#   Enum.each(1..number, fn x ->
#     case {rem(x, 3) == 0, rem(x, 5) == 0} do
#       {true, true} -> IO.puts("FizzBuzz")
#       {false, true} -> IO.puts("Buzz")
#       {true, false} -> IO.puts("Fizz")
#       {false, false} -> IO.puts(x)
#     end
#   end)
# end
