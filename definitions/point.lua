---@eta

---@class Point
local _point = {
    ---@type integer
    x = nil,

    ---@type integer
    y = nil,
}

---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(x: integer, y: integer)
---@overload fun(options: { x: integer, y: integer }): Point
---@overload fun(numbers: { [1]: integer, [2]: integer }): Point
function Point () end
