---@meta

--Type definition of API Version 28
--based on @aseprite/api, commit hash: 6cad8d32a8d07ba48a9cb0e198a6a2714133c293


---@type unknown
local undefined

---@alias Properties any
---@overload fun(pluginKey: string): any

---The `app` global namespace.
app = {
    ---Active site (active image, layer, frame, sprite, etc.).
    ---@type Site
    site = undefined,

    ---Range member represents the active selection from an objects collection. It returns a sorted list of selected frames, or cels, or layers, or colors, etc.
    ---@type Range
    range = undefined,

    ---Gets or sets the active `Cel` object.
    ---@type Cel
    cel = undefined,

    ---The active frame number
    ---```lua
    ---local frame = app.frame
    ---assert(frame.sprite == app.sprite)
    ---app.frame = app.sprite.frames[2] -- go to the second frame
    ---
    ---app.frame = 3 -- you can assign a frame number directly
    ---app.frame = 1 -- 1 is the first frame of the sprite
    ---```
    ---
    ---Returns a `Frame object` that represents the active
    ---frame in the focused sprite editor. You can set this property
    ---assigning a frame number directly to jump to another frame.
    ---
    ---To known the active frame number use `app.frame.frameNumber`
    ---@type Frame
    frame = undefined,

    ---```lua
    ---local image = app.image
    ---```
    ---
    ---Returns the active image, an `Image` object.
    ---@type Image
    image = undefined,

    ---Returns the active layer, a `Layer` object.
    ---@type Layer
    layer = undefined,

    ---```lua
    ---local sprite = app.sprite
    ---```
    ---
    ---Returns the active sprite, a `Sprite` object.
    ---@type Sprite
    sprite = undefined,

    ---Returns the active tag, which is the tag located at the active frame.
    ---@type Tag
    tag = undefined,

    ---Returns the active tool (a `Tool` object) selected in the [tool bar](https://www.aseprite.org/docs/workspace/).
    ---The active tool
    ---@type Tool
    tool = undefined,

    ---Returns the active brush (a `Brush` object) selected in the [context bar](https://www.aseprite.org/docs/workspace/).
    ---@type Brush
    brush = undefined,

    ---@type Editor
    editor = undefined,

    ---Returns the main window (a `Window` object).
    ---@type Window
    window = undefined,

    ---This property contains a set of function to handle the color for Image pixels at the lowest level: an unsigned integer.
    ---
    ---On Aseprite there are two kind of ways to handle colors:
    ---
    ---1. The `Color` object type (a high-level/abstract/user-friendly way to handle color)
    ---2. Or an unsigned integer (low-level/performance-wise) value which can represent several kind of colors:
    ---   - For RGB images: a 32-bit unsigned integer value (8-bit for each of the four RGBA component)
    ---   - Gray images: a 16-bit unsigned integer with Alpha and Grayscale value (8-bit for Alpha, 8-bit for Gray)
    ---   - Indexed images: 8-bit unsigned integer which represents a value from 0 to 255 to reference a palette entry
    ---
    ---For performance reasons, pixel values on images are handled with the second kind of colors: an unsigned integer value. This color format is used when you handle pixels directly with functions like `Image:getPixel()`, `Image:putPixel()`, or `Image:pixels()`.
    pixelColor = {

        ---```lua
        ---local rgbaPixelValue = app.pixelColor.rgba(red, green, blue, [, alpha])
        ---```
        ---
        ---Constructs a 32-bit unsigned integer for RGBA images.
        ---Alpha will be 255 (i.e. 100% opaque) if it's not specified.
        ---
        ---Example:
        ---```lua
        ---local pc = app.pixelColor
        ---local redPixel = pc.rgba(255, 0, 0)
        ---local semiTransparentWhite = pc.rgba(255, 255, 255, 128)
        ---```
        ---@param red integer
        ---@param green integer
        ---@param blue integer
        ---@param alpha? integer default is 255 (i.e. 100% opaque)
        ---@return integer
        rgba = function(red, green, blue, alpha) end,

        ---```lua
        ---local redComponent = app.pixelColor.rgbaR(rgbaPixelValue)
        ---```
        ---
        ---Returns the red component of the given 32-bit integer (`rgbaPixelValue`). This integer is a value created with `app.pixelColor.rgba()` or `Image:getPixel()` from a RGBA image.
        ---
        ---Note: RGB components **are not** premultiplied by alpha.
        ---
        ---Example:
        ---
        ---```lua
        ---
        ---local pc = app.pixelColor
        ---local rgbaPixelValue = pc.rgba(255, 128, 0)
        ---local redComponent = pc.rgbaR(rgbaPixelValue)
        ---local greenComponent = pc.rgbaG(rgbaPixelValue)
        ----- redComponent is 255
        ----- greenComponent is 128
        ---```
        ---@param rgbaPixelValue integer
        ---@return integer
        rgbaR = function(rgbaPixelValue) end,

        ---Same as `rgbaR()` but with the Green component.
        ---@param rgbaPixelValue integer
        ---@return integer
        rgbaG = function(rgbaPixelValue) end,

        ---Same as `rgbaR()` but with the Blue component.
        ---@param rgbaPixelValue integer
        ---@return integer
        rgbaB = function(rgbaPixelValue) end,

        ---Same as `rgbaR()` but with the Alpha component.
        ---@param rgbaPixelValue integer
        ---@return integer
        rgbaA = function(rgbaPixelValue) end,

        ---```lua
        ---local grayPixelValue = app.pixelColor.graya(gray [, alpha])
        ---```
        ---
        ---Constructs a 16-bit unsigned integer for grayscale images. Alpha will be 255 (i.e. 100% opaque) if it's not specified.
        ---
        ---Example:
        ---
        ---```lua
        ---local pc = app.pixelColor
        ---local black = pc.graya(0)
        ---local white = pc.graya(255)
        ---local semiTransparentWhite = pc.graya(255, 128)
        ---```
        ---@param gray integer
        ---@param alpha? integer default is 255 (i.e. 100% opaque)
        ---@return integer
        graya = function(gray, alpha) end,

        ---```lua
        ---local grayValue = app.pixelColor.grayaV(grayPixelValue)
        ---```
        ---
        ---Returns the gray component of the given 16-bit integer (`grayPixelValue`). This integer is a value created with `app.pixelColor.graya()` or `Image:getPixel()` from a grayscale image.
        ---
        ---Example:
        ---
        ---```lua
        ---local pc = app.pixelColor
        ---local grayPixelValue = pc.graya(128, 32)
        ---local grayComponent = pc.grayaV(grayPixelValue)
        ---local alphaComponent = pc.grayaA(grayPixelValue)
        ----- grayComponent is 128
        ----- alphaComponent is 32
        ---```
        ---@param grayPixelValue integer 16-bit integer
        ---@return integer
        grayaV = function(grayPixelValue) end,

        ---Same as `grayaV()` but with the Alpha component.
        ---@param grayPixelValue integer 16-bit integer
        ---@return integer
        grayaA = function(grayPixelValue) end
    },

    ---Returns the Aseprite version number as a `Version` object (e.g. `Version("1.2.10-beta1")`).
    ---@type Version
    version = undefined,

    ---Returns the API version. See the [changes file](https://github.com/aseprite/api/blob/main/Changes.md#api-changes) between version to know what offer each API version.
    apiVersion = 28,

    ---Gets or sets the current foreground color.
    ---@type Color
    fgColor = undefined,

    ---Gets or sets the current background color. Remember that some commands use the background color to clear the active layer.
    ---@type Color
    bgColor = undefined,

    ---Returns `true` if the UI is available. E.g. if this is `true ` you can use app.alert or dialogs. The UI is not available when we run in [--batch mode](https://www.aseprite.org/docs/cli/#batch).
    ---@type boolean
    isUIAvailable = undefined,

    ---```lua
    ---for i,sprite in ipairs(app.sprites) do
    ---  -- do something with each sprite...
    ---end
    ---```
    ---
    ---Returns an array of sprites.
    sprites = undefined --[=[@as Sprite[]]=],

    ---This is a table with parameters specified as [`--script-param key=value`](https://www.aseprite.org/docs/cli/#script-param) in the [CLI](https://www.aseprite.org/docs/cli/) or as `<param>` in `user.aseprite-keys` or [`gui.xml`](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) file.
    params = undefined --[[@as {[string]: string}]],

    ---```lua
    ---app.alert "Text"
    ---
    ---app.alert("Text")
    ---app.alert{title="Title", text="Text", buttons="OK"}
    ---app.alert{title="Title", text="Text", buttons={"OK", "Cancel"}}
    ---app.alert{title="Title", text={"Line 1", "Line 2", ...}, buttons={"Yes", "No", "Cancel", ...}}
    ---```
    ---
    ---Shows an alert message. If `buttons` are not specified, it will show a message box with the `OK` button only.
    ---
    ---Returns an integer with the selected button i.e. 1 if the first button was clicked, 2 if the second one, etc. Example:
    ---
    ---```lua
    ---local result = app.alert{ title="Warning",
    ---                          text="Save Changes?",
    ---                          buttons={"Yes", "No"}}
    ---if result == 1 then
    ---  app.alert "Yes was pressed"
    ---
    ---end
    ---```
    ---@param text string
    ---@return integer buttonClicked
    ---@overload fun(options: { title: string, text: string|string[], buttons: string | string[] }): integer
    alert = function(text) end,

    ---```lua
    ---app.open(filename)
    ---```
    ---
    ---Opens a new sprite loading it from the given filename. Returns an instance of the Sprite class or `nil` if something went wrong.
    ---@param filename string
    ---@return Sprite | nil
    open = function(filename) end,

    ---```lua
    ---app.exit()
    ---```
    ---
    ---Closes the application. It's like clicking *File > Exit* menu option.
    exit = function() end,

    ---```lua
    ---app.transaction(
    ---  function()
    ---    ...
    ---  end)
    ---
    ---app.transaction(
    ---  string,
    ---  function()
    ---    ...
    ---  end)
    ---```
    ---
    ---Creates a new transaction so you can group several sprite modifications in just one undo/redo operation.
    ---
    ---The function in the argument is called inside the transaction, if the function fails, the whole transaction is undone. If the function successes, the transaction is committed and then all actions will be grouped in just one undo/redo operation.
    ---
    ---If a string is given as first argument, that string will be used as a label for the undo/redo action. Creates a new transaction so you can group several sprite modifications in just one undo/redo operation
    ---@param func fun(): any a function called inside the transaction
    ---@overload fun(label: string, func: fun(): any)
    transaction = function(func) end,

    ---```lua
    ---app.command.CommandName()
    ---app.command.CommandName { param1=value1, param2=value2, ... }
    ---```
    ---
    ---Executes the given command named `CommandName` with the given parameters.
    ---see [https://www.aseprite.org/api/app_command](https://www.aseprite.org/api/app_command)
    command = undefined --[[@as {[string]: fun(options: {[string]: any}) | fun(): any}]],

    ---```lua
    ---local value = app.preferences.section.option
    ---app.preferences.section.option = newValue
    ---```
    ---
    ---Gets or sets the given preference `option` in the given `section`. You can find valid `section` and `option` names in the [pref.xml](https://github.com/aseprite/aseprite/blob/main/data/pref.xml) file.
    preferences = {} --[[@as { [string]: {[string]: any} }]],

    ---A set of function to handle file names and the file system.
    fs = {
        ---```lua
        ---local fn = "path" .. app.fs.pathSeparator .. "filename.png"
        ---```
        ---
        ---Returns the preferred path separator of the current platform, it is `/` on macOS and Linux, and `\` on Windows. Preferably you should use `app.fs.joinPath()`.
        ---
        ---Example:
        ---
        ---```lua
        ---local sep = app.fs.pathSeparator
        ---local fn = "path" .. sep .. "filename.png"
        ---print(fn)
        ---```
        ---
        ---Will print `path/filename.png` on macOS or Linux, and `path\filename.png` on Windows.
        pathSeparator = undefined --[[@as "/"|"\\"]],

        ---```lua
        ---local pathPart = app.fs.filePath(fn)
        ---```
        ---
        ---Returns the path/directory part (as a string) of the given filename `fn`.
        ---@param fn string filename
        ---@return string
        filePath = function(fn) end,

        ---Returns the file name (including the extension part) of the given filename
        ---
        ---```lua
        ---local fileName = app.fs.fileName(fn)
        ---```
        ---
        ---Returns the file name (including the extension part) of the given filename `fn`.
        ---@param fn string filename
        ---@return string
        fileName = function(fn) end,

        ---```lua
        ---local extension = app.fs.fileExtension(fn)
        ---```
        ---
        ---Returns the file extension (without including the `.`) of the given filename `fn`. For example:
        ---
        ---```lua
        ---print(app.fs.fileExtension("path/file.png"))
        ---```
        ---
        ---Prints `png`. Returns the file extension (without including the `.`) of the given filename
        --- @param fn string filename
        ---@return string
        fileExtension = function(fn) end,

        ---```lua
        ---local title = app.fs.fileTitle(fn)
        ---```
        ---
        ---Returns the file title (without including the path nor the extension) of the given filename `fn`. For example:
        ---
        ---```lua
        ---print(app.fs.fileTitle("path/file.png"))
        ---```
        ---
        ---Prints `file`.
        ---@param fn string filename
        ---@return string
        fileTitle = function(fn) end,

        ---```lua
        ---local title = app.fs.filePathAndTitle(fn)
        ---```
        ---
        ---Returns the file path joined with the title (without including the extension) of the given filename `fn`. For example:
        ---
        ---```lua
        ---print(app.fs.filePathAndTitle("path/file.png"))
        ---
        ---```
        ---
        ---Prints `path/file`.
        ---@param fn string filename
        ---@return string
        filePathAndTitle = function(fn) end,

        ---Returns the file path converted to a canonical form for the current platform.
        ---
        ---Example:
        ---
        ---```lua
        ---print(app.fs.normalizePath("//home//user//path"))
        ---```
        ---
        ---Will print as `/home/user/path` on macOS or Linux, and `C:\home\user\path` on Windows.
        ---@param path string
        ---@return string
        normalizePath = function(path) end,

        ---Can accept any number of string arguments to join together with the path separator for the current platform.
        ---
        ---```lua
        ---local path = app.fs.joinPath("path1", "path2")
        ---```
        ---
        ---Returns `path1/path2` on macOS or Linux, and `path1\path2` on Windows.
        ---@param path1 string
        ---@param path2 string
        ---@return string
        joinPath = function(path1, path2) end,

        ---Returns the path the Aseprite executable was launched from.
        ---@type string
        currentPath = undefined,

        ---Returns the installation path of Aseprite for the current platform.
        ---@type string
        appPath = undefined,

        ---Returns the path for temporary files for the current platform.
        ---
        ---On macOS or Linux it will be `/tmp`, and Windows it will look like `C:\Users\username\AppData\Local\Temp\`.
        ---@type string
        tempPath = undefined,

        ---Returns the current user's Documents path for the current platform.
        ---
        ---Depending on the platform, this may return the user's home directory.
        ---@type string
        userDocsPath = undefined,

        ---Returns the current user's Aseprite configuration path for the current platform.
        ---
        ---You can learn about the specific location of this folder [from the Aseprite documentation](https://www.aseprite.org/docs/preferences-folder/).
        ---@type string
        userConfigPath = undefined,

        ---```lua
        ---local exists = app.fs.isFile(fn)
        ---```
        ---
        ---Returns 'true' if the given filename `fn` is a file.
        ---@param fn string filename
        ---@return boolean
        isFile = function(fn) end,

        ---```lua
        ---local exists = app.fs.isDirectory(fn)
        ---```
        ---
        ---Returns 'true' if the given filename `fn` is a directory.
        ---@param fn string filename
        ---@return boolean
        isDirectory = function(fn) end,

        ---```lua
        ---local size = app.fs.fileSize(fn)
        ---```
        ---
        ---Returns the file size of the given filename `fn`.
        ---@param fn string filename
        ---@return integer
        fileSize = function(fn) end,

        ---```lua
        ---local table = app.fs.listFiles(path)
        ---```
        ---
        ---Returns a list of files in the given directory `path`. The returned value is a table where each element is a file name, each file name is relative to the given `path`, they are not full path file names. In case that you want to get a list of full file names you can do something like this:
        ---
        ---```lua
        ---local dir = ...
        ---for _,filename in pairs(app.fs.listFiles(dir)) do
        ---  local fullFilename = app.fs.joinPath(dir, filename)
        ---  ...
        ---end
        ---```
        ---@param path string
        ---@return string[]
        listFiles = function(path) end,

        ---```lua
        ---app.fs.makeDirectory(path)
        ---```
        ---
        ---Create one directory.
        ---
        ---Returns `true` if the directory was created.
        ---@param path string
        ---@return boolean
        makeDirectory = function(path) end,

        ---```lua
        ---local result = app.fs.makeAllDirectories(path)
        ---```
        ---
        ---Create all directories needed to access to the `path`, so path could be `dir1/dir2/dir3` and the whole hierarchy of directories will be created.
        ---
        ---Returns `true` if all the directories were created.
        ---@param path string
        ---@return boolean
        makeAllDirectories = function(path) end,

        ---```lua
        ---app.fs.removeDirectory(path)
        ---```
        ---
        ---Remove the given directory (it must be empty).
        ---
        ---Returns `true` if the directory was removed (or is already removed).
        ---@param path string
        ---@return boolean
        removeDirectory = function(path) end
    },

    ---Access information about the current theme.
    ---@type Theme
    theme = undefined,

    ---Returns the [UI Elements Scaling](https://www.aseprite.org/docs/preferences/) value specified in *Edit > Preferences* as an scale factor (1 for 100%, 2 for 200%, etc.)
    uiScale = undefined,

    ---This function is available just in case you see that your script updates the sprite but the screen is not showing the updated state of the sprite. It should not be needed, but it's here just in case that something is not working right on the Aseprite side.
    refresh = function() end,

    ---Undoes the latest operation in the active sprite. It's like calling `app.command.Undo()` (the *Edit > Undo*  menu option).
    undo = function() end,

    ---Redoes the latest undone operation in the active sprite. It's like calling `app.command.Redo()` (the *Edit > Redo*  menu option).
    redo = function() end,

    ---Simulates an user stroke in the canvas using the given tool.
    ---
    ---* `tool`: A string with a well known tool ID (`rectangular_marquee`, `elliptical_marquee`, `lasso`, `polygonal_lasso`, `magic_wand`, `pencil`, `spray`, `eraser`, `eyedropper`, `zoom`, `hand`, `move`, `slice`, `paint_bucket`, `gradient`, `line`, `curve`, `rectangle`, `filled_rectangle`, `ellipse`, `filled_ellipse`, `contour`, `polygon`, `blur`, `jumble`) or a [tool](tool.md#tool) object
    ---* `color`: A [color](color.md#color) object to draw with the given tool
    ---* `brush`: A [brush](brush.md#brush) object to draw the points
    ---* `points`: An array of [points](point.md#point) in the sprite canvas which simulate the position of where the user put the mouse to draw with the given tool.
    ---* `selection`: What to do with the selection, only for selection-like tools (`rectangular_marquee`, `magic_wand`, etc.). The default value when the [UI is enabled](#appisuiavailable) will be `app.preferences.selection.mode`, in CLI mode it's `SelectionMode.REPLACE`.
    ---* And we can specify the `cel` or `layer`/`frame` where to draw:
    ---  * `cel`: The specific [cel](cel.md#cel) where we want to use the tool/draw with the tool (by default [app.cel](app.md#appcel))
    ---  * `layer`: The [layer](layer.md#layer) where we want to use the tool/draw with the tool (by default [app.layer](app.md#applayer))
    ---  * `frame`: The [frame](frame.md#frame) where to draw (by default [app.frame](app.md#appframe))
    ---@param options { tool: string, color: Color, bgColor: Color, brush: Brush, points: Point[], cel: Cel, layer: Layer, frame: Frame, ink: Ink, button: MouseButton, opacity: integer, contiguous: boolean, tolerance: integer, freehandAlgorithm: 0 | 1, selection: SelectionMode?, tilemapMode: unknown?, tilesetMode: unknown? }
    usetool = function(options) end,

    ---Returns the `Events` object to associate functions that can act like listeners of specific `app` events. E.g.
    ---```lua
    ---app.events:on('sitechange',
    ---  function()
    ---    print('Now we are located in other sprite, layer, or frame')
    ---
    ---  end)
    ---```
    ---
    ---Available events for `app`:
    ---* `'sitechange'`: When the user selects other sprite, layer, or frame.
    ---* `'fgcolorchange'`: When the [Foreground color](https://www.aseprite.org/docs/color-bar/#foreground-color) in the color bar is changed.
    ---* `'bgcolorchange'`: When the [Background color](https://www.aseprite.org/docs/color-bar/#background-color) in the color bar is changed.
    ---* `'beforecommand'`: Before executing any command in the program.
    ---* `'aftercommand'`: After executing any command in the program.
    ---
    ---The `'beforecommand'` and `'aftercommand'` events receive an `ev` argument with the name of the command (`ev.name`) and the params (`ev.params`). `'beforecommand'` includes a `ev.stopPropagation()` function to cancel the event, e.g. in case that you've handled the event in a custom way.
    ---
    ---E.g. This code catches the *Edit > Cut* command and convert it to a *Copy*:
    ---```lua
    ---app.events:on('beforecommand',
    ---  function(ev)
    ---    if ev.name == "Cut" then
    ---      app.command.Copy()   -- call Copy command
    ---      ev.stopPropagation() -- and cancel the Cut
    ---    end
    ---  end)
    ---```
    ---@type Events
    events = undefined,

    ---A set of function to get properties about the running Operating System platform.
    ---Note: `app.os` is not linked from the description of `app` global namespace and its documentation seems to be still ongoing.
    os = {
        ---Returns the platform name. It can be `Windows`, `macOS`, or `Linux`.
        ---@type string
        name = undefined,

        ---Returns an `Version` with the Windows or macOS version. It's just `0.0.0` on Linux.
        ---@type Version
        version = undefined,

        ---Returns the full platform name with its version. On Linux returns the distribution name with its specific version.
        ---
        ---Some examples: `Windows NT 10.0.22631`, `macOS 14.4.1`, `Pop!_OS 22.04 LTS`, etc.
        ---@type string
        fullName = undefined,

        ---Returns `true` if we are running in the windows platform.
        ---@type boolean
        windows = undefined,

        ---Returns `true` if we are running in the macos platform.
        ---@type boolean
        macos = undefined,

        ---Returns `true` if we are running in the linux platform.
        ---@type boolean
        linux = undefined,

        ---Returns `true` if we are running in the x64 platform.
        ---@type boolean
        x64 = undefined,

        ---Returns `true` if we are running in the x86 platform.
        ---@type boolean
        x86 = undefined,

        ---Returns `true` if we are running in the arm64 platform.
        ---@type boolean
        arm64 = undefined,
    },

    ---@deprecated
    ---Deprecated. Use `app.sprite`.
    ---@type Sprite
    activeSprite = undefined,

    ---@deprecated
    ---Deprecated. Use `app.layer`.
    ---@type Layer
    activeLayer = undefined,

    ---@deprecated
    ---Deprecated. Use `app.frame`.
    ---@type Frame
    activeFrame = undefined,

    ---@deprecated
    ---Deprecated. Use `app.cel`.
    ---@type Cel
    activeCel = undefined,

    ---@deprecated
    ---Deprecated. Use `app.image`.
    ---@type Image
    activeImage = undefined,

    ---@deprecated
    ---Deprecated. Use `app.tag`.
    ---@type Tag
    activeTag = undefined,

    ---@deprecated
    ---Deprecated. Use `app.tool`.
    ---@type Tool
    activeTool = undefined,

    ---@deprecated
    ---Deprecated. Use `app.brush`.
    ---@type Brush
    activeBrush = undefined,
}


---Since **Aseprite v1.3-rc5** you have this `json` global namespace. It provides a couple of functions to decode JSON objects from strings to Lua objects/tables and viceversa.
json = {
    ---Parses the given `jsonText` and returns a Lua table-like object
    ---`jsonObj` that represents the given data.
    ---
    ---Examples:
    ---
    ---```lua
    ---local obj = json.decode('{"a":true,"b":5,"c":[1,3,9]}')
    ---assert(#obj == 3)
    ---assert(obj.a == true)
    ---assert(obj.b == 5)
    ---assert(#obj.c == 3)
    ---assert(obj.c[1] == 1)
    ---assert(obj.c[2] == 3)
    ---assert(obj.c[3] == 9)
    ---```
    ---@param jsonText string
    ---@return any
    decode = function(jsonText) end,

    ---Converts the given Lua-table into a JSON text.
    ---
    ---Example:
    ---
    ---```lua
    ---local text = json.encode({ a=4, b=true, c="name", d={1,8,{a=2}} })
    ---assert(text == '{"a": 4, "b": true, "c": "name", "d": [1, 8, {"a": 2}]}')
    ---```
    ---@param luaTable any
    ---@return string
    encode = function(luaTable) end,
}


---Set of flags/bits specifying horizontal and vertical alignment of an UI element. You can combine one or several of these values depending on the case/what you are aligning. The specific integer values of each element in this enum might vary in the future.
---
---E.g.
---
---```lua
---local leftBottom = Align.LEFT | Align.BOTTOM
---local rightTop = Align.RIGHT | Align.TOP
---```
---@class Align
Align = {
    ---@type Align
    LEFT = undefined,

    ---@type Align
    CENTER = undefined,

    ---@type Align
    RIGHT = undefined,

    ---@type Align
    TOP = undefined,

    ---@type Align
    BOTTOM = undefined,
}


---Direction of animation playback.
---@class AniDir
AniDir = {
    FORWARD = undefined --[[@as AniDir]],
    REVERSE = undefined --[[@as AniDir]],
    PING_PONG = undefined --[[@as AniDir]],
    PING_PONG_REVERSE = undefined --[[@as AniDir]],
}


---Blend modes defines how the colors should be mixed when two images overlaps. Used in `Image:drawImage()` as input argument.
---@class BlendMode: integer
BlendMode = {
    NORMAL = undefined --[[@as BlendMode]],
    SRC = undefined --[[@as BlendMode]],
    MULTIPLY = undefined --[[@as BlendMode]],
    SCREEN = undefined --[[@as BlendMode]],
    OVERLAY = undefined --[[@as BlendMode]],
    DARKEN = undefined --[[@as BlendMode]],
    LIGHTEN = undefined --[[@as BlendMode]],
    COLOR_DODGE = undefined --[[@as BlendMode]],
    COLOR_BURN = undefined --[[@as BlendMode]],
    HARD_LIGHT = undefined --[[@as BlendMode]],
    SOFT_LIGHT = undefined --[[@as BlendMode]],
    DIFFERENCE = undefined --[[@as BlendMode]],
    EXCLUSION = undefined --[[@as BlendMode]],
    HSL_HUE = undefined --[[@as BlendMode]],
    HSL_SATURATION = undefined --[[@as BlendMode]],
    HSL_COLOR = undefined --[[@as BlendMode]],
    HSL_LUMINOSITY = undefined --[[@as BlendMode]],
    ADDITION = undefined --[[@as BlendMode]],
    SUBTRACT = undefined --[[@as BlendMode]],
    DIVIDE = undefined --[[@as BlendMode]],
}


---@class BrushPattern
BrushPattern = {
    NONE = undefined --[[@as BrushPattern]],
    ORIGIN = undefined --[[@as BrushPattern]],
    TARGET = undefined --[[@as BrushPattern]],
}


---@class BrushType
BrushType = {
    CIRCLE = undefined --[[@as BrushType]],
    SQUARE = undefined --[[@as BrushType]],
    LINE = undefined --[[@as BrushType]],
    IMAGE = undefined --[[@as BrushType]],
}


---The color mode of an sprite or image specifies the internal structure of each pixel. You can see the [Color Mode section in the Aseprite docs](https://www.aseprite.org/docs/color-mode/) for an introduction about each color mode.
---@class ColorMode: integer
ColorMode = {
    ---You can use this color mode to create RGBA sprites and images.
    ---
    ---Each pixel is a 32-bit unsigned integer where each component (Red, Green, Blue, and Alpha) uses 8-bit (values from 0 to 255).
    ---@type ColorMode
    RGB = undefined,

    ---You can use this color mode to create gray sprites and images. Known as `ColorMode.GRAYSCALE` in previous versions.
    ---
    ---Each pixel is a 16-bit unsigned integer where each component (Gray and Alpha) uses 8-bit (values from 0 to 255).
    ---@type ColorMode
    GRAY = undefined,

    ---You can use this color mode to create indexed sprites and images.
    ---
    ---Each pixel is an 8-bit unsigned integer (a value from 0 to 255) which indicates the specific [palette entry](palette.md#palettesetcolor) which the pixel refers.
    ---@type ColorMode
    INDEXED = undefined,

    ---Special color mode used for tilemaps, where each pixel is tile reference in a tileset.
    ---@type ColorMode
    TILEMAP = undefined,

}


---@class FilterChannels
---@operator bor(FilterChannels): FilterChannels
FilterChannels = {
    RED = undefined --[[@as FilterChannels]],
    GREEN = undefined --[[@as FilterChannels]],
    BLUE = undefined --[[@as FilterChannels]],
    ALPHA = undefined --[[@as FilterChannels]],
    GRAY = undefined --[[@as FilterChannels]],
    INDEX = undefined --[[@as FilterChannels]],

    ---Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE`.
    ---@type FilterChannels
    RGB = undefined,

    ---Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE | FilterChannels.ALPHA`.
    ---@type FilterChannels
    RGBA = undefined,

    ---Same as `FilterChannels.GRAY | FilterChannels.ALPHA`.
    ---@type FilterChannels
    GRAYA = undefined,

}


---More info about each ink type behavior at [https://www.aseprite.org/docs/ink/](https://www.aseprite.org/docs/ink/).
---@class Ink
Ink = {
    ---Value `0` or `"simple"` string.
    ---@type Ink
    SIMPLE = undefined,

    ---Value `1`, `"alpha_compositing"`, or `"alpha-compositing"`.
    ---@type Ink
    ALPHA_COMPOSTING = undefined,

    ---Value `2`, `"copy_color"`, or `"copy-color"`.
    ---@type Ink
    COPY_COLOR = undefined,

    ---Value `3`, `"lock_alpha"`, or `"lock-alpha"`.
    ---@type Ink
    LOCK_ALPHA = undefined,

    ---Value `4`, or `"shading"`.
    ---@type Ink
    SHADING = undefined,
}


---@class MouseButton
MouseButton = {
    NONE = undefined --[[@as MouseButton]],
    LEFT = undefined --[[@as MouseButton]],
    RIGHT = undefined --[[@as MouseButton]],
    MIDDLE = undefined --[[@as MouseButton]],
    X1 = undefined --[[@as MouseButton]],
    X2 = undefined --[[@as MouseButton]]
}


---Mouse cursor that can be set in a [canvas widget](dialog.md#dialogcanvas) using:
---
---```lua
---dialog:modify{ id=canvasId, mouseCursor=newMouseCursor }
---```
---@class MouseCursor
MouseCursor = {
    NONE = undefined --[[@as MouseCursor]],
    ARROW = undefined --[[@as MouseCursor]],
    CROSSHAIR = undefined --[[@as MouseCursor]],
    POINTER = undefined --[[@as MouseCursor]],
    NOT_ALLOWED = undefined --[[@as MouseCursor]],
    GRAB = undefined --[[@as MouseCursor]],
    GRABBING = undefined --[[@as MouseCursor]],
    MOVE = undefined --[[@as MouseCursor]],
    NS_RESIZE = undefined --[[@as MouseCursor]],
    WE_RESIZE = undefined --[[@as MouseCursor]],
    N_RESIZE = undefined --[[@as MouseCursor]],
    NE_RESIZE = undefined --[[@as MouseCursor]],
    E_RESIZE = undefined --[[@as MouseCursor]],
    SE_RESIZE = undefined --[[@as MouseCursor]],
    S_RESIZE = undefined --[[@as MouseCursor]],
    SW_RESIZE = undefined --[[@as MouseCursor]],
    W_RESIZE = undefined --[[@as MouseCursor]],
    NW_RESIZE = undefined --[[@as MouseCursor]],
}


---Type of range selected in the timeline.
---@class RangeType
RangeType = {
    ---When there is no selection.
    ---@type RangeType
    EMPTY = undefined,

    ---When the selection is in the layers.
    ---@type RangeType
    LAYERS = undefined,

    ---When the selection is in the frames.
    ---@type RangeType
    FRAMES = undefined,

    ---When the selection is in the cels.
    ---@type RangeType
    CELS = undefined,
}


---Selection mode
---@class SelectionMode
SelectionMode = {
    REPLACE = undefined --[[@as SelectionMode]],
    ADD = undefined --[[@as SelectionMode]],
    SUBTRACT = undefined --[[@as SelectionMode]],
    INTERSECT = undefined --[[@as SelectionMode]],
}


---Data format used to export JSON files in `app.command.ExportSpriteSheet`.
---@class SpriteSheetDataFormat
SpriteSheetDataFormat = {
    JSON_HASH = undefined --[[@as SpriteSheetDataFormat]],
    JSON_ARRAY = undefined --[[@as SpriteSheetDataFormat]],
}


---Type of sprite sheet used in `app.command.ExportSpriteSheet`
---@class SpriteSheetType
SpriteSheetType = {
    HORIZONTAL = undefined --[[@as SpriteSheetType]],
    VERTICAL = undefined --[[@as SpriteSheetType]],
    ROWS = undefined --[[@as SpriteSheetType]],
    COLUMNS = undefined --[[@as SpriteSheetType]],
    PACKED = undefined --[[@as SpriteSheetType]]
}


---@class WebSocketMessageType
WebSocketMessageType = {
    ---Text message received.
    ---@type WebSocketMessageType
    TEXT = undefined,

    ---Binary message received.
    ---@type WebSocketMessageType
    BINARY = undefined,

    ---Connected to the server.
    ---@type WebSocketMessageType
    OPEN = undefined,

    ---Connection was closed for any reason, or broke.
    ---@type WebSocketMessageType
    CLOSE = undefined,

    ---See [the standard](https://datatracker.ietf.org/doc/html/rfc6455) about ping and pong.
    ---@type WebSocketMessageType
    PING = undefined,

    ---Your ping has been answered.
    ---
    ---Note that incoming pings are answered automatically.
    ---@type WebSocketMessageType
    PONG = undefined,

    ---@type WebSocketMessageType
    FRAGMENT = undefined,
}


---Identifies a brush to paint with `app.useTool()` function.
---@class Brush
---@field type BrushType
---@field size integer
---@field angle integer in degrees, from -180 to 180
---@field image Image
---@field center Point
---@field pattern BrushPattern
---@field patternOrigin Point
local _brush = undefined

---@alias BrushInit { type: BrushType, size: integer, angle: integer, center: Point, image: Image, pattern: BrushPattern, patternOrigin: Point }
---Creates a new `Brush` instance
---@return Brush
---@overload fun(size: Size): Brush
---@overload fun(image: Image): Brush
---@overload fun(init: BrushInit): Brush
function Brush() end

---A cel is an image in a specific xy-coordinate, and a specific layer/frame combination.
---@class Cel
---@field sprite Sprite Returns the sprite this cel belongs to.
---@field layer Layer Returns the layer where this cel is located.
---@field frame Frame Returns the frame object which this cel belongs. If you set this property, the cel will be moved to the given frame (if another cel already exists in that frame, it will be removed).
---@field frameNumber integer Returns the frame number which this cel belongs, the frame number `1` is the first frame (not `0`). If you set this property the cel will be moved to the given `frameNumber`, check the notes of `Cel.frame`.
---@field image Image Gets or sets the image with the pixels of this cel. This is the preferred way to replace the cel image, because it generates only one undoable action.
---@field bounds Rectangle Returns the rectangle with the cel bounds (position and size).
---@field position Point Gets or sets the cel position.
---@field opacity integer Gets or sets the cel opacity. A value from `0` to `255` (which means `0=0%` completely transparent, or `255=100%` completely opaque).
---@field zIndex integer Gets or sets the cel z-index value. By default `0`, which means "show this cel in the same position as its layer", but can be modified to positive values to move the cel to the front, or negative values to move it to the back. It offers a way to change the order of layers in one specific frame. Note: The value is limited to the `[-32768,32767]` range.
---@field color Color Gets or sets the user-defined color of this cel in the timeline.
---@field data string Gets or sets the user-defined data related to this cel (a text string).
---@field properties any Access user-defined and extension-defined properties of this cel.
local _cel = undefined

---Represents a color that can be choose by the user in different kinds
---(RGB, HSV, HSL, grayscale, indexed).
---
---Don't confuse this color with the [app.pixelColor](pixelcolor.md#apppixelcolor)
---which is used to put/get pixels to/from an [image](image.md#image).
---@class Color
---@field alpha integer The alpha of color between 0 (transparent) and 255 (opaque)
---@field red integer Gets or sets the red components of the color.
---@field green integer Gets or sets the green components of the color.
---@field blue integer Gets or sets the blue components of the color.
---@field hsvHue integer Gets or sets the HSV hue components of the color.
---@field hsvSaturation number Gets or sets the HSV saturation components of the color.
---@field hsvValue number Gets or sets the HSV value components of the color.
---@field hslHue number Gets or sets the HSL hue components of the color.
---@field hslSaturation number Gets or sets the HSL saturation components of the color.
---@field hslLightness number Gets or sets the HSL lightness components of the color.
---@field hue number Gets/sets the HSV hue or HSL hue depending on the kind of color.
---@field saturation number Gets/sets the HSV saturation or HSL saturation depending on the kind of color.
---@field value number Gets/sets the HSV value.
---@field lightness number Gets/sets the HSL lightness.
---@field index integer Gets or sets the palette index related to this color. If the color is not an index, i.e. it's RGB/HSL/HSV, the closest palette index of the current palette (the palette of the active sprite) that matches the RGB/HSL/HSV values will be returned.
---@field gray integer
---@field rgbaPixel integer Returns the pixel color which is equivalent to the RGBA values of this color.
---@field grayPixel integer Returns the pixel color which is equivalent to the gray+alpha values of this color.
local _color = undefined

---Creates a new `Color` instance
---```lua
---local c
---c = Color{ r=255, g=255, b=255, a=255 }
---c = Color{ h=360.0, s=1.0, v=1.0, a=255 }
---
---c = Color{ h=360.0, s=1.0, l=1.0, a=255 }
---c = Color{ red=255, green=255, blue=255, alpha=255 }
---c = Color{ hue=360.0, saturation=1.0, value=1.0, alpha=255 }
---c = Color{ hue=360.0, saturation=1.0, lightness=1.0, alpha=255 }
---c = Color{ gray=255, alpha=255 }
---c = Color{ index=integer }
---c = Color(integer)
---```
---
---* If `alpha` argument is not specified, it's 255 by default (opacity = 100%).
---* The `Color(integer)` constructor receives a [pixel color](pixelcolor.md#apppixelcolor) and the integer is interpreted depending on the [active sprite](app.md#appsprite).
---@param index integer
---@return Color
---@overload fun(options: { r: number, g: number, b: number, a: integer }): Color
---@overload fun(options: { h: number, s: number, v: number, a: integer }): Color
---@overload fun(options: { h: number, s: number, l: number, a: integer }): Color
---@overload fun(options: { red: integer, green: integer, blue: integer, alpha: integer }): Color
---@overload fun(options: { hue: number, saturation: number, value: number, alpha: integer }): Color
---@overload fun(options: { hue: number, saturation: number, lightness: number, alpha: integer }): Color
---@overload fun(options: { gray: integer, a: integer }): Color
---@overload fun(options: { index: integer }): Color
function Color(index) end

---Represents the [color space/profile](https://www.aseprite.org/docs/color-profile/) of a sprite, image, or image spec.
---@class ColorSpace
---@field name string Get/sets the color space name.
local _colorSpace = undefined

---```lua
---local none = ColorSpace()
---local srgb = ColorSpace{ sRGB=true }
---
---local icc = ColorSpace{ fromFile="/path/file.icc" }
---```
---
---Creates an empty color space, sRGB color space, or loads a color profile from the given ICC file specified in `fromFile` parameter.
---@return ColorSpace
---@overload fun(options: { sRGB: boolean }): ColorSpace
---@overload fun(options: { fromFile: string }): ColorSpace
function ColorSpace() end

---The dialog class can be used to show input controls/widgets in the screen to get some data from the user.
---
---Example:
---
---```lua
---local dlg = Dialog()
---dlg:entry{ id="user_value", label="User Value:", text="Default User" }
---dlg:button{ id="confirm", text="Confirm" }
---dlg:button{ id="cancel", text="Cancel" }
---dlg:show()
---local data = dlg.data
---if data.confirm then
---  app.alert("The given value is '" .. data.user_value .. "'")
---end
---```
---
---Almost all dialogs functions return the same dialog object so we can use method chaining.
---
---Each time we add a new widget like `:button{ ... }` some common properties can be specified for every kind of widget:
---
---```lua
---Dialog:widget_type{
---  id=string,
---  label=string,
---  focus=boolean,
---  enabled=boolean,
---  visible=boolean,
---  hexpand=boolean,
---  vexpand=boolean,
---}
---```
---
---Where:
---* `id`: It's the ID to identify this widget in `Dialog.data`
---* `label`: Label at the left side of the widget
---* `focus`: Focus this widget by default (useful to focus a specific entry when the dialog appears on the screen for the first time)
---* `enabled`: Enable or disable the widget by default
---* `visible`: Make the widget visible or hidden by default
---* `hexpand`: Expand the widget horizontally (useful to make a canvas with fixed size if we specify `hexpand=false`)
---* `vexpand`: Expand the widget vertically (useful to make a canvas with fixed size if we specify `vexpand=false`)
---@class Dialog
local _dialog = {
    ---Gets/sets a table with one field for each widget with a given `id`. For each different kind of widget the field is of a different type:
    ---
    ---* button/check/radio: The field is a boolean (true or false) if the button is selected or was used to close the dialog.
    ---* entry/label: A string of text.
    ---* slider: An integer.
    ---* number: An intenger or a number depending on the number of decimals of the number field.
    ---* combobox: A string with the selected item.
    ---* color: A Color.
    ---* shades: A table with an array of Colors when `mode="sort"`
    ---@type { [string]: boolean | string | number | Color | Color[] }
    data = undefined,

    ---```lua
    ---local dlg = Dialog()
    ---local bounds = dlg.bounds
    ---dlg.bounds = Rectangle(x, y, bounds.width, bounds.height)
    ---```
    ---
    ---Gets or sets the position and size (a rectangle) of the dialog. This might be useful to align several dialog that must be shown in the same *xy*-position.
    ---@type Rectangle
    bounds = undefined,

    ---@alias ButtonInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string?, selected: boolean?, onclick: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:button{ id=string,
    ---            label=string,
    ---            text=string,
    ---            selected=boolean,
    ---            focus=boolean,
    ---            onclick=function }
    ---```
    ---
    ---Creates a button.
    ---
    ---Arguments (table fields):
    ---
    ---* `id`: Identifier for this button. Dialog.data will contain a field for each widget with and `id`.
    ---* `label`: Label at the left side of the control.
    ---* `text`: Text of the button.
    ---* `selected`: True in case that you want to show the button checked by default.
    ---* `focus`: Focus this button by default or when the Enter key is pressed in an text entry field.
    ---* `onclick`: Function to be called when the button is pressed.
    ---@param init ButtonInit
    ---@return Dialog
    button = function(self, init) end,

    ---@alias CheckInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string?, selected: boolean?, onclick: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:check{ id=string,
    ---           label=string,
    ---           text=string,
    ---           selected=boolean,
    ---           onclick=function }
    ---```
    ---
    ---Creates a check box. Arguments are the same as in `Dialog:button`.
    ---}
    ---@param init CheckInit
    ---@return Dialog
    check = function(self, init) end,

    ---```lua
    ---local dlg = Dialog()
    ---dlg:button{ text="Close",
    ---            onclick=function()
    ---                  dlg:close()
    ---            end }
    ---dlg:show{ wait=false }
    ---```
    ---
    ---Closes the dialog from a `onclick` button event. By default buttons without an `onclick` event handler will close the dialog, but if you specify a `onclick` function, you have to call this function to close the dialog.
    close = function(self) end,

    ---@alias ColorInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, color: Color?, onchange: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:color{ id=string,
    ---           label=string,
    ---           color=app.Color,
    ---           onchange=function }
    ---```
    ---
    ---Creates a button to select a color.
    ---@param init ColorInit
    ---@return Dialog
    color = function(self, init) end,

    ---@alias ComboboxInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, option: string?, options: string[], onchange: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:combobox{ id=string,
    ---              label=string,
    ---              option=string,
    ---              options={ string1,string2,string3... },
    ---              onchange=function }
    ---```
    ---
    ---Creates a combo box/drop-down list.
    ---
    ---* `options`: Indicates a list of available options in the combobox.
    ---* `option`: Indicates the default selected option in the combobox (one of the `options`).
    ---@param init ComboboxInit
    ---@return Dialog
    combobox = function(self, init) end,

    ---@alias EntryInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string?, focus: string?, onchange: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:entry{ id=string,
    ---           label=string,
    ---           text=string,
    ---           focus=boolean,
    ---           onchange=function }
    ---```
    ---
    ---Creates a text entry.
    ---@param init EntryInit
    ---@return Dialog
    entry = function(self, init) end,

    ---@alias LabelInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:label{ id=string,
    ---           label=string,
    ---           text=string }
    ---```
    ---
    ---* `id`: Identifier for this label. If you specify it, a field in `Dialog.data` will be created with the given string in `text`.
    ---* `label`: Text to be used in the left side.
    ---* `text`: Text to be used in the right side.
    ---
    ---Creates a static label.
    ---@param init LabelInit
    ---@return Dialog
    label = function(dialog, init) end,

    ---@alias ModifyOptions { id: string, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, [string]: string | number | boolean | Color | Color[] }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:modify{ id=string,
    ---            visible=boolean,
    ---            enabled=boolean,
    ---            text=string }
    ---```
    ---
    ---Changes properties of the given widget that matches the identifier `id`.
    ---
    ---```lua
    ---local dlg = Dialog()
    ---dlg:modify{ title = "New Dialog Title" }
    ---```
    ---
    ---Using the `dialog:modify` with a parameter `title` changes the dialog title.
    ---@param options ModifyOptions
    modify = function(self, options) end,

    ---```lua
    ---local dlg = Dialog()
    ---dlg:newrow()
    ---dlg:newrow{ always=true }
    ---```
    ---
    ---Indicates that the next widget should be put in a new row in the dialog (useful to create buttons or several controls of the same type one below the other).
    ---
    ---Using the `newrow{ always=true }` is a way to avoid joining widgets of the same type (it's like calling `newrow()` after each new widget is added).
    ---@return Dialog
    ---@overload fun(self: Dialog, options: { always: boolean? })
    newrow = function(self) end,

    ---@alias NumberInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string?, decimals: string?, onchange: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:number{ id=string,
    ---            label=string,
    ---            text=string,
    ---            decimals=integer,
    ---            onchange=function }
    ---```
    ---
    ---Creates an entry field to input a number.
    ---@param init NumberInit
    ---@return Dialog
    number = function(self, init) end,

    ---@alias RadioInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string?, selected: boolean?, onclick: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:radio{ id=string,
    ---           label=string,
    ---           text=string,
    ---           selected=boolean,
    ---           onclick=function }
    ---```
    ---
    ---Creates a radio button. Arguments are the same as in [Dialog:button](#dialogbutton).
    ---@param init RadioInit
    ---@return Dialog
    radio = function(self, init) end,

    ---@alias SeparatorInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, text: string? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:separator{ id=string,
    ---               text=string }
    ---```
    ---
    ---Creates a separator.
    ---@param init SeparatorInit,
    ---@return Dialog
    separator = function(dialog, init) end,

    ---@alias ShadesInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, mode: "pick" | "sort", colors: Color[], onclick: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:shades{ id=string,
    ---            label=string,
    ---            mode="pick" | "sort",
    ---            colors={ color1, color2, color3, ... },
    ---            onclick=function }
    ---```
    ---
    ---Creates a widget with a set of colors that can be clicked/picked (when `mode="pick"`, which is the default mode) or can be sorted (when `mode="sort"`, which is the default mode). The `onclick` function can receive a `event` parameter which is a table with one `event.color` field which is the color that was clicked, and a `event.button` field with the mouse button, for example:
    ---
    ---```lua
    ---dlg:shades{
    ---  ...
    ---  onclick=function(ev)
    ---    if ev.button == MouseButton.LEFT then
    ---      -- In this case we change the active foreground color
    ---      -- with the clicked color in the shades widget when
    ---      -- the left mouse button is pressed.
    ---      app.fgColor = ev.color
    ---    elseif ev.button == MouseButton.RIGHT then
    ---      app.bgColor = ev.color
    ---    end
    ---  end
    ---}
    ---```
    ---@param init ShadesInit
    ---@return Dialog
    shades = function(self, init) end,

    ---```lua
    ---local dlg = Dialog()
    ---dlg:show()
    ---dlg:show{
    ---  wait=false,
    ---  bounds=Rectangle(),
    ---  autoscrollbars=false,
    ---}
    ---```
    ---
    ---Makes the dialog visible to the user. The script code will continue when the dialog is closed by default (pressing a button).
    ---
    ---If `{ wait=false }` is used as argument, the dialog is open "in background", which means that the script code continues the execution with its following line, and the dialog will be visible until it's closed with some button or calling `Dialog:close` in a `onclick` event.
    ---
    ---With `{ bounds=Rectangle() }` you can display the dialog in a specific location. Useful to show the dialog in a previous position that you obtain from `Dialog.bounds` property.
    ---
    ---Setting `{ autoscrollbars=true }` will add scrollbars automatically only if they are needed. This means that if your dialog contains enough widgets to make it go out of the window/screen (depending if you are using single window UI or multiple windows UI) then scrollbars will be shown into your dialog when its content doesn't fit its bounds.
    ---@return Dialog
    ---@overload fun(self: Dialog, options: { wait: boolean?, bounds: Rectangle?, autoscrollbars: boolean? })
    show = function(self) end,

    ---@alias SliderInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, min: integer, max: integer, value: integer, onchange: function?, onrelease: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:slider{ id=string,
    ---            label=string,
    ---            min=integer,
    ---            max=integer,
    ---            value=integer,
    ---            onchange=function,
    ---            onrelease=function }
    ---```
    ---
    ---Creates a slider in the dialog.
    ---@param init SliderInit
    ---@return Dialog
    slider = function(self, init) end,

    ---@alias TabInit { id: string?, focus: boolean?, enabled: boolean?, visible: boolean?, text: string?, onclick: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:tab{ id=string,
    ---         text=string,
    ---         onclick=function }
    ---```
    ---
    ---If called for the first time (or anytime after a `Dialog:endtabs` call), it creates a new tabs group and starts the first tab. If called after a previous `Dialog:tab` call, it marks the end of the previous tab and starts a new one.
    ---
    ---Once started a tab, you can define its content by adding widgets as usual. When you are done adding tabs, call `Dialog:endtabs`.
    ---
    ---* `id`: Identifier for this tab. If you specify it, you can use it in `Dialog:endtabs` to reference the selected tab. This value will be used also when asking for the selected tab through `Dialog.data`.
    ---* `text`: Text to display on the tab.
    ---* `onclick`: Function to be called when the tab is pressed. It receives a parameter that you can use to get the pressed tab:
    ---    ```lua
    ---    { onclick=function(ev)
    ---         print("pressed tab: " .. ev.tab)
    ---      end }
    ---    ```
    ---Does not support the following common properties: `label`, `hexpand`, `vexpand`.
    ---
    ---These can be specified at `Dialog:endtabs`.
    ---@param init TabInit
    ---@return Dialog
    tab = function(self, init) end,

    ---```lua
    ---local dlg = Dialog()
    ---dlg:endtabs{ id=string,
    ---             selected=string,
    ---             align=integer,
    ---             onchange=function }
    ---```
    ---
    ---
    ---Marks the end of both the last tab and the group of tabs to which it belongs.
    ---
    ---* `id`: Identifier for this tabs widget. `Dialog.data` will contain a field named as this id, which will return the value of the currently selected tab's `id`.
    ---* `align`: Horizontal and vertical alignment/placement of the tabs selector specified with [Align](align.md#align) values. Its default value is `{ align=Align.CENTER|Align.TOP }`.
    ---* `onchange`: Function to be called when the tab is changed. It receives a parameter that you can use to get the selected tab:
    ---    ```lua
    ---    { onchange=function(ev)
    ---         print("selected tab: " .. ev.tab)
    ---      end }
    ---    ```
    ---@param options { id: string?, selected: string?, align: (Align | integer)?, onchange: function? }
    ---@return Dialog
    endtabs = function(self, options) end,

    ---@alias FileInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, title: string?, open: boolean?, save: boolean?, filename: (string | string[])?, filetypes: string[]?, onchange: function? }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:file{ id=string,
    ---          label=string,
    ---          title=string,
    ---          open=boolean,
    ---          save=boolean,
    ---          filename=string | { string1,string2,string3... },
    ---          filetypes={ string1,string2,string3... },
    ---          onchange=function }
    ---```
    ---
    ---
    ---Creates a text entry field + a button to select one file to open or save, possibilities:
    ---
    ---* `open=true`: shows a dialog to open an existent file (this is the default mode).
    ---* `save=true`: shows a dialog to select an existent file to overwrite or a new file to save.
    ---
    ---Arguments (table fields):
    ---
    ---* `load`: True if you want to show a dialog to the user to select an existent file to load/read.
    ---* `save`: True if you want to show a dialog to the user to select a new file to save/write content.
    ---* `filename`: String of the selected filename to open or save.
    ---* `filetypes`: Array of possible file types/extensions that the user can select.
    ---* `entry`: Show an entry field to edit the filename manually (false by default).
    ---* `focus`: Focus this field by default.
    ---* `onchange`: Function to be called when the filename is changed.
    ---@param init FileInit
    ---@return Dialog
    file = function(self, init) end,

    ---@alias CanvasInit { id: string?, label: string?, focus: boolean?, enabled: boolean?, visible: boolean?, hexpand: boolean?, vexpand: boolean?, width: integer, height: integer, autoscaling: boolean?, onpaint: function, onkeydown: function, onkeyup: function, onmousemove: fun(ev: MouseEvent), onmousedown: fun(ev: MouseEvent), onmouseup: fun(ev: MouseEvent), ondblclick: fun(ev: MouseEvent), onwheel: fun(ev: MouseEvent), ontouchmagnify: function }
    ---```lua
    ---local dlg = Dialog()
    ---dlg:canvas{ id=string,
    ---            width=integer,
    ---            height=integer,
    ---            autoscaling=boolean,
    ---            onpaint=function(ev) ... end,
    ---            onkeydown=function(ev) ... end,
    ---            onkeyup=function(ev) ... end,
    ---            onmousemove=function(ev) ... end,
    ---            onmousedown=function(ev) ... end,
    ---            onmouseup=function(ev) ... end,
    ---            ondblclick=function(ev) ... end,
    ---            onwheel=function(ev) ... end,
    ---            ontouchmagnify=function(ev) ... end }
    ---```
    ---
    ---The Canvas widget provides several events to create an interactive experience with the user:
    ---
    ---
    ---* `onpaint`: A function that receives an event with a GraphicsContext (`ev.context`) to paint on.
    ---* `onkeydown`/`onkeyup`: Key events when a key is pressed or released. If a canvas widget handles these events, it will receive the keyboard focus when it's clicked. The `ev` event is a `KeyEvent`.
    ---* `onmousemove`/`onmousedown`/`onmouseup`/`onwheel`: Mouse events when the mouse is moved over the canvas, a button is pressed (`onmousedown`), a button is released (`onmouseup`), or the mouse wheel moved (`onwheel`). The `ev` event is a `MouseEvent`.
    ---* `ontouchmagnify`: Touch event generated when a pinch gesture is done in the trackpad to zoom in or out. The `ev` event is a `TouchEvent`.
    ---
    ---The `autoscaling` property allows the script developer to draw on the GraphicsContext received in the canvas's onpaint event without worrying about the current UI scale setting. For instance, you can draw a 20[px]x30[px] rectangle in the canvas's GraphicsContext and it will be displayed the same at any UI scale. This property is enabled by default if omitted, so if you don't need it you must explicitly set it to false.
    ---@param init CanvasInit
    ---@return Dialog
    canvas = function(self, init) end,

    ---Will call `onpaint` event of all canvases and update the dialog pixels on the screen.
    repaint = function(self) end,
}

---@alias DialogInit { title: string?, notitlebar: boolean?, parent: Dialog?, onclose: function? }
---```lua
---local dlg = Dialog()
---local dlg = Dialog(string)
---local dlg = Dialog{ title=string,
---                    notitlebar=false,
---                    parent=otherDialog,
---                    onclose=function }
---```
---
---Creates a new dialog. The dialog is hidden, so you have to call `Dialog:show` function to make it visible. The constructor that receives a `string` will use that string in the title bar of the dialog. The constructor that receives a table can receive a special callback function (`onclose`) that is called when the dialog is closed.
---
---The `{ parent=otherDialog }` can be used to display an alert/subdialog inside a parent dialog (the parent dialog is blocked until the child dialog is closed).
---
---The `{ notitlebar=true }` can be used to display a dialog without any kind of title bar (the dialog must be closed with a button inside it).
---
---Returns `nil` if there is no UI available, i.e. [app.isUIAvailable is `false`](app.md#appisuiavailable).
---@return Dialog | nil
---@overload fun(title: string): Dialog | nil
---@overload fun(init: DialogInit): Dialog | nil
function Dialog() end

---References a sprite editor. At the moment we can access only the active editor using `app.editor`.
---@class Editor
local _editor = {
    ---Returns the sprite in the editor.
    ---@type Sprite
    sprite = undefined,

    ---Returns a point of the the mouse position on the sprite, i.e. what pixel is going to be changed if the user clicks the mouse.
    ---@type Point
    spritePos = undefined,

    ---Returns a point indicating the mouse position on the screen.
    mousePos = undefined,

    ---@alias AskPointOptions { title: string?, point: Point?, onclick: function?, onchange: function?, oncancel: function? }
    ---```lua
    ---app.editor:askPoint{
    ---  title=string,
    ---  point=initialPoint,
    ---  onclick=function(ev) ... end,
    ---  onchange=function(ev) ... end,
    ---  oncancel=function(ev) ... end,
    ---}
    ---```
    ---
    ---Asks the user to select a pixel/point on the sprite. It's similar to what happens when you choose *Edit > New Brush* (but in that case you select a rectangle).
    ---
    ---* `title`: Text to show in the [context bar](https://www.aseprite.org/docs/context-bar/)
    ---* `point`: Initial point to highlight (optional)
    ---* `onclick`: Happens when the user clicks (press/release a mouse button) on the canvas
    ---* `onchange`: Happens when the user drags the mouse (press/move mouse/release a mouse button) on the canvas
    ---* `oncancel`: Happens when the user cancels the action (e.g. press the <kbd>Escape</kbd> key)
    ---@param options AskPointOptions
    askPoint = function(self, options) end,

    ---```lua
    ---app.editor:cancel()
    ---```
    ---
    ---Cancels the `editor:askPoint()` action.
    cancel = function(self) end,
}

---A collection of listeners for specific events. Available for `App.events` and `Sprite.events`.
---
---With this property you can associate (or disassociate) a function to a specific event.
---@class Events
Events = {
    ---```lua
    ---local listenerCode = events:on(eventName, function)
    ---```
    ---
    ---Connects the given `function` (2nd argument) with the given event by `eventName` (a `string`, the event name/code/identifier). When the event happens in the future the function will be called automatically. This is like the `function` starts "listening" the event.
    ---
    ---The returned `listenerCode` is a numeric value that indicates the connection between the event and the function. You can use this value in `Events.off()` to stop listening/break the connection with the event.
    ---
    ---E.g.
    ---
    ---```lua
    ---app.events:on('sitechange',
    ---  function()
    ---    print('app.site has changed')
    ---  end)
    ---```
    ---@param eventName string the event name/code/identifier
    ---@param func fun()
    ---@return integer listenerCode
    on = function(eventName, func) end,

    ---```lua
    ---events:off(function)
    ---events:off(listenerCode)
    ---```
    ---
    ---Disconnects the given `function` from all events in the object, or stops/breaks only the specific connection identified by `listenerCode` (the code returned by `Events:on()`).
    ---
    ---```lua
    ---local function onSiteChange() ... end
    ---app.events:on('sitechange', onSiteChange)
    ---app.events:off(onSiteChange)
    ---```
    ---@param listenerCode integer
    ---@overload fun(func: fun())
    off = function(listenerCode) end,
}


---This is an auxiliary object that points to a given frame in the sprite and can be used to adjust information about that frame. If you modify the number of frames in the sprite, or the structure of the frames, a `Frame` object will still pointing to the same frame number.
---@class Frame
local _frame = {
    ---Returns the sprite of this frame.
    ---@type Sprite
    sprite = undefined,

    ---Returns the frame number. `1` is the first frame in the animation and this `frame` is equal to `frame == frame.sprite.frames[frameNumber]`.
    ---@type integer
    frameNumber = undefined,

    ---Gets or sets the duration of this frame in the animation in seconds. E.g. `0.3333` means that this frame will be `1/3` of a second in the screen when the animation is being played.
    ---@type number
    duration = undefined,

    ---Returns `Frame` object in the previous frame number or `nil` if this is the first frame.
    ---@type Frame
    previous = undefined,

    ---Returns `Frame` object in the next frame number or `nil` if this is the last frame.
    ---@type Frame
    next = undefined,
}


---The *GraphicsContext* object provides methods for drawing images, text and shapes on the canvas.
---
---```lua
---local dlg = Dialog()
---dlg:canvas{
---  onpaint = function(ev)
---    local gc = ev.context
---    -- gc is a GraphicsContext
---
---  end
---
---}
---```
---@class GraphicsContext
local _graphicsContext = {
    ---Gets the width of the visible area in pixels. Canvas dimensions change when the dialog is resized by the user.
    ---@type integer
    width = undefined,

    ---Gets the height of the visible area in pixels. Canvas dimensions change when the dialog is resized by the user.
    ---@type integer
    height = undefined,

    ---Gets or sets whether paths and shapes are painted on using antialiasing.
    ---@type boolean
    antialias = undefined,

    ---Gets or sets the color to paint with the path functions.
    ---@type Color
    color = undefined,

    ---Gets or sets the width of lines painted when calling `stroke()` or `strokeRect()`.
    ---@type number
    strokeWidth = undefined,

    ---Gets or sets the blend mode used in `stroke()`, `fill()`, `drawImage()`, etc.
    ---@type BlendMode
    blendMode = undefined,

    ---```lua
    ---local opacity = gc.opacity
    ---assert(opacity >= 0 and opacity <= 255)
    ---gc.opacity = newOpacity
    ---```
    ---
    ---Opacity used in `stroke()`, `fill()`, `drawImage()`, etc.
    ---
    ---* `opacity`: 0 completely transparency, 255 completely opaque.
    ---@type number
    opacity = undefined,

    ---It has the same functionality as `app.theme`, with the only difference that the values returned by accessing dimensions or style metrics data are not affected by the current UI Scale setting. This is useful when you are drawing on a dialog canvas's GraphicsContext with autoScaling enabled, so you don't have to worry about adjusting sizes and measures when painting on the canvas using the current theme.
    ---
    ---For instance, when UI Scale is set to 200% this is the difference:
    ---```lua
    ---local dlg = Dialog()
    ---dlg:canvas{
    ---  onpaint = function(ev)
    ---      local b1 = app.theme:styleMetrics("button")
    ---      local b2 = ev.context.theme:styleMetrics("button")
    ---      print("app.theme:     " .. b1.border.top .. " " .. b1.border.left .. " " .. b1.border.bottom .. " " .. b1.border.right)
    ---      print("context.theme: " .. b2.border.top .. " " .. b2.border.left .. " " .. b2.border.bottom .. " " .. b2.border.right)
    ---      -- Console's output:
    ---      -- app.theme:     8 8 12 8
    ---      -- context.theme: 4 4 6 4
    ---  end
    ---}
    ---```
    ---@type Theme
    theme = undefined,

    ---Saves the current state of the canvas to [restore](#graphicscontextrestore) it later, including:
    ---
    ---* color
    ---* opacity
    ---* blendMode
    ---* stroke width
    ---* clipping region
    save = function(self) end,

    ---Restores the last saved canvas state.
    restore = function(self) end,

    ---Sets the current path as a clipping area for following drawing operations.
    ---
    ---**Warning:** The only option to draw paths not clipped after calling `GraphicsContext:clip()` is restoring a previously saved state.
    ---
    ---```lua
    ----- Save state before clipping
    ---gc:save()
    ---
    ----- Create a rectangle and use it as a clipping region
    ---gc:beginPath()
    ---gc:rect(Rectangle(0, 30, 100, 40))
    ---gc:clip()
    ---
    ---
    ----- Stroke a circle with width of 4
    ---gc.strokeWidth = 4
    ---
    ---gc:beginPath()
    ---gc:roundedRect(Rectangle(10, 10, 80, 80), 50)
    ---gc:stroke()
    ---
    ----- Restore the state
    ---gc:restore()
    ---
    ----- Fill a smaller circle in white
    ---gc.color = Color {r = 255, g = 255, b = 255, a = 255}
    ---
    ---gc:beginPath()
    ---gc:roundedRect(Rectangle(20, 20, 60, 60), 30)
    ---gc:fill()
    ---```
    clip = function(self) end,

    ---Paints the edges of the given rectangle with the current color and current width.
    ---@param rectangle Rectangle
    strokeRect = function(self, rectangle) end,

    ---Fills the given rectangle with the current color.
    ---@param rectangle Rectangle
    fillRect = function(self, rectangle) end,

    ---Draws on the canvas the given text string, at a position specified by the *xy*-coordinates.
    ---@param text string
    ---@param x number
    ---@param y number
    fillText = function(self, text, x, y) end,

    ---Returns the `Size` of the given text using the current font.
    ---@param text string
    ---@return Size
    measureText = function(self, text) end,

    ---```lua
    ---gc:drawImage(image, x, y)
    ---gc:drawImage(image, srcRect, dstRect)
    ---gc:drawImage(image, srcX, srcY, srcW, srcH, dstX, dstY, dstW, dstH)
    ---```
    ---
    ---Draws on the canvas the given image.
    ---
    ---If given *xy*-coordinates, the full image will be drawn at the specified position, in it's original scale.
    ---
    ---If given source and destination bounds (or their respective values), a part of the image is drawn (specified by the *srcRect*, or *srcX/srcY/srcW/srcH*, relative to the image) on the canvas (specified by the *dstRect* or *dstX/dstY/dstW/dstH*). This allows drawing only a part of and/or scaling the image.
    ---@param image Image
    ---@param x number
    ---@param y number
    ---@overload fun(self, image: Image, srcRect: Rectangle, dstRect: Rectangle)
    ---@overload fun(self, image: Image, srcX: number, srcY: number, srcW: number, srcH: number, dstX: number, dstY: number, dstW: number, dstH: number)
    drawImage = function(self, image, x, y) end,

    ---```lua
    ---gc:drawThemeImage(partId, point)
    ---gc:drawThemeImage(partId, x, y)
    ---```
    ---
    ---Draws on the canvas a theme part specified by the given *partId*, at a given `Point` or at specified *xy*-coordinates.
    ---
    ---List of possible parts can be found in [theme.xml](https://github.com/aseprite/aseprite/blob/3c77928a6f193748bcd8cca15d45000dd58e11d5/data/extensions/aseprite-theme/theme.xml#L115).
    ---@param partId string
    ---@param point Point
    ---@overload fun(self, partId: string, x: number, y: number)
    drawThemeImage = function(self, partId, point) end,

    ---```lua
    ---gc:drawThemeRect(partId, rectangle)
    ---gc:drawThemeRect(partId, x, y, w, h)
    ---```
    ---
    ---Draws on the canvas a theme part specified by the given *partId*, filling a given `Rectangle` or at specified *xy*-coordinates, with given width and height. This method uses [nine-slice scaling](https://en.wikipedia.org/wiki/9-slice_scaling) for parts that have their Slice's center defined.
    ---
    ---List of possible parts can be found in [theme.xml](https://github.com/aseprite/aseprite/blob/3c77928a6f193748bcd8cca15d45000dd58e11d5/data/extensions/aseprite-theme/theme.xml#L115).
    ---@param partId string
    ---@param rectangle Rectangle
    ---@overload fun(self, partId: string, x: number, w: number, w: number, h: number)
    drawThemeRect = function(self, partId, rectangle) end,

    ---Starts a new path, emptying the list of tracked sub-paths. This is the first method to call when drawing paths.
    beginPath = function(self) end,

    ---Closes the current sub-path by connecting the current point with the first point of the current sub-path.
    closePath = function(self) end,

    ---Starts a new sub-path at the specified *xy*-coordinates. This is the second method to call (after `GraphicsContext:beginPath()`) when drawing paths.
    ---@param x number
    ---@param y number
    moveTo = function(self, x, y) end,

    ---Adds a line to the current sub-path, from the last point to the specified *xy*-coordinates.
    ---
    ---**Note:** This method doesn't draw on the canvas, to draw the path onto the canvas call `GraphicsContext:stroke()` or `GraphicsContext:fill()`.
    ---@param x number
    ---@param y number
    lineTo = function(self, x, y) end,

    ---Adds a cubic [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) to the current sub-path, from the last point to the specified *xy*-coordinates, with two control points (specified by *cp1x/cp1y* and *cp2x/cp2y* coordinates).
    ---
    ---**Note:** This method doesn't draw on the canvas, to draw the path onto the canvas call `GraphicsContext:stroke()` or `GraphicsContext:fill()`.
    ---@param cp1x number
    ---@param cp1y number
    ---@param cp2x number
    ---@param cp2y number
    ---@param x number
    ---@param y number
    cubicTo = function(self, cp1x, cp1y, cp2x, cp2y, x, y) end,

    ---Adds an oval enclosed by the given `Rectangle` to the current sub-path.
    ---
    ---**Note:** This method doesn't draw on the canvas, to draw the path onto the canvas call `GraphicsContext:stroke()` or `GraphicsContext:fill()`.
    ---@param rectangle Rectangle
    oval = function(self, rectangle) end,

    ---Adds a given [Rectangle](rectangle.md) to the current sub-path.
    ---
    ---**Note:** This method doesn't draw on the canvas, to draw the path onto the canvas call `GraphicsContext:stroke()` or `GraphicsContext:fill()`.
    ---@param rectangle Rectangle
    rect = function(self, rectangle) end,

    ---```lua
    ---gc:roundedRect(rectangle, r)
    ---gc:roundedRect(rectangle, rx, ry)
    ---```
    ---
    ---Adds a given `Rectangle` to the current sub-path with rounded corners.
    ---
    ---If a single radius is specified, a rectangle with circular corners is created. This method can be used to easily draw circles.
    ---
    ---If two radii are specified, a rectangle with elliptical corners is created.
    ---
    ---**Note:** This method doesn't draw on the canvas, to draw the path onto the canvas call `GraphicsContext:stroke()` or `GraphicsContext:fill()`.
    ---@param rectangle Rectangle
    ---@param r number
    ---@overload fun(self, rectangle: Rectangle, rx: number, ry: number)
    roundedRect = function(self, rectangle, r) end,

    ---Paints the edges of the current path with the current color and current width.
    stroke = function(self) end,

    ---Fills the current path with the current color.
    fill = function(self) end,
}

---An image object. Each cel has one image (all linked cels share the same image).
---
---An image can be associated to a specific cel or can be alone:
---
---* When you create an image with `Image()`, the image will be alone so they don't generate undo information.
---* A `Cel.image` is an image associated to a cel, some functions will generate undoable actions.
---@class Image
local _image = {
    ---Internal unique ID (an integer) assigned to this image inside the program. You can use it to identify this image in your script.
    ---@type integer
    id = undefined,

    ---Internal version (an integer) assigned to this image inside the program. It's always incremented when the image is modified. Can be used to cache some complex calculation related to the image and recalculate it only if the version is modified (which means the pixels are modified).
    ---@type integer
    version = undefined,

    ---@type integer
    width = undefined,

    ---@type integer
    height = undefined,

    ---Returns a rectangle with the bounds of the image with origin equal to (0, 0).
    ---@type Rectangle
    bounds = undefined,

    ---Image color mode.
    ---@type ColorMode
    colorMode = undefined,

    ---The `specification` for this image.
    ---@type ImageSpec
    spec = undefined,

    ---Returns the cel to which this image belongs or `nil` if this image is not associated to a cel.
    ---@type Cel | nil
    cel = undefined,

    ---A byte string that contains raw image data. The layout depends on the image's color mode. It can be used with the usual string methods, or split into bytes using `string.bytes`. For editing the image, it's easier to use `image:pixels()`.
    ---
    ---The number of bytes must be equal to `image.rowStride * image.height`.
    ---@type integer[]
    bytes = undefined,

    ---Number of bytes for each row in the image. Each image has a total of `image.rowSide * image.height` bytes. It's useful if you are going to get or set the [`Image.bytes`](#imagebytes) property manually.
    ---@type integer
    rowStride = undefined,

    ---Number of bytes per pixel.
    ---
    ---The number of visible pixels per row is `Image.width`, the number of bytes per row is `Image.rowStride`, the number of "visible bytes" is `image.width * image.bytesPerPixel`, and the number of "pixels per row" (visible pixels + hidden/just for alignment) is `image.rowStride / image.bytesPerPixel`.
    ---@type integer
    bytesPerPixel = undefined,

    ---Creates a copy of the given image. You can use the `Image(otherImage)` constructor for the same behavior.
    ---
    ---The new image is unrelated to the sprite, but it can be used to update the image in a transaction. E.g. You clone an image, modify the pixels from the copy, and then you patch the image.
    ---@return Image
    clone = function(self) end,

    ---Clears the image pixels in a given bounds with a the given color. The entire image is erased by default if no bounds present. `image.spec.transparentColor` if no color specified.
    ---@override fun(self, color: Color)
    ---@override fun(self, bounds: Rectangle, color: Color)
    clear = function(self) end,

    ---Sets the pixel in the *xy*-coordinate to the given integer pixel value. The *xy*-coordinate is relative to the image, so pixel (0, 0) is the first pixel at the top-left coorner in the image, not in the sprite canvas.
    ---
    ---**Warning**: This method doesn't create undo information, you should clone the image and then patch it to get proper undo/redo information.
    ---@param x integer
    ---@param y integer
    ---@param color integer
    drawPixel = function(self, x, y, color) end,

    ---Returns a integer pixel value for the given *xy*-coordinate related to the "Image" itself. The returned value will depend on the color mode of the image.
    ---
    ---Do NOT confuse with the absolute *xy*-coordinate in the Canvas. In the following example, we show the differences between `getPixel()`, `Cel.bounds` and `Cel.position`:
    ---@param x integer
    ---@param y integer
    ---@return integer
    getPixel = function(self, x, y) end,

    ---```lua
    ---destinationImage:drawImage(sourceImage [, position, opacity, blendMode] )
    ---```
    ---
    ---Copies/draws the given *sourceImage* image over *destinationImage*. If *position* is a `Point`, it will draw the *sourceImage* in the given position (Point(0, 0) as default).
    ---
    ---`opacity` is an integer (0 to 255) that defines a general opacity level of the *sourceImage* (255 by default). `blendMode` is the blending method to compose the `sourceImage` over the *destinationImage* (`BlendMode.NORMAL` as default).
    ---
    ---**Warning**: If the image is associated with a `Cel`, this method generates undo information, so you could use it as an individual operation or in a transaction.
    ---@param sourceImage Image
    ---@overload fun(self, sourceImage: Image, position: Point)
    ---@overload fun(self, sourceImage: Image, position: Point, opacity: integer)
    ---@overload fun(self, sourceImage: Image, position: Point, opacity: integer, blendMode: BlendMode)
    ---@overload fun(self, sourceImage: Image, position: Point, blendMode: BlendMode)
    ---@overload fun(self, sourceImage: Image, opacity: integer)
    ---@overload fun(self, sourceImage: Image, opacity: integer, blendMode: BlendMode)
    ---@overload fun(self, sourceImage: Image, blendMode: BlendMode)
    drawImage = function(self, sourceImage) end,

    ---```lua
    ---destinationImage:drawSprite(sourceSprite, frameNumber, [, position ] )
    ---```
    ---
    ---Draws the given `sourceSprite` frame number into the *destinationImage*. If *position* is a `Point`, it will draw the *sourceSprite* in the given position.
    ---
    ---**Warning**: If the image is associated with a `Cel`, this method generates undo information, so you could use it as an individual operation or in a transaction.
    ---@param sourceSprite Sprite
    ---@param frameNumber integer
    ---@param position? Point
    drawSprite = function(self, sourceSprite, frameNumber, position) end,

    ---```lua
    ---if imageA:isEqual(imageB) then
    ---  print("Both images are equal")
    ---end
    ---```
    ---
    ---Returns true if both images looks the same (spec is equal and all pixels are the same).
    ---@param anotherImage Image
    ---@return boolean
    isEqual = function(self, anotherImage) end,

    ---Returns true if all pixels in the image are equal to the transparent color.
    ---@return boolean
    isEmpty = function(self) end,

    ---Returns true if all pixels in the image are equal to the given `color` (which can be a pixel color or a `Color`).
    ---@param color Color | integer
    ---@return boolean
    isPlain = function(self, color) end,

    ---@class Pixel
    ---@field x integer
    ---@field y integer
    ---@operator call(integer?): integer

    ---```lua
    ---iterator = image:pixels()
    ---iterator = image:pixels(rectangle)
    ---```
    ---
    ---Returns a pixel iterator for the whole image or the given `Rectangle`. Then you can use the iterator to read or change pixel values in this way:
    ---
    ---```lua
    ---for it in image:pixels() do
    ---  local pixelValue = it() -- get pixel
    ---  it(pixelValue)          -- set pixel
    ---  print(it.x, it.y)       -- get pixel x,y coordinates
    ---end
    ---```
    ---@param rectangle? Rectangle
    ---@return fun(): Pixel
    pixels = function(self, rectangle) end,

    ---Same as `Image:drawPixel()`.
    ---@deprecated
    ---@param x integer
    ---@param y integer
    ---@param color integer
    putPixel = function(self, x, y, color) end,

    ---Now it's `Image:drawImage()`. This function is deprecated and was renamed to avoid confusion with the behavior `cel.image`.
    ---@deprecated
    ---@param image Image
    ---@param position? Point
    putImage = function(self, image, position) end,

    ---Now it's `Image:drawSprite()` to match `Image:drawImage()` name.
    ---@deprecated
    ---@param sprite Sprite
    ---@param frameNumber integer
    ---@param position Point
    putSprite = function(self, sprite, frameNumber, position) end,

    ---```lua
    ---image:saveAs(filename)
    ---image:saveAs{ filename=string,
    ---              palette=Palette }
    ---```
    ---
    ---Saves the image as a sprite in the given `filename`.
    ---
    ---To save an indexed image we need to specify a `palette` parameter (a `Palette` object).  If we don't specify a palette parameter, in case that the image is related to a `Cel`, we'll use the palette of the Cel's `Sprite`.
    ---@param filename string
    ---@overload fun(self, options: { filename: string, palette: Palette? })
    saveAs = function(self, filename) end,

    ---```lua
    ---image:resize(width, height)
    ---image:resize{ width=integer, height=integer, ... }
    ---image:resize{ size=Size(width, height), ... }
    ---image:resize{ ..., method='bilinear' | 'rotsprite' }
    ---image:resize{ ..., pivot=Point(x, y) }
    ---```
    ---
    ---Resizes the image. The pivot is `Point(0, 0)` by default (i.e.  the image right and bottom sides will be increased, and the top-left corner will be in the same place).
    ---@param width integer
    ---@param height integer
    ---@overload fun(self, options: { width: integer, height: integer, method: ("bilinear" | "rotsprite")?, pivot: Point })
    ---@overload fun(self, options: { size: Size, method: ("bilinear" | "rotsprite")?, pivot: Point })
    resize = function(self, width, height) end,

    ---```lua
    ---local rectangle = image:shrinkBounds()
    ---local rectangle = image:shrinkBounds(refColor)
    ---```
    ---
    ---Returns the shrunken bounds (a `Rectangle`) of the image removing all the empty space of borders using the mask color or the given reference `Color` in `refColor`. }
    ---@param refColor? Color
    shrinkBounds = function(self, refColor) end,
}

---```lua
---local image = Image(width, height [, colorMode])
---local image = Image(spec)
---local image = Image(sprite)
---local image = Image(otherImage)
---local image = Image(otherImage, rectangle)
---local image = Image{ fromFile=filename }
---```
---
---Creates a new image with the given `width` and `height`. The color mode is optional, RGB by default.
---
---The `spec` parameter is an image specification object.
---
---If you specify `otherImage`, it's equivalent to use `otherImage:clone()`. If you specify `Image(otherImage, rectangle)` this will create a copy of the specified rectangle of `otherImage`.
---
---If a `sprite` is given, the image will be a render of the first frame of the sprite. Note: You can use `Image:drawSprite()` to draw other frame.
---If `fromFile` is given, it indicates a file name (a string) and
---it will create an image loading the first frame of the given file.
---@param width integer
---@param height integer
---@param colorMode? ColorMode
---@return Image
---@overload fun(spec: ImageSpec): Image
---@overload fun(sprite: Sprite): Image
---@overload fun(otherImage: Image, rectangle?: Rectangle): Image
---@overload fun(option: { fromFile: string }): Image
function Image(width, height, colorMode) end

---It's a simple object that contains some specifications to create new `Sprites` or `Images`, or to get the information (specs) of a `Sprite` or `Image`, like the canvas size (width/height), color mode, and color space. Often abbreviated as 'spec' in the API.
---@class ImageSpec
local _imageSpec = {
    ---Gets or sets the color mode of the image or sprite.
    ---@type ColorMode
    colorMode = undefined,

    ---Gets or sets the width of the image or sprite.
    ---@type integer
    width = undefined,

    ---Gets or sets the height of the image or sprite.
    ---@type integer
    height = undefined,

    ---Gets or sets the color space for an image or sprite.
    ---@type ColorSpace
    colorSpace = undefined,

    ---Gets or sets the index that refers a transparent color in a palette when the image or sprite uses indexed color mode.
    ---@type Color
    transparentColor = undefined,
}

---```lua
---ImageSpec()
---ImageSpec(otherImageSpec)
---ImageSpec{
---    width=number,
---    height=number,
---    colorMode=number,
---    transparentColor=number }
---```
---
---Creates a new `ImageSpec` instance.
---
---When no arguments are given, defaults to a width and height of 1, with the transparent color index set to zero and RGB color mode.
---@return ImageSpec
---@overload fun(otherImageSpec: ImageSpec): ImageSpec
---@overload fun(options: { width: integer, height: integer, colorMode: ColorMode, transparentColor: number })
function ImageSpec() end

---This object is received as first parameter in the function associated to `onkeydown` or `onkeyup` events of a canvas widget.
---@class KeyEvent
local _keyEvent = {
    ---Number of times the key was autorepeated. This can happen when the user presses and holds a key.
    ---@type integer
    repeatCount = undefined,

    ---A string containing the pressed/released Unicode character.
    ---@type string
    key = undefined,

    ---A string that identifies the pressed/released key, similar to the values found in https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values.
    ---@type "Unidentified" | "KeyA" | "KeyB" | "KeyC" | "KeyD" | "KeyE" | "KeyF" | "KeyG" | "KeyH" | "KeyI" | "KeyJ" | "KeyK" | "KeyL" | "KeyM" | "KeyN" | "KeyO" | "KeyP" | "KeyQ" | "KeyR" | "KeyS" | "KeyT" | "KeyU" | "KeyV" | "KeyW" | "KeyX" | "KeyY" | "KeyZ" | "Digit0" | "Digit1" | "Digit2" | "Digit3" | "Digit4" | "Digit5" | "Digit6" | "Digit7" | "Digit8" | "Digit9" | "Numpad0" | "Numpad1" | "Numpad2" | "Numpad3" | "Numpad4" | "Numpad5" | "Numpad6" | "Numpad7" | "Numpad8" | "Numpad9" | "F1" | "F2" | "F3" | "F4" | "F5" | "F6" | "F7" | "F8" | "F9" | "F10" | "F11" | "F12" | "Escape" | "Backquote" | "Minus" | "Equal" | "Backspace" | "Tab" | "BracketLeft" | "BracketRight" | "Enter" | "Semicolon" | "Quote" | "Backslash" | "Comma" | "Period" | "Slash" | "Space" | "Insert" | "Delete" | "Home" | "End" | "PageUp" | "PageDown" | "ArrowLeft" | "ArrowRight" | "ArrowUp" | "ArrowDown" | "NumpadDivide" | "NumpadMultiply" | "NumpadSubtract" | "NumpadAdd" | "NumpadComma" | "NumpadEnter" | "PrintScreen" | "Pause" | "IntlYen" | "KanaMode" | "Convert" | "NonConvert" | "NumpadEqual" | "Backquote" | "ShiftLeft" | "ShiftRight" | "ControlLeft" | "ControlRight" | "AltLeft" | "AltRight" | "MetaLeft" | "MetaRight" | "ContextMenu" | "MetaLeft" | "ScrollLock" | "NumLock" | "CapsLock"
    code = undefined,

    ---True if the <kbd>Alt</kbd> key was pressed when the event occurs.
    ---@type boolean
    altKey = undefined,

    ---True if the <kbd>Windows</kbd> key (or <kbd>Command</kbd> key on macOS) was pressed when the event occurs.
    ---@type boolean
    metaKey = undefined,

    ---True if the <kbd>Ctrl</kbd> key was pressed when the event occurs.
    ---@type boolean
    ctrlKey = undefined,

    ---True if the <kbd>Shift</kbd> key was pressed when the event occurs.
    ---@type boolean
    shiftKey = undefined,

    ---True if the <kbd>Space</kbd> key was pressed when the event occurs.
    ---@type boolean
    spaceKey = undefined,

    ---Stops propagating this event to other parent widget/main Aseprite window. Use this in case that your canvas widget used the key and you want to avoid triggering a command with a keyboard shortcut.
    stopPropagation = function(self) end,
}

---Layers are arranged as a stack within a sprite. Layers may nest within each other to form a hierarchy. Layers that accept children are group layers.
---
---A layer can be created with `Sprite:newLayer`. A group layer can be created with `Sprite:newGroup`. Layers can be removed with `Sprite:deleteLayer`.
---@class Layer
local _layer = {
    ---Gets the sprite to which this layer belongs.
    ---@type Sprite
    sprite = undefined,

    ---Gets or sets the layer name, a `string`.
    ---@type string
    name = undefined,

    ---Gets or sets the layer opacity, a value from `0` to `255`. The layer is completely transparent when the value is `0`; opaque when the value is `255`. When the layer is a background, returns `255`.
    ---
    ---When the layer is a `group`, returns `nil`.
    ---@type integer?
    opacity = undefined,

    ---Gets or sets the layer blending mode (how colors are blend with the layer below). It's expressed as an integer or a value from the `BlendMode` enumeration.
    ---
    ---When the layer is a [group](#layerisgroup), this property is `nil`.
    ---@type BlendMode?
    blendMode = undefined,

    ---If a layer is a group, gets the `table` of child layers for which the group serves as a parent. If the layer is not a group, returns `nil`.
    ---@type Layer[] | nil
    layers = undefined,

    ---```lua
    ---local spriteOrLayerGroup = layer.parent
    ---layer.parent = sprite
    ---layer.parent = group
    ---```
    ---
    ---Gets or sets the layer's parent. The parent may be either a sprite or a group layer.
    ---
    ---Upon setting the parent, the child layer is moved to the top of the parent's layer `stack`. Throws an error if the parent layer is not a group or if the setter tries to parent a layer to itself.
    ---@type Sprite | Layer
    parent = undefined,

    ---Gets or sets the layer's index in its parent's layers `table`. In other words, this is the layer's place in the local stack. Layers stack in descending order. For example, a layer with index `1` will lie beneath a layer with index `2`, assuming the layers share the same parent.
    ---@type integer
    stackIndex = undefined,

    ---Gets whether or not the layer contains cels with images.
    ---@type boolean
    isImage = undefined,

    ---Gets whether or not the layer is a group and *has the capacity* to be a parent to other layers. A layer may be a group, yet have no children; in such a case, its layers property will return a table of zero length.
    ---
    ---Groups may nest within groups, creating a hierarchy.
    ---@type boolean
    isGroup = undefined,

    ---Returns true if the layer is a tilemap (contains a tileset)
    ---@type boolean
    isTilemap = undefined,

    ---Gets whether or not a layer supports transparency. The opposite of the property `Layer.isBackground`. For indexed color mode, the layer may contain images with a transparent color index. For RGB or grayscale color mode, the layer may contain images with an alpha channel.
    ---
    ---Returns `true` if the layer is a group.
    ---
    ---For context, see the general documentation on [layers](https://www.aseprite.org/docs/layers).
    ---@type boolean
    isTransparent = undefined,

    ---Gets whether or not a layer is a background. The opposite of the property `Layer.isTransparent`. Background layers do not contain images which support transparency. Returns `false` if the layer is a group.
    ---
    ---For context, see the general documentation on [layers](https://www.aseprite.org/docs/layers).
    ---@type boolean
    isBackground = undefined,

    ---Gets or sets whether a layer is editable, unlocked in other words.
    ---
    ---It describes only the group layer's local editability, not whether any hierarchy that contains it is editable. See `Layer.isVisible` for an example snippet using a similar property.
    isEditable = undefined,

    ---Gets or sets whether or not the layer is visible.
    ---
    ---It describes only the layer's local visibility, not its visibility with respect to the hierarchy that contains it. For example, in the following code `layer1.isVisible` will be `true` (even when the parnet group visibility is `false`):
    ---
    ---```lua
    ---local sprite = app.sprite
    ---local layerGroup = sprite:newGroup()
    ---local layers = sprite.layers
    ---local layer1 = layers[1]
    ---layer1.parent = layerGroup
    ---layerGroup.isVisible = false
    ---layer1.isVisible = true
    ---print(layer1.isVisible)
    ---```
    ---@type boolean
    isVisible = undefined,

    ---Gets or sets whether a layer biases toward linked cels when a new cel is created in the timeline.
    ---
    ---Returns `false` if the layer is a group.
    ---
    ---For context, see the general documentation on continuous layers.
    ---@type boolean
    isContinuous = undefined,

    ---Gets or sets whether or not a group layer is collapsed, i.e., whether its child layers are hidden in the timeline. The opposite of the property `Layer.isExpanded`.
    ---
    ---It describes only the group layer's local collapse, not whether any hierarchy that contains it is collapsed. See `Layer.isVisible` for an example snippet using a similar property.
    ---@type boolean
    isCollapsed = undefined,

    ---Gets or sets whether or not a group layer is expanded, meaning whether its child layers are visible in the timeline. The opposite of the property `Layer.isCollapsed`.
    ---
    ---It describes only the group layer's local expansion, not whether any hierarchy that contains it is expanded. See `Layer.isVisible` for an example snippet using a similar property.
    ---@type boolean
    isExpanded = undefined,

    ---Gets whether or not the layer is a reference layer. You cannot change the value of this property.
    ---@type boolean
    isReference = undefined,

    ---Gets a `table` of cels in the layer. If the layer is a group, this property will return a table of zero length.
    ---
    ---See also the `Layer:cel()` function.
    ---@type Cel[]
    cels = undefined,

    ---Gets or sets the user-defined color of this layer in the timeline.
    ---@type Color
    color = undefined,

    ---Gets or sets the user-defined data related to this layer (a text string).
    ---@type string
    data = undefined,

    ---Access user-defined and extension-defined `Properties` of this layer.
    ---@type Properties
    properties = undefined,

    ---```lua
    ---local cel = layer:cel(frameNumber)
    ---assert(cel == layer:cel(sprite.frames[frameNumber]))
    ---```
    ---
    ---Returns a cel, if any, at the intersection of the layer and a frame. The frame may be either a frame object or its frame number, an integer. If there is no cel at that intersection, returns `nil`.
    ---@param frame integer | Frame
    ---@return Cel | nil
    cel = function(self, frame) end,

    ---Gets or sets the tileset associated to this layer only when it's a tilemap (returns nil in other case).
    ---@type Tileset | nil
    tileset = undefined,
}

---This object is received as first parameter in the function associated to `onmousedown`, `onmouseup`, `onmousemove`, or `onwheel` events of a canvas widget.
---@class MouseEvent
local _mouseEvent = {
    ---```lua
    ---  onmousedown=function(ev)
    ---    print('mouse button pressed in', ev.x, ev.y)
    ---  end
    ---```
    ---
    ---The (x,y) position of the mouse when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type integer
    x = undefined,

    ---The (x,y) position of the mouse when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget. See `MouseEvent.x`.
    ---@type integer
    y = undefined,

    ---The `MouseButton` pressed or released by the user.
    ---@type MouseButton
    button = undefined,

    ---The pressure of pen when the event is generated from a stylus.
    ---@type number
    pressure = undefined,

    ---Only for the `onwheel` event.
    ---@type integer
    deltaX = undefined,

    ---Only for the `onwheel` event.
    ---@type integer
    deltaY = undefined,

    ---True if the <kbd>Alt</kbd> key was pressed when the event occurs.
    ---@type boolean
    altKey = undefined,

    ---True if the <kbd>Windows</kbd> key (or <kbd>Command</kbd> key on macOS) was pressed when the event occurs.
    ---@type boolean
    metaKey = undefined,

    ---True if the <kbd>Ctrl</kbd> key was pressed when the event occurs.
    ---@type boolean
    ctrlKey = undefined,

    ---True if the <kbd>Shift</kbd> key was pressed when the event occurs.
    ---@type boolean
    shiftKey = undefined,

    ---True if the <kbd>Space</kbd> key was pressed when the event occurs.
    ---@type boolean
    spaceKey = undefined,
}

---@class Palette
---@operator len:integer
local _palette = {
    ---Changes the number of the palette colors to `ncolors` (an integer value).
    ---@param ncolors integer
    resize = function(self, ncolors) end,

    ---Returns the `Color` in the given entry `index` (the `index` goes from `0` to `#palette-1`).
    ---@param index integer
    ---@return Color
    getColor = function(self, index) end,

    ---Changes a palette color in the given entry `index` (the `index` goes from `0` to `#palette-1`). The `color` can be a `Color` object or an integer pixel value.
    ---@param index integer
    ---@param color Color | integer
    setColor = function(self, index, color) end,

    ---At the moment it always return the first frame, but in a
    ---near future Aseprite will support palette changes over time (in
    ---different frames), so this field should be the frame number where this
    ---palette is displayed for first time in the sprite.
    ---@type Frame
    frame = undefined,

    ---Saves the palette in the given `filename`.
    ---@param filename string
    saveAs = function(self, filename) end,
}

---```lua
---local palette = Palette()
---local palette = Palette(numberOfColors)
---local palette = Palette(otherPalette)
---local palette = Palette{ fromFile=filename }
---local palette = Palette{ fromResource=resourceID }
---```
---
---Creates a new palette. By default it will contain 256 colors, but you can specify a `numberOfColors` (integer value).
---
---`otherPalette` can be another palette object to create a copy of it.
---
---If `fromFile` is given, the palette is loaded from the file name.
---
---If `fromResource` is given, the `resourceID` is an ID specified in one of the [extensions palette](https://github.com/aseprite/aseprite/tree/main/data/extensions) (e.g. [`DB16`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L13), [`DB32`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L14), [`Solarized`](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/software-palettes/package.json#L15)).
---@return Palette
---@overload fun(numberOfColors: integer): Palette
---@overload fun(otherPalette: Palette): Palette
---@overload fun(options: { fromFile: string })
---@overload fun(options: { fromResource: string })
function Palette() end

---Since Aseprite v1.2.18 we can create [plugins](https://www.aseprite.org/docs/extensions/) with scripts.
---@class Plugin
local _plugin = {
    ---Name of the extension.
    ---@type string
    name = undefined,

    ---Path where the extension is installed.
    ---@type string
    path = undefined,

    ---It's a Lua table where you can load/save any kind of Lua value here and they will be saved/restored automatically on each session.
    ---@type table<string, any>
    preferences = undefined,

    ---@alias PluginInit { id: string, title: string, group: string, onclick: function?, onenabled: function? }
    ---```lua
    ---function init(plugin)
    ---  plugin:newCommand{
    ---    id="CommandName",
    ---    title="User Friendly Command Name",
    ---    group=string,
    ---    onclick=function()
    ---      ...
    ---    end,
    ---    onenabled=function()
    ---      ...
    ---      return true | false
    ---    end
    ---  }
    ---end
    ---```
    ---
    ---Creates a new command that can be associated to keyboard shortcuts and it's added in the app menu in the specific `"group"`. Groups are defined in the [`gui.xml` file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element.
    ---
    ---* `onclick`: Function to be called when the command is executed (clicked or an associated keyboard shortcut pressed).
    ---* `onenabled`: Optional function to know if the command should be available (enabled or disabled). It should return true if the command can be executed right now. If this function is not specified the command will be always available to be executed by the user.
    ---@param init PluginInit
    newCommand = function(self, init) end,

    ---@alias MenuGroupInit { id: string, title: string, group: string }
    ---```lua
    ---function init(plugin)
    ---  plugin:newMenuGroup{
    ---    id="new_group_id",
    ---    title="Menu Item Label",
    ---    group="parent_group_id"
    ---  }
    ---end
    ---```
    ---
    ---Creates a new menu item which will contain a submenu grouping several plugin commands.
    ---
    ---* `id`: ID to identify this new menu group in `Plugin:newCommand{ ..., group=id, ... }` calls to add several command/menu items as elements of this group submenu.
    ---* `group`: In which existent group we should add this new menu item. Existent app groups are defined in the [`gui.xml` file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element.
    ---@param init MenuGroupInit
    newMenuGroup = function(self, init) end,

    ---```lua
    ---function init(plugin)
    ---  plugin:newMenuSeparator{
    ---    group="group_id"
    ---  }
    ---end
    ---```
    ---
    ---Creates a menu separator in the given menu group, useful to separate several `Plugin:newCommand`.
    ---@param options { group: string }
    ewMenuSeparator = function(self, options) end,
}

---@class Point
local _point = {
    ---@type integer
    x = undefined,

    ---@type integer
    y = undefined,
}

---Creates a new `Point` instance with the given coordinates (or `x=y=0` if they are not specified).
---@return Point
---@overload fun(otherPoint: Point): Point
---@overload fun(x: integer?, y: integer?)
---@overload fun(options: { x: integer?, y: integer? }): Point
---@overload fun(numbers: { [1]: integer?, [2]: integer? }): Point
function Point() end

---This class is used to represent the range of selected objects.
---
---It can be:
---
---* A list of layers
---* A list of frames
---* A list of cels
---* A list of images
---* A list of colors
---* A list of slices
---
---Or a combination of those.
---@class Range
local _range = {
    ---Returns a `RangeType`.
    ---@type RangeType
    type = undefined,

    ---Returns true if the range is empty, i.e. there is no selected range in the timeline (a thick border in the timeline), only the active cel in the sprite editor.
    ---
    ---This is the same as asking for `app.range.type == RangeType.EMPTY`.
    ---
    ---Note that if the range is empty, you can still use `Range.layers` to get the active layer (the Range.layers property will be an array of one element, just the active layer). The same is true for `Range.frame` and `app.frame`, `Range.cel` and `app.cel`, etc.
    ---@type boolean
    isEmpty = undefined,

    ---`Sprite` to which this range is pointing to.
    ---@type Sprite
    sprite = undefined,

    ---Gets or sets the array of selected layers.
    ---@type Layer[]
    layers = undefined,

    ---Returns or sets the array of selected frames.
    ---@type Frame[]
    frames = undefined,

    ---Returns an array of selected cels.
    ---@type Cel[]
    cels = undefined,

    ---Returns an array of selected images (images from linked cels are counted just one time in this array).
    ---@type Image[]
    images = undefined,

    ---Returns an array of selected images in the range that are in unlocked layers (editable).
    ---@type Image[]
    editableImages = undefined,

    ---Gets or sets the array of selected palette entries in the [color bar](https://www.aseprite.org/docs/color-bar/). Each element of the array is an integer (the palette index).
    ---
    ---Example to select the colors with index 0 and 3 in the color bar:
    ---
    ---```lua
    ---app.range.colors = { 0, 3 }
    ---```
    ---@type integer[]
    colors = undefined,

    ---Gets or sets the array of selected tile entries in the [color bar](https://www.aseprite.org/docs/color-bar/) when we are in a [tilemap layer](https://www.aseprite.org/docs/tilemap/). Each element of the array is an integer (the tile index).
    ---
    ---Example to select tiles with index 0 and 3 in the color bar:
    ---
    ---```lua
    ---app.range.tiles = { 0, 3 }
    ---```
    ---@type integer[]
    tiles = undefined,

    ---Gets or sets the array of [selected slices](https://www.aseprite.org/docs/slices) in the sprite editor. Each element of the array is a `Slice`.
    ---
    ---Example to select all slices in the sprite:
    ---
    ---```lua
    ---app.range.slices = app.sprite.slices
    ---```
    ---@type Slice[]
    slices = undefined,

    ---```lua
    ---local hasLayer = app.range:contains(layer)
    ---local hasFrame = app.range:contains(frame)
    ---local hasCel = app.range:contains(cel)
    ---local hasSlice = app.range:contains(slice)
    ---```
    ---
    ---Returns true if the given object (layer/frame/cel/slice) is inside the selected range.
    ---@param object Layer | Frame | Cel | Slice
    contains = function(self, object) end,

    ---Returns true if the given color index is selected in the [color bar](https://www.aseprite.org/docs/color-bar/).
    ---@param colorIndex integer
    containsColor = function(self, colorIndex) end,

    ---Clears the current selected range of frames/layers/cels/colors.
    clear = function(self) end,
}

--Creates a new `Rectangle` instance
---@class Rectangle
local _rectangle = {
    ---Gets or sets the *x*-coordinate of the rectangle. 0 means at the left side of the screen/sprite.
    ---@type integer
    x = undefined,

    ---Gets or sets the *y*-coordinate of the rectangle. 0 means at the top side of the screen/sprite.
    ---@type integer
    y = undefined,

    ---Gets or sets the *width* of the rectangle. If it's 0, the rectangle is empty (so the coordinate doesn't matter).
    ---@type integer
    width = undefined,

    ---Gets or sets the *height* of the rectangle. If it's 0, the rectangle is empty (so the coordinate doesn't matter).
    ---@type integer
    height = undefined,

    ---Same as `Rectangle.width`.
    ---@type integer
    w = undefined,

    ---Same as `Rectangle.height`.
    ---@type integer
    h = undefined,

    ---Gets or sets the origin of the rectangle with a `Point` object, just like changing `Rectangle.x` and `Rectangle.y` at the same time.
    ---@type Point
    origin = undefined,

    ---Gets or sets the size of the rectangle with a `Size` object, just like changing `Rectangle.width` and `Rectangle.height` at the same time.
    ---@type Size
    size = undefined,

    ---Returns true if the rectangle is empty i.e. width and/or `height` are 0.
    ---@type boolean
    isEmpty = undefined,

    ---Returns true if `otherRectangle` is inside `rectangle`.
    ---
    ---Example:
    ---
    ---```lua
    ---local bounds = Rectangle{ x=0, y=0, width=32, height=32 }
    ---local rectInside = Rectangle{ x=4, y=4, width=8, height=8 }
    ---if bounds:contains(rectInside) then ... end
    ---```
    ---@param otherRectangle Rectangle
    ---@return boolean
    contains = function(self, otherRectangle) end,

    ---Returns true if `rectangle` intersects in some way `otherRectangle`.
    ---@param otherRectangle Rectangle
    ---@return boolean
    intersects = function(self, otherRectangle) end,

    ---Returns the new rectangle `newRectangle` which is the intersection of `rectangle` and `otherRectangle`. If both rectangles don't intersect each other, the result will be an empty rectangle.
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    intersect = function(self, otherRectangle) end,

    ---Returns the new rectangle `newRectangle` which will be a rectangle big enough to contains both given rectangles `rectangle` and `otherRectangle`.
    ---@param otherRectangle Rectangle
    ---@return Rectangle
    union = function(self, otherRectangle) end,
}

---Creates a new `Rectangle` instance.
---
---```lua
---Rectangle()
---Rectangle(otherRectangle)
---Rectangle(x, y, width, height)
---Rectangle{x=number, y=number, width=number, height=number}
---Rectangle{x=number, y=number, w=number, h=number}
---Rectangle{number, number, number, number}
---```
---@return Rectangle
---@overload fun(otherRectangle: Rectangle): Rectangle
---@overload fun(x: integer, y: integer, width: integer, height: integer): Rectangle
---@overload fun(options: { x: integer, y: integer, width: integer, height: integer }): Rectangle
---@overload fun(numbers: { [1]: integer, [2]: integer, [3]: integer, [4]: integer })
function Rectangle() end

---@class Selection
local _selection = {
    ---Returns a rectangle with the bounds of the selection (if the rectangle is empty, is because there is no selection).
    ---@type Rectangle
    bounds = undefined,

    ---Gets or sets the selection origin/position (a point). This can be used to move the selection edges (not the content).
    ---@type Point
    origin = undefined,

    ---Returns true if the selection is empty i.e. there are no pixels selected.
    ---@type boolean
    isEmpty = undefined,

    deselect = function(self) end,

    ---Replaces the selection with the given rectangle. If you want to add a rectangle to the selection, you can use `Selection:add()`.
    ---@param rectangle Rectangle
    select = function(self, rectangle) end,

    ---Selected the whole sprite canvas. Only valid for a `sprite.selection`.
    selectAll = function(self) end,

    ---Adds a new rectangle (or `otherSelection`) to the `selection`. Creating an union between the existent selected area and the given `rectangle`/`otherSelection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    add = function(self, rectangle) end,

    ---Subtracts the given `rectangle` (or `otherSelection`) from `selection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    subtract = function(self, rectangle) end,

    ---Creates an intersection in `selection` between the given `rectangle` (or `otherSelection`) and the already selected area in `selection`.
    ---@param rectangle Rectangle
    ---@overload fun(self, otherSelection: Selection)
    intersect = function(self, rectangle) end,

    ---Returns true or false if the given point is inside the selection.
    ---@param point Point
    ---@return boolean
    ---@overload fun(self, x: integer, y: integer)
    contains = function(self, point) end,
}

---Creates a new empty selection, or with the given rectangle.
---@param rectangle? Rectangle
---@return Selection
function Selection(rectangle) end

---This is an object that saves the active state of the editor in a specific moment. Which active sprite, layer, frame, cel, image, etc. where in a specific moment.
---
---If you save the object:
---
---```lua
---local site = app.site
---```
---
---The `site` object will not be updated if the active sprite is modified.
---@class Site
local _site = {
    ---Gets the active sprite at the time the site object was created.
    ---@type Sprite
    sprite = undefined,

    ---Gets the active layer at the time the site object was created.
    ---@type Layer
    layer = undefined,

    ---Gets the active cel at the time the site object was created.
    ---@type Cel
    cel = undefined,

    ---Gets the active frame at the time the site object was created.
    ---@type Frame
    frame = undefined,

    ---Gets the active frame number (an integer value, 1 is the first frame). Same as `app.site.frame.frameNumber`.
    ---@type integer
    frameNumber = undefined,

    ---Gets the active image at the time the site object was created.
    ---@type Image
    image = undefined,
}

---If a function receives a size as an argument it could be several things:
---@class Size
local _size = {
    ---@type integer
    width = undefined,

    ---@type integer
    height = undefined,

    ---Same as `Size.width`.
    ---@type integer
    w = undefined,

    ---Same as `Size.height`.
    ---@type integer
    h = undefined,

    ---Returns the new size `newSize` which will be big enough to contains both given dimensions (`size` and `otherSize`).
    ---@param otherSize Size
    ---@return Size
    union = function(self, otherSize) end,
}

---Creates a new `Size` instance with the given dimensions (or `width=height=0` if they are not specified).
---@return Size
---@overload fun(otherSize: Size): Size
---@overload fun(width: integer, height: integer): Size
---@overload fun(options: { width: integer, height: integer }): Size
---@overload fun(options: { w: integer, h: integer }): Size
---@overload fun(numbers: { [1]: integer, [2]: integer }): Size
function Size() end

---An object that allows for [nine-slice scaling](https://en.wikipedia.org/wiki/9-slice_scaling). It can be created with the slice tool or with `Sprite:newSlice`.
---@class Slice
local _slice = {
    --- Gets or sets a slice's bounding rectangle.
    ---@type Rectangle
    bounds = undefined,


    ---Gets or sets the central rectangle of a slice's nine-slice. The getter returns `nil` when nine-slicing is inactive in Aseprite's user interface. The rectangle's top-left corner is defined in local coordinates.
    ---
    ---```lua
    ---local sliceBounds = slice.bounds
    ---local inset = 3
    ---slice.center = Rectangle(
    ---    inset, inset,
    ---    sliceBounds.width - inset * 2,
    ---    sliceBounds.height - inset * 2)
    ---```
    ---
    ---For example, the snippet above insets the central rectangle by three pixels.
    ---@type Rectangle | nil
    center = undefined,

    ---Gets or sets the user-defined color of this slice in the timeline.
    ---@type Color
    color = undefined,

    ---Gets or sets the user-defined data related to this slice, a `string`.
    ---@type string
    data = undefined,

    ---Access user-defined and extension-defined properties of this slice.
    ---@type Properties
    properties = undefined,

    ---Gets or sets the a slice's name, a `string`.
    ---@type string
    name = undefined,

    ---Gets or sets the slice's pivot, a point. The getter returns `nil` when the pivot is inactive in Aseprite's user interface. The pivot is defined in local coordinates relative to the slice's top-left corner.
    ---
    ---```lua
    ---local sliceBounds = slice.bounds
    ---slice.pivot = Point(
    ---    sliceBounds.width // 2,
    ---    sliceBounds.height // 2)
    ---```
    ---
    ---For example, the snippet above sets the pivot to the slice's approximate center.
    ---@type Point
    pivot = undefined,

    ---Gets the sprite to which a slice belongs.
    ---@type Sprite
    sprite = undefined,
}

---@class Sprite
local _sprite = {
    ---Returns or changes the sprite width. Use `Sprite:resize` if you want to change the sprite size resizing layers, images, etc.
    ---@type integer
    width = undefined,

    ---Returns or changes the sprite height. Use `Sprite:resize` if you want to change the sprite size resizing layers, images, etc.
    ---@type integer
    height = undefined,

    ---Returns the bounds of the sprite as a rectangle in the position `0,0`. This is like calling `Rectangle{ x=0, y=0, width=sprite.width, height=sprite.height }`.
    ---@type Rectangle
    bounds = undefined,

    ---Gets or sets the bounds of the sprite grid as a rectangle. By default this is 16x16 (with origin in 0,0) but the default value can be [changed from *Edit > Preferences > Grid*](https://www.aseprite.org/docs/preferences/).
    ---@type Rectangle
    gridBounds = undefined,

    ---Gets or sets the pixel ratio of the sprite as a size.
    ---@type Size
    pixelRatio = undefined,

    ---Gets or sets the active sprite selection. This property is an instance of the Selection class to manipulate the set of selected pixels in the canvas.
    ---@type Selection
    selection = undefined,

    ---Gets or sets the name of the file from where this sprite was loaded or saved. Or an empty string if this is a new sprite without an associated file.
    ---@type string
    filename = undefined,

    ---Returns true if the sprite is modified compared to the latest saved state on disk.
    ---@type boolean
    isModifier = undefined,

    ---Returns the color mode of this sprite.
    ---@type ColorMode
    colorMode = undefined,

    ---The specification for image in this sprite.
    ---@type ImageSpec
    spec = undefined,

    ---An array of frames.
    ---@type Frame[]
    frames = undefined,

    ---An array of palettes. Generally it contains only one palette (`sprite.palettes[1]`).
    ---
    ---In the future we'll support multiple palettes to create [color cycling animations](https://en.wikipedia.org/wiki/Color_cycling).
    ---@type Palette[]
    palettes = undefined,

    ---An array of layers.
    ---@type Layer[]
    layers = undefined,

    ---An array of cels.
    ---@type Cel[]
    cels = undefined,

    ---An array of tags.
    ---@tyepe Tag[]
    tags = undefined,

    ---An array of slices.
    ---@type Slice[]
    slices = undefined,

    ---Returns the [background layer](https://www.aseprite.org/docs/layers/#background-layer) a layer object or `nil` if the sprite doesn't contain a background layer.
    ---@type Layer | nil
    backgroundLayer = undefined,

    ---The transparent color is an intenger that specifies what index (`0` by default) is the transparent color in transparent layers on indexed sprites.
    ---@type integer
    transparentColor = undefined,

    ---Gets or sets the user-defined color of this sprite. This color is used to display the tab in the main window of this sprite.
    ---@type Color
    color = undefined,

    ---Gets or sets the user-defined data related to this sprite (a text string).
    ---@type string
    data = undefined,

    ---Access user-defined and extension-defined properties of this sprite.
    ---@type Properties
    properties = undefined,

    ---Resize the sprite (and all frames/cels) to the given dimensions.
    ---@param width integer
    ---@param height integer
    ---@overload fun(self, size: Size)
    resize = function(self, width, height) end,

    ---Crops the sprite to the given dimensions.
    ---@param x integer
    ---@param y integer
    ---@param width integer
    ---@param height integer
    ---@overload fun(self, rectangle: Rectangle)
    crop = function(self, x, y, width, height) end,

    ---Saves the sprite to the given file and marks the sprite as saved so closing it won't ask to save changes.
    ---@param filename string
    saveAs = function(self, filename) end,

    ---Saves a copy of the sprite in the given file but doesn't change the saved state of the sprite, if the sprite is modified and then try to close it, the user will be asked to save changes.
    ---@param filename string
    saveCopyAs = function(self, filename) end,

    ---Closes the sprite. This doesn't ask the user to save changes. If you want to do the classic *File > Close* where the user is asking to save changes, you can use `app.command.CloseFile()`.
    close = function(self) end,

    ---Sets the sprite palette loading it from the given file.
    ---
    ---The same can be achieved using [`Palette{ fromFile }`](palette.md#palette):
    ---
    ---```lua
    ---sprite:setPalette(Palette{ fromFile=filename })
    ---```
    ---@param filename string
    loadPalette = function(self, filename) end,

    ---Changes the sprite palette.
    ---@param palette Palette
    setPalette = function(self, palette) end,

    ---Assign a new color space to the sprite without modifying the sprite pixels.
    ---@param colorSpace ColorSpace
    assignColorSpace = function(self, colorSpace) end,

    ---Converts all the sprite pixels to a new color space so the image looks the same as in the previous color space (all pixels will be adjusted to the new color space).
    ---@param colorSpace ColorSpace
    convertColorSpace = function(self, colorSpace) end,

    ---Creates a new layer at the top of the layers stack.
    ---@return Layer
    newLayer = function(self) end,

    ---Creates a new empty layer group at the top of the layers stack.
    ---@return Layer
    newGroup = function(self) end,

    ---Deletes the given layer or the layer with the given `layerName` (a string).
    ---@param layerName string
    ---@overload fun(self, layer: Layer)
    deleteLayer = function(self, layerName) end,


    ---Creates a copy of the given frame object or frame number and returns a `Frame` that points to the newly created frame in `frameNumber` position.
    ---@param frame Frame
    ---@return Frame
    ---@overload fun(self, frameNumber: integer)
    newFrame = function(self, frame) end,

    ---Creates a new empty frame in the given `frameNumber` (an integer) and returns the new frame.
    ---@param frameNumber integer
    ---@return Frame
    newEmptyFrame = function(self, frameNumber) end,

    ---@param frame Frame
    deleteFrame = function(self, frame) end,


    ---Creates a new cel in the given layer and `frame` number. If the image is not specified, a new image will be created with the size of the sprite canvas. The position is a point to locate the image.
    ---@param layer Layer
    ---@param frame Frame
    ---@param image Image?
    ---@param position Point?
    newCel = function(self, layer, frame, image, position) end,

    ---Deletes the given cel. If the cel is from a transparent layer, the cel is completely deleted, but if the cel is from a background layer, the cel will be delete with the background color.
    ---@param cel Cel
    ---@overload fun(self, layer: Layer, frame: Frame)
    deleteCel = function(self, cel) end,

    ---Creates a new tag in the given frame range and with the given name.
    ---@param fromFrameNumber integer
    ---@param toFrameNumber integer
    ---@return Tag
    newTag = function(self, fromFrameNumber, toFrameNumber) end,

    ---Deletes the given tag.
    ---@param tag Tag
    ---@overload fun(self, tagName: string)
    deleteTag = function(self, tag) end,

    ---Returns a new slice.
    ---@return Slice
    ---@overload fun(self, rectangle: Rectangle): Slice
    newSlice = function(self) end,

    ---Deletes the given slice.
    ---@param slice Slice
    ---@overload fun(self, sliceName: string)
    deleteSlice = function(self, slice) end,

    ---Returns a new tileset and adds it to the sprite's tilesets.
    ---
    ---If no parameters are given, the resulting tileset will have just one empty tile and a tile size equal to the active sprite grid size.
    ---
    ---If Grid or Rectangle is specified it is used to set the resulting tileset's origin and tile size.
    ---
    ---numTiles specifies the number of tiles we want the tileset to contain initially.
    ---
    ---If another tileset is passed as the only parameter, the result is a duplicate of it. Take into consideration that the passed tileset cannot belong to another sprite.
    ---@return Tileset
    ---@overload fun(grid: unknown, numTiles: integer?): Tileset
    ---@overload fun(rectangle: Rectangle, numTiles: integer?): Tileset
    ---@overload fun(anotherTileset: Tileset): Tileset
    newTileset = function(self) end,

    ---Deletes the given tileset from the sprite's tilesets.
    ---@param tileset Tileset
    ---@overload fun(self, tilesetIndex: integer)
    deleteTileset = function(self, tileset) end,

    ---Inserts an empty tile into the given [tileset](https://github.com/aseprite/api/blob/next-version/api/tileset.md#tileset) at a given `tileIndex`. If `tileIndex` is not provided, the new tile is added to the end of the tileset. This method generates undo information, so you could use it as an individual operation or in a [transaction](https://github.com/aseprite/api/blob/main/api/app.md#apptransaction).
    ---@param tileset Tileset
    ---@param tileIndex integer?
    newTile = function(self, tileset, tileIndex) end,

    ---Removes a `tile` from a [tileset](https://github.com/aseprite/api/blob/next-version/api/tileset.md#tileset). This method generates undo information, so you could use it as an individual operation or in a [transaction](https://github.com/aseprite/api/blob/main/api/app.md#apptransaction).
    ---@param tile Tile
    ---@overload fun(self, tileset: Tileset, tileIndex: integer)
    deleteTile = function(self, tile) end,

    ---Flatten all layers of the sprite into one layer. It's like calling `app.commands.FlattenLayers()`.
    flatten = function(self) end,

    ---Returns the `Events` object to associate functions that can act like listeners of specific `Sprite` events. E.g.
    ---
    ---```lua
    ---sprite.events:on('change',
    ---  function(ev)
    ---    print('The sprite has changed')
    ---  end)
    ---```
    ---
    ---A special `ev` argument can be sent to the listener. Which generally is a table, but it can be `nil` for older version of Aseprite or events that don't support it.
    ---
    ---Available events for a `Sprite`:
    ---
    ---* `'change'`: When sprite content changed because we perform some action on it (also called when we undo/redo those actions). Since Aseprite v1.2.41, you can access `ev.fromUndo` property which is `true` if the change came from a undo/redo/undo history event (and not from a direct user change in the sprite).
    ---* `'filenamechange'`: When the filename associated to a sprite changes.
    ---@type Events
    events = undefined,

    ---Special property to disable Aseprite [tile management UI](https://aseprite.org/docs/tilemap) and use an external plugin to handle tilesets and tilemaps in this sprite.
    ---
    ---This property is used by the [Attachment-System](https://github.com/aseprite/Attachment-System) plugin, but any extension can create a totally customized way to handle tiles (and disable the standard UI to avoid conflicts).
    ---
    ---**Warning**: If a sprite has this property set, another plugin shouldn't change it, because it might break the tilesets/tilemaps structure.
    ---@type string
    tileManagementPlugin = undefined,
}

---Creates a new sprite with the given `width` and `height`. The color mode is optional, RGB by default.
---
---The `spec` parameter is an image specification object.
---
---If `otherSprite` is given (other `Sprite` object), the sprite is duplicated.
---
---If `fromFile` is given, it indicates a file name (a string) and it's like opening a new document with `app.open()`.
---@param width integer
---@param height integer
---@param colorMode ColorMode?
---@return Sprite
---@overload fun(spec: ImageSpec): Sprite
---@overload fun (otherSprite: Sprite): Sprite
---@overload fun(options: { fromFile: string, oneFrame: Frame? }): Sprite
function Sprite(width, height, colorMode) end

---Represents [a tag in the timeline](https://www.aseprite.org/docs/tags/).
---@class Tag
local _tag = {
    ---Returns the sprite to which this tag belongs.
    ---@type Sprite
    sprite = undefined,

    ---Returns the first `Frame` object where this tag starts.
    ---
    ---Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number instead of a `Frame` object.
    ---@type Frame
    fromFrame = undefined,

    ---Returns the last `Frame` object where this tag ends.
    ---
    ---Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number instead of a `Frame` object.
    ---@type Frame
    toFrame = undefined,

    ---Returns the number of frames that this tag contain. Equal to:
    ---
    ---```lua
    ---local frames = tag.toFrame.frameNumber - tag.fromFrame.frameNumber + 1
    ---```
    ---@type integer
    frames = undefined,

    ---Gets or sets the name of the tag (a string).
    ---@type string
    name = undefined,

    ---Gets or sets the *[Animation Direction](https://www.aseprite.org/docs/tags/)* property of the tag.
    ---@type AniDir
    aniDir = undefined,

    ---Gets or sets the user-defined color of this tag in the timeline.
    ---@type Color
    color = undefined,

    ---Gets or sets the number of times the tag is repeated/looped.
    ---
    ---* `0` = Doesn't specify, plays infinite in UI, once on export, for ping-pong it plays once in each direction
    ---* `1` = Plays once, for ping-pong it plays just in one direction
    ---* `2` = Plays twice, for ping-pong it plays once in each direction, and once in reverse
    ---* `n` = Plays N times
    ---@type integer
    repeats = undefined,

    ---Gets or sets the user-defined data related to this tag, a `string`.
    ---@type string
    data = undefined,

    ---Access user-defined and extension-defined [properties](properties.md#properties) of this tag.
    ---@type Properties
    properties = undefined,
}

---@class Theme
local _theme = {
    ---```lua
    ---print(app.theme.color.text)
    ---print(app.theme.color.background)
    ---```
    ---
    ---The table of color can be used to paint in an Image or a GraphicsContext.
    ---
    ---List of possible colors:
    ---https://github.com/aseprite/aseprite/blob/3c77928a6f193748bcd8cca15d45000dd58e11d5/data/extensions/aseprite-theme/theme.xml#L33
    color = undefined --[[@as { [string]: Color }]],

    ---```lua
    ---print(app.theme.dimension.tabs_width)
    ---print(app.theme.dimension.tabs_height)
    ---```
    ---
    ---Returns a number identified in the dimensions of the theme.
    ---List of possible dimensions:
    ---https://github.com/aseprite/aseprite/blob/3c77928a6f193748bcd8cca15d45000dd58e11d5/data/extensions/aseprite-theme/theme.xml#L11
    dimension = undefined --[[@as { [string]: integer }]],

    ---```lua
    ---local data = app.theme:styleMetrics("popup_window")
    ---local leftBorder = data.border.left
    ---local topBorder = data.border.top
    ---local rightBorder = data.border.right
    ---local bottomBorder = data.border.bottom
    ---```
    ---
    ---Returns information about the given style ID (`style_id` must be a string). The returned information at the moment includes a `border` field which is a table with `left`/`top`/`right`/`bottom` border dimension in pixels (they already have app.uiScale applied).
    ---
    ---List of possible styles:
    ---https://github.com/aseprite/aseprite/blob/0c092cc37c193786bad702c0830b739f5ff808e0/data/extensions/aseprite-theme/theme.xml#L446
    ---@param styld_id string
    ---@return { border: { left: integer, top: integer, right: integer, bottom: integer } }
    styleMetrics = function(styld_id) end,
}

---Represents a tile from a Tileset.
---@class Tile
local _tile = {
    ---The index of the tile (position in its tileset).
    ---@type integer
    index = undefined,

    ---Gets or sets the image of this tile.
    ---@type Image
    image = undefined,

    ---Gets or sets the user-defined color of this tile.
    ---@type Color
    color = undefined,

    ---Gets or sets the user-defined data related to this tile (a text string).
    ---@type string
    data = undefined,

    ---Access user-defined and extension-defined [properties](properties.md#properties) of this tile.
    ---@type Properties
    properties = undefined,
}

---@class Tileset
local _tileset = {
    ---Note: this type annotation may not be correct.
    ---@type string
    name = undefined,

    ---@type unknown
    grid = undefined,

    ---Note: this type annotation may not be correct.
    ---@type integer
    baseIndex = undefined,

    ---Note: this type annotation may not be correct.
    ---@type Color
    color = undefined,

    ---Note: this type annotation may not be correct.
    ---@type string
    data = undefined,

    ---Note: this type annotation may not be correct.
    ---@type Properties
    properties = undefined,

    ---Returns the tile in the given index (`0` is the empty tile, so `1` is the first user-defined tile).
    ---@param index integer
    ---@return Tile
    tile = function(self, index) end,

    ---Returns the image of tile in the given index (`0` is the empty tile, so `1` is the first user-defined tile).
    ---
    ---Note: This method was superseded with `Tileset:tile()`, so you can use the following alternative:
    ---
    ---```lua
    ---local tileImage = ts:tile(index).image
    ---```
    ---@deprecated
    ---@param index integer
    ---@return Image
    getTile = function(self, index) end,
}


---The Timer class can be used to execute a function periodically.
---
---Example to create a function that is called:
---
---```lua
---local timer = Timer{
---  interval=5.0,
---  ontick=function()
---    print('Each 5 seconds')
---  end }
---timer:start()
---```
---
---Or a function that is called just once after one second:
---
---```lua
---local timer
---timer = Timer{
---  interval=1.0,
---  ontick=function()
---    print('Called')
---    timer:stop()
---  end }
---timer:start()
---```
---@class Timer
local _timer = {
    ---Starts the timer.
    start = function(self) end,

    ---Stops the timer.
    stop = function(self) end,

    ---Returns the interval of this specific timer (in seconds).
    ---@type number
    interval = undefined,

    ---Returns true if the timer is running.
    ---@type boolean
    isRunning = undefined,
}

---@alias TimerInit { interval: number, ontick: function }
---```lua
---local timer = Timer{ interval=number,
---                     ontick=function }
---```
---
---Creates a new timer.
---
---* `interval`: Number of seconds to wait for the first/next call. You can specify decimal numbers, e.g. `interval=1.0 / 60.0` to call the function 60 times per second, etc.
---* `ontick`: Function that is called each time the specified number of seconds ellapses.
---@param init TimerInit
---@return Timer
function Timer(init) end

---References a drawing tool. At the moment this class is used only to get and set the active tool (`app.tool`), or to paint on the canvas (`tool` parameter in `app.useTool()`).
---
---If a function receives a tool, it can receive a tool ID too.
---@class Tool
local _tool = {
    ---Returns the identifier (a string) of the specified in the [`gui.xml`](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) file ([example](https://github.com/aseprite/aseprite/blob/20618ff321ae4e73a4f5d6bfd9ef6f2cd8925b7a/data/gui.xml#L1065)).
    ---@type string
    id = undefined,
}

---This object is received as first parameter in the function associated to `ontouch` event of a canvas widget.
---@class TouchEvent
local _touchEvent = {
    ---```lua
    ---  ontouch=function(ev)
    ---    print('touch event pressed in', ev.x, ev.y)
    ---  end
    ---```
    ---
    ---The (x,y) position of the touch when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type number
    x = undefined,

    ---```lua
    ---  ontouch=function(ev)
    ---    print('touch event pressed in', ev.x, ev.y)
    ---  end
    ---```
    ---
    ---The (x,y) position of the touch when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type number
    y = undefined,

    ---Magnification factor to apply.
    ---@type number
    magnification = undefined,
}

---Represents a version number and provides an easy way to compare if the `app.version` is greater or equal than a specific expected version. Example:
---@class Version
local _version = {
    ---```lua
    ---local v = Version("1.2.9")
    ---assert(v.major == 1)
    ---
    ---v = Version("2")
    ---assert(v.major == 2)
    ---```
    ---
    ---Returns the first number of the version.
    ---@type integer
    major = undefined,

    ---```lua
    ---local v = Version("1.2.9")
    ---assert(v.minor == 2)
    ---
    ---v = Version("2")
    ---assert(v.minor == 0)
    ---```
    ---
    ---Returns the second number of the version.
    ---@type integer
    minor = undefined,

    ---```lua
    ---local v = Version("1.2.9")
    ---assert(v.patch == 9)
    ---
    ---v = Version("2")
    ---assert(v.patch == 0)
    ---```
    ---
    ---Returns the third number of the version.
    ---@type integer
    patch = undefined,

    ---```lua
    ---local v = Version("1.2.10-beta4")
    ---assert(v.prereleaseLabel == "beta")
    ---
    ---v = Version("2")
    ---assert(v.prereleaseLabel == "")
    ---```
    ---
    ---Returns the pre-release label/keyword. For official releases it's an empty string, in other cases it might be `"alpha"`, `"beta"`, `"dev"`, etc.
    ---@type string
    prereleaseLabel = undefined,

    ---```lua
    ---local v = Version("1.2.10-beta4")
    ---assert(v.prereleaseNumber == 4)
    ---
    ---v = Version("2")
    ---assert(v.prereleaseNumber == 0)
    ---```
    ---
    ---Returns the pre-release version.
    ---@type integer
    prereleaseNumber = undefined,
}

---```lua
---local v = Version("1.2.10")
---```
---
---You can create a new version from a string. Then access each field
---@param versionString string
---@return Version
function Version(versionString) end

---Represents an UUID (*Universally Unique IDentifier*), a 16-bytes unique identifier.
---
---You can compare UUIDs, convert them to a string of the `"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"` 36-chars format, or get each of byte using the `__index` Lua operator. Example:
---
---```lua
---local u = Uuid()
---assert(u == Uuid(tostring(u)))
---assert(tostring(u):sub(1, 2) == string.format("%02x", u[1]))
---```
---@class Uuid: { [integer]: string }
local _uuid = {}

---```lua
---local u = Uuid()
---local v = Uuid("74341b56-4f7f-4ab1-9495-58cf5bce0e1c") -- e.g.
---```
---
---You can create a new random UUID using `Uuid()` or a UUID representation of the given 36-chars string.
---@param uuidString string?
---@return Uuid
function Uuid(uuidString) end

---WebSocket
---@class WebSocket
WebSocket = {
    ---Address of the server. Read-only, the url is specified when creating the websocket.
    ---@type string
    url = undefined,

    ---Try connecting to the server. After a successful connection, `onreceive` function will be called with message type `WebSocketMessageType.OPEN`. When the server or network breaks the connection, the client tries reconnecting automatically.
    connect = function(self) end,

    ---Disconnects from the server. After a disconnect, `onreceive` function will be called with message type `WebSocketMessageType.CLOSE`.
    close = function(self) end,

    ---```lua
    ---WebSocket:sendText(str1, str2, ...)
    ---```
    ---
    ---Sends a text message to the server. If multiple strings are passed, they will be joined together.
    ---@param ... string
    sendText = function(self, ...) end,

    ---```lua
    ---WebSocket:sendBinary(bstr1, bstr2, ...)
    ---```
    ---
    ---Sends a binary message to the server. If multiple strings are passed, they will be joined together. Lua makes no distinction between character and byte strings, but the websocket protocol does label them.
    ---@param ... string
    sendBinary = function(self, ...) end,

    ---```lua
    ---WebSocket:sendPing(str)
    ---```
    ---
    ---Sends a very short ping message to the server. There's a limit to the length of data that can be sent. It's sometimes used to prevent the connection from timing out and closing. A standard compliant server will reply to every "ping" message with a "pong". Client pongs are sent automatically, and there's no need to control that. Sends a very short ping message to the server; There's a limit to the length of data that can be sent
    ---@param str string
    sendPing = function(self, str) end
}

---@alias WebSocketInit { url: string, onreceive: fun(message: string, data: any), deflate: boolean?, minreconnectwait: number?, maxreconnectwait: number? }
---```lua
---local ws = WebSocket()
---local ws = WebSocket{
---    url = string,
---    onreceive = function(message, data),
---    deflate = bool,
---    minreconnectwait=number,
---    maxreconnectwait=number
---}
---```
---
---Creates a websocket client that can be used to communicate with another program:
---
---* `url` specifies the server to connect.
---* `deflate` option enables compression before sending the data - if the server is running on the same machine, it might be faster to turn it off.
---* `onreceive` function will be called for every incoming message, and when the connection is established and broken. Its two arguments are the event type (see `WebSocketMessageType`) and the received data (a string, can be empty).
---* `minreconnectwait` and `maxreconnectwait` (in seconds) are optional values that limit the waiting time to try a reconnection to the server.
---
---Example:
---
---```lua
---local function handleMessage(mt, data)
---  if mt == WebSocketMessageType.OPEN then
---    print("Connection open. Sending a message...")
---    ws:sendText("Hello!")
---
---  elseif mt == WebSocketMessageType.TEXT then
---    print("Message received: " .. data)
---    ws:close()
---
---  elseif mt == WebSocketMessageType.CLOSE then
---    print("Connection closed")
---  end
---end
---
---local ws = WebSocket{
---    onreceive = handleMessage,
---    url = "http://127.0.0.1:9000",
---    deflate = false
---}
---```
---@param init WebSocketInit
---@return WebSocket
function WebSocket(init) end

---References a window of the program. At the moment we can access only the main window using app.window.
---@class Window
local _window = {
    ---Returns the width of the main window.
    ---@type integer
    width = undefined,

    ---Returns the height of the main window.
    height = undefined,

    ---Returns the `Events` object to associate functions that can act like listeners of specific `Window` events. E.g.
    ---
    ---```lua
    ---app.window.events:on('resize',
    ---  function(ev)
    ---    print('Now the main window is', ev.width, ev.height)
    ---  end)
    ---```
    ---
    ---Available events for a `Window`:
    ---
    ---* `'resize'`: When the user resizes the window.
    ---@type Events
    events = undefined,
}
