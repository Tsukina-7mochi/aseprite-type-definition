---@meta

---Mouse cursor that can be set in a [canvas widget](lua://Dialog.canvas) using: `dialog:modify{ id=canvasId, mousecursor=newMouseCursor }`
---@class MouseCursor
MouseCursor = {
    ---@type MouseCursor
    NONE = nil,

    ---@type MouseCursor
    ARROW = nil,

    ---@type MouseCursor
    CROSSHAIR = nil,

    ---@type MouseCursor
    POINTER = nil,

    ---@type MouseCursor
    NOT_ALLOWED = nil,

    ---@type MouseCursor
    GRAB = nil,

    ---@type MouseCursor
    GRABBING = nil,

    ---@type MouseCursor
    MOVE = nil,

    ---@type MouseCursor
    NS_RESIZE = nil,

    ---@type MouseCursor
    WE_RESIZE = nil,

    ---@type MouseCursor
    N_RESIZE = nil,

    ---@type MouseCursor
    NE_RESIZE = nil,

    ---@type MouseCursor
    E_RESIZE = nil,

    ---@type MouseCursor
    SE_RESIZE = nil,

    ---@type MouseCursor
    S_RESIZE = nil,

    ---@type MouseCursor
    SW_RESIZE = nil,

    ---@type MouseCursor
    W_RESIZE = nil,

    ---@type MouseCursor
    NW_RESIZE = nil,
}
