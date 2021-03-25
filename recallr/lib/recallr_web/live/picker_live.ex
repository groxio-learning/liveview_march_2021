defmodule RecallrWeb.PickerLive do
  use RecallrWeb, :live_view
  # alias Recallr.Prose
  alias Recallr.Library

 def mount(_params, _session, socket) do
  {:ok,
    socket
    |> assign(id: Library.first().id)
    |> lookup()
    |> count
  }
 end

 def count(socket) do
   assign(socket, count: Enum.count(Library.list_passages))
 end

 def lookup(socket) do
   prose = Library.get_passage!(socket.assigns.id)
   assign(socket, prose: prose)
 end

 def next(socket) do
  socket |> update(:id, &Library.next/1) |> lookup
 end

 def handle_event("next", _value, socket) do
  {:noreply, next(socket)}
end

def handle_event("choose", _value, socket) do
  {:noreply, push_redirect(socket, to: "/memorize/#{socket.assigns.id}")}
end

end
