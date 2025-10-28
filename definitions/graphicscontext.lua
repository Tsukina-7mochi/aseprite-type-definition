---@class GraphicsContext
local _graphicsContext = {
    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type boolean
    antialias = nil,

    ---@type Color
    color = nil,

    ---@type number
    strokeWidth = nil,

    ---@type BlendMode
    blendMode = nil,

    ---@type integer
    opacity = nil,

    ---@type Theme
    theme = nil,

    save = function (self) end,

    restore = function (self) end,

    clip = function (self) end,

    ---@param rectangle Rectangle
    strokeRect = function (self, rectangle) end,

    ---@param rectangle Rectangle
    fillRect = function (self, rectangle) end,

    ---@param text string
    ---@param x number
    ---@param y number
    fillText = function (self, text, x, y) end,

    ---@param text string
    ---@return Size
    measureText = function (self, text) end,

    ---@param image Image
    ---@param x number
    ---@param y number
    ---@overload fun(self, image: Image, srcRect: Rectangle, dstRect: Rectangle)
    ---@overload fun(
    ---    self,
    ---    image: Image,
    ---    srcX: number,
    ---    srcY: number,
    ---    srcW: number,
    ---    srcH: number,
    ---    dstX: number,
    ---    dstY: number,
    ---    dstW: number,
    ---    dstH: number,
    ---)
    drawImage = function (self, image, x, y) end,

    ---@param partId string
    ---@param point Point
    ---@overload fun(self, partId: string, x: number, y: number)
    drawThemeImage = function (self, partId, point) end,

    ---@param partId string
    ---@param rectangle Rectangle
    ---@overload fun(self, partId: string, x: number, w: number, w: number, h: number)
    drawThemeRect = function (self, partId, rectangle) end,

    beginPath = function (self) end,

    closePath = function (self) end,

    ---@param x number
    ---@param y number
    moveTo = function (self, x, y) end,

    ---@param x number
    ---@param y number
    lineTo = function (self, x, y) end,

    ---@param cp1x number
    ---@param cp1y number
    ---@param cp2x number
    ---@param cp2y number
    ---@param x number
    ---@param y number
    cubicTo = function (self, cp1x, cp1y, cp2x, cp2y, x, y) end,

    ---@param rectangle Rectangle
    oval = function (self, rectangle) end,

    ---@param rectangle Rectangle
    rect = function (self, rectangle) end,

    ---@param rectangle Rectangle
    ---@param r number
    ---@overload fun(self, rectangle: Rectangle, rx: number, ry: number)
    roundedRect = function (self, rectangle, r) end,

    stroke = function (self) end,

    fill = function (self) end,
}
