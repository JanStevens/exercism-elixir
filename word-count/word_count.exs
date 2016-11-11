defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> split_on_space_and_dash
      |> only_word_characters
      |> count_words
  end

  def split_on_space_and_dash(sentence) do
    String.split(sentence, [" ", "_"])
  end

  def count_words(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  def update_count(word, acc) do
    Map.update(acc, word |> normalize, 1, &(&1 + 1))
  end

  def normalize(word) do
    word
      |> (&Regex.replace(~r/[^\w-]+/u, &1, "")).()
      |> String.downcase
  end

  def only_word_characters(words) do
    Enum.filter(words, &(Regex.match?(~r/[\w]/, &1)))
  end
end
