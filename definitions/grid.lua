---@meta

---@class Grid
local _grid = {
    ---@type Size
    tileSize = nil,

    ---@type Point
    origin = nil,
}

---@oreturn Grid
---@overload fun(otherGrid: Grid): Grid
function Grid () end
