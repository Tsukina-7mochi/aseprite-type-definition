---@meta

---@class Layer
local _layer = {
    ---@type Sprite
    sprite = nil,

    ---@type string
    name = nil,

    ---@type integer?
    opacity = nil,

    ---@type BlendMode?
    blendMode = nil,

    ---@type Layer[] | nil
    layers = nil,

    ---@type Sprite | Layer
    parent = nil,

    ---@type integer
    stackIndex = nil,

    ---@type Uuid
    uuid = nil,

    ---@type boolean
    isImage = nil,

    ---@type boolean
    isGroup = nil,

    ---@type boolean
    isTilemap = nil,

    ---@type boolean
    isTransparent = nil,

    ---@type boolean
    isBackground = nil,

    isEditable = nil,

    ---@type boolean
    isVisible = nil,

    ---@type boolean
    isContinuous = nil,

    ---@type boolean
    isCollapsed = nil,

    ---@type boolean
    isExpanded = nil,

    ---@type boolean
    isReference = nil,

    ---@type Cel[]
    cels = nil,

    ---@type Color
    color = nil,

    ---@type string
    data = nil,

    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---@param frame integer | Frame
    ---@return Cel | nil
    cel = function (self, frame) end,

    ---@type Tileset | nil
    tileset = nil,
}
