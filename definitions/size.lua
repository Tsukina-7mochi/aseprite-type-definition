---@meta

---@class Size
local _size = {
    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---Same as [Size.width](lua://Size#sizewidth).
    ---@type integer
    w = nil,

    ---Same as [Size.height](lua://Size#sizeheight).
    ---@type integer
    h = nil,

    ---Returns the new size `newSize` which will be big enough to contains both given dimensions (`size` and `otherSize`).
    ---@param otherSize Size
    ---@return Size
    union = function (self, otherSize) end,
}

---Creates a new `Size` instance with the given dimensions (or `width=height=0` if they are not specified).
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: { width: integer, height: integer }): Size
---@overload fun(options: { w: integer, h: integer }): Size
---@overload fun(numbers: { [1]: integer, [2]: integer }): Size
function Size () end
