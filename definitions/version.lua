---@meta

---Represents a version number and provides an easy way to compare if the `app.version` is greater or equal than a specific expected version. Example:
---@class Version
local _version = {
    ---@type integer
    major = nil,

    ---@type integer
    minor = nil,

    ---@type integer
    patch = nil,

    ---@type string
    prereleaseLabel = nil,

    ---@type integer
    prereleaseNumber = nil,
}

---@param versionString string
---@return Version
function Version (versionString) end
