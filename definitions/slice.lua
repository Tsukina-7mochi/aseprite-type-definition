---@meta

---@class Slice
local _slice = {
    ---@type Rectangle
    bounds = nil,

    ---@type Rectangle | nil
    center = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---@type string
    name = nil,

    ---@type Point | nil
    pivot = nil,

    ---@type Sprite
    sprite = nil,
}
