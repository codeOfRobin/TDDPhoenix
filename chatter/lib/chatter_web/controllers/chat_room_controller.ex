defmodule ChatterWeb.ChatRoomController do
  use ChatterWeb, :controller

  def index(conn, _params) do

    chat_rooms = Chatter.Chat.all_rooms()
    render(conn, "index.html", chat_rooms: chat_rooms)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
