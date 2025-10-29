---@meta

---A [cel](https://www.aseprite.org/docs/cel/) is an [image](lua://Cel.image) in a specific [*xy*-coordinate](lua://Cel.position), and a specific [layer](lua://Cel.layer)/[frame](lua://Cel.frame) combination.
---@class Cel
local _cel = {
    ---Cels belong to one [sprite](lua://Sprite). This property returns that sprite.
    ---@type Sprite
    sprite = nil,

    ---Returns the [layer](lua://Layer) where this cel is located.
    ---@type Layer
    layer = nil,

    ---Returns the [frame](lua://Frame) object which this cel belongs. If you set this property, the cel will be moved to the given frame (if another cel already exists in that frame, it will be removed).
    ---@type Frame
    frame = nil,

    ---Returns the frame number which this cel belongs, the frame number `1` is the first frame (not `0`). If you set this property the cel will be moved to the given `frameNumber`, check the notes of [Cel.frame](lua://Cel.frame).
    ---@type integer
    frameNumber = nil,

    ---Gets or sets the [image](lua://Image) with the pixels of this cel. This is the preferred way to replace the cel image, because it generates only one undoable action.
    ---@type Image
    image = nil,

    ---Returns the [rectangle](lua://Rectangle) with the cel bounds (position and size).
    ---@type Rectangle
    bounds = nil,

    ---Gets or sets the cel position.
    ---@type Point
    position = nil,

    ---Gets or sets the cel opacity. A value from `0` to `255` (which means `0=0%` completely transparent, or `255=100%` completely opaque).
    ---@type integer
    opacity = nil,

    ---Gets or sets the cel z-index value. By default `0`, which means "show this cel in the same position as its layer", but can be modified to positive values to move the cel to the front, or negative values to move it to the back.
    ---@type integer
    zIndex = nil,

    ---Gets or sets the user-defined [color](lua://Color) of this cel in the timeline.
    ---@type Color
    color = nil,

    ---Gets or sets the user-defined data related to this cel (a text string).
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties) of this cel.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
