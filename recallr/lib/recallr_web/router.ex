defmodule RecallrWeb.Router do
  use RecallrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RecallrWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RecallrWeb do
    pipe_through :browser

    live "/choose", PickerLive
    live "/count", CountLive
    live "/", PageLive, :index
    live "/memorize/:id", MemorizeLive

    live "/passages", PassageLive.Index, :index
    live "/passages/new", PassageLive.Index, :new
    live "/passages/:id/edit", PassageLive.Index, :edit

    live "/passages/:id", PassageLive.Show, :show
    live "/passages/:id/show/edit", PassageLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", RecallrWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RecallrWeb.Telemetry
    end
  end
end
