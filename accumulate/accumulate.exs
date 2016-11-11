defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    accumulate(list, fun, [])
  end

  # accumulate exit function, reverse the result 
  def accumulate([], _, result) do
    Enum.reverse(result)
  end

  # NOTE: for performance reasons its better to prepend to a list
  def accumulate([head | tail], fun, result) do
    accumulate(tail, fun, [fun.(head) | result])
  end
end
