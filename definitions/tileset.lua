---@meta

---A set of [tiles](lua://Tile#tile).
---@class Tileset
local _tileset = {
    ---Gets or sets the name of this tileset.
    ---@type string
    name = nil,

    ---Gets or sets the base index of this tileset.
    ---@type integer
    baseIndex = nil,

    ---@type Color
    color = nil,

    ---Gets or sets the user-defined data related to this tileset (a text string).
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties#properties) of this tileset.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---Returns the [grid](lua://Grid#grid) of this tileset.
    ---@type Grid
    grid = nil,

    ---Returns the [tile](lua://Tile#tile) in the given index (`0` is the empty tile, so `1` is the first user-defined tile).
    ---@param index integer
    ---@return Tile
    tile = function (self, index) end,

    ---Returns the image of tile in the given index (`0` is the empty tile, so `1` is the first user-defined tile). Note: This method was superseded with [Tileset:tile()](lua://Tileset#tilesettile), so you can use the following alternative: `local tileImage = ts:tile(index).image`
    ---@deprecated
    ---@param index integer
    ---@return Image
    getTile = function (self, index) end,
}
