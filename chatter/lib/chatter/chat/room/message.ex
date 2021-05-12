defmodule Chatter.Chat.Room.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_room_messages" do
    field :author, :string
    field :body, :string
    belongs_to :chat_room, Chatter.Chat.Room

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [])
    |> validate_required([])
  end
end
