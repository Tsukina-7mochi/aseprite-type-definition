---@meta

---An image object. Each [cel](https://www.aseprite.org/docs/cel/) has one image (all [linked cels](https://www.aseprite.org/docs/linked-cels/) share the same image).
---@class Image
local _image = {
    ---Creates a copy of the given image. You can use the `Image(otherImage)` constructor for the same behavior.
    ---@return Image
    clone = function (self) end,

    ---Internal unique ID (an integer) assigned to this image inside the program. You can use it to identify this image in your script.
    ---@type integer
    id = nil,

    ---Internal version (an integer) assigned to this image inside the program. It's always incremented when the image is modified. Can be used to cache some complex calculation related to the image and recalculate it only if the version is modified (which means the pixels are modified).
    ---@type integer
    version = nil,

    ---Returns the width of the image in pixels.
    ---@type integer
    width = nil,

    ---Returns the height of the image in pixels.
    ---@type integer
    height = nil,

    ---Returns a [rectangle](lua://Rectangle) with the bounds of the image with origin equal to (0, 0).
    ---@type Rectangle
    bounds = nil,

    ---Image [color mode](lua://ColorMode).
    ---@type ColorMode
    colorMode = nil,

    ---The [specification](lua://ImageSpec) for this image.
    ---@type ImageSpec
    spec = nil,

    ---Returns the [cel](lua://Cel) to which this image belongs or `nil` if this image is not associated to a cel.
    ---@type Cel | nil
    cel = nil,

    ---A byte string that contains raw image data. The layout depends on the image's color mode. It can be used with the usual string methods, or split into bytes using `string.bytes`. For editing the image, it's easier to use `image:pixels()`.
    ---@type string
    bytes = nil,

    ---Number of bytes for each row in the image. Each image has a total of `image.rowStride * image.height` bytes. It's useful if you are going to get or set the [Image.bytes](lua://Image.bytes) property manually.
    ---@type integer
    rowStride = nil,

    ---Number of bytes per pixel.
    ---@type integer
    bytesPerPixel = nil,

    ---Clears the image pixels in a given [bounds](lua://Rectangle) with a the given [color](lua://Color). The entire image is erased by default if no bounds present. `image.spec.transparentColor` if no color specified.
    ---@override fun(self, color: Color)
    ---@override fun(self, bounds: Rectangle, color: Color)
    clear = function (self) end,

    ---Sets the pixel in the *xy*-coordinate to the given [integer pixel value](lua://app.pixelColor). The *xy*-coordinate is relative to the image, so pixel (0, 0) is the first pixel at the top-left coorner in the image, not in the sprite canvas.
    ---@param x integer
    ---@param y integer
    ---@param color integer
    drawPixel = function (self, x, y, color) end,

    ---Gets the pixel in the *xy*-coordinate.
    ---@param x integer
    ---@param y integer
    ---@return integer
    getPixel = function (self, x, y) end,

    ---@param sourceImage Image
    ---@overload fun(self, sourceImage: Image, position: Point)
    ---@overload fun(self, sourceImage: Image, position: Point, opacity: integer)
    ---@overload fun(self, sourceImage: Image, position: Point, opacity: integer, blendMode: BlendMode)
    drawImage = function (self, sourceImage) end,

    ---@param sourceSprite Sprite
    ---@param frameNumber integer
    ---@overload fun(self, sourceSprite: Sprite, frameNumber: integer, position: Point)
    drawSprite = function (self, sourceSprite, frameNumber) end,

    ---@param anotherImage Image
    ---@return boolean
    isEqual = function (self, anotherImage) end,

    ---@return boolean
    isEmpty = function (self) end,

    ---@param color Color | integer
    ---@return boolean
    isPlain = function (self, color) end,

    ---@class _Pixel
    ---@field x integer
    ---@field y integer
    ---@operator call(integer?): integer

    ---@param rectangle? Rectangle
    ---@return fun(): _Pixel
    pixels = function (self, rectangle) end,

    ---@deprecated
    ---@param x integer
    ---@param y integer
    ---@param color integer
    putPixel = function (self, x, y, color) end,

    ---@deprecated
    ---@param image Image
    ---@param position? Point
    putImage = function (self, image, position) end,

    ---@deprecated
    ---@param sprite Sprite
    ---@param frameNumber integer
    ---@param position Point
    putSprite = function (self, sprite, frameNumber, position) end,

    ---@param filename string
    ---@overload fun(self, options: { filename: string, palette: Palette? })
    saveAs = function (self, filename) end,

    ---@param width integer
    ---@param height integer
    ---@overload fun(self, options: { width: integer, height: integer, method: ("bilinear" | "rotsprite")?, pivot: Point? })
    ---@overload fun(self, options: { size: Size, method: ("bilinear" | "rotsprite")?, pivot: Point? })
    resize = function (self, width, height) end,

    ---@overload fun(self, refColor: Color)
    shrinkBounds = function (self) end,

    ---@overload fun (self, type: FlipType)
    flip = function (self) end,
}

---Creates a new image with the given `width` and `height`. The [color mode](lua://ColorMode) is optional, [RGB](lua://ColorMode.RGB) by default.
---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Image
---@overload fun(spec: ImageSpec): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image, rectangle?: Rectangle): Image
---@overload fun(option: { fromFile: string }): Image
function Image (width, height, colorMode) end
