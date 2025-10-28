---@meta

---@class Timer
local _timer = {
    start = function (self) end,

    stop = function (self) end,

    ---@type number
    interval = nil,

    ---@type boolean
    isRunning = nil,
}

---@param init { interval: number, ontick: fun() }
---@return Timer
function Timer (init) end
