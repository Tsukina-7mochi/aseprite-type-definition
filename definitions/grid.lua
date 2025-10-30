---@meta

---This is an object that defines the grid for a [tileset](lua://Tileset).
---@class Grid
local _grid = {
    ---Returns the [tile](lua://Tile) width and height of a [tileset](lua://Tileset), as a [size](lua://Size).
    ---@type Size
    tileSize = nil,

    ---Returns the origin of the grid as a [point](lua://Point).
    ---@type Point
    origin = nil,
}

---@return Grid
---@overload fun(otherGrid: Grid): Grid
function Grid () end
