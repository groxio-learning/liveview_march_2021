defmodule Recallr.Eraser do
  defstruct [:text, :characters]
  def new(rounds, text) do
    length = String.length(text)
    %Recallr.Eraser{text: text, characters: [[1, 3, 5], [2, 4, 6, 7]]}
  end

  def erase(%{text: text, characters: characters} = acc) do
    text
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(fn {char, index} = char->
      replace(char, hd(characters))
    end)
  end

  defp replace({char, index}, round) do
    if index in round do
      {"_", index}
    else
      {char, index}
    end
  end
end
