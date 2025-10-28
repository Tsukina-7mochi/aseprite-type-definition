---@meta

---@class Dialog
local _dialog = {
    ---@type { [string]: boolean | string | number | Color | Color[] }
    data = nil,

    ---@type Rectangle
    bounds = nil,

    ---@type Align
    autofit = nil,

    ---@type Size
    sizeHint = nil,

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

    close = function (self) end,

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

    ---@return Dialog
    ---@overload fun(self: Dialog, options: { always: boolean? })
    newrow = function (self) end,

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

    ---@param options {
    ---    wait: boolean?,
    ---    bounds: Rectangle?,
    ---    autoscrollbars: boolean?,
    ---    hand: boolean?,
    ---}
    ---@return Dialog
    ---@overload fun(self)
    show = function (self, options) end,

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
---@return Dialog | nil
---@overload fun(title: string): Dialog | nil
---@overload fun(init: DialogInit): Dialog | nil
function Dialog () end
