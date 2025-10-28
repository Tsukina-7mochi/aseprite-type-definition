---@meta

---@class Events
local _events = {
    ---@param eventName string
    ---@param callback fun()
    ---@return integer listenerCode
    on = function (self, eventName, callback) end,

    ---@param listenerCode integer
    ---@overload fun(callback: fun())
    off = function (self, listenerCode) end,
}
