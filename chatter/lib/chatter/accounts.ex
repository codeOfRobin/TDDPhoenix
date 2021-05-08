defmodule Chatter.Accounts do
  alias Doorman.Auth.Secret
  alias Chatter.User
  alias Chatter.Repo

  def create_user(params) do
    %User{}
    |> User.changeset(params)
    |> Secret.put_session_secret()
    |> Repo.insert()
  end

  def change_user(user) do
    User.changeset(user, %{})
  end
end
