---@meta

---@class Color
local _color = {
    ---@type integer
    alpha = nil,

    ---@type integer
    red = nil,

    ---@type integer
    green = nil,

    ---@type integer
    blue = nil,

    ---@type integer
    hsvHue = nil,

    ---@type integer
    hsvSaturation = nil,

    ---@type integer
    hsvValue = nil,

    ---@type integer
    hslHue = nil,

    ---@type integer
    hslSaturation = nil,

    ---@type integer
    hslLightness = nil,

    ---@type integer
    hue = nil,

    ---@type integer
    saturation = nil,

    ---@type integer
    value = nil,

    ---@type integer
    lightness = nil,

    ---@type integer
    index = nil,

    ---@type integer
    gray = nil,

    ---@type integer
    rgbaPixel = nil,

    ---@type integer
    grayPixel = nil,
}

---@param index integer
---@return Color
---@overload fun(options: { r: number, g: number, b: number, a: integer }): Color
---@overload fun(options: { h: number, s: number, v: number, a: integer }): Color
---@overload fun(options: { h: number, s: number, l: number, a: integer }): Color
---@overload fun(options: { red: integer, green: integer, blue: integer, alpha: integer }): Color
---@overload fun(options: { hue: number, saturation: number, value: number, alpha: integer }): Color
---@overload fun(options: { hue: number, saturation: number, lightness: number, alpha: integer }): Color
---@overload fun(options: { gray: integer, alpha: integer }): Color
---@overload fun(options: { index: integer }): Color
function Color (index) end
