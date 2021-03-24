defmodule Recallr.Eraser do
  defstruct [:text, :characters]

  def new(rounds \\ 2, text \\ "did you try turning it off and on again") do
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
    |> String.replace([",", ".", " "], "")
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn {char, index} -> replace(char, index in round) end)
    |> Enum.join
  end

  # defp replace(" ", _boolean), do: char
  # defp replace(",", _boolean), do: char
  # defp replace(".", _boolean), do: char
  defp replace(_char, true), do: "_"
  defp replace(char, false), do: char

end
