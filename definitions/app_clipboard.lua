---@meta

app.clipboard = {
    ---@type string | nil
    text = nil,

    ---@type Image | nil
    image = nil,

    ---@type {
    ---  image: Image | nil,
    ---  selection: Selection | nil,
    ---  palette: Palette | nil,
    ---  tileset: Tileset | nil,
    ---  text: string | nil,
    ---}
    content = nil,

    ---@type boolean
    hasText = nil,

    ---@type boolean
    hasImage = nil,

    clear = function () end,
}
