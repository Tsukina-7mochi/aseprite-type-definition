---@meta

---This object is received as first parameter in the function associated to `ontouch` event of a [canvas](lua://Dialog.canvas) widget.
---@class TouchEvent
local _touchEvent = {
    ---The (x,y) position of the touch when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type integer
    x = nil,

    ---The (x,y) position of the touch when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type integer
    y = nil,

    ---Magnification factor to apply.
    ---@type number
    magnification = nil,
}
