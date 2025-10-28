---@meta

---@class KeyEvent
local _keyEvent = {
    ---@type integer
    repeatCount = nil,

    ---@type string
    key = nil,

    ---@type string
    code = nil,

    ---@type boolean
    altKey = nil,

    ---@type boolean
    metaKey = nil,

    ---@type boolean
    ctrlKey = nil,

    ---@type boolean
    shiftKey = nil,

    ---@type boolean
    spaceKey = nil,

    stopPropagation = function (self) end,
}
