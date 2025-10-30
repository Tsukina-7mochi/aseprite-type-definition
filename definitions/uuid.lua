---@meta

---Represents an UUID (*Universally Unique IDentifier*), a 16-bytes unique identifier.
---
---You can compare UUIDs, convert them to a string of the `"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"` 36-chars format, or get each of byte using the `__index` Lua operator.
---@class Uuid: { [integer]: string }
local _uuid = {}

---You can create a new random UUID using `Uuid()` or a UUID representation of the given 36-chars string.
---@return Uuid
---@overload fun(fromString: string): Uuid
function Uuid () end
