---@meta

---The color mode of an sprite or image specifies the internal structure of each pixel. You can see the [Color Mode section in the Aseprite docs](https://www.aseprite.org/docs/color-mode/) for an introduction about each color mode.
---@class ColorMode
ColorMode = {
    ---You can use this color mode to create RGBA [sprites](lua://Sprite) and [images](lua://Image).
    ---@type ColorMode
    RGB = nil,

    ---You can use this color mode to create gray [sprites](lua://Sprite) and [images](lua://Image). Known as `ColorMode.GRAYSCALE` in previous versions.
    ---@type ColorMode
    GRAY = nil,

    ---You can use this color mode to create indexed [sprites](lua://Sprite) and [images](lua://Image).
    ---@type ColorMode
    INDEXED = nil,

    ---Special color mode used for tilemaps, where each pixel is tile reference in a [tileset](lua://Tileset).
    ---@type ColorMode
    TILEMAP = nil,
}
