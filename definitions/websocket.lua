---@meta

---@class WebSocket
local _websocket = {
    ---Address of the server. Read-only, the url is specified when creating the websocket.
    ---@type string
    url = nil,

    ---Try connecting to the server. After a successful connection, `onreceive` function will be called with message type `WebSocketMessageType.OPEN`. When the server or network breaks the connection, the client tries reconnecting automatically.
    connect = function (self) end,

    ---Disconnects from the server. After a disconnect, `onreceive` function will be called with message type `WebSocketMessageType.CLOSE`.
    close = function (self) end,

    ---Sends a text message to the server. If multiple strings are passed, they will be joined together.
    ---@param ... string
    sendText = function (self, ...) end,

    ---Sends a binary message to the server. If multiple strings are passed, they will be joined together. Lua makes no distinction between character and byte strings, but the websocket protocol does label them.
    ---@param ... string
    sendBinary = function (self, ...) end,

    ---Sends a very short ping message to the server. There's a limit to the length of data that can be sent. It's sometimes used to prevent the connection from timing out and closing. A standard compliant server will reply to every "ping" message with a "pong". Client pongs are sent automatically, and there's no need to control that.
    ---@param str string
    sendPing = function (self, str) end,
}

---Creates a websocket client that can be used to communicate with another program:
---
---* `url` specifies the server to connect.
---* `deflate` option enables compression before sending the data - if the server is running on the same machine, it might be faster to turn it off.
---* `onreceive` function will be called for every incoming message, and when the connection is established and broken. Its two arguments are the event type (see [`WebSocketMessageType`](lua://WebSocketMessageType)) and the received data (a string, can be empty).
---* `minreconnectwait` and `maxreconnectwait` (in seconds) are optional values that limit the waiting time to try a reconnection to the server.
---@return WebSocket
---@overload fun(
---    url: string,
---    onreceive: fun(message: string, data: any),
---    deflate: boolean,
---    minreconnectwait: integer,
---    maxreconnectwait: integer,
---)
function WebSocket () end
