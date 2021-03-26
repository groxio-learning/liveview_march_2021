defmodule RecallrWeb.CountLive do
  use RecallrWeb, :live_view
  alias Recallr.Counter

  def mount(_params, _session, socket) do
    {:ok, assign(socket, things: "mushrooms fans", count: 42)}
  end

  def render(assigns) do
    ~L"""
    <%= live_component(@socket, RecallrWeb.HeaderComponent, things: @things) %>
      <p> <%= @count %> </p>
      <p> <%= inspect self() %> </p>
      <button phx-click="add"> Increment </button>
    """
  end

  def handle_event("add", _value, socket) do
    {:noreply, increment(socket)}
  end

  def increment(socket) do
    update(socket, :count, &Counter.increment/1)
  end

end
