defmodule Recallr.Eraser do
  defstruct [:text, :characters]
  @characters [",", ".", " ", "\n", "!"]

  def new(rounds \\ 4, text \\ "The needs of the many outweigh the needs of the few, or the one!") do
    length = String.length(text)
    chunks = ceil(length / rounds)
    schedule =
      1..length
      |> Enum.shuffle
      |> Enum.chunk_every(chunks)

    %Recallr.Eraser{text: text, characters: schedule}
  end

  def erase(%{text: text, characters: [first_round | rounds]} = acc) do
    new_text = get_text(text, first_round)
    %{acc| text: new_text, characters: rounds}
  end

  defp get_text(text, round) do
    text
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn {char, index} -> replace(char, index in round) end)
    |> Enum.join
  end

  defp replace(char, _in_round) when char in @characters, do: char
  defp replace(_char, true), do: "_"
  defp replace(char, false), do: char

end
