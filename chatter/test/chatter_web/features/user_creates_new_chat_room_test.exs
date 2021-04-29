defmodule ChatterWeb.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user creates a chat room", %{session: session} do
    user = insert(:user)

    session
    |> visit("/")
    |> sign_in(as: user)
    |> click(new_chat_link())
    |> create_new_chat_room("Elixir")
    |> assert_has(room_title("Elixir"))
  end

  defp sign_in(session, as: user) do
    session
    |> fill_in(Query.text_field("Email"), with: user.email)
    |> fill_in(Query.text_field("Password"), with: user.password)
    |> click(Query.button("Sign in"))
  end

  defp new_chat_link(), do: Query.link("New chat room")

  defp create_new_chat_room(session, name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Submit"))
  end

  defp room_title(title) do
    Query.data("role", "room-title", text: title)
  end
end
