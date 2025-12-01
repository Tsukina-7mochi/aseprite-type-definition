---@meta

---This [app](lua://app) property contains a set of function to handle the color for [Image pixels](lua://Image.pixels) at the lowest level: an unsigned integer.
--- @class PixelColor
local _pixelColor = {
    ---Constructs a 32-bit unsigned integer for [RGBA](lua://ColorMode.RGB) images. Alpha will be 255 (i.e. 100% opaque) if it's not specified.
    ---@param red integer
    ---@param green integer
    ---@param blue integer
    ---@return integer
    ---@overload fun(red: integer, green: integer, blue: integer, alpha: integer): integer
    rgba = function (red, green, blue) end,

    ---Returns the red component of the given 32-bit integer (`rgbaPixelValue`). This integer is a value created with [app.pixelColor.rgba()](lua://app.pixelColor.rgba) or [Image:getPixel()](lua://Image.getPixel) from a [RGBA](lua://ColorMode.RGB) image.
    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaR = function (rgbaPixelValue) end,

    ---Same as [rgbaR()](lua://app.pixelColor.rgbaR) but with the Green component.
    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaG = function (rgbaPixelValue) end,

    ---Same as [rgbaR()](lua://app.pixelColor.rgbaR) but with the Blue component.
    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaB = function (rgbaPixelValue) end,

    ---Same as [rgbaR()](lua://app.pixelColor.rgbaR) but with the Alpha component.
    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaA = function (rgbaPixelValue) end,

    ---Constructs a 16-bit unsigned integer for [grayscale](lua://ColorMode.GRAYSCALE) images. Alpha will be 255 (i.e. 100% opaque) if it's not specified.
    ---@param gray integer
    ---@return integer
    ---@overload fun(gray: integer, alpha: integer): integer
    graya = function (gray) end,

    ---Returns the gray component of the given 16-bit integer (`grayPixelValue`). This integer is a value created with [app.pixelColor.graya()](lua://app.pixelColor.graya) or [Image:getPixel()](lua://Image.getPixel) from a [grayscale](lua://ColorMode.GRAY) image.
    ---@param grayaPixelValue integer
    ---@return integer
    grayaV = function (grayaPixelValue) end,

    ---Same as [grayaV()](lua://app.pixelColor.grayaV) but with the Alpha component.
    ---@param grayaPixelValue integer
    ---@return integer
    grayaA = function (grayaPixelValue) end,
}
