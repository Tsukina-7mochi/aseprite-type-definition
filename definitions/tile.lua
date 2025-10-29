---@meta

---Represents a tile from a [Tileset](lua://Tileset#tileset).
---@class Tile
local _tile = {
    ---The index of the tile (position in its [tileset](lua://Tileset#tileset)).
    ---@type integer
    index = nil,

    ---Gets or sets the [image](lua://Image#image) of this tile.
    ---@type Image
    image = nil,

    ---Gets or sets the user-defined [color](lua://Color#color) of this tile.
    ---@type Color
    color = nil,

    ---Gets or sets the user-defined data related to this tile (a text string).
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties#properties) of this tile.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
