defmodule ChatterWeb.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a chat room", %{session: session} do
    session
    |> visit(rooms_index())
    |> click(Query.link("New chat room"))
    |> create_new_chat_room("Elixir")
    |> assert_has(room_title("elixir"))
  end

  defp rooms_index(), do: Routes.chat_room_path(@endpoint, :index)
  defp new_chat_link(), do: Query.link("New chat room")

  defp create_new_chat_room(session, name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Submit"))
  end

  defp room_title(title) do
    Query.data("role", "room-title", text: "elixir")
  end
end
