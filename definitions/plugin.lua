---@meta

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

    ---Creates a new command that can be associated to keyboard shortcuts and it's added in the app menu in the specific `"group"`. Groups are defined in the [gui.xml file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element. `onclick`: Function to be called when the command is executed (clicked or an associated keyboard shortcut pressed). `onenabled`: Optional function to know if the command should be available (enabled or disabled). It should return true if the command can be executed right now. If this function is not specified, the command will always be available to be executed by the user. `onchecked`: Optional function to know if the command should be checked or not. The function is called every time the command is displayed in a menu (e.g: a dropdown is opened). It should return true if it is checked. If this function is not specified, the command will be unchecked.
    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---    onclick: fun(),
    ---    onenabled: fun(),
    ---    onchecked: fun(),
    ---}
    newCommand = function (self, init) end,

    ---Creates a new menu item which will contain a submenu grouping several plugin commands. `id`: ID to identify this new menu group in [Plugin:newCommand{ ..., group=id, ... }](lua://Plugin#pluginnewcommand) calls to add several command/menu items as elements of this group submenu. `group`: In which existent group we should add this new menu item. Existent app groups are defined in the [gui.xml file](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) inside the `<menus>` element.
    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---}
    newMenuGroup = function (self, init) end,

    ---Creates a menu separator in the given menu group, useful to separate several [Plugin:newCommand](lua://Plugin#pluginnewcommand).
    ---@param options {
    ---    group: string,
    ---}
    newMenuSeparator = function (self, options) end,
}
