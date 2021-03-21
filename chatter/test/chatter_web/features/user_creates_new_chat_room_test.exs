defmodule ChatterWeb.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a chat room", %{session: session} do
    session
    |> visit(rooms_index())
    |> click(Query.link("New chat room"))
    |> fill_in(Query.text_field("Name"), with: "elixir")
    |> click(Query.button("submit"))
    |> assert_has(Query.data("role", "room-title", text: "elixir"))

  end

  defp rooms_index(), do: Routes.chat_room_path(@endpoint, :index)
end
