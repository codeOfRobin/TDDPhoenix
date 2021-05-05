defmodule ChatterWeb.UserController do
  use ChatterWeb, :controller

  alias Doorman.Auth.Secret
  alias Chatter.User
  alias Chatter.Repo

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user" => params}) do
    {:ok, _user} =
      %User{}
      |> User.changeset(params)
      |> Secret.put_session_secret()
      |> Repo.insert()

    conn |> redirect(to: "/")
  end
end
