---@meta

---@class Tile
local _tile = {
    ---@type integer
    index = nil,

    ---@type Image
    image = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
