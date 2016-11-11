defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
      |> Enum.filter(fn(x) -> anagram?(base, x) end)
  end

  defp anagram?(base, candidate) do
    unify_string(base) != unify_string(candidate) &&
    (base |> to_sorted_word) === (candidate |> to_sorted_word)
  end

  # Sorting is the real hack here, this makes detecting very easy
  defp to_sorted_word(word) do
    word
      |> unify_string
      |> String.graphemes
      |> Enum.sort
  end

  defp unify_string(word) do
    word
      |> String.downcase
      |> String.trim
  end
end
