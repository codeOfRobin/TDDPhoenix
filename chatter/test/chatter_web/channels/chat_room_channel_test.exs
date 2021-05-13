defmodule ChatterWeb.ChatRoomChannelTest do
  use ChatterWeb.ChannelCase

  describe "new_message event" do
    test "broadcasts message to all users" do
      email = "random@example.com"
      room = insert(:chat_room)
      {:ok, _, socket} = join_channel("chat_room:#{room.name}", as: email)
      payload = %{"body" => "hello world!", "author" => email}

      push(socket, "new_message", payload)

      assert_broadcast "new_message", ^payload
    end

    defp join_channel(topic, as: email) do
      ChatterWeb.UserSocket
      |> socket("", %{:email => email})
      |> subscribe_and_join(ChatterWeb.ChatRoomChannel, topic)
    end
  end
end
