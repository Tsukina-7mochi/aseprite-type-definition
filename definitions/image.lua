---@meta

---@class Image
local _image = {
    ---@return Image
    clone = function (self) end,

    ---@type integer
    id = nil,

    ---@type integer
    version = nil,

    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type Rectangle
    bounds = nil,

    ---@type ColorMode
    colorMode = nil,

    ---@type ImageSpec
    spec = nil,

    ---@type Cel | nil
    cel = nil,

    ---@type string
    bytes = nil,

    ---@type integer
    rowStride = nil,

    ---@type integer
    bytesPerPixel = nil,

    ---@override fun(self, color: Color)
    ---@override fun(self, bounds: Rectangle, color: Color)
    clear = function (self) end,

    ---@param x integer
    ---@param y integer
    ---@param color integer
    drawPixel = function (self, x, y, color) end,

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

---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Image
---@overload fun(spec: ImageSpec): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image, rectangle?: Rectangle): Image
---@overload fun(option: { fromFile: string }): Image
function Image (width, height, colorMode) end
