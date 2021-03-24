defmodule Recallr.Game do

  def plan_new(text, steps) do
    size = String.length(text)
    chunk_size = ceil(size / 2)

    plan = 1..size |> Enum.shuffle |> Enum.chunk_every(chunk_size)
    %{plan: plan, text: text}
  end

  def random_step_new(text, steps) do
    schedule = 1..size |> Enum.map(fn x -> :rand.uniform(steps) end)
    %{schedule: schedule, text: text, step: 1}
  end
end
