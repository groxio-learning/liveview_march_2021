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
