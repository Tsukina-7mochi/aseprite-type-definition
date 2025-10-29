---The *GraphicsContext* object provides methods for drawing images, text and shapes on the canvas.
---@class GraphicsContext
local _graphicsContext = {
    ---Gets the width of the visible area in pixels. Canvas dimensions change when the dialog is resized by the user.
    ---@type integer
    width = nil,

    ---Gets the height of the visible area in pixels. Canvas dimensions change when the dialog is resized by the user.
    ---@type integer
    height = nil,

    ---Gets or sets whether paths and shapes are painted on using antialiasing.
    ---@type boolean
    antialias = nil,

    ---Gets or sets the [color](lua://Color) to paint with the path functions.
    ---@type Color
    color = nil,

    ---Gets or sets the width of lines painted when calling [GraphicsContext:stroke()](lua://GraphicsContext.stroke) or [GraphicsContext:strokeRect()](lua://GraphicsContext.strokeRect).
    ---@type number
    strokeWidth = nil,

    ---[Blend mode](lua://BlendMode) used in [stroke()](lua://GraphicsContext.stroke), [fill()](lua://GraphicsContext.fill), [drawImage()](lua://GraphicsContext.drawImage), etc.
    ---@type BlendMode
    blendMode = nil,

    ---Opacity used in [stroke()](lua://GraphicsContext.stroke), [fill()](lua://GraphicsContext.fill), [drawImage()](lua://GraphicsContext.drawImage), etc.
    ---@type integer
    opacity = nil,

    ---It has the same functionality as [app.theme](lua://app.theme), with the only difference that the values returned by accessing dimensions or style metrics data are not affected by the current UI Scale setting. This is useful when you are drawing on a dialog canvas's GraphicsContext with [autoScaling](lua://Dialog.canvas) enabled, so you don't have to worry about adjusting sizes and measures when painting on the canvas using the current theme.
    ---@type Theme
    theme = nil,

    ---Saves the current state of the canvas to [restore](lua://GraphicsContext.restore) it later, including: [color](lua://GraphicsContext.color), [opacity](lua://GraphicsContext.opacity), [blendMode](lua://GraphicsContext.blendMode), [stroke width](lua://GraphicsContext.strokeWidth), [clipping region](lua://GraphicsContext.clip).
    save = function (self) end,

    ---Restores the last [saved](lua://GraphicsContext.save) canvas state.
    restore = function (self) end,

    ---Sets the [current path](lua://GraphicsContext.beginPath) as a clipping area for following drawing operations.
    clip = function (self) end,

    ---Paints the edges of the given [rectangle](lua://Rectangle) with the [current color](lua://GraphicsContext.color) and [current width](lua://GraphicsContext.strokeWidth).
    ---@param rectangle Rectangle
    strokeRect = function (self, rectangle) end,

    ---Fills the given [rectangle](lua://Rectangle) with the [current color](lua://GraphicsContext.color).
    ---@param rectangle Rectangle
    fillRect = function (self, rectangle) end,

    ---Draws on the canvas the given text string, at a position specified by the *xy*-coordinates.
    ---@param text string
    ---@param x number
    ---@param y number
    fillText = function (self, text, x, y) end,

    ---Returns the [size](lua://Size) of the given text using the current font.
    ---@param text string
    ---@return Size
    measureText = function (self, text) end,

    ---Draws on the canvas the given image.
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

    ---Draws on the canvas a theme part specified by the given *partId*, at a given [Point](lua://Point) or at specified *xy*-coordinates.
    ---@param partId string
    ---@param point Point
    ---@overload fun(self, partId: string, x: number, y: number)
    drawThemeImage = function (self, partId, point) end,

    ---Draws on the canvas a theme part specified by the given *partId*, filling a given [Rectangle](lua://Rectangle) or at specified *xy*-coordinates, with given width and height. This method uses [nine-slice scaling](https://en.wikipedia.org/wiki/9-slice_scaling) for parts that have their [Slice's center](lua://Slice.center) defined.
    ---@param partId string
    ---@param rectangle Rectangle
    ---@overload fun(self, partId: string, x: number, w: number, w: number, h: number)
    drawThemeRect = function (self, partId, rectangle) end,

    ---Starts a new path, emptying the list of tracked sub-paths. This is the first method to call when drawing paths.
    beginPath = function (self) end,

    ---Closes the current sub-path by connecting the current point with the first point of the current sub-path.
    closePath = function (self) end,

    ---Starts a new sub-path at the specified *xy*-coordinates. This is the second method to call (after [GraphicsContext:beginPath()](lua://GraphicsContext.beginPath)) when drawing paths.
    ---@param x number
    ---@param y number
    moveTo = function (self, x, y) end,

    ---Adds a line to the current sub-path, from the last point to the specified *xy*-coordinates.
    ---@param x number
    ---@param y number
    lineTo = function (self, x, y) end,

    ---Adds a cubic [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) to the current sub-path, from the last point to the specified *xy*-coordinates, with two control points (specified by *cp1x/cp1y* and *cp2x/cp2y* coordinates).
    ---@param cp1x number
    ---@param cp1y number
    ---@param cp2x number
    ---@param cp2y number
    ---@param x number
    ---@param y number
    cubicTo = function (self, cp1x, cp1y, cp2x, cp2y, x, y) end,

    ---Adds an oval enclosed by the given [Rectangle](lua://Rectangle) to the current sub-path.
    ---@param rectangle Rectangle
    oval = function (self, rectangle) end,

    ---Adds a given [Rectangle](lua://Rectangle) to the current sub-path.
    ---@param rectangle Rectangle
    rect = function (self, rectangle) end,

    ---Adds a given [Rectangle](lua://Rectangle) to the current sub-path with rounded corners.
    ---@param rectangle Rectangle
    ---@param r number
    ---@overload fun(self, rectangle: Rectangle, rx: number, ry: number)
    roundedRect = function (self, rectangle, r) end,

    ---Paints the edges of the [current path](lua://GraphicsContext.beginPath) with the [current color](lua://GraphicsContext.color) and [current width](lua://GraphicsContext.strokeWidth).
    stroke = function (self) end,

    ---Fills the [current path](lua://GraphicsContext.beginPath) with the [current color](lua://GraphicsContext.color).
    fill = function (self) end,
}
