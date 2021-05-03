defmodule ChatterWeb.UserController do
  use ChatterWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
