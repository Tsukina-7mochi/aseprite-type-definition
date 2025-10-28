---@meta

---@class ImageSpec
local _imageSpec = {
    ---@type ColorMode
    colorMode = nil,

    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type ColorSpace
    colorSpace = nil,

    ---@type Color
    transparentColor = nil,
}

---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: { width: integer, height: integer, colorMode: ColorMode, transparentColor: number })
function ImageSpec () end
