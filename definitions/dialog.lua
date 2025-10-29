---@meta

---The dialog class can be used to show input controls/widgets in the screen to get some data from the user.
---@class Dialog
local _dialog = {
    ---Gets/sets a table with one field for each widget with a given `id`. For each different kind of widget the field is of a different type.
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

    ---Creates a widget with a set of colors that can be clicked/picked (when `mode="pick"`, which is the default mode) or can be sorted (when `mode="sort"`, which is the default mode).
    ---@param init {
    ---    id: string,
    ---    label: string?,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    hexpand: boolean?,
    ---    vexpand: boolean?,
    ---    mode: "pick" | "sort"?,
    ---    colors: Color[],
    ---    onclick: fun(ev: MouseEvent)?,
    ---}
    ---@return Dialog
    shades = function (self, init) end,

    ---Makes the dialog visible to the user. The script code will continue when the dialog is closed by default (pressing a [button](lua://Dialog.button)).
    ---@param options {
    ---    wait: boolean?,
    ---    bounds: Rectangle?,
    ---    autoscrollbars: boolean?,
    ---    hand: boolean?,
    ---}
    ---@return Dialog
    ---@overload fun(self)
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
    ---@param init {
    ---    id: string,
    ---    focus: boolean?,
    ---    enabled: boolean?,
    ---    visible: boolean?,
    ---    text: string,
    ---    onclick: fun(ev: MouseEvent)?,
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

    ---Creates a text entry field + a button to select one file to open or save, possibilities.
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

    ---The Canvas widget provides several events to create an interactive experience with the user.
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
