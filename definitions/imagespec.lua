---@meta

---It's a simple object that contains some specifications to create new [sprites](lua://Sprite) or [images](lua://Image), or to get the information (specs) of a [sprite](lua://Sprite.spec) or [image](lua://Image.spec), like the canvas size (width/height), [color mode](lua://ColorMode), and color space. Often abbreviated as 'spec' in the API.
---@class ImageSpec
local _imageSpec = {
    ---Gets or sets the [color mode](lua://ColorMode) of the image or sprite.
    ---@type ColorMode
    colorMode = nil,

    ---Gets or sets the width of the image or sprite.
    ---@type integer
    width = nil,

    ---Gets or sets the height of the image or sprite.
    ---@type integer
    height = nil,

    ---Gets or sets the [color space](lua://ColorSpace) for an image or sprite.
    ---@type ColorSpace
    colorSpace = nil,

    ---Gets or sets the index that refers a transparent color in a palette when the image or sprite uses indexed [color mode](lua://ColorMode).
    ---@type Color
    transparentColor = nil,
}

---Creates a new `ImageSpec` instance.
---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: { width: integer, height: integer, colorMode: ColorMode, transparentColor: number })
function ImageSpec () end
