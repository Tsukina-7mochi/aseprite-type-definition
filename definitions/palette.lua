---@meta

---@class Palette
---@operator len: integer
local _palette = {
    ---Changes the number of the palette colors to `ncolors` (an integer value).
    ---@param ncolors integer
    resize = function (self, ncolors) end,

    ---Returns the [color](lua://Color#color) in the given entry `index` (the `index` goes from `0` to `#palette-1`).
    ---@param index integer
    ---@return Color
    getColor = function (self, index) end,

    ---Changes a palette color in the given entry `index` (the `index` goes from `0` to `#palette-1`). The `color` can be a [Color](lua://Color#color) object or an [integer pixel value](lua://app#apppixelcolor).
    ---@param index integer
    ---@param color Color | integer
    setColor = function (self, index, color) end,

    ---At the moment it will always return the first [frame](lua://Frame#frame), but in the near future Aseprite will support palette changes over time (in different frames), so this field should be the frame number where the palette is displayed for the first time in the [sprite](lua://Sprite#sprite).
    ---@type Frame
    frame = nil,

    ---Saves the palette in the given `filename`.
    ---@param filename string
    saveAs = function (self, filename) end,
}

---Creates a new palette. By default it will contain 256 colors, but you can specify a `numberOfColors` (integer value). `otherPalette` can be another palette object to create a copy of it. If `fromFile` is given, the palette is loaded from the file name. If `fromResource` is given, the `resourceID` is an ID specified in one of the [extensions palette](https://github.com/aseprite/aseprite/tree/main/data/extensions) (e.g. [DB16](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L13), [DB32](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/dawnbringer-palettes/package.json#L14), [Solarized](https://github.com/aseprite/aseprite/blob/8e193b592ae06abb36be6f72ef43c308b511b24c/data/extensions/software-palettes/package.json#L15)).
---@return Palette
---@overload fun(ncolors: integer): Palette
---@overload fun(otherPalette: Palette): Palette
---@overload fun(options: { fromFile: string })
---@overload fun(options: { fromResource: string })
function Palette () end
