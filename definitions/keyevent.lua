---@meta

---This object is received as first parameter in the function associated to `onkeydown` or `onkeyup` events of a [canvas](lua://Dialog.canvas) widget.
---@class KeyEvent
local _keyEvent = {
    ---Number of times the key was autorepeated. This can happen when the user presses and holds a key.
    ---@type integer
    repeatCount = nil,

    ---A string containing the pressed/released Unicode character.
    ---@type string
    key = nil,

    ---A string that identifies the pressed/released key, similar to the values found in https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_code_values, one of the following values.
    ---@type string
    code = nil,

    ---True if the <kbd>Alt</kbd> key was pressed when the event occurs.
    ---@type boolean
    altKey = nil,

    ---True if the <kbd>Windows</kbd> key (or <kbd>Command</kbd> key on macOS) was pressed when the event occurs.
    ---@type boolean
    metaKey = nil,

    ---True if the <kbd>Ctrl</kbd> key was pressed when the event occurs.
    ---@type boolean
    ctrlKey = nil,

    ---True if the <kbd>Shift</kbd> key was pressed when the event occurs.
    ---@type boolean
    shiftKey = nil,

    ---True if the <kbd>Space</kbd> key was pressed when the event occurs.
    ---@type boolean
    spaceKey = nil,

    ---Stops propagating this event to other parent widget/main Aseprite window. Use this in case that your canvas widget used the key and you want to avoid triggering a command with a keyboard shortcut.
    stopPropagation = function (self) end,
}
