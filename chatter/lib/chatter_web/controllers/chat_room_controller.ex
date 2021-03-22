defmodule ChatterWeb.ChatRoomController do
  use ChatterWeb, :controller

  def index(conn, _params) do

    chat_rooms = Chatter.Chat.all_rooms()
    render(conn, "index.html", chat_rooms: chat_rooms)
  end

  def new(conn, _params) do
    changeset = Chatter.Chat.new_chat_room()
    render(conn, "new.html", changeset: changeset)
  end
end
