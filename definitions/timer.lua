---@meta

---The Timer class can be used to execute a function periodically.
---@class Timer
local _timer = {
    ---Starts the timer.
    start = function (self) end,

    ---Stops the timer.
    stop = function (self) end,

    ---Returns the interval of this specific timer (in seconds).
    ---@type number
    interval = nil,

    ---Returns true if the timer is running.
    ---@type boolean
    isRunning = nil,
}

---Creates a new timer. `interval`: Number of seconds to wait for the first/next call. You can specify decimal numbers, e.g. `interval=1.0 / 60.0` to call the function 60 times per second, etc. `ontick`: Function that is called each time the specified number of seconds ellapses.
---@param init { interval: number, ontick: fun() }
---@return Timer
function Timer (init) end
