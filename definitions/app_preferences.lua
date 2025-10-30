---@meta

---Gets or sets the given preference `option` in the given `section`.
app.preferences = {
    ---@type table<string, any>
    section = nil,

    ---Returns the preferences of the given [tool](lua://Tool).
    ---@param tool Tool
    ---@return { section: table<string, any> }
    tool = function (tool) end,

    ---Returns the preferences of the given [sprite](lua://Sprite).
    ---@param sprite Sprite
    ---@return { section: table<string, any> }
    document = function (sprite) end,
}
