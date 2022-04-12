defmodule IntegersRecreationOne do
  def call(m, n) when 1 <= m when m <= n do
    # 1..42
    m..n
    |> Enum.map(&{&1, sum_of_squared(&1)})

    |> Enum.filter(fn {_, sos} ->
        r = :math.sqrt(sos)
        r - trunc(r) == 0
      end)
  end

  def sum_of_squared(num) do
    # 1..6
    1..(:math.sqrt(num) |> trunc)
    # -> 1..6
    #|> IO.inspect()
    |> Enum.filter(&(rem(num, &1) == 0))
    # -> [1, 2, 3, 6]
    #|> IO.inspect()
    |> Enum.reduce(0, fn x, acc ->
      # IO.inspect(x, label: "x")
      # IO.inspect(num, label: "num")

      # div(42, 1)
      r = div(num, x) # |> IO.inspect(label: "div(num, x) -> r")

      #acc |> IO.inspect(label: "acc")

      if x == r,
        do: acc + x * x, #|> IO.inspect(label: "x == r do: acc + x * x"),
        else: acc + x * x + r * r #|> IO.inspect(label: "acc + x * x + r * r")
    end)

    # 1..6
    # [1, 2, 3, 6]

    # x: 1
    # num: 42
    # div(num, x) -> r: 42
    # acc: 0
    # acc + x * x + r * r: 1765

    # x: 2
    # num: 42
    # div(num, x) -> r: 21
    # acc: 1765
    # acc + x * x + r * r: 2210

    # x: 3
    # num: 42
    # div(num, x) -> r: 14
    # acc: 2210
    # acc + x * x + r * r: 2415

    # x: 6
    # num: 42
    # div(num, x) -> r: 7
    # acc: 2415
    # acc + x * x + r * r: 2500

    # [{42, 2500}]
  end


  ################
  # MINHA SOUÇÃO:
  ################

  # # Example: m = 42 and n = 250
  # def call(m, n) when 1 <= m when m <= n do
  #   # num = 246
  #   Enum.reduce(m..n, [], fn num, acc ->
  #     # sum = 84100
  #     sum =
  #       num
  #       |> divisors()
  #       |> Enum.sum()

  #     # sqrt = 290
  #     sqrt =
  #       sum
  #       |> :math.sqrt()
  #       |> trunc()

  #     if sqrt * sqrt == sum, do: acc ++ [{num, sum}], else: acc
  #     # 290 * 290 == 84100 so [{42, 2500}] ++ [{246, 84100}] return [{42, 2500}, {246, 84100}]
  #   end)
  # end

  # defp divisors(number) do
  #   # 1..246
  #   Enum.reduce(1..number, [], fn divisor, acc ->
  #     # divisors: [1, 2, 3, 6, 41, 82, 123, 246] -> squared: [1, 4, 9, 36, 1681, 6724, 15129, 60516]
  #     if rem(number, divisor) == 0,
  #       do: acc ++ [divisor * divisor],
  #       else: acc
  #   end)
  # end
end
