---@meta

---@class Palette
---@operator len: integer
local _palette = {
    ---@param ncolors integer
    resize = function (self, ncolors) end,

    ---@param index integer
    ---@return Color
    getColor = function (self, index) end,

    ---@param index integer
    ---@param color Color | integer
    setColor = function (self, index, color) end,

    ---@type Frame
    frame = nil,

    ---@param filename string
    saveAs = function (self, filename) end,
}

---@return Palette
---@overload fun(ncolors: integer): Palette
---@overload fun(otherPalette: Palette): Palette
---@overload fun(options: { fromFile: string })
---@overload fun(options: { fromResource: string })
function Palette () end
