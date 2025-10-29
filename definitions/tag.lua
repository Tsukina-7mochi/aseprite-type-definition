---@meta

---Represents [a tag in the timeline](https://www.aseprite.org/docs/tags/).
---@class Tag
local _tag = {
    ---Returns the sprite to which this tag belongs.
    ---@type Sprite
    sprite = nil,

    ---Returns the first [Frame](lua://Frame#frame) object where this tag starts. Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number instead of a `Frame` object.
    ---@type Frame
    fromFrame = nil,

    ---Returns the last [Frame](lua://Frame#frame) object where this tag ends. Note: Old versions (Aseprite v1.2.10-beta2) returned a frame number instead of a `Frame` object.
    ---@type Frame
    toFrame = nil,

    ---Returns the number of frames that this tag contain. Equal to: `local frames = tag.toFrame.frameNumber - tag.fromFrame.frameNumber + 1`
    ---@type integer
    frames = nil,

    ---Gets or sets the name of the tag (a string).
    ---@type string
    name = nil,

    ---Gets or sets the *[Animation Direction](https://www.aseprite.org/docs/tags/)* property of the tag.
    ---@type AniDir
    aniDir = nil,

    ---Gets or sets the user-defined [color](lua://Color#color) of this tag in the timeline.
    ---@type Color
    color = nil,

    ---Gets or sets the number of times the tag is repeated/looped. `0` = Doesn't specify, plays infinite in UI, once on export, for ping-pong it plays once in each direction. `1` = Plays once, for ping-pong it plays just in one direction. `2` = Plays twice, for ping-pong it plays once in each direction, and once in reverse. `n` = Plays N times
    ---@type integer
    repeats = nil,

    ---Gets or sets the user-defined data related to this tag, a `string`.
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties#properties) of this tag.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,
}
