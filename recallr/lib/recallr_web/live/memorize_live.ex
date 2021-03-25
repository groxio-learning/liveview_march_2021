defmodule RecallrWeb.MemorizeLive do
  use RecallrWeb, :live_view
  alias Recallr.{Eraser, Library}

  def mount(%{"id" => id}, _session, socket) do
    passage= Library.get_passage!(id)
    {:ok, assign(socket, eraser: Eraser.new(passage.rounds, passage.text))}
  end

  def handle_event("erase", _value, socket) do
    {:noreply, erase(socket)}
  end

  def erase(socket) do
    update(socket, :eraser, &Eraser.erase/1)
  end

  def render(assigns) do
    ~L"""
    <h1>Memorize this quote from</h1>
    <pre> <%= Phoenix.HTML.raw @eraser.text %> </pre>
    <button phx-click="erase"> Erase </button>
    """
  end

end
