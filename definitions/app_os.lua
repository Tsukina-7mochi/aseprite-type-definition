---@meta

app.os = {
    ---@type "Windows" | "macOS" | "Linux"
    name = nil,

    ---@type Version
    version = nil,

    ---@type string
    fullName = nil,

    ---Returns `true` if we are running in the windows platform.
    ---@type boolean
    windows = nil,

    ---Returns `true` if we are running in the macos platform.
    ---@type boolean
    macos = nil,

    ---Returns `true` if we are running in the linux platform.
    ---@type boolean
    linux = nil,

    ---Returns `true` if we are running in the x64 platform.
    ---@type boolean
    x64 = nil,

    ---Returns `true` if we are running in the x86 platform.
    ---@type boolean
    x86 = nil,

    ---Returns `true` if we are running in the arm64 platform.
    ---@type boolean
    arm64 = nil,
}
