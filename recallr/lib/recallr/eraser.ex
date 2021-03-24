defmodule Recallr.Eraser do
  defstruct [:text, :characters]
  def new(rounds, text) do
    length = String.length(text)
    %Recallr.Eraser{text: text, characters: [[1, 3, 5], [2, 4, 6, 7]]}
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
