defmodule ListFilter do
  def parse_integer(string) do
    case Integer.parse(string) do
      {num, _} -> {:ok, num}
      :error -> :error
    end
  end

  defp odd_number?(num) do
    rem(num, 2) == 1
  end

  def count_odd_numbers(strings) do
    strings
    |> Enum.map(&parse_integer/1)
    |> Enum.filter(fn
      {:ok, num} -> odd_number?(num)
      :error -> false
    end)
    |> length()
  end
end
