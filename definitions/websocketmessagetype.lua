---@meta

---@class WebSocketMessageType
WebSocketMessageType = {
    ---Text message received
    ---@type WebSocketMessageType
    TEXT = nil,

    ---Binary message received
    ---@type WebSocketMessageType
    BINARY = nil,

    ---Connected to the server
    ---@type WebSocketMessageType
    OPEN = nil,

    ---Connection was closed for any reason, or broke
    ---@type WebSocketMessageType
    CLOSE = nil,

    ---See [the standard](https://datatracker.ietf.org/doc/html/rfc6455) about ping and pong.
    ---@type WebSocketMessageType
    PING = nil,

    ---Your ping has been answered.
    ---
    ---Note that incoming pings are answered automatically.
    ---@type WebSocketMessageType
    PONG = nil,

    ---@type WebSocketMessageType
    FRAGMENT = nil,
}
