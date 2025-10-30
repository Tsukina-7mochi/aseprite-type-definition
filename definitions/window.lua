---@meta

---References a window of the program. At the moment we can access only the main window using [app.window](lua://App.window).
---@class Window
local _window = {
    ---Returns the width of the main window.
    ---@type integer
    width = nil,

    ---Returns the height of the main window.
    ---@type integer
    height = nil,

    ---Returns the [`Events`](lua://Events) object to associate functions that can act like listeners of specific `Window` events.
    ---
    ---Available events for a `Window`:
    ---
    ---* `'resize'`: When the user resizes the window.
    ---@type Events
    events = nil,
}
