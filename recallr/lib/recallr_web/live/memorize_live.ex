defmodule RecallrWeb.MemorizeLive do
  use RecallrWeb, :live_view
  alias Recallr.Eraser

  def mount(_params, _session, socket) do
    {:ok, assign(socket, eraser: Eraser.new())}
  end

  def handle_event("erase", _value, socket) do
    {:noreply, erase(socket)}
  end

  def erase(socket) do
    update(socket, :eraser, &Eraser.erase/1)
  end

  def render(assigns) do
    ~L"""
    <h1>This is the Memory game</h1>
    <pre> <%= inspect @eraser.characters %> </pre>
    <pre> <%= inspect @eraser.text %> </pre>
    <button phx-click="erase"> Erase </button>
    """
  end

end
