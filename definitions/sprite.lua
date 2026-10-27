---@meta

---@class Sprite
local _sprite = {
    ---@type integer
    width = nil,

    ---@type integer
    height = nil,

    ---@type Rectangle
    bounds = nil,

    ---Gets or sets the bounds of the sprite grid as a [rectangle](lua://Rectangle). By default, this is 16x16 (with its origin at 0,0) but the default value can be [changed from *Edit > Preferences > Grid*](https://www.aseprite.org/docs/preferences/).
    ---@type Rectangle
    gridBounds = nil,

    ---@type Size
    pixelRatio = nil,

    ---@type Selection
    selection = nil,

    ---Gets or sets the name of the file from which this sprite was loaded or saved, or returns the sprite title if it's a new sprite without an associated file.
    ---@type string
    filename = nil,

    ---@type integer
    id = nil,

    ---Returns `true` if the sprite is modified compared to the latest saved state on disk.
    ---@type boolean
    isModified = nil,

    ---Returns `true` if the sprite object is a valid object (the sprite is open).
    ---@type boolean
    isValid = nil,

    ---Returns true if the sprite was loaded from or saved to a file on the disk.
    ---@type boolean
    hasAssociatedFile = nil,

    ---@type ColorSpace
    colorSpace = nil,

    ---@type ColorMode
    colorMode = nil,

    ---@type ImageSpec
    spec = nil,

    ---Gets or sets if the sprite should use [layer](lua://Layer) UUIDs.
    ---@type boolean
    useLayerUuids = nil,

    undoHistory = {
        ---@type integer
        undoSteps = nil,

        ---@type integer
        redoSteps = nil,
    },

    ---@type Frame[]
    frames = nil,

    ---An array of [palettes](lua://Palette). In most cases, it only contains one palette (`sprite.palettes[1]`), except in a very specific case.
    ---
    ---In the event that two or more [indexed](https://www.aseprite.org/docs/color-mode#indexed) numbered files (eg. `spr_01.png`, `spr_02.png`, `spr_03.png` etc.) are [opened as a sequence](https://www.aseprite.org/docs/open#loading-image-sequences), each frame would have its own palette. This only occurs when there are at least two different indexed palettes, so the indexed palette for the `spr_01.png` frame would have a different index-to-color mapping than the indexed palette for `spr_02.png` (as would `spr_03.png`), hence the need for three sprite palettes. If two images/frames have the same indexed palette, they will share it (so if `spr_01.png` and `spr_02.png` have the same palette, but `spr_03.png` has a different one, there would be `2` sprite palettes).
    ---
    ---There is no proper UI to support multiple palettes at the moment, but in the future we want to create an easy way to create [color cycling animations](https://en.wikipedia.org/wiki/Color_cycling).
    ---@type Palette[]
    palettes = nil,

    ---@type Layer[]
    layers = nil,

    ---@type Cel[]
    cels = nil,

    ---@type Tag[]
    tags = nil,

    ---@type Slice[]
    slices = nil,

    ---@type Tileset[]
    tilesets = nil,

    ---@type Layer | nil
    backgroundLayer = nil,

    ---The transparent color is an integer that specifies which index (`0` by default) is the transparent color in transparent layers on indexed sprites.
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

    ---Saves a copy of the sprite to the given file but does not change the saved state of the sprite. If the sprite is then modified, the user will be asked to save changes on close.
    ---@param filename string
    saveCopyAs = function (self, filename) end,

    ---Closes the sprite. This does not ask the user to save changes. If you want to do the classic *File > Close* where the user is asked to save changes, you can use `app.command.CloseFile()`.
    close = function (self) end,

    ---@param filename string
    loadPalette = function (self, filename) end,

    ---@param palette Palette
    setPalette = function (self, palette) end,

    ---Assigns a new [color space](lua://ColorSpace) to the sprite without modifying the sprite pixels.
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

    ---Deletes the given [cel](lua://Cel). If the cel is from a transparent layer, the cel is completely deleted, but if the cel is from a background layer, the cel will be deleted with the [background color](lua://app.bgColor).
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

    ---Returns a new [tileset](lua://Tileset) and adds it to the sprite's tilesets.
    ---
    ---If no parameters are given, the resulting tileset will have only one empty tile and a tile size equal to the active [sprite grid size](lua://Sprite.gridBounds).
    ---
    ---If a Grid or Rectangle is specified, it is used to set the resulting tileset's origin and tile size.
    ---
    ---numTiles specifies the number of tiles we want the tileset to contain initially.
    ---
    ---If another tileset is passed as the only parameter, the result is a duplicate of it. Take into consideration that the passed tileset cannot belong to another sprite.
    ---@return Tileset
    ---@overload fun(self, grid: Grid): Tileset
    ---@overload fun(self, rectangle: Rectangle): Tileset
    ---@overload fun(self, grid: Grid, numTiles: integer): Tileset
    ---@overload fun(self, rectangle: Rectangle, numTiles: integer): Tileset
    ---@overload fun(self, anotherTileset: Tileset): Tileset
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

    ---Flattens all layers of the sprite into one layer. The same as calling `app.command.FlattenLayers()`.
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
