defmodule RecallrWeb.CounterComponent do
  use RecallrWeb, :live_component

  def update(assigns, socket) do
    {:ok, assign(socket, count: assigns.count)}
  end

  def render(assigns) do
    ~L"""
    <p> <%= @count %> </p>
    <button phx-click="add"> Increment </button>
    """
  end
end
