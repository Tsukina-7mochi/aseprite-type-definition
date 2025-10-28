---@meta

---@class Editor
local _editor = {
    ---@type Sprite
    sprite = nil,

    ---@type Point
    spritePos = nil,

    ---@type Point
    mousePos = nil,

    ---@type number
    zoom = nil,

    ---@type { x: number, y: number }
    scroll = nil,

    ---@param options {
    ---    title: string,
    ---    point: Point,
    ---    onclick: fun(ev: MouseEvent),
    ---    onchange: fun(ev: MouseEvent),
    ---    oncancel: fun(ev: MouseEvent),
    ---}
    askPoint = function (self, options) end,

    cancel = function (self) end,
}
