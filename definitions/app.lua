---@meta

app = {
    ---@type Site
    site = nil,

    ---@type Range
    range = nil,

    ---@type Cel | nil
    cel = nil,

    ---@type Frame | nil
    frame = nil,

    ---@type Image | nil
    image = nil,

    ---@type Layer | nil
    layer = nil,

    ---@type Sprite | nil
    sprite = nil,

    ---@type Tag | nil
    tag = nil,

    ---@type Tool
    tool = nil,

    ---@type Brush
    brush = nil,

    ---@type Editor | nil
    editor = nil,

    ---@type Window | nil
    window = nil,

    ---@type Version
    version = nil,

    apiVersion = 36,

    ---@type Color
    fgColor = nil,

    ---@type Color
    bgColor = nil,

    ---@type Tile
    fgTile = nil,

    ---@type Tile
    bgTile = nil,

    ---@type boolean
    isUIAvailable = nil,

    ---@type Sprite[]
    sprites = nil,

    ---@type table<string, string>
    params = nil,

    ---@type number
    uiScale = nil,

    ---@type Palette
    defaultPalette = nil,

    ---@type Events
    events = nil,

    ---@param text string
    ---@return integer buttonClicked
    ---@overload fun(options: { title: string, text: string|string[], buttons: string | string[] }): integer
    alert = function (text) end,

    ---@param text string
    ---@overload fun(text: string, duration: number)
    ---@overload fun(options: { text: string, duration: number })
    tip = function (text) end,

    ---@param filename string
    ---@return Sprite | nil
    open = function (filename) end,

    exit = function () end,

    ---@param func fun()
    ---@overload fun(label: string, func: fun(): any)
    transaction = function (func) end,

    refresh = function () end,

    undo = function () end,

    redo = function () end,

    ---@param options {
    ---    tool: string | Tool,
    ---    color: Color,
    ---    bgColor: Color,
    ---    brush: Brush,
    ---    points: Point[],
    ---    cel: Cel,
    ---    layer: Layer,
    ---    frame: Frame,
    ---    ink: Ink,
    ---    button: MouseButton,
    ---    opacity: integer,
    ---    contiguous: boolean,
    ---    tolerance: integer,
    ---    freehandAlgorithm: 0 | 1,
    ---    selection: SelectionMode?,
    ---    tilemapMode: TilemapMode?,
    ---    tilesetMode: TilesetMode?,
    ---}
    usetool = function (options) end,

    ---@deprecated
    ---@type Sprite | nil
    activeSprite = nil,

    ---@deprecated
    ---@type Layer | nil
    activeLayer = nil,

    ---@deprecated
    ---@type Frame | nil
    activeFrame = nil,

    ---@deprecated
    ---@type Cel | nil
    activeCel = nil,

    ---@deprecated
    ---@type Image | nil
    activeImage = nil,

    ---@deprecated
    ---@type Tag | nil
    activeTag = nil,

    ---@deprecated
    ---@type Tool
    activeTool = nil,

    ---@deprecated
    ---@type Brush
    activeBrush = nil,
}
