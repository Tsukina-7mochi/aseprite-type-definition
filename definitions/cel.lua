---@meta

---@class Cel
local _cel = {
    ---@type Sprite
    sprite = nil,

    ---@type Layer
    layer = nil,

    ---@type Frame
    frame = nil,

    ---@type integer
    frameNumber = nil,

    ---@type Image
    image = nil,

    ---@type Rectangle
    bounds = nil,

    ---@type Point
    position = nil,

    ---@type integer
    opacity = nil,

    ---@type integer
    zIndex = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
