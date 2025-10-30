---@meta

---Represents the [color space/profile](https://www.aseprite.org/docs/color-profile/) of a [sprite](lua://Sprite), [image](lua://Image), or [image spec](lua://ImageSpec).
---@class ColorSpace
local _colorSpace = {
    ---Get/sets the color space name.
    ---@type string
    name = nil,
}

---Creates an empty color space, sRGB color space, or loads a color profile from the given ICC file specified in `fromFile` parameter.
---@return ColorSpace
---@overload fun(options: { sRGB: boolean }): ColorSpace
---@overload fun(options: { fromFile: string }): ColorSpace
function ColorSpace () end
