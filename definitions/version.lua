---@meta

---Represents a version number and provides an easy way to compare if the [`app.version`](lua://App.version) is greater or equal than a specific expected version.
---@class Version
local _version = {
    ---Returns the first number of the version.
    ---@type integer
    major = nil,

    ---Returns the second number of the version.
    ---@type integer
    minor = nil,

    ---Returns the third number of the version.
    ---@type integer
    patch = nil,

    ---Returns the pre-release label/keyword. For official releases it's an empty string, in other cases it might be `"alpha"`, `"beta"`, `"dev"`, etc.
    ---@type string
    prereleaseLabel = nil,

    ---Returns the pre-release version.
    ---@type integer
    prereleaseNumber = nil,
}

---You can create a new version from a string. Then access each field
---@param versionString string
---@return Version
function Version (versionString) end
