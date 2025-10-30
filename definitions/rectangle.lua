---@meta

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

    ---@param otherRectangle Rectangle
    ---@return boolean
    intersects = function (self, otherRectangle) end,

    ---@param otherRectangle Rectangle
    ---@return Rectangle
    intersect = function (self, otherRectangle) end,

    ---@param otherRectangle Rectangle
    ---@return Rectangle
    union = function (self, otherRectangle) end,
}

---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: integer, y: integer, width: integer, height: integer): Rectangle
---@overload fun(options: { x: integer, y: integer, width: integer, height: integer }): Rectangle
---@overload fun(options: { x: integer, y: integer, w: integer, h: integer }): Rectangle
---@overload fun(numbers: { [1]: integer, [2]: integer, [3]: integer, [4]: integer })
function Rectangle () end
