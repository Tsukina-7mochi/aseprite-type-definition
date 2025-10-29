---@meta

---Blend modes defines how the colors should be mixed when two images overlaps. Used in [Image:drawImage()](lua://Image.drawImage) as input argument.
---@class BlendMode
BlendMode = {
    ---Mix the background colors with the blending image proportionally to its alpha values. Full transparent pixels will show the background.
    ---@type BlendMode
    NORMAL = nil,

    ---A simple copy/paste of the blending image to the background.
    ---@type BlendMode
    SRC = nil,

    ---@type BlendMode
    MULTIPLY = nil,

    ---@type BlendMode
    SCREEN = nil,

    ---@type BlendMode
    OVERLAY = nil,

    ---@type BlendMode
    DARKEN = nil,

    ---@type BlendMode
    LIGHTEN = nil,

    ---@type BlendMode
    COLOR_DODGE = nil,

    ---@type BlendMode
    COLOR_BURN = nil,

    ---@type BlendMode
    HARD_LIGHT = nil,

    ---@type BlendMode
    SOFT_LIGHT = nil,

    ---@type BlendMode
    DIFFERENCE = nil,

    ---@type BlendMode
    EXCLUSION = nil,

    ---@type BlendMode
    HSL_HUE = nil,

    ---@type BlendMode
    HSL_SATURATION = nil,

    ---@type BlendMode
    HSL_COLOR = nil,

    ---@type BlendMode
    HSL_LUMINOSITY = nil,

    ---@type BlendMode
    ADDITION = nil,

    ---@type BlendMode
    SUBTRACT = nil,

    ---@type BlendMode
    DIVIDE = nil,
}
