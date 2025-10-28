---@meta

---@class ColorSpace
local _colorSpace = {
    ---@type string
    name = nil,
}

---@return ColorSpace
---@overload fun(options: { sRGB: boolean }): ColorSpace
---@overload fun(options: { fromFile: string }): ColorSpace
function ColorSpace () end
