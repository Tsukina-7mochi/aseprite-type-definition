---@meta

---Type of flipping to be used in [image:flip](lua://Image.flip)
---@class FlipType
FlipType = {
    ---Defines a type of image flip that horizontally flips an image across the vertical axis.
    ---@type FlipType
    HORIZONTAL = nil,

    ---Defines a type of image flip that vertically flips an image across the horizontal axis.
    ---@type FlipType
    VERTICAL = nil,

    ---Defines a type of image flip that both vertically and horizontally flips an image across the diagonal axis.
    ---@type FlipType
    DIAGONAL = nil,
}
