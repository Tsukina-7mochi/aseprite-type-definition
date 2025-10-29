---@meta

---An object that allows for [nine-slice scaling](https://en.wikipedia.org/wiki/9-slice_scaling). It can be created with the slice tool or with [Sprite:newSlice](lua://Sprite#spritenewslice).
---@class Slice
local _slice = {
    ---Gets or sets a slice's bounding [rectangle](lua://Rectangle#rectangle).
    ---@type Rectangle
    bounds = nil,

    ---Gets or sets the central [rectangle](lua://Rectangle#rectangle) of a slice's nine-slice. The getter returns `nil` when nine-slicing is inactive in Aseprite's user interface. The rectangle's top-left corner is defined in local coordinates.
    ---@type Rectangle | nil
    center = nil,

    ---Gets or sets the user-defined [color](lua://Color#color) of this slice in the timeline.
    ---@type Color
    color = nil,

    ---Gets or sets the user-defined data related to this slice, a `string`.
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties#properties) of this slice.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---Gets or sets the a slice's name, a `string`.
    ---@type string
    name = nil,

    ---Gets or sets the slice's pivot, a [point](lua://Point#point). The getter returns `nil` when the pivot is inactive in Aseprite's user interface. The pivot is defined in local coordinates relative to the slice's top-left corner.
    ---@type Point | nil
    pivot = nil,

    ---Gets the [sprite](lua://Sprite#sprite) to which a slice belongs.
    ---@type Sprite
    sprite = nil,
}
