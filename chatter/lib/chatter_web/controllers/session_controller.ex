defmodule ChatterWeb.SessionController do
  use ChatterWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Doorman.authenticate(email, password) do
      nil ->
        conn
        |> put_flash(:error, "Invalid error or password")
        |> render("new.html")

      user ->
        conn
        |> Doorman.Login.Session.login(user)
        |> redirect(to: "/")
    end
  end
end
