defmodule Chatter.Factory do
  use ExMachina.Ecto, repo: Chatter.Repo

  def chat_room_factory do
    %Chatter.Chat.Room{
      name: sequence(:name, &"chat room #{&1}")
    }
  end

  def user_factory do
    %Chatter.User{
      email: sequence(:email, &"super#{&1}@example.com"),
      password: "password1"
    }
  end
end
