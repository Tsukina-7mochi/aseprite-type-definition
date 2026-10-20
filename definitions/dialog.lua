---@meta

---The dialog class can be used to show input controls/widgets on the screen to get some data from the user.
---
---Almost all dialog functions return the same dialog object so we can use [method chaining](https://en.wikipedia.org/wiki/Method_chaining). For example:
---
---Each time we add a new widget like `:button{ ... }` some common properties can be specified for every kind of widget:
---
---Where:
---
---* `id`: It's the ID to identify this widget in [Dialog.data](lua://Dialog.data)
---* `label`: Label at the left side of the widget
---* `focus`: Focus this widget by default (useful to focus a specific [entry](lua://Dialog.entry) when the dialog appears on the screen for the first time)
---* `enabled`: Enable or disable the widget by default
---* `visible`: Make the widget visible or hidden by default
---* `hexpand`: Expand the widget horizontally (useful to make a [canvas](lua://Dialog.canvas) with fixed size if we specify `hexpand=false`)
---* `vexpand`: Expand the widget vertically (useful to make a [canvas](lua://Dialog.canvas) with fixed size if we specify `vexpand=false`)
---@class Dialog
local _dialog = {
    ---Gets/sets a table with one field for each widget with a given `id`. For each different kind of widget the field is of a different type:
    ---
    ---* [button](lua://Dialog.button)/[check](lua://Dialog.check)/[radio](lua://Dialog.radio): The field is a boolean (true or false) if the button is selected or was used to close the dialog.
    ---* [entry](lua://Dialog.entry)/[label](lua://Dialog.label): A string of text.
    ---* [slider](lua://Dialog.slider): An integer.
    ---* [number](lua://Dialog.number): An integer or a number depending on the number of decimals of the number field.
    ---* [combobox](lua://Dialog.combobox): A string with the selected item.
    ---* [color](lua://Dialog.color): A [Color](lua://Color).
    ---* [shades](lua://Dialog.shades): A table with an array of [Color](lua://Color)s when `mode="sort"`
    ---@type { [string]: boolean | string | number | Color | Color[] }
    data = nil,

    ---Gets or sets the position and size (a [rectangle](lua://Rectangle)) of the dialog. This can be useful to align several dialog that must be shown in the same *xy*-position.
    ---@type Rectangle
    bounds = nil,

    ---Gets or sets the dialog autofit, as an [Align](lua://Align) object. The setting will only visually take effect on the dialog after a [Dialog:modify()](lua://Dialog.modify). When set, the dialog window will resize itself, anchoring at the specified value (eg. when autofitting with `Align.LEFT | Align.TOP`, the dialog bounds will shrink to the minimum size anchored at the top left of the dialog).
    ---@type Align
    autofit = nil,

    ---Gets the minimum size (without cutoff) of the dialog window, as a [Size](lua://Size).
    ---@type Size
    sizeHint = nil,

    ---Creates a button.
    ---
    ---Arguments (table fields):
    ---
    ---* `id`: Identifier for this button. [Dialog.data](lua://Dialog.data) will contain a field for each widget with an `id`.
    ---* `label`: Text label on the left side of the control.
    ---* `text`: Text displayed on the button.
    ---* `selected`: True in case that you want to show the button checked by default.
    ---* `focus`: Focus this button by default or when the Enter key is pressed in a [text entry](lua://Dialog.entry) field.
    ---* `onclick`: Function to be called when the button is pressed. When omitted, clicking the button closes its Dialog, as if [Dialog:close()](lua://Dialog.close) was called.
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string?,
    ---    selected: boolean?,
    ---    onclick: fun(ev: MouseEvent)?,
    ---}
    ---@return Dialog
    button = function (self, init) end,

    ---Creates a check box. Arguments are the same as in [Dialog:button](lua://Dialog.button).
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string?,
    ---    selected: boolean,
    ---    onclick: fun(ev: MouseEvent)?,
    ---}
    ---@return Dialog
    check = function (self, init) end,

    ---Closes the dialog from a `onclick` [button](lua://Dialog.button) event. By default buttons without an `onclick` event handler will close the dialog, but if you specify a `onclick` function, you have to call this function to close the dialog.
    close = function (self) end,

    ---Creates a button to select a [color](lua://Color).
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    color: Color,
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    color = function (self, init) end,

    ---Creates a combo box/drop-down list.
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    option: string,
    ---    options: string[],
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    combobox = function (self, init) end,

    ---Creates a text entry.
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string,
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    entry = function (self, init) end,

    ---Creates a static label.
    ---@param init {
    ---    id: string?,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string?,
    ---}
    ---@return Dialog
    label = function (dialog, init) end,

    ---Changes properties of the given widget that matches the identifier `id`.
    ---@param options {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    [string]: string | number | boolean | Color | Color[],
    ---}
    modify = function (self, options) end,

    ---Indicates that the next widget should be put in a new row in the dialog (useful to create buttons or several controls of the same type one below the other).
    ---@return Dialog
    ---@overload fun(self: Dialog, options: { always: boolean? })
    newrow = function (self) end,

    ---Creates an entry field to input a number.
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string,
    ---    decimals: integer?,
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    number = function (self, init) end,

    ---Creates a radio button. Arguments are the same as in [Dialog:button](lua://Dialog.button).
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string?,
    ---    selected: boolean?,
    ---    onclick: fun(ev: MouseEvent)?,
    ---}
    ---@return Dialog
    radio = function (self, init) end,

    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    text: string?,
    ---}
    ---@return Dialog
    separator = function (dialog, init) end,

    ---Creates a widget with a set of colors that can be clicked/picked (when `mode="pick"`, which is the default mode) or can be sorted (when `mode="sort"`).
    ---
    ---The `onclick` function can receive a `event` parameter which is a table with one `event.color` field which is the color that was clicked, and a `event.button` field with the [mouse button](lua://MouseButton), for example:
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    mode: ("pick" | "sort")?,
    ---    colors: Color[],
    ---    onclick: fun(event: { color: Color, button: MouseButton })?,
    ---}
    ---@return Dialog
    shades = function (self, init) end,

    ---Makes the dialog visible to the user. The script code will continue when the dialog is closed by default (pressing a [button](lua://Dialog.button)).
    ---
    ---If `{ wait=false }` is used as an argument, the dialog is opened "in the background", which means that the script code continues execution with its following line, and the dialog will be visible until it's closed with some button or calling [Dialog:close](lua://Dialog.close) in an `onclick` event.
    ---
    ---With `{ bounds=Rectangle() }` you can display the dialog in a specific location. Useful to show the dialog in a previous position that you obtain from [Dialog.bounds](lua://Dialog.bounds) property.
    ---
    ---Setting `{ autoscrollbars=true }` will add scrollbars automatically only if they are needed. This means that if your dialog contains enough widgets to make it go out of the window/screen (depending on whether you are using single window UI or multiple windows UI) then scrollbars will be shown in your dialog when its content doesn't fit its bounds.
    ---
    ---If `{ hand=true }`, this enables the hand tool in the editor while the dialog is active. See the *Edit > Replace Color* menu for an example. Only useful if `{ wait=true }`.
    ---@param options {
    ---    wait: boolean?,
    ---    bounds: Rectangle?,
    ---    autoscrollbars: boolean?,
    ---    hand: boolean?,
    ---}
    ---@return Dialog
    ---@overload fun(self): Dialog
    show = function (self, options) end,

    ---Creates a slider in the dialog.
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    min: integer,
    ---    max: integer,
    ---    value: integer,
    ---    onchange: fun()?,
    ---    onrelease: fun()?,
    ---}
    ---@return Dialog
    slider = function (self, init) end,

    ---If called for the first time (or anytime after a [Dialog:endtabs](lua://Dialog.endtabs) call), it creates a new tabs group and starts the first tab. If called after a previous `Dialog:tab` call, it marks the end of the previous tab and starts a new one.
    ---
    ---Once a tab is started, you can define its content by adding widgets as usual. When you are done adding tabs, call [Dialog:endtabs](lua://Dialog.endtabs).
    ---
    ---* `id`: Identifier for this tab. If you specify it, you can use it in [Dialog:endtabs](lua://Dialog.endtabs) to reference the selected tab. This value will be used also when asking for the selected tab through [Dialog.data](lua://Dialog.data).
    ---* `text`: Text to display on the tab.
    ---* `onclick`: Function to be called when the tab is pressed. It receives a parameter that you can use to get the pressed tab:
    ---
    ---Does not support the following common properties: label, hexpand, vexpand. These can be specified at [Dialog:endtabs](lua://Dialog.endtabs).
    ---@param init {
    ---    id: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    text: string,
    ---    onclick: fun(ev: { tab: string })?,
    ---}
    ---@return Dialog
    tab = function (self, init) end,

    ---Marks the end of both the last tab and the group of tabs to which it belongs.
    ---@param options {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    selected: boolean?,
    ---    align: Align,
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    endtabs = function (self, options) end,

    ---Creates a text entry field + a button to select one file to open or save, with the following options:
    ---
    ---* `open`: When true, shows a dialog to open an existing file (set to true by default).
    ---* `save`: When true, shows a dialog to select an existing file to overwrite or a new file to save.
    ---
    ---Other arguments:
    ---
    ---* `filename`: String of the selected filename to open or save.
    ---* `title`: The title of the file select menu.
    ---* `filetypes`: Array of possible file types/extensions that the user can select.
    ---* `entry`: Show an entry field to edit the filename manually (false by default).
    ---* `basepath`: The base path of the directory. Use [app.fs.joinPath()](lua://app.fs.joinPath) for paths.
    ---* `onchange`: Function to be called when the filename/path is changed.
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    title: string?,
    ---    filename: string?,
    ---    basepath: string?,
    ---    open: boolean?,
    ---    save: boolean?,
    ---    entry: boolean?,
    ---    filetypes: string[]?,
    ---    onchange: fun()?,
    ---}
    ---@return Dialog
    file = function (self, init) end,

    ---The Canvas widget provides several events to create an interactive experience with the user:
    ---
    ---* `onpaint`: A function that receives an event with [a GraphicsContext (`ev.context`)](lua://GraphicsContext) to paint on.
    ---* `onkeydown`/`onkeyup`: Key events when a key is pressed or released. If a canvas widget handles these events, it will receive the keyboard focus when it's clicked. The `ev` event is a [KeyEvent](lua://KeyEvent).
    ---* `onmousemove`/`onmousedown`/`onmouseup`/`onwheel`/`ondblclick`: Mouse events when the mouse is moved over the canvas, a mouse button is pressed (`onmousedown`), a mouse button is double-clicked (`ondblclick`), a button is released (`onmouseup`), or the mouse wheel is moved (`onwheel`). The `ev` event is a [MouseEvent](lua://MouseEvent).
    ---* `ontouchmagnify`: Touch event generated when a pinch gesture is done in the trackpad to zoom in or out. The `ev` event is a [TouchEvent](lua://TouchEvent).
    ---
    ---The `autoscaling` property allows the script developer to draw on the GraphicsContext received in the canvas's onpaint event without worrying about the current UI scale setting. For instance, you can draw a 20[px]x30[px] rectangle in the canvas's GraphicsContext and it will be displayed the same at any UI scale. This property is enabled by default if omitted, so if you don't need it you must explicitly set it to false.
    ---
    ---Additionally, when using `Dialog:modify()`, the canvas `mousecursor` property can be set to a [MouseCursor](lua://MouseCursor) value, changing the mouse cursor type.
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    width: integer?,
    ---    height: integer?,
    ---    autoscaling: boolean?,
    ---    onpaint: fun(ev: { context: GraphicsContext }),
    ---    onkeydown: fun(ev: KeyEvent)?,
    ---    onkeyup: fun(ev: KeyEvent)?,
    ---    onmousemove: fun(ev: MouseEvent)?,
    ---    onmousedown: fun(ev: MouseEvent)?,
    ---    onmouseup: fun(ev: MouseEvent)?,
    ---    ondblclick: fun(ev: MouseEvent)?,
    ---    onwheel: fun(ev: MouseEvent)?,
    ---    ontouchmagnify: fun(ev: TouchEvent)?,
    ---}
    ---@return Dialog
    canvas = function (self, init) end,

    ---Will call `onpaint` event of all [canvases](lua://Dialog.canvas) and update the dialog pixels on the screen.
    repaint = function (self) end,
}

---@alias DialogInit {
---    title: string?,
---    autofit: Align?,
---    notitlebar: boolean?,
---    resizeable: boolean?,
---    parent: Dialog?,
---    onclose: fun()?,
---}
---Creates a new dialog. The dialog is hidden, so you have to call [Dialog:show](lua://Dialog.show) function to make it visible. The constructor that receives a `string` will use that string in the title bar of the dialog. The constructor that receives a table can receive a special callback function (`onclose`) that is called when the dialog is closed.
---@return Dialog | nil
---@overload fun(title: string): Dialog | nil
---@overload fun(init: DialogInit): Dialog | nil
function Dialog () end
