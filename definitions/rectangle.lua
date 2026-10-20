---@meta

---If a function receives a rectangle as an argument, it can be one of several things:
---
---1. You can specify the parameters `x, y, width, height` directly as arguments of the function. E.g. `sprite:crop(0, 16, 64, 32)`
---1. You can specify an object with `x`, `y`, `width`, and `height` properties. E.g. `sprite:crop{ x=0, y=16, width=64, height=32 }`
---1. You can specify an array with 4 elements: E.g. `sprite:crop{ 0, 16, 64, 32 }`
---1. You can specify a `Rectangle` instance: E.g. `sprite:crop(Rectangle(0, 16, 64, 32))`
---@class Rectangle
local _rectangle = {
    ---@type integer
    x = nil,

    ---@type integer
    y = nil,

    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type integer
    w = nil,

    ---@type integer
    h = nil,

    ---@type Point
    origin = nil,

    ---@type Size
    size = nil,

    ---@type boolean
    isEmpty = nil,

    ---@param otherRectangle Rectangle
    ---@return boolean
    contains = function (self, otherRectangle) end,

    ---Returns true if `rectangle` intersects `otherRectangle` in some way.
    ---@param otherRectangle Rectangle
    ---@return boolean
    intersects = function (self, otherRectangle) end,

    ---Returns the new rectangle `newRectangle` which is the intersection of `rectangle` and `otherRectangle`. If both rectangles do not intersect, the result will be an [empty rectangle](lua://Rectangle.isEmpty).
    ---@param otherRectangle Rectangle
    ---@return Rectangle newRectangle
    intersect = function (self, otherRectangle) end,

    ---Returns the new rectangle `newRectangle` which will be a rectangle big enough to contain both given rectangles `rectangle` and `otherRectangle`.
    ---@param otherRectangle Rectangle
    ---@return Rectangle newRectangle
    union = function (self, otherRectangle) end,
}

---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: integer, y: integer, width: integer, height: integer): Rectangle
---@overload fun(options: { x: integer, y: integer, width: integer, height: integer }): Rectangle
---@overload fun(options: { x: integer, y: integer, w: integer, h: integer }): Rectangle
---@overload fun(numbers: { [1]: integer, [2]: integer, [3]: integer, [4]: integer })
function Rectangle () end
