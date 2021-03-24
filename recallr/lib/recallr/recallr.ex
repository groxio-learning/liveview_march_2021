defmodule Recallr.Recallr do

  defstruct original_text: "", text: [], rounds: 0, length: 0

  def new(text, rounds \\ 7) do
    state = %__MODULE__{original_text: text, text: [], rounds: rounds}
      |> split_words()
      |> count_words()
      # |> remove_word()
  end

  def split_words(state) do
    words =
      state.original_text
        |> String.split()

    %{state | text: words, rounds: state.rounds }
  end

  def count_words(state) do
    state
  end

end
