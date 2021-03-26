defmodule RecallrWeb.CountLive do
  use RecallrWeb, :live_view
  alias Recallr.Counter

  def mount(_params, _session, socket) do
    {:ok, assign(socket, things: "mushrooms fans", count: 42)}
  end

  def render(assigns) do
    ~L"""
    <%= live_component(@socket, RecallrWeb.HeaderComponent, things: @things) %>
    <%= live_component(@socket, RecallrWeb.CounterComponent, id: 1, count: @count) %>
    <hr/>
    <%= live_component(@socket, RecallrWeb.CounterComponent, id: 2, count: @count) %>
    <button phx-click="add" phx-target="<%= 2 %>"> Increment </button>
    """
  end

end
