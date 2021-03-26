defmodule RecallrWeb.HeaderComponent do
  use RecallrWeb, :live_component

  def mount(socket) do
    {:ok, assign(socket, name: "Grace")}
  end

  def render(assigns) do
    ~L"""
    <h1>This is the Counter that counts <%= @things %> </h1>
    <h2>For <%= @name %></h2>
    """
  end

end
