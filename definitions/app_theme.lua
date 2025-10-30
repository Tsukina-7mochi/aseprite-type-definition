---@meta

---Access information about the current theme.
app.theme = {
    ---The [color](lua://Color) can be used to paint in an [Image](lua://Image) or a [GraphicsContext](lua://GraphicsContext).
    ---@type table<string, Color>
    color = nil,

    ---Returns a number identified in the dimensions of the theme.
    ---@type table<string, integer>
    dimension = nil,

    ---Returns information about the given style ID (`style_id` must be a string). The returned information at the moment includes a `border` field which is a table with `left`/`top`/`right`/`bottom` border dimension in pixels (they already have [app.uiScale](lua://app.uiScale) applied).
    ---@param style_id string
    ---@return any
    styleMetrics = function (style_id) end,
}
