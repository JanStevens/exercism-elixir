defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
      |> String.graphemes
      |> rle_encode([])
      |> Enum.map(fn({chr, cnt}) -> "#{cnt}#{chr}" end)
      |> Enum.join
  end

  # Out function
  defp rle_encode([], out), do: Enum.reverse(out)
  # Will match when the head of our output matches the new head of our input
  # If matches we add one
  defp rle_encode([head|tail], [{head, count} | out]) do
    rle_encode(tail, [{head, count + 1} | out])
  end

  # Will match when we have input, we then prepend our head with count 1
  # to the output
  defp rle_encode([head|tail], out) do
    rle_encode(tail, [{head, 1} | out])
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(?<times>[0-9]+)(?<letter>[A-Z]{1})/, string, capture: :all_names)
      |> Enum.map(&multiply_char/1)
      |> Enum.join
  end

  defp multiply_char([char, cnt]) do
    char |> String.duplicate(cnt |> String.to_integer)
  end
end
