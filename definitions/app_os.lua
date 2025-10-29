---@meta

---A set of functions to get properties about the running Operating System platform.
app.os = {
    ---Returns the platform name. It can be `Windows`, `macOS`, or `Linux`.
    ---@type "Windows" | "macOS" | "Linux"
    name = nil,

    ---Returns an [`Version`](lua://Version) with the Windows or macOS version. It's just `0.0.0` on Linux.
    ---@type Version
    version = nil,

    ---Returns the full platform name with its version. On Linux returns the distribution name with its specific version.
    ---@type string
    fullName = nil,

    ---@type boolean
    windows = nil,

    ---@type boolean
    macos = nil,

    ---@type boolean
    linux = nil,

    ---@type boolean
    x64 = nil,

    ---@type boolean
    x86 = nil,

    ---@type boolean
    arm64 = nil,
}
