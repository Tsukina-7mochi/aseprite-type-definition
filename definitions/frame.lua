---@meta

---@class Frame
local _frame = {
    ---@type Sprite
    sprite = nil,

    ---@type integer
    frameNumber = nil,

    ---@type number
    duration = nil,

    ---@type Frame | nil
    previous = nil,

    ---@type Frame | nil
    next = nil,
}
