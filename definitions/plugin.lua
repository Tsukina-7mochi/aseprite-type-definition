---@meta

---@class Plugin
local _plugin = {
    ---@type string
    name = nil,

    ---@type string
    displayName = nil,

    ---@type Version
    version = nil,

    ---@type string
    path = nil,

    ---@type table<string, any>
    preferences = nil,

    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---    onclick: fun(),
    ---    onenabled: fun(),
    ---    onchecked: fun(),
    ---}
    newCommand = function (self, init) end,

    ---@param init {
    ---    id: string,
    ---    title: string,
    ---    group: string,
    ---}
    newMenuGroup = function (self, init) end,

    ---@param options {
    ---    group: string,
    ---}
    newMenuSeparator = function (self, options) end,
}
