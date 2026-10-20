---@meta

---If a function receives a point as an argument, it can be one of several things:
---
---1. You can specify two parameters `x, y` directly as arguments of the function. E.g. `selection:contains(8, 20)`
---1. You can specify an object with `x` and `y` properties. E.g. `selection:contains{ x=8, y=20 }`
---1. You can specify an array with two elements: E.g. `selection:contains{ 8, 20 }`
---1. You can specify a `Point` instance: E.g. `selection:contains(Point(8, 20))`
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
