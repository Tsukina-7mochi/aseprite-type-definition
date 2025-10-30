---@meta

---@class Point
local _point = {
    ---@type integer
    x = nil,

    ---@type integer
    y = nil,
}

---Creates a new `Point` instance with the given coordinates (or `x=y=0` if they are not specified).
---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(x: integer, y: integer)
---@overload fun(options: { x: integer, y: integer }): Point
---@overload fun(numbers: { [1]: integer, [2]: integer }): Point
function Point () end
