defmodule ChatterWeb.Router do
  use ChatterWeb, :router
  alias ChatterWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Doorman.Login.Session
    plug :put_user_email
  end

  defp put_user_email(conn, _) do
    if current_user = conn.assigns[:current_user] do
      assign(conn, :email, current_user.email)
    else
      conn
    end
cam  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChatterWeb do
    pipe_through :browser
    get "/sign_in", SessionController, :new
    resources "/sessions", SessionController, only: [:create]
    resources "/users", UserController, only: [:new, :create]
  end

  scope "/", ChatterWeb do
    pipe_through [:browser, Plugs.RequireLogin]

    resources "/chat_rooms", ChatRoomController, only: [:new, :create, :show]
    get "/", ChatRoomController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatterWeb do
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
      live_dashboard "/dashboard", metrics: ChatterWeb.Telemetry
    end
  end
end
