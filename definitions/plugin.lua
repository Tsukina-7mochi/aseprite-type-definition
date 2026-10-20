---@meta

---Since Aseprite v1.2.18 we can create [plugins](https://www.aseprite.org/docs/extensions/) with scripts.
---
---To create a plugin we have to create a folder with a `package.json` file. For example:
---
---Then we create a `my-script.lua` file inside the folder. For example:
---
---Then we compress both files (`package.json` and `my-script.lua`) to a zip archive, and change the `.zip` extension to `.aseprite-extension`.
---
---To install the extension just double-clicking it should be enough on Windows or macOS. Alternatively, you can install it from *Edit > Preferences > Extensions > Add Extension*.
---@class Plugin
local _plugin = {
    ---Name of the extension.
    ---@type string
    name = nil,

    ---Display name of the extension.
    ---@type string
    displayName = nil,

    ---Version of the extension.
    ---@type Version
    version = nil,

    ---Path where the extension is installed.
    ---@type string
    path = nil,

    ---It's a Lua table where you can load/save any kind of Lua value here and they will be saved/restored automatically on each session.
    ---@type table<string, any>
    preferences = nil,

    ---Creates a new command that can be associated with keyboard shortcuts and is added to the app menu in the specified `"group"`. Groups are defined in the [`gui.xml` file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element.
    ---
    ---* `onclick`: Function to be called when the command is executed (clicked or an associated keyboard shortcut pressed).
    ---* `onenabled`: Optional function to check if the command should be available (enabled or disabled). It should return true if the command can be executed right now. If this function is not specified, the command will always be available to be executed by the user.
    ---* `onchecked`: Optional function to check whether the command should have a checkbox. This is called every time the command is displayed in a menu (e.g., when a dropdown is opened). It should return true if the command should have a checked checkbox next to it.
    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---    onclick: fun(),
    ---    onenabled: (fun(): boolean)?,
    ---    onchecked: (fun(): boolean)?,
    ---}
    newCommand = function (self, init) end,

    ---Creates a new menu item which will contain a submenu grouping several plugin commands.
    ---
    ---* `id`: ID to identify this new menu group in [`Plugin:newCommand{ ..., group=id, ... }`](lua://Plugin.newCommand) calls to add several commands/menu items as elements of this group submenu.
    ---* `group`: Specifies the existing group to which this new menu item should be added. Existing app groups are defined in the [`gui.xml` file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element.
    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---}
    newMenuGroup = function (self, init) end,

    ---Creates a menu separator in the given menu group, useful to separate several [Plugin:newCommand](lua://Plugin.newCommand) calls.
    ---@param options {
    ---    group: string,
    ---}
    newMenuSeparator = function (self, options) end,

    ---Registers a new file format handler.
    ---
    ---* `name`: Optional, will use the first extension registered otherwise
    ---* `binary`: Optional, whether the file will be opened in binary mode or not (set to `false` for text-only formats, otherwise defaults to `true`)
    ---* `supports`: Optional, a set of flags specifying the capabilities of this format, see [FormatSupport](lua://FormatSupport) for a description of each flag. Defaults to `FILE_SUPPORT_RGB | FILE_SUPPORT_RGBA | FILE_SUPPORT_GRAY | FILE_SUPPORT_GRAYA | FILE_SUPPORT_INDEXED`.
    ---* `extensions`: The extension to be registered, without the dot ("."). They cannot overlap with an existing format that Aseprite supports (for example, "png"), if the format has already been registered by either Aseprite itself or another plugin, registration will fail with an error.
    ---* `onload/onsave`: The function that is called for the extension to convert the given file to one or multiple Sprites. It is called with a table argument containing a `file` and `filename`. The `file` is an open Lua file handle to whatever we're loading or saving. For loading, this function must return a Sprite object on success, or raise an error otherwise. For saving, the function should return a boolean on success or failure, or raise an error to give the user more details.
    ---
    ---For an example of a minimal implementation of a file format, see [here](https://github.com/ckaiser/aseprite-ppm-example).
    ---@param init {
    ---    name: string?,
    ---    binary: boolean?,
    ---    supports: integer?,
    ---    extensions: string[],
    ---    onload: (fun(ev: { file: file*, filename: string }): Sprite),
    ---    onsave: (fun(ev: { file: file*, filename: string }): boolean),
    ---}
    newFileFormat = function (self, init) end,
}
