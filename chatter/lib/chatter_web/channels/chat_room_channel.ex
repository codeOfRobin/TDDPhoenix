defmodule ChatterWeb.ChatRoomChannel do
  use ChatterWeb, :channel

  def join("chat_room:" <> _room_name, _msg, socket) do
    {:ok, socket}
  end
end
