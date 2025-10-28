---@meta

---@class Range
local _range = {
    ---@type RangeType
    type = nil,

    ---@type boolean
    isEmpty = nil,

    ---@type Sprite
    sprite = nil,

    ---@type Layer[]
    layers = nil,

    ---@type Frame[]
    frames = nil,

    ---@type Cel[]
    cels = nil,

    ---@type Image[]
    images = nil,

    ---@type Image[]
    editableImages = nil,

    ---@type integer[]
    colors = nil,

    ---@type integer[]
    tiles = nil,

    ---@type Slice[]
    slices = nil,

    ---@param object Layer | Frame | Cel | Slice
    contains = function (self, object) end,

    ---@param colorIndex integer
    containsColor = function (self, colorIndex) end,

    clear = function (self) end,
}
