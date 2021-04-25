defmodule ChatterWeb.UserCanChatTest do
  use ChatterWeb.FeatureCase, async: true

  test "user visits rooms ", %{metadata: metadata} do
    room = insert(:chat_room)

    user =
      metadata
      |> new_user()
      |> visit(rooms_index())
      |> join_room(room.name)

    other_user =
      metadata
      |> new_user()
      |> visit(rooms_index())
      |> join_room(room.name)

    user
    |> add_message("Hi everyone")

    other_user
    |> assert_has(message("Hi everyone"))
    |> add_message("Hi, welcome to #{room.name}")

    user
    |> assert_has(message("Hi, welcome to #{room.name}"))
  end

  defp message(text) do
    Query.data("role", "message", text: text)
  end

  defp add_message(user, message) do
    user
    |> fill_in(Query.text_field("New Message"), with: message)
    |> click(Query.button("Send"))
  end

  defp new_user(metadata) do
    {:ok, user} = Wallaby.start_session(metadata: metadata)
    user
  end

  defp rooms_index(), do: Routes.chat_room_path(@endpoint, :index)

  defp join_room(session, name) do
    session |> click(Query.link(name))
  end
end
