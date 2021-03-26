defmodule RecallrWeb.CounterComponent do
  use RecallrWeb, :live_component
  alias Recallr.Counter

  def update(assigns, socket) do
    {:ok, assign(socket, count: assigns.count)}
  end

  def handle_event("add", _value, socket) do
    {:noreply, increment(socket)}
  end

  def increment(socket) do
    update(socket, :count, &Counter.increment/1)
  end


  def render(assigns) do
    ~L"""
    <p> <%= @count %> </p>
    <button phx-click="add" phx-target="<%= @myself %>"> Increment </button>
    """
  end
end
