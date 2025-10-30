---@meta

---@class Selection
local _selection = {
    ---Returns a [rectangle](lua://Rectangle#rectangle) with the bounds of the selection (if the rectangle is empty, is because there is no selection).
    ---@type Rectangle
    bounds = nil,

    ---Gets or sets the selection origin/position (a [point](lua://Point#point)). This can be used to move the selection edges (not the content).
    ---@type Point
    origin = nil,

    ---Returns true if the selection is empty i.e. there are no pixels selected.
    ---@type boolean
    isEmpty = nil,

    deselect = function (self) end,

    ---Replaces the selection with the given [rectangle](lua://Rectangle#rectangle). If you want to add a rectangle to the selection, you can use [Selection:add()](lua://Selection#selectionadd).
    ---@param rectangle Rectangle
    select = function (self, rectangle) end,

    ---Selected the whole sprite canvas. Only valid for a [sprite.selection](lua://Sprite#spriteselection).
    selectAll = function (self) end,

    ---Adds a new rectangle (or `otherSelection`) to the `selection`. Creating an union between the existent selected area and the given `rectangle`/`otherSelection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    add = function (self, rectangle) end,

    ---Subtracts the given `rectangle` (or `otherSelection`) from `selection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    subtract = function (self, rectangle) end,

    ---Creates an intersection in `selection` between the given `rectangle` (or `otherSelection`) and the already selected area in `selection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    intersect = function (self, rectangle) end,

    ---Returns true or false if the given [point](lua://Point#point) is inside the selection.
    ---@param point Point
    ---@return boolean
    ---@overload fun(self, x: integer, y: integer)
    contains = function (self, point) end,
}

---Creates a new empty selection, or with the given [rectangle](lua://Rectangle#rectangle).
---@param rectangle? Rectangle
---@return Selection
function Selection (rectangle) end
