---@meta

---Represents a color that can be choose by the user in different kinds (RGB, HSV, HSL, grayscale, indexed).
---@class Color
local _color = {
    ---@type integer
    alpha = nil,

    ---Get/sets red/green/blue components of the color.
    ---@type integer
    red = nil,

    ---Get/sets red/green/blue components of the color.
    ---@type integer
    green = nil,

    ---Get/sets red/green/blue components of the color.
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

    ---Gets/sets the [HSV hue](lua://Color.hsvHue) or [HSL hue](lua://Color.hslHue) depending on the kind of color.
    ---@type integer
    hue = nil,

    ---Gets/sets the [HSV saturation](lua://Color.hsvSaturation) or [HSL saturation](lua://Color.hslSaturation) depending on the kind of color.
    ---@type integer
    saturation = nil,

    ---Gets/sets the [HSV value](lua://Color.hsvValue).
    ---@type integer
    value = nil,

    ---Gets/sets the [HSL lightness](lua://Color.hslLightness).
    ---@type integer
    lightness = nil,

    ---Gets or sets the palette index related to this color. If the color is not an index, i.e. it's RGB/HSL/HSV, the closest palette index of the current palette (the palette of the active sprite) that matches the RGB/HSL/HSV values will be returned.
    ---@type integer
    index = nil,

    ---@type integer
    gray = nil,

    ---Returns the [pixel color](lua://app.pixelColor.rgba) which is equivalent to the RGBA values of this color.
    ---@type integer
    rgbaPixel = nil,

    ---Returns the [pixel color](lua://app.pixelColor.graya) which is equivalent to the gray+alpha values of this color.
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
