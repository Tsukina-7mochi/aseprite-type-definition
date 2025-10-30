---@meta

---This object is received as first parameter in the function associated to `onmousedown`, `onmouseup`, `onmousemove`, or `onwheel` events of a [canvas](lua://Dialog#dialogcanvas) widget.
---@class MouseEvent
local _mouseEvent = {
    ---The (x,y) position of the mouse when the event happens, in client coordinates, where (0,0) is the top-left corner of the canvas widget.
    ---@type integer
    x = nil,

    ---See [MouseEvent.x](lua://MouseEvent#mouseeventx)
    ---@type integer
    y = nil,

    ---The [MouseButton](lua://MouseButton#mousebutton) pressed or released by the user.
    ---@type MouseButton
    button = nil,

    ---The pressure of pen when the event is generated from a stylus.
    ---@type number
    pressure = nil,

    ---Only for the `onwheel` event.
    ---@type integer
    deltaX = nil,

    ---Only for the `onwheel` event.
    ---@type integer
    deltaY = nil,

    ---True if the Alt key was pressed when the event occurs.
    ---@type boolean
    altKey = nil,

    ---True if the Windows key (or Command key on macOS) was pressed when the event occurs.
    ---@type boolean
    metaKey = nil,

    ---True if the Ctrl key was pressed when the event occurs.
    ---@type boolean
    ctrlKey = nil,

    ---True if the Shift key was pressed when the event occurs.
    ---@type boolean
    shiftKey = nil,

    ---True if the Space key was pressed when the event occurs.
    ---@type boolean
    spaceKey = nil,
}
