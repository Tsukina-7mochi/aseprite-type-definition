---@meta

app.preferences = {
    ---@type table<string, any>
    section = nil,

    ---@param tool Tool
    ---@return { section: table<string, any> }
    tool = function (tool) end,

    ---@param sprite Sprite
    ---@return { section: table<string, any> }
    document = function (sprite) end,
}
