---@meta

---A collection of listeners for specific events. Available for [App.events](lua://app.events) and [Sprite.events](lua://Sprite.events).
---@class Events
local _events = {
    ---Connects the given `function` (2nd argument) with the given event by `eventName` (a `string`, the event name/code/identifier). When the event happens in the future the function will be called automatically. This is like the `function` starts "listening" the event.
    ---@param eventName string
    ---@param callback fun()
    ---@return integer listenerCode
    on = function (self, eventName, callback) end,

    ---Disconnects the given `function` from all events in the object, or stops/breaks only the specific connection identified by `listenerCode` (the code returned by [Events:on()](lua://Events.on)).
    ---@param listenerCode integer
    ---@overload fun(callback: fun())
    off = function (self, listenerCode) end,
}
