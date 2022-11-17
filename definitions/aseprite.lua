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


---@class Frame
---@field sprite Sprite The sprite of this frame
---@field frameNumber integer The frame number; the `frame` is equal to `frame.sprite.frames[frameNumber]`
---@field duration number Duration of this frame in the animation in seconds
---@field previous Frame
---@field next Frame


---@class Image
---@field width integer
---@field height integer
---@field colorMode ColorMode
---@field spec ImageSpec The specification for this image
---@field cel Cel The cel to which this image belongs or `nil`
---@field bytes string A byte string that contains raw image data
---@field rowStride integer Number of bytes for each row in the image
Image = {
    ---Creates a copy of the image
    ---@param image self
    ---@return Image
    clone=function(image) end,

    ---Cleare all pixels in the image with given color (or `image.spec.transparentColor` if no color is specified)
    ---@param image self
    ---@param color? Color
    clear=function(image, color) end,

    ---Sets the pixel in the xy-coordinate to the given integer pixel value
    ---@param image self
    ---@param x integer
    ---@param y integer
    ---@param color integer
    drawPixel=function(image, x, y, color) end,

    ---Returns a integer pixel value for the given xy-coordinate related to the "Image" itself
    ---@param image self
    ---@param x integer
    ---@param y integer
    ---@return integer
    getPixel=function(image, x, y) end,

    ---Copies/draws the given sourceImage image over destinationImage; If position is a point, it will draw the sourceImage in the given position
    ---@param destinationImage self
    ---@param sourceImage Image
    ---@param position? Point
    drawImage=function(destinationImage, sourceImage, position) end,

    ---Draws the given sourceSprite frame number into the destinationImage; If position is a point, it will draw the sourceSprite in the given position
    ---@param destinationImage self
    ---@param sourceSprite Sprite
    ---@param frameNumber integer
    ---@param position Point
    drawSprite=function(destinationImage, sourceSprite, frameNumber, position) end,

    ---Returns true if both images looks the same (spec is equal and all pixels are the same)
    ---@param image self
    ---@param otherImage Image
    ---@return boolean
    isEqual=function(image, otherImage) end,

    ---Returns true if all pixels in the image are equal to the transparent color
    ---@param image self
    ---@return boolean
    isEmpty=function(image) end,

    ---Returns true if all pixels in the image are equal to the given color (which can be a pixel color or a color)
    ---@param image self
    ---@param color Color | integer
    ---@return boolean
    isPlain=function(image, color) end,

    ---Returns a pixel iterator for the whole image or the given rectangle
    ---@param image self
    ---@param rectangle? Rectangle
    ---@return fun(): integer | fun(integer) | {x: integer, y: integer} accessor Can be called to get pixel and set pixel (e.g. `accessor()` and `accessor(pixelValue)`), and holds x, y coordinates
    pixels=function(image, rectangle) end,

    ---Sets the pixel in the xy-coordinate to the given integer pixel value
    ---@param image self
    ---@param x integer
    ---@param y integer
    ---@param color integer
    putPixel=function(image, x, y, color) end,

    ---Copies/draws the given sourceImage image over destinationImage; If position is a point, it will draw the sourceImage in the given position
    ---@deprecated
    ---@param destinationImage self
    ---@param sourceImage Image
    ---@param position? Point
    putImage=function(destinationImage, sourceImage, position) end,

    ---Draws the given sourceSprite frame number into the destinationImage; If position is a point, it will draw the sourceSprite in the given position
    ---@param destinationImage self
    ---@param sourceSprite Sprite
    ---@param frameNumber integer
    ---@param position Point
    putSprite=function(destinationImage, sourceSprite, frameNumber, position) end,

    ---Saves the image as a sprite in the given `filename`
    ---@param image Image
    ---@param filename string
    ---@overload fun(image: Image, options: {filename: string, palette: Palette})
    saveAs=function(image, filename) end,

    ---Resizes the image; The pivot is Point(0, 0) by default
    ---@param image self
    ---@param width integer
    ---@param height integer
    ---@overload fun(image: Image, options: {width: integer, height: integer, method?: "bilinear" | "rotsprite", pivot?: Point})
    ---@overload fun(image: Image, options: {size: Size, method?: "bilinear" | "rotsprite", pivot?: Point})
    resize=function(image, width, height) end
}

---Creates a new `Image` instance
---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Image
---@overload fun(spec: ImageSpec): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image): Image
---@overload fun(option: {fromFile: string}): Image
function Image(width, height, colorMode) end


---Specifications of sprites or images
---@class ImageSpec
---@field colorMode ColorMode
---@field width integer
---@field height integer
---@field colorSpace ColorSpace
---@field transparentColor integer The index that refers a transparent color in a palette when the image or sprite uses indexed color mode

---Creates a new `ImageSpec` instance
---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: {width: integer, height: integer, colorMode: ColorMode | number, transparentColor: number})
function ImageSpec() end


---@class Layer
---@field sprite Sprite The sprite to which the layer belongs
---@field name string
---@field opacity integer The layer opacity, a value from 0 (transparent) to 255 (opaque)
---@field blendMode BlendMode
---@field layers Layer[] | nil If a layer is a group, gets the table of child layers for which the group serves as a parent
---@field parent Sprite | Layer
---@field stackIndex integer Tthe layer's index in its parent's layers table
---@field isImage boolean Whether or not the layer contains cels with images
---@field isGroup boolean Whether or not the layer is a group and has the capacity to be a parent to other layers
---@field isTransparent boolean Whether or not a layer supports transparency
---@field isBackground boolean Whether or not a layer is a background
---@field isEditable boolean Whether a layer is editable (unlocked)
---@field isVisible boolean Whether or not the layer is visible
---@field isContinuous boolean Whether a layer biases toward linked cels when a new cel is created in the timeline
---@field isCollapsed boolean Whether or not a group layer is collapsed, i.e., whether its child layers are hidden in the timeline
---@field isExpanded boolean Whether or not a group layer is expanded, meaning whether its child layers are visible in the timeline
---@field isReference boolean Whether or not the layer is a reference layer
---@field cels boolean Cel[] Table of cels in the layer
---@field color Color User-defined color of this layer in the timeline
---@field data string The user-defined data related to this layer
Layer = {
    ---Returns a cel, if any, at the intersection of the layer and a frame
    ---@param layer self
    ---@param frame Frame
    ---@overload fun(layer: self, frameNumber: Frame)
    cel=function(layer, frame) end
}


---@class Palette
---@field frame Frame At the moment it always return the first frame, but in a near future Aseprite will support palette changes over time (in different frames), so this field should be the frame number where this palette is displayed for first time in the sprite
Palette = {
    ---Changes the number of the palette colors to `ncolors`
    ---@param palette self
    ---@param ncolors integer
    resize=function(palette, ncolors) end,

    ---Returns the color in the given entry index (the index goes from 0 to #palette-1)
    ---@param palette self
    ---@param index integer
    ---@return Color
    getColor=function(palette, index) end,

    ---Changes a palette color in the given entry index (the index goes from 0 to #palette-1)
    ---@param palette self
    ---@param color Color | integer
    setColor=function(palette, color) end,

    ---Saves the palette in the given `filename`
    ---@param palette self
    ---@param filename string
    saveAs=function(palette, filename) end,
}

---Creates a new `Palette` instance; By default it will contain 256 colors;
---`fromResource` is an ID specified in one of the extensions palette (e.g. `DB16`, `DB32`, `Solarized`)
---@return Palette
---@overload fun(numberOfColors: integer): Palette
---@overload fun(options: {fromFile: string})
---@overload fun(options: {fromResource: string})
function Palette() end


---@class Point
---@field x number
---@field y number

---Creates a new `Point` instance
---@param x? number Default is 0
---@param y? number Default is 0
---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(options: {x: number, y: number}): Point
---@overload fun(numbers: {[1]: number, [2]: number}): Point
function Point(x, y) end


---The range of selected objects;
---It can be a list of one type of the following: layers, frames, cels, images, and colors
---@class Range
---@field type RangeType
---@field isEmpty boolean Whether or not the range is empty
---@field sprite Sprite Sprite to which the range is pointing to
---@field layers Layer[] The table of selected layers
---@field frames Frame[] The table of selected frames
---@field cels Cel[] The table of selected cels
---@field images Image[] The table of selected images (images from linked cels are counted just one time in this array)
---@field editableImages Image[] The table of selected images in the range that are in unlocked layers (editable)
---@field colors integer[] The table of selected palette entries in the color bar
Range = {
    ---Returns true if the given object (layer/frame/cel) is inside the selected range
    ---@param range self
    ---@param object Layer | Frame | Cel
    contains=function(range, object) end,

    ---Returns true if the given color index is selected in the color bar
    ---@param range self
    ---@param colorIndex integer
    containsColor=function(range, colorIndex) end,

    ---Clears the current selected range of frames/layers/cels/colors
    ---@param range self
    clear=function(range) end
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
---@overload fun(numbers: {[1]: number, [2]: number, [3]: number, [4]: number})
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
---@field backgroundLayer Layer The background layer or `nil`
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
    ---@return Layer
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

