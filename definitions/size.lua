---@meta

---@class Size
local _size = {
    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type integer
    w = nil,

    ---@type integer
    h = nil,

    ---@param otherSize Size
    ---@return Size
    union = function (self, otherSize) end,
}

---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: { width: integer, height: integer }): Size
---@overload fun(options: { w: integer, h: integer }): Size
---@overload fun(numbers: { [1]: integer, [2]: integer }): Size
function Size () end
