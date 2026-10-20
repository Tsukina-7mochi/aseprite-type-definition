---@meta

---This [`app`](lua://app) property contains a set of functions to handle the color for [Image pixels](lua://Image.pixels) at the lowest level: an unsigned integer.
---
---On Aseprite there are two ways to handle colors:
---
---1. The [Color](lua://Color) object type (a high-level/abstract/user-friendly way to handle color)
---2. An unsigned integer (low-level/performance-wise) value which can represent several kinds of colors:
---   - For [RGB](lua://ColorMode.RGB) images: a 32-bit unsigned integer value (8-bit for each of the four RGBA components)
---   - [Gray](lua://ColorMode.GRAY) images: a 16-bit unsigned integer with Alpha and Grayscale value (8-bit for Alpha, 8-bit for Gray)
---   - [Indexed](lua://ColorMode.INDEXED) images: 8-bit unsigned integer which represents a value from 0 to 255 to reference a [palette entry](lua://Palette.getColor)
---
---For performance reasons, pixel values on [images](lua://Image) are handled with the second kind of colors: an unsigned integer value. This color format is used when you handle pixels directly with functions like [Image:getPixel()](lua://Image.getPixel), [Image:putPixel()](lua://Image.putPixel), or [Image:pixels()](lua://Image.pixels).
app.pixelColor = {
    ---Constructs a 32-bit unsigned integer for [RGBA](lua://ColorMode.RGB) images. Alpha will be 255 (i.e. 100% opaque) if it's not specified.
    ---@param red integer
    ---@param green integer
    ---@param blue integer
    ---@return integer
    ---@overload fun(red: integer, green: integer, blue: integer, alpha: integer): integer
    rgba = function (red, green, blue) end,

    ---Returns the red component of the given 32-bit integer (`rgbaPixelValue`). This integer is a value created with [`app.pixelColor.rgba()`](lua://app.pixelColor.rgba) or [`Image:getPixel()`](lua://Image.getPixel) from a [RGBA](lua://ColorMode.RGB) image.
    ---
    ---Note: RGB components **are not** premultiplied by alpha.
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

    ---Returns the gray component of the given 16-bit integer (`grayPixelValue`). This integer is a value created with [`app.pixelColor.graya()`](lua://app.pixelColor.graya) or [`Image:getPixel()`](lua://Image.getPixel) from a [grayscale](lua://ColorMode.GRAY) image.
    ---@param grayPixelValue integer
    ---@return integer
    grayaV = function (grayPixelValue) end,

    ---Same as [grayaV()](lua://app.pixelColor.grayaV) but with the Alpha component.
    ---@param grayaPixelValue integer
    ---@return integer
    grayaA = function (grayaPixelValue) end,
}
