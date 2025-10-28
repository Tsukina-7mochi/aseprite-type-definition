---@meta

---@class Selection
local _selection = {
    ---@type Rectangle
    bounds = nil,

    ---@type Point
    origin = nil,

    ---@type boolean
    isEmpty = nil,

    deselect = function (self) end,

    ---@param rectangle Rectangle
    select = function (self, rectangle) end,

    selectAll = function (self) end,

    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    add = function (self, rectangle) end,

    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    subtract = function (self, rectangle) end,

    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    intersect = function (self, rectangle) end,

    ---@param point Point
    ---@return boolean
    ---@overload fun(self, x: integer, y: integer)
    contains = function (self, point) end,
}

---Creates a new empty selection, or with the given rectangle.
---@param rectangle? Rectangle
---@return Selection
function Selection (rectangle) end
