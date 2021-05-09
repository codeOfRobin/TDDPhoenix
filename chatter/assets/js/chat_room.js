import socket from "./socket";

// Now that you are connected, you can join channels with a topic
let chatRoomTitle = document.getElementById("chat-room-title");
if (chatRoomTitle) {
  let chatRoomName = chatRoomTitle.dataset.chatRoomName;
  let channel = socket.channel(`chat_room:${chatRoomName}`, {});

  let messageForm = document.getElementById("new-message-form");
  let messageInput = document.getElementById("message");
  let messagesContainer = document.querySelector("[data-role='messages']");
  messageForm.addEventListener("submit", (event) => {
    event.preventDefault();
    channel.push("new_message", { body: messageInput.value });
    event.target.reset();
  });
  channel.join();

  channel.on("new_message", (payload) => {
    let messageItem = document.createElement("li");
    messageItem.dataset.role = "message";
    messageItem.innerText = `${payload.author}: ${payload.body}`;
    messagesContainer.appendChild(messageItem);
  });
}
