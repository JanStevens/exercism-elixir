defmodule Bob do
  def hey(input) do
    cond do
        String.ends_with?(input, "?") -> "Sure."
        input |> String.trim |> String.length == 0 -> "Fine. Be that way!"
        String.upcase(input) == input && Regex.match?(~r/\p{L}/, input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
