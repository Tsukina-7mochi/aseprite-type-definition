---@meta


---@type unknown
local undefined


---The `app` global namespace
app = {
    ---The active site
    site=undefined --[[@as Site]],
    ---The range represents the active selection from an objects collection; It returns a sorted list of selected frames, or cels, or layers, or colors, etc.
    range=undefined --[[@as Range]],
    ---The active cel
    activeCel=undefined --[[@as Cel]],
    ---The active frame numbe
    activeFrame=undefined --[[@as integer]],
    ---The active image
    activeImage=undefined --[[@as Image]],
    ---The active layer
    activeLayer=undefined --[[@as Layer]],
    ---The active sprite
    activeSprite=undefined --[[@as Sprite]],
    ---The active tag
    activeTag=undefined --[[@as Tag]],
    ---The active tool
    activeTool=undefined --[[@as Tool]],
    ---The active brush
    activeBrush=undefined --[[@as Brush]],
    ---A set of function to handle the color for Image pixels at the lowest level: an unsigned integer
    pixelColor={
        ---Constructs a 32-bit unsigned integer for RGBA images.
        ---@param red integer
        ---@param green integer
        ---@param blue integer
        ---@param alpha? integer alpha; default is 255 (opaque)
        ---@return integer
        rgba=function(red, green, blue, alpha) end,
        ---Returns the red component
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaR=function(rgbaPixelValue) end,
        ---Returns the green component
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaG=function(rgbaPixelValue) end,
        ---Returns the blue component
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaB=function(rgbaPixelValue) end,
        ---Returns the alpha component
        ---@param rgbaPixelValue integer 32-bit integer
        ---@return integer
        rgbaA=function(rgbaPixelValue) end,
        ---Constructs a 16-bit unsigned integer for grayscale images
        ---@param gray integer
        ---@param alpha integer alpha; default is 255 (opaque)
        ---@return integer
        graya=function(gray, alpha) end,
        ---Returns the gray component
        ---@param grayPixelValue integer 16-bit integer
        grayaV=function(grayPixelValue) end,
        ---Returns the alpha component
        ---@param grayPixelValue integer 16-bit integer
        grayaA=function(grayPixelValue) end
    },
    ---The Aseprite version number (e.g. Version("1.2.10-beta1"))
    version=undefined --[[@as Version]],
    ---The API version
    apiVersion=undefined --[[@as number]],
    ---The foreground color
    fgColor=undefined --[[@as Color]],
    ---The background color
    bgColor=undefined --[[@as Color]],
    ---`true` if the UI is available
    isUIAvailable=undefined --[[@as boolean]],
    ---sprites opening
    sprites=undefined --[=[@as Sprite[]]=],
    ---A table with parameters specified as `--script-param key=value` in the CLI or as `<param>` in `user.aseprite-keys` or `gui.xml` file
    params=undefined --[[@as {[string]: string}]],
    ---Shows an alert message;
    ---If `buttons` are not specified, it will show a message box with the OK button only
    ---@param text string
    ---@overload fun(options: {title: string, text: string|string[], buttons: string | string[]})
    ---@return integer buttonIndex the selected button i.e. 1 if the first button was clicked
    alert=function(text) end,
    ---Opens a new sprite loading it from the given filename
    ---@param filename string
    ---@return Sprite | nil
    open=function(filename) end,
    ---Closes the application
    exit=function() end,
    ---Creates a new transaction so you can group several sprite modifications in just one undo/redo operation
    ---@param func fun(...): any a function called inside the transaction
    transaction=function(func) end,
    ---Executes the given command named `CommandName` with the given parameters; see: https://www.aseprite.org/api/app_command
    command=undefined --[[@as {[string]: fun(options: {[string]: any}) | fun(): any}]],
    ---@type {tool: fun(tool: Tool): any} | {document: fun(sprite: Sprite): any} | {[string]: {[string]: any}}
    preferences={
        -- TODO: fix the description of tool and document

        ---Returns the preferences of the given tool
        ---@param tool Tool
        ---@return any
        tool=function(tool) end,
        ---Returns the preferences of the given `sprite`
        ---@param sprite Sprite
        ---@return any
        document=function(sprite) end
    },
    ---A set of function to handle file names and the file system
    fs={
        ---The preferred path separator of the current platform; see: `app.fs.joinPath()`
        pathSeparator=undefined --[[@as "/"|"\\"]],
        ---Returns the path/directory part of the given filename
        ---@param fn string filename
        ---@return string
        filePath=function(fn) end,
        ---Returns the file name (including the extension part) of the given filename
        ---@param fn string filename
        ---@return string
        fileName=function(fn) end,
        ---Returns the file extension (without including the `.`) of the given filename
        ---@param fn string filename
        ---@return string
        fileExtension=function(fn) end,
        ---Returns the file title (without including the path nor the extension) of the given filename
        ---@param fn string filename
        ---@return string
        fileTitle=function(fn) end,
        ---Returns the file path joined with the title (without including the extension) of the given filename
        ---@param fn string filename
        ---@return string
        filePathAndTitle=function(fn) end,
        ---Returns the file path converted to a canonical form for the current platform
        ---@param path string
        ---@return string
        normalizePath=function(path) end,
        ---Can accept any number of string arguments to join together with the path separator for the current platform
        ---@param path1 string
        ---@param path2 string
        ---@return string
        joinPath=function(path1, path2) end,
        ---The path the Aseprite executable was launched from
        currentPath=undefined --[[@as string]],
        ---The installation path of Aseprite for the current platform
        appPath=undefined --[[@as string]],
        ---The path for temporary files for the current platform
        tempPath=undefined --[[@as string]],
        ---The current user's Documents path for the current platform
        userDocsPath=undefined --[[@as string]],
        ---The current user's Aseprite configuration path for the current platform
        userConfigPath=undefined --[[@as string]],
        ---Returns true if the given filename `fn` is a file
        ---@param fn string filename
        ---@return boolean
        isFile=function(fn) end,
        ---Returns true if the given filename `fn` is a directory
        ---@param fn string filename
        ---@return boolean
        isDirectory=function(fn) end,
        ---Returns the file size of the given filename `fn`
        ---@param fn string filenmae
        ---@return integer
        fileSize=function(fn) end,
        ---Returns a list of files in the given directory path;  The returned value is a table where each element is a file name, each file name is relative to the given path
        ---@param path string
        ---@return string[]
        listFiles=function(path) end,
        ---Create one directory
        ---@param path string
        ---@return boolean succeeded
        makeDirectory=function(path) end,
        ---Create all directories needed to access to the path
        ---@param path string
        ---@return boolean succeeded
        makeAllDirectories=function(path) end,
        ---Remove the given directory (it must be empty)
        ---@param path string
        ---@return boolean succeeded `true` if the directory was removed (or is already removed)
        removeDirectory=function(path) end
    },
    ---Force aseprite to refresh screen
    refresh=function() end,
    ---Undoes the latest operation in the `activeSprite`
    undo=function() end,
    ---Redoes the latest operation in the `activeSprite`
    redo=function() end,
    ---Simulates an user stroke in the canvas using the given tool; see https://www.aseprite.org/api/app#app-usetool
    ---@param options {tool: string, color: Color, bgColor: Color, brush: Brush, points: Point[], cel: Cel, layer: Layer, frame: Frame, ink: Ink, button: MouseButton, opacity: integer, contiguous: boolean, tolerance: integer, freehandAlgorithm: 0 | 1, selection?: SelectionMode}
    usetool=function(options) end,
    ---The `Events` object to associate functions that can act like listeners of specific App events
    events=undefined --[[@as Events]]
}


---Direction of animation playback
---@class AniDir

---Direction of animation playback
AniDir = {
    FOWARD=undefined --[[@as AniDir]],
    REVERSE=undefined --[[@as AniDir]],
    PING_PONG=undefined --[[@as AniDir]]
}


---Layer blend mode
---@class BlendMode

---Layer blend mode
BlendMode = {
    NORMAL=undefined --[[@as BlendMode]],
    MULTIPLY=undefined --[[@as BlendMode]],
    SCREEN=undefined --[[@as BlendMode]],
    OVERLAY=undefined --[[@as BlendMode]],
    DARKEN=undefined --[[@as BlendMode]],
    LIGHTEN=undefined --[[@as BlendMode]],
    COLOR_DODGE=undefined --[[@as BlendMode]],
    COLOR_BURN=undefined --[[@as BlendMode]],
    HARD_LIGHT=undefined --[[@as BlendMode]],
    SOFT_LIGHT=undefined --[[@as BlendMode]],
    DIFFERENCE=undefined --[[@as BlendMode]],
    EXCLUSION=undefined --[[@as BlendMode]],
    HSL_HUE=undefined --[[@as BlendMode]],
    HSL_SATURATION=undefined --[[@as BlendMode]],
    HSL_LUMINOSITY=undefined --[[@as BlendMode]],
    ADDITION=undefined --[[@as BlendMode]],
    SUBTRACT=undefined --[[@as BlendMode]],
    DIVIDE=undefined --[[@as BlendMode]]
}


---Brush pattern
---@class BrushPattern

---Brush pattern
BrushPattern = {
    NONE=undefined --[[@as BrushPattern]],
    ORIGIN=undefined --[[@as BrushPattern]],
    TARGET=undefined --[[@as BrushPattern]]
}


---Brush Type
---@class BrushType

---Brush Type
BrushType = {
    CIRCLE=undefined --[[@as BrushType]],
    SQUARE=undefined --[[@as BrushType]],
    LINE=undefined --[[@as BrushType]],
    IMAGE=undefined --[[@as BrushType]]
}


---Color mode
---@class ColorMode

---Color mode
ColorMode = {
    RGB=undefined --[[@as ColorMode]],
    GRAY=undefined --[[@as ColorMode]],
    INDEXED=undefined --[[@as ColorMode]]
}


---Filter Channels
---@class FilterChannels
---@operator bor(FilterChannels): FilterChannels

---Filter Channels
FilterChannels = {
    RED=undefined --[[@as FilterChannels]],
    GREEN=undefined --[[@as FilterChannels]],
    BLUE=undefined --[[@as FilterChannels]],
    ALPHA=undefined --[[@as FilterChannels]],
    GRAY=undefined --[[@as FilterChannels]],
    INDEX=undefined --[[@as FilterChannels]],
    RGB=undefined --[[@as FilterChannels]],
    RGBA=undefined --[[@as FilterChannels]],
    GRAYA=undefined --[[@as FilterChannels]]
}


---Ink
Ink = {
    SIMPLE=undefined --[[@as 0 | "simple"]],
    ALPHA_COMPOSTING=undefined --[[@as 1 | "alpha_composting" | "alpha-composting"]],
    COPY_COLOR=undefined --[[@as 2 | "copy_color" | "copy-color"]],
    LOCK_ALPHA=undefined --[[@as 3 | "lock_alpha" | "lock-alpha"]],
    SHADING=undefined --[[@as 4 | "shading"]]
}


---Mouse button
---@class MouseButton

---Mouse button
MouseButton = {
    NONE=undefined --[[@as MouseButton]],
    LEFT=undefined --[[@as MouseButton]],
    RIGHT=undefined --[[@as MouseButton]],
    MIDDLE=undefined --[[@as MouseButton]],
    X1=undefined --[[@as MouseButton]],
    X2=undefined --[[@as MouseButton]]
}


---Type of ranges selected in the timeline
---@class RangeType

---Type of ranges selected in the timeline
RangeType = {
    EMPTY=undefined --[[@as RangeType]],
    LAYERS=undefined --[[@as RangeType]],
    FRAMES=undefined --[[@as RangeType]],
    CELS=undefined --[[@as RangeType]],
}


---@ NOTE: There are no information on API reference rather than app.useTool()
--- Selection mode
---@class SelectionMode

SelectionMode = {
    REPLACE=undefined --[[@as SelectionMode]],
    ADD=undefined --[[@as SelectionMode]],
    SUBTRACT=undefined --[[@as SelectionMode]],
    INTERSECT=undefined --[[@as SelectionMode]],
}


---Data format used to export JSON files in 1app.command.ExportSpriteSheet1
---@class SpriteSheetDataFormat

---Data format used to export JSON files in 1app.command.ExportSpriteSheet1
SpriteSheetDataFormat = {
    JSON_HASH=undefined --[[@as SpriteSheetDataFormat]],
    JSON_ARRAY=undefined --[[@as SpriteSheetDataFormat]],
}


---Type of sprite sheet used in `app.command.ExportSpriteSheet`
---@class SpriteSheetType

---Type of sprite sheet used in `app.command.ExportSpriteSheet`
SpriteSheetType = {
    HORIZONTAL=undefined --[[@as SpriteSheetType]],
    VERTICAL=undefined --[[@as SpriteSheetType]],
    ROWS=undefined --[[@as SpriteSheetType]],
    COLUMNS=undefined --[[@as SpriteSheetType]],
    PACKED=undefined --[[@as SpriteSheetType]]
}


---Type of WebSocket message
---@class WebSocketMessageType

---Type of WebSocket message
WebSocketMessageType = {
    TEXT=undefined --[[@as WebSocketMessageType]],
    BINARY=undefined --[[@as WebSocketMessageType]],
    OPEN=undefined --[[@as WebSocketMessageType]],
    CLOSE=undefined --[[@as WebSocketMessageType]],
    PING=undefined --[[@as WebSocketMessageType]],
    PONG=undefined --[[@as WebSocketMessageType]],
    FRAGMENT=undefined --[[@as WebSocketMessageType]]
}


---Identifies a brush to paint with `app.useTool()` function
---@class Brush
---@field type BrushType
---@field size integer
---@field angle integer Angle of brush pattern between -180 and 180
---@field image Image
---@field center Point
---@field pattern BrushPattern
---@field patternOrigin Point

---Creates a new `Braush` instance
---@return Brush
---@overload fun(size: Size): Brush
---@overload fun(image: Image): Brush
---@overload fun(options: {type: BrushType, size: integer, angle: integer, center: Point, image: Image, pattern: BrushPattern, patternOrigin: Point}): Brush
function Brush() end

---Cel
---@class Cel
---@field sprite Sprite The sprite the cel belongs to
---@field layer Layer The layer where the cel is located
---@field frame Frame The frame which the cel belongs to; If you set this property, the cel will be moved to the given frame (if another cel already exists in that frame, it will be removed)
---@field frameNumber integer The frame number which the cel belongs
---@field image Image The image with the pixels of this cel
---@field bounds Rectangle The rectangle of the cel bounds
---@field position Point The cel position
---@field opacity integer The cel opacity between 0 (transparent) and 255 (opaque)
---@field color Color The use-defined color of this cel in the timeline
---@field data string The user-defined data related to this cel


---Represents a color that can be choose by the user in different kinds (RGB, HSV, HSL, grayscale, indexed)
---@class Color
---@field alpha integer The alpha of color between 0 (transparent) and 255 (opaque)
---@field red integer
---@field green integer
---@field blue integer
---@field hsvHue integer
---@field hsvSaturation number
---@field hsvValue number
---@field hslHue number
---@field hslSaturation number
---@field hslLightness number
---@field hue number The HSV hue or HSL hue depending on the kind of color
---@field saturation The HSV saturation or HSL saturation depending on the kind of color
---@field value number The HSV Value
---@field lightness number The HSL Lightness
---@field index integer The palette index related to this color; If the color is not an index, i.e. it's RGB/HSL/HSV, the closest palette index of the current palette  (the palette of the active sprite) that matches the RGB/HSL/HSV
---@field gray integer
---@field rgbaPixel integer The pixel color which is equivalent to the RGBA values of this color
---@field grayPixel integer The pixel color which is equivalent to the gray+alpha values of this color

---Creates a new `Color` instance
---@param options {r: integer, g: integer, b: integer, a: integer}
---@return Color
---@overload fun(options: {h: number, s: number, v: number, a: integer}): Color
---@overload fun(options: {h: number, s: number, l: number, a: integer}): Color
---@overload fun(options: {red: integer, green: integer, blue: integer, a: integer}): Color
---@overload fun(options: {hue: number, saturation: number, value: number, alpha: integer}): Color
---@overload fun(options: {hue: number, saturation: number, lightness: number, alpha: integer}): Color
---@overload fun(options: {gray: integer, a: integer}): Color
---@overload fun(options: {index: integer}): Color
---@overload fun(index: integer): Color
function Color(options) end


---Represents the color space/profile of a sprite, image, or image spec
---@class ColorSpace
---@field name string The color space name

---Creates an empty color space, sRGB color space, or loads a color profile from the given ICC file specified in "fromFile" parameter.
---@return ColorSpace
---@overload fun(options: {sRGB: true}): ColorSpace
---@overload fun(options: {fromFile: string}): ColorSpace
function ColorSpace() end


---A class can be used to show input controls/widgets in the screen to get some data from the user
---@class Dialog
---@field data {[string]: boolean | string | integer | number | Color | Color[]}
---@field bounds Rectangle The bounds of dialog
Dialog = {
    ---Creates a button
    ---@param dialog self
    ---@param options {id?: string, label?: string, text: string, selected?: boolean, focus?: boolean, onclick?: fun()}
    ---@return Dialog
    button=function(dialog, options) end,

    ---Creates a check box
    ---@param dialog self
    ---@param options {id?: string, label?: string, text?: string, selected?: boolean, onclick?: function}
    ---@return Dialog
    check=function(dialog, options) end,

    ---Closes the dialog
    ---@param dialog self
    close=function(dialog) end,

    ---Creates a color picker
    ---@param dialog self
    ---@param options {id?: string, label?: string, color?: Color, onchange?: function}
    ---@return Dialog
    color=function(dialog, options) end,

    ---Creates a combo box/drop-down list
    ---@param dialog self
    ---@param options {id?: string, label?: string, options?: string[], options?: string[], onchange?: fun()}
    ---@return Dialog
    combobox=function(dialog, options) end,

    ---Creates a text entry
    ---@param dialog self
    ---@param options {id?: string, label: string, text: string, focus: boolean, onchange: function}
    ---@return Dialog
    entry=function(dialog, options) end,

    ---Creates a static label
    ---@param dialog self
    ---@param options {id?: string, label?: string, text?: string}
    ---@return Dialog
    label=function(dialog, options) end,

    ---Changes properties of the given widget that matches the identifier
    ---@param dialog self
    ---@param options {id: string, visible?: boolean, enabled?: boolean} | {[string]: any}
    modify=function(dialog, options) end,

    ---Creates a new row
    ---@param dialog self
    ---@param options {always?: boolean}
    ---@return Dialog
    ---@overload fun(): Dialog
    newrow=function(dialog, options) end,

    ---Creates an entry field to input a number
    ---@param dialog self
    ---@param options {id?: string, label?: string, text?: string, decimals?: integer, onchange?: fun()}
    ---@return Dialog
    number=function(dialog, options) end,

    ---Creates a radio button
    ---@param dialog self
    ---@param options {id?: string, label?: string, text?: string, selected?: boolean, onchange?: fun()}
    ---@return Dialog
    radio=function(dialog, options) end,

    ---Creates a separator
    ---@param dialog self
    ---@param options {id?: string, text?: string}
    ---@return Dialog
    separator=function(dialog, options) end,

    ---Creates a widget with a set of colors that can be clicked/picked (when mode="pick", which is the default mode) or can be sorted (when mode="sort", which is the default mode)
    ---@param dialog self
    ---@param options {id?: string, label?: string, mode: "pick" | "sort", colors: Color[], onclick?: fun()}
    ---@return Dialog
    shades=function(dialog, options) end,

    ---Makes the dialog visible to the user
    ---@param dialog self
    ---@param options {wait?: boolean, bounds?: Rectangle}
    ---@overload fun(dialog: self)
    show=function(dialog, options) end,

    ---Creates a slider
    ---@param dialog self
    ---@param options {id?: string, label?: string, min?: integer, max?: integer, value?: integer, onchange?: function, onrelease?: function}
    ---@return Dialog
    slider=function(dialog, options) end,

    ---Creates a text entry field + a button to select one file to open or save
    ---@param dialog self
    ---@param options {id?: string, label?: string, title?: string, open?: boolean, save?: boolean, filename: string | string[], filetypes?: string[], onchange?:fun()}
    ---@return Dialog
    file=function(dialog, options) end,
}


---@class Frame
---@field sprite Sprite The sprite of this frame
---@field frameNumber integer The frame number; the `frame` is equal to `frame.sprite.frames[frameNumber]`
---@field duration number Duration of this frame in the animation in seconds
---@field previous Frame
---@field next Frame


---Creates a new `Dialog` isntance
---@return Dialog
---@overload fun(title: string): Dialog
---@overload fun(options: {title: string, onclose: fun()}): Dialog
function Dialog() end


---A collection of listeners for specific events;
---see: `app.events`, `sprite.events`
---@class Events
Events = {
    ---Connects the given `function` with the given event
    ---@param eventName string the event name/code/identifier
    ---@param func fun()
    ---@return integer listnerCode
    on = function(eventName, func) end,

    ---Disconnects the given function from all events in the object, or stops/breaks only the specific connection identified by listenerCode
    ---@param listenerCode integer
    ---@overload fun(func: fun())
    off = function(listenerCode) end,
}


--Creates a new `Rectangle` instance
---@class Rectangle
---@field x number
---@field y number
---@field width number
---@field height number
Rectanble = {
    ---Returns true if the rectangle is empty i.e. width and/or height are 0
    ---@param rectangle self
    ---@return boolean
    isEmpty=function(rectangle) end,

    ---Returns true if `otherRectangle` is inside `rectangle`
    ---@param rectangle self
    ---@param otherRectangle Rectangle
    ---@return boolean
    contains=function(rectangle, otherRectangle) end,

    ---Returns true if `rectangle` intersects in some way `otherRectangle`
    ---@param rectangle self
    ---@param otherRectangle Rectangle
    ---@return boolean
    intersects=function(rectangle, otherRectangle) end,

    ---Returns the new rectangle which is the intersection of `rectangle` and `otherRectangle`; If both rectangles don't intersect each other, the result will be an empty rectangle
    ---@param rectangle self
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    intersect=function(rectangle, otherRectangle) end,

    ---Returns the new rectangle which will be a rectangle big enough to contains both given rectangles `rectangle` and `otherRectangle`
    ---@param rectangle self
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    utnion=function(rectangle, otherRectangle) end
}

---Creates a new `Rectangle` instance
---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: number, y: number, width: number, height: number): Rectangle
---@overload fun(options: {x: number, y: number, width: number, height: number}): Rectangle
function Rectanble() end


---@class Size
---@field width number
---@field height number

---Creates a new `Size` instance with the given dimensions (or width=height=0 if they are not specified)
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: number, height: number): Size
---@overload fun(options: {width: number, height: number}): Size
---@overload fun(options: number[]): Size
function Size() end


---@class Sprite
---@field width integer
---@field height integer
---@field bounds Rectangle The bounds of the sprite as a rectangle in the position `0, 0`
---@field gridBounds Rectangle The bounds of the sprite grid
---@field pixelRatio Size The pixel ratio of the sprite
---@field selection Selection The active selection
---@field filename string  The name of the file from where this sprite was loaded or saved or an empty string
---@field colorMode ColorMode The color mode of the sprite
---@field spec ImageSpec The specification for image in this sprite
---@field frames Frame[] The frames the sprite has
---@field palettes Palette[] The palettes the sprite has
---@field layers Layer[] The layer the sprite has
---@field cels Cel[] The cels the sprite has
---@field tags Tag[] The tags the sprite has
---@field slices Slice[] The slices the sprite has
---@field backgroundLayer Layer | nil The background layer
---@field transparentColor integer An integer that spcifies what index (`0` by default) on indexed sprites
---@field events Events events to associate functions that can act like listeners of specific Sprite events; see: https://www.aseprite.org/api/sprite#sprite-events
Sprite = {
    ---Resizes the sprite (and all frames/cels)
    ---@param sprite self
    ---@param width integer
    ---@param height integer
    ---@overload fun(sprite: self, size: Size)
    resize=function(sprite, width, height) end,

    ---Crops the sprite
    ---@param sprite self
    ---@param x integer
    ---@param y integer
    ---@param width integer
    ---@param height integer
    ---@overload fun(sprite: self, rectangle: Rectangle)
    crop=function(sprite, x, y, width, height) end,

    ---Saves the sprite to the given file and mark the sprite as saved
    ---@param sprite self
    ---@param filename string
    saveAs=function(sprite, filename) end,

    ---Saves a copy of the sprite in the given file but doesn't change the saved state of the sprite
    ---@param sprite self
    ---@param filename string
    saveCopyAs=function(sprite, filename) end,

    ---Closes the sprite; This doesn't ask the user to save changes; see: app.command.CloseFile()
    ---@param sprite self
    close=function(sprite) end,

    ---Sets the sprite palette loading it from the given file
    ---@param sprite self
    ---@param filename string
    loadPalette=function(sprite, filename) end,

    ---Changes the sprite palette
    ---@param sprite self
    ---@param palette Palette
    setPalette=function(sprite, palette) end,

    ---Assign a new color space to the sprite without modifying the sprite pixels
    ---@param sprite self
    ---@param colorSpace ColorSpace
    assignColorSpace=function(sprite, colorSpace) end,

    ---Converts all the sprite pixels to a new color space so the image looks the same as in the previous color space
    ---@param sprite self
    ---@param ColorSpace ColorSpace
    convertColorSpace=function(sprite, ColorSpace) end,

    ---Creates a new layer at the top of the layers stack
    ---@param sprite self
    newLayer=function(sprite) end,

    ---Creates a new empty layer group at the top of the layers stack
    ---@param sprite self
    ---@return Layer[]
    newGroup=function(sprite) end,

    ---Deletes the given `layer` or the layer with the given `layerName`
    ---@param sprite self
    ---@param layer Layer
    ---@overload fun(sprite: self, layerName: string)
    deleteLayer=function(sprite, layer) end,

    ---Creates a copy of the given `frame` object or frame number and returns a `Frame` that points to the newly created frame in `frameNumber` position
    ---@param sprite self
    ---@param frame Frame
    ---@return Frame
    ---@overload fun(sprite: self, frameNumber: integer): Frame
    newFrame=function(sprite, frame) end,

    ---Creates a new empty frame in the given `frameNumber`
    ---@param sprite self
    ---@param frameNumber integer
    ---@return Frame
    newEmptyFrame=function(sprite, frameNumber) end,

    ---Deletes the given `frame`
    ---@param sprite self
    ---@param frame Frame
    deleteFrame=function(sprite, frame) end,

    ---Creates a new cel in the given `layer` and `frame` number. If the image is not specified, a new image will be created with the size of the sprite canvas. The position is a point to locate the image.
    ---@param sprite self
    ---@param layer Layer
    ---@param frame? Frame
    ---@param image? Image
    ---@param position? Point
    ---@return Cel
    newCel=function(sprite, layer, frame, image, position) end,

    ---Deletes the given `cel`; If the cel is from a transparent layer, the cel is completely deleted, but if the cel is from a background layer, the cel will be delete with the background color
    ---@param sprite self
    ---@param cel Cel
    ---@overload fun(sprite: self, layer: Layer, frame: Frame)
    deleteCel=function(sprite, cel) end,

    ---Creates a new tag in the given frame range and with the given name
    ---@param sprite self
    ---@param fromFrameNumber integer
    ---@param toFrameNumber integer
    ---@return Tag
    newTag=function(sprite, fromFrameNumber, toFrameNumber) end,

    ---Deletes the given `tag`
    ---@param sprite self
    ---@param tag Tag
    ---@overload fun(sprite: self, tagName: string)
    deleteTag=function(sprite, tag) end,

    ---Creates a new slice
    ---@param sprite self
    ---@param rectangle? Rectangle
    ---@return Slice
    newSlice=function(sprite, rectangle) end,

    ---Deletes the given `slice`
    ---@param sprite self
    ---@param slice Slice
    ---@overload fun(sprite: self, sliceName: string)
    deleteSlice=function(sprite, slice) end,

    ---Flatten all layers of the sprite into one layer; as the same as `app.commands.FlattenLayers()`
    ---@param sprite self
    flatten=function(sprite) end,
}


---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Sprite
---@overload fun(spec: ImageSpec): Sprite
---@overload fun (otherSprite: Sprite): Sprite
---@overload fun(options: { fromFile: string }): Sprite
---@overload fun(options: { fromFile: string, oneFrame: any }): Sprite
---@ NOTE: no information for oneFrame of Sprite{ fromFile=filename, oneFrame }
function Sprite(width, height, colorMode) end

