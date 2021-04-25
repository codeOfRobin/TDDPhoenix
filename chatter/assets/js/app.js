// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss";
import socket from "./socket";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
let socket = new Socket("/socket", { params: {} });

let chatRoomTitle = document.getElementById("title");
let chatRoomName = chatRoomTitle.dataset.chatRoomName;
let channel = socket.channel(`chat_room:${chatRoomName}`, {});

import "phoenix_html";
