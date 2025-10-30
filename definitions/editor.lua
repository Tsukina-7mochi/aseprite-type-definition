---@meta

---References a sprite editor. At the moment we can access only the active editor using [app.editor](lua://app.editor).
---@class Editor
local _editor = {
    ---Returns the [sprite](lua://Sprite) in the editor.
    ---@type Sprite
    sprite = nil,

    ---Returns a [point](lua://Point) of the the mouse position on the sprite, i.e. what pixel is going to be changed if the user clicks the mouse.
    ---@type Point
    spritePos = nil,

    ---Returns a [point](lua://Point) indicating the mouse position on the screen.
    ---@type Point
    mousePos = nil,

    ---Gets or sets the editor zoom as a float. To get a percentage, multiply by 100.
    ---@type number
    zoom = nil,

    ---Gets or sets the editor scroll (coordinates of sprite pixel to center the editor at) as a table, with values `x` and `y` as floats.
    ---@type { x: number, y: number }
    scroll = nil,

    ---Asks the user to select a pixel/point on the sprite. It's similar to what happens when you choose *Edit > New Brush* (but in that case you select a rectangle).
    ---@param options {
    ---    title: string,
    ---    point: Point,
    ---    onclick: fun(ev: MouseEvent),
    ---    onchange: fun(ev: MouseEvent),
    ---    oncancel: fun(ev: MouseEvent),
    ---}
    askPoint = function (self, options) end,

    ---Cancels the [editor:askPoint()](lua://Editor.askPoint) action.
    cancel = function (self) end,
}
