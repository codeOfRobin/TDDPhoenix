defmodule ChatterWeb.ChatRoomChannel do
  use ChatterWeb, :channel

  alias Chatter.Chat

  def join("chat_room:" <> room_name, _msg, socket) do
    room = Chat.find_room_by_name(room_name)
    {:ok, assign(socket, :room, room)}
  end

  def handle_in("new_message", payload, socket) do
    %{room: room, email: author} = socket.assigns

    outgoing_payload = Map.put(payload, "author", author)
    Chat.new_message(room, outgoing_payload)

    broadcast(socket, "new_message", outgoing_payload)
    {:noreply, socket}
  end
end
