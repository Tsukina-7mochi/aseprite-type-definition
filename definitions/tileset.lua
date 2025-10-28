---@meta

---@class Tileset
local _tileset = {
    ---@type string
    name = nil,

    ---@type integer
    baseIndex = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---@type Grid
    grid = nil,

    ---@param index integer
    ---@return Tile
    tile = function (self, index) end,

    ---@deprecated
    ---@param index integer
    ---@return Image
    getTile = function (self, index) end,
}
