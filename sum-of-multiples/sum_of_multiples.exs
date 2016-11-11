defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
      |> Enum.filter(&(multiple_of?(&1, factors)))
      |> Enum.sum
  end

  defp multiple_of?(number, factors) do
    factors
      |> Enum.any?(&(divisible_by?(number, &1)))
  end

  defp divisible_by?(number, factor), do: rem(number, factor) == 0
end
