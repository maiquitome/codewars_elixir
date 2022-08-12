# defmodule HumanReadableDurationFormat do
#   @units [
#     year: 31536000,
#     day: 86400,
#     hour: 3600,
#     minute: 60,
#     second: 1
#   ]

#   def format_duration(0), do: "now"
#   def format_duration(seconds) do
#     @units
#     |> Enum.map_reduce(seconds, fn {unit, n}, s -> {{unit, div(s, n)}, rem(s, n)} end)
#     |> elem(0)
#     |> Enum.filter(fn {_, n} -> n > 0 end)
#     |> Enum.map(fn {unit, 1} -> "1 #{unit}"
#                    {unit, n} -> "#{n} #{unit}s" end)
#     |> Enum.intersperse(", ")
#     |> List.replace_at(-2, " and ")
#     |> Enum.join()
#   end
# end

defmodule HumanReadableDurationFormat do
  @times [year: 31_536_000, day: 86400, hour: 3600, minute: 60, second: 1]

  def format_duration(0), do: "now"

  def format_duration(seconds) do
    {_, res} =
      Enum.reduce(@times, {seconds, []}, fn {key, time}, {seconds, res_acc} ->
        if seconds >= time do
          div = div(seconds, time)
          rem = rem(seconds, time)

          if div > 1,
            do: {rem, res_acc ++ ["#{div} #{key}s"]},
            else: {rem, res_acc ++ ["#{div} #{key}"]}
        else
          {seconds, res_acc}
        end
      end)

    list_to_string(res)
  end

  defp list_to_string(res) when length(res) > 1 do
    res
    |> Enum.join(", ")
    |> String.replace(~r/,([^,]*)$/, " and " <> List.last(res))
  end

  defp list_to_string([res]), do: res
end
