---@meta

---@class Tag
local _tag = {
    ---@type Sprite
    sprite = nil,

    ---@type Frame
    fromFrame = nil,

    ---@type Frame
    toFrame = nil,

    ---@type integer
    frames = nil,

    ---@type string
    name = nil,

    ---@type AniDir
    aniDir = nil,

    ---@type Color
    color = nil,

    ---@type integer
    repeats = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
