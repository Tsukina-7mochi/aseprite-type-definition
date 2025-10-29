---@meta

---References a drawing tool. At the moment this class is used only to get and set the active tool ([app.tool](lua://app.tool)), or to paint on the canvas (`tool` parameter in [app.useTool()](lua://app.useTool)). If a function receives a tool, it can receive a tool ID too.
---@class Tool
local _tool = {
    ---Returns the identifier (a string) of the specified in the [gui.xml](https://github.com/aseprite/aseprite/blob/main/data/gui.xml) file ([example](https://github.com/aseprite/aseprite/blob/20618ff321ae4e73a4f5d6bfd9ef6f2cd8925b7a/data/gui.xml#L1065)).
    ---@type string
    id = nil,
}
