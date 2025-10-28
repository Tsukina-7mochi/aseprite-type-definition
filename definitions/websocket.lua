---@meta

---@class WebSocket
local _websocket = {
    ---@type string
    url = nil,

    connect = function (self) end,

    close = function (self) end,

    ---@param ... string
    sendText = function (self, ...) end,

    ---@param ... string
    sendBinary = function (self, ...) end,

    ---@param str string
    sendPing = function (self, str) end,
}

---@return WebSocket
---@overload fun(
---    url: string,
---    onreceive: fun(message: string, data: any),
---    deflate: boolean,
---    minreconnectwait: integer,
---    maxreconnectwait: integer,
---)
function WebSocket () end
