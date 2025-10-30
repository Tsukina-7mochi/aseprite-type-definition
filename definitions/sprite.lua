---@meta

---@class Sprite
local _sprite = {
    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type Rectangle
    bounds = nil,

    ---@type Rectangle
    gridBounds = nil,

    ---@type Size
    pixelRatio = nil,

    ---@type Selection
    selection = nil,

    ---@type string
    filename = nil,

    ---@type integer
    id = nil,

    ---@type boolean
    isModifier = nil,

    ---@type ColorSpace
    colorSpace = nil,

    ---@type ColorMode
    colorMode = nil,

    ---@type ImageSpec
    spec = nil,

    undoHistory = {
        ---@type integer
        undoSteps = nil,

        ---@type integer
        redoSteps = nil,
    },

    ---@type Frame[]
    frames = nil,

    ---@type Palette[]
    palettes = nil,

    ---@type Layer[]
    layers = nil,

    ---@type Cel[]
    cels = nil,

    ---@tyepe Tag[]
    tags = nil,

    ---@type Slice[]
    slices = nil,

    ---@type Tileset[]
    tilesets = nil,

    ---@type Layer | nil
    backgroundLayer = nil,

    ---@type integer
    transparentColor = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---@param width integer
    ---@param height integer
    ---@overload fun(self, size: Size)
    resize = function (self, width, height) end,

    ---@param x integer
    ---@param y integer
    ---@param width integer
    ---@param height integer
    ---@overload fun(self, rectangle: Rectangle)
    crop = function (self, x, y, width, height) end,

    ---@param filename string
    saveAs = function (self, filename) end,

    ---@param filename string
    saveCopyAs = function (self, filename) end,

    close = function (self) end,

    ---@param filename string
    loadPalette = function (self, filename) end,

    ---@param palette Palette
    setPalette = function (self, palette) end,

    ---@param colorSpace ColorSpace
    assignColorSpace = function (self, colorSpace) end,

    ---@param colorSpace ColorSpace
    convertColorSpace = function (self, colorSpace) end,

    ---@return Layer
    newLayer = function (self) end,

    ---@return Layer
    newGroup = function (self) end,

    ---@param layerName string
    ---@overload fun(self, layer: Layer)
    deleteLayer = function (self, layerName) end,

    ---@param frame Frame
    ---@return Frame
    ---@overload fun(self, frameNumber: integer)
    newFrame = function (self, frame) end,

    ---@param frameNumber integer
    ---@return Frame
    newEmptyFrame = function (self, frameNumber) end,

    ---@param frame Frame
    deleteFrame = function (self, frame) end,

    ---@param layer Layer
    ---@param frame Frame
    ---@return Cel
    ---@overload fun(self, layer: Layer, frame: Frame, image: Image, position: Point)
    newCel = function (self, layer, frame) end,

    ---@param cel Cel
    ---@overload fun(self, layer: Layer, frame: Frame)
    deleteCel = function (self, cel) end,

    ---@param fromFrameNumber integer
    ---@param toFrameNumber integer
    ---@return Tag
    newTag = function (self, fromFrameNumber, toFrameNumber) end,

    ---@param tag Tag
    ---@overload fun(self, tagName: string)
    deleteTag = function (self, tag) end,

    ---@return Slice
    ---@overload fun(self, rectangle: Rectangle): Slice
    newSlice = function (self) end,

    ---@param slice Slice
    ---@overload fun(self, sliceName: string)
    deleteSlice = function (self, slice) end,

    ---@return Tileset
    ---@overload fun (grid: Grid): Tileset
    ---@overload fun (rectangle: Rectangle): Tileset
    ---@overload fun (grid: Grid, numTiles: integer): Tileset
    ---@overload fun (rectangle: Rectangle, numTiles: integer): Tileset
    ---@overload fun (anotherTileset: Tileset): Tileset
    newTileset = function (self) end,

    ---@param tileset Tileset
    ---@overload fun(self, tilesetIndex: integer)
    deleteTileset = function (self, tileset) end,

    ---@param tileset Tileset
    ---@overload fun (tileset: Tileset, tilesetIndex: integer)
    newTile = function (self, tileset) end,

    ---@param tile Tile
    ---@overload fun(self, tileset: Tileset, tileIndex: integer)
    deleteTile = function (self, tile) end,

    flatten = function (self) end,

    ---@type Events
    events = nil,

    ---@type string
    tileManagementPlugin = nil,
}

---@param width integer
---@param height integer
---@return Sprite
---@overload fun(width: integer, height: integer, colorMode: ColorMode): Sprite
---@overload fun(spec: ImageSpec): Sprite
---@overload fun (otherSprite: Sprite): Sprite
---@overload fun(options: { fromFile: string }): Sprite
---@overload fun(options: { fromFile: string, oneFrame: boolean }): Sprite
function Sprite (width, height) end
