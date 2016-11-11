defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    for(x <- 1..number, rem(number, x) == 0, do: round(number / x))
      |> Enum.reverse
      |> Enum.map_join(&raindropy/1)
      |> to_output(number)
  end

  def raindropy(3), do: 'Pling'
  def raindropy(5), do: 'Plang'
  def raindropy(7), do: 'Plong'
  def raindropy(_), do: ''

  def to_output("", default), do: default |> Integer.to_string
  def to_output(output, default), do: output
end
