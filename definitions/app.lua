---@meta

---The `app` global namespace.
app = {
    ---Active [site](lua://Site) (active image, layer, frame, sprite, etc.).
    ---@type Site
    site = nil,

    ---[Range](lua://Range) member represents the active selection from an objects collection. It returns a sorted list of selected frames, or cels, or layers, or colors, etc.
    ---@type Range
    range = nil,

    ---Gets or sets the active [Cel](lua://Cel) object.
    ---@type Cel | nil
    cel = nil,

    ---Returns a [Frame object](lua://Frame) that represents the active frame in the focused sprite editor. You can set this property assigning a frame number directly to jump to another frame.
    ---
    ---To know the active frame number, use [`app.frame.frameNumber`](lua://Frame.frameNumber)
    ---@type Frame | nil
    frame = nil,

    ---Returns the active image, an [Image](lua://Image) object.
    ---@type Image | nil
    image = nil,

    ---Returns the active layer, a [Layer](lua://Layer) object.
    ---@type Layer | nil
    layer = nil,

    ---Returns the active sprite, a [Sprite](lua://Sprite) object.
    ---@type Sprite | nil
    sprite = nil,

    ---Returns the active [tag](lua://Tag), which is the tag located at the active frame.
    ---@type Tag | nil
    tag = nil,

    ---Gets or sets the active tool (a [Tool](lua://Tool) object) selected in the [tool bar](https://www.aseprite.org/docs/workspace/).
    ---@type Tool
    tool = nil,

    ---Returns the active brush (a [Brush](lua://Brush) object) selected in the context bar.
    ---@type Brush
    brush = nil,

    ---Returns the active editor (a [Editor](lua://Editor) object).
    ---@type Editor | nil
    editor = nil,

    ---Returns the main window (a [Window](lua://Window) object).
    ---@type Window | nil
    window = nil,

    ---Returns the Aseprite version number as a [`Version`](lua://Version) object (e.g. `Version("1.2.10-beta1")`).
    ---@type Version
    version = nil,

    ---Returns the API version. See the [changes file](https://github.com/aseprite/api/blob/main/Changes.md#api-changes) between versions to know what each API version offers.
    apiVersion = 39,

    ---Gets or sets the current foreground [color](lua://Color).
    ---@type Color
    fgColor = nil,

    ---Gets or sets the current background [color](lua://Color). Remember that some commands use the background color to clear the active layer.
    ---@type Color
    bgColor = nil,

    ---Gets or sets the current foreground [tile](lua://Tile).
    ---@type Tile
    fgTile = nil,

    ---Gets or sets the current background [tile](lua://Tile).
    ---@type Tile
    bgTile = nil,

    ---Returns true if the UI is available. E.g. if this is true you can use [app.alert](lua://app.alert) or dialogs. The UI is not available when we run in --batch mode.
    ---@type boolean
    isUIAvailable = nil,

    ---Returns an array of [sprites](lua://Sprite).
    ---@type Sprite[]
    sprites = nil,

    ---This is a table with parameters specified as `--script-param key=value` in the CLI or as `<param>` in `user.aseprite-keys` or `gui.xml` file.
    ---@type table<string, string>
    params = nil,

    ---@type Theme
    theme = nil,

    ---Returns the [UI Elements Scaling](https://www.aseprite.org/docs/preferences/) value specified in *Edit > Preferences* as a scale factor (1 for 100%, 2 for 200%, etc.)
    ---@type number
    uiScale = nil,

    ---Returns the user's default palette, as a [Palette](lua://Palette).
    ---@type Palette
    defaultPalette = nil,

    ---Returns the [`Events`](lua://Events) object to associate functions that can act like listeners of specific `app` events. E.g.
    ---
    ---Available events for `app`:
    ---
    ---* `'sitechange'`: When the user selects another sprite, layer, or frame.
    ---* `'beforesitechange'`: Before the user switches to another sprite, layer, or frame.
    ---* `'fgcolorchange'`: When the [Foreground color](https://www.aseprite.org/docs/color-bar/#foreground-color) in the color bar is changed.
    ---* `'bgcolorchange'`: When the [Background color](https://www.aseprite.org/docs/color-bar/#background-color) in the color bar is changed.
    ---* `'beforecommand'`: Before executing any command in the program.
    ---* `'aftercommand'`: After executing any command in the program.
    ---
    ---The `'beforecommand'` and `'aftercommand'` events receive an `ev` argument with the name of the command (`ev.name`) and the params (`ev.params`). `'beforecommand'` includes a `ev.stopPropagation()` function to cancel the event, e.g. in case that you've handled the event in a custom way.
    ---
    ---E.g. This code catches the *Edit > Cut* command and converts it to a *Copy*:
    ---@type Events
    events = nil,

    ---Shows an alert message. If `buttons` are not specified, it will show a message box with the `OK` button only.
    ---
    ---Returns an integer with the selected button i.e. 1 if the first button was clicked, 2 if the second one, etc.
    ---@param text string
    ---@return integer buttonClicked
    ---@overload fun(options: { title: string, text: string|string[], buttons: string | string[] }): integer
    alert = function (text) end,

    ---Shows a tooltip message in the status bar. If the duration (in seconds) is not specified, it will default to `2`. The duration can be between `0.5` to `30` seconds.
    ---@param text string
    ---@overload fun(text: string, duration: number)
    ---@overload fun(options: { text: string, duration: number })
    tip = function (text) end,

    ---Opens a new sprite, loading it from the given filename. Returns an instance of the [Sprite class](lua://Sprite) or `nil` if something went wrong.
    ---@param filename string
    ---@return Sprite | nil
    open = function (filename) end,

    ---Closes the application. It's like clicking *File > Exit* menu option.
    exit = function () end,

    ---Creates a new transaction so you can group several sprite modifications in just one undo/redo operation. If a string is given as first argument, that string will be used as the label of this undo/redo action (which can be seen in the *Edit > Undo History* window).
    ---
    ---The given function is called inside the transaction. If the function fails, the whole transaction is undone (i.e. all the steps executed so far will be reversed). If the function succeeds, the transaction is committed and then all actions will be grouped in just one undo/redo operation.
    ---
    ---You can cancel/reverse/cause an explicit failure of the transaction calling the `error()` Lua function, e.g:
    ---@param func fun()
    ---@overload fun(label: string, func: fun(): any)
    transaction = function (func) end,

    ---This function is available just in case you see that your script updates the sprite but the screen is not showing the updated state of the sprite. It should not be needed, but it's here just in case that something is not working right on the Aseprite side.
    refresh = function () end,

    ---Undoes the latest operation in the active sprite.
    ---It's like calling `app.command.Undo()` (the *Edit > Undo*  menu option).
    undo = function () end,

    ---Redoes the latest undone operation in the active sprite.  It's like calling `app.command.Redo()` (the *Edit > Redo*  menu option).
    redo = function () end,

    ---Simulates a user stroke on the canvas using the given tool.
    ---
    ---* `tool`: The tool to use. Can either be a [Tool](lua://Tool) object or a string tool ID (`rectangular_marquee`, `elliptical_marquee`, `lasso`, `polygonal_lasso`, `magic_wand`, `pencil`, `spray`, `eraser`, `eyedropper`, `zoom`, `hand`, `move`, `slice`, `paint_bucket`, `gradient`, `line`, `curve`, `rectangle`, `filled_rectangle`, `ellipse`, `filled_ellipse`, `contour`, `polygon`, `blur`, `jumble`). Defaults to [app.tool](lua://app.tool).
    ---* `color`: The color to draw with (foreground color), as a [Color](lua://Color) object. Defaults to [app.fgColor](lua://app.fgColor).
    ---* `bgColor`: The background color to draw with, as a [Color](lua://Color) object. Defaults to [app.bgColor](lua://app.bgColor).
    ---* `brush`: A [Brush](lua://Brush) object for the tool to draw with. Defaults to the active brush.
    ---* `points`: An array of [points](lua://Point) on the sprite canvas which simulate the positions where a user would put their mouse to draw with the given tool.
    ---* `selection`: What to do with the selection, only for selection-like tools (`rectangular_marquee`, `magic_wand`, etc.). The default value when the [UI is enabled](lua://app.isUIAvailable) will be `app.preferences.selection.mode`, in CLI mode it's `SelectionMode.REPLACE`.
    ---* The draw location (`cel` or `layer`/`frame`) can be specified:
    ---  * `cel`: The specific [Cel](lua://Cel) where we want to use the tool/draw with the tool (by default [app.cel](lua://app.cel)).
    ---  * `layer`: The [Layer](lua://Layer) to use the tool at (by default [app.layer](lua://app.layer)).
    ---  * `frame`: The [Frame](lua://Frame) to use the tool at (by default [app.frame](lua://app.frame)).
    ---* `ink`: The [Ink](lua://Ink) type for the tool to use.
    ---* `button`: The [MouseButton](lua://MouseButton) to use, can either be `MouseButton.LEFT` or `MouseButton.RIGHT`. Defaults to `MouseButton.LEFT`.
    ---* `opacity`: The opacity of the tool stroke, as an integer between `0` and `255`. Defaults to `255`.
    ---* `tolerance`: The tolerance of the tool fill, as an integer between `0` and `255`. Defaults to `0`.
    ---* `contiguous`: Contiguous mode toggle. Defaults to `true`.
    ---* `freehandAlgorithm`: Changes the freehand algorithm. Can either be `0` (regular mode) or `1` (pixel-perfect mode). Defaults to `0`.
    ---* `tilemapMode`: The [TilemapMode](lua://TilemapMode) of the tool. Defaults to `TilemapMode.PIXELS`.
    ---* `tilesetMode`: The [TilesetMode](lua://TilemapMode) of the tool. Defaults to `TilesetMode.MANUAL`.
    ---@param options {
    ---    tool: (string | Tool)?,
    ---    color: Color?,
    ---    bgColor: Color?,
    ---    brush: Brush?,
    ---    points: Point[],
    ---    cel: Cel?,
    ---    layer: Layer?,
    ---    frame: Frame?,
    ---    ink: Ink?,
    ---    button: MouseButton?,
    ---    opacity: integer?,
    ---    contiguous: boolean?,
    ---    tolerance: integer?,
    ---    freehandAlgorithm: (0 | 1)?,
    ---    selection: SelectionMode?,
    ---    tilemapMode: TilemapMode?,
    ---    tilesetMode: TilesetMode?,
    ---}
    useTool = function (options) end,

    ---Deprecated. Use [app.sprite](lua://app.sprite).
    ---@deprecated
    ---@type Sprite | nil
    activeSprite = nil,

    ---Deprecated. Use [app.layer](lua://app.layer).
    ---@deprecated
    ---@type Layer | nil
    activeLayer = nil,

    ---Deprecated. Use [app.frame](lua://app.frame).
    ---@deprecated
    ---@type Frame | nil
    activeFrame = nil,

    ---Deprecated. Use [app.cel](lua://app.cel).
    ---@deprecated
    ---@type Cel | nil
    activeCel = nil,

    ---Deprecated. Use [app.image](lua://app.image).
    ---@deprecated
    ---@type Image | nil
    activeImage = nil,

    ---Deprecated. Use [app.tag](lua://app.tag).
    ---@deprecated
    ---@type Tag | nil
    activeTag = nil,

    ---Deprecated. Use [app.tool](lua://app.tool).
    ---@deprecated
    ---@type Tool
    activeTool = nil,

    ---Deprecated. Use [app.brush](lua://app.brush).
    ---@deprecated
    ---@type Brush
    activeBrush = nil,
}
