---@meta

app.theme = {
    ---@type table<string, Color>
    color = nil,

    ---@type table<string, integer>
    dimension = nil,

    ---@param style_id string
    ---@return any
    styleMetrics = function (style_id) end,
}
