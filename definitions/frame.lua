---@meta

---This is an auxiliary object that points to a given frame in the sprite and can be used to adjust information about that frame. If you modify the number of frames in the sprite, or the structure of the frames, a `Frame` object will still pointing to the same frame number.
---@class Frame
local _frame = {
    ---Returns the [sprite](lua://Sprite) of this frame.
    ---@type Sprite
    sprite = nil,

    ---Returns the frame number. `1` is the first frame in the animation and this `frame` is equal to `frame == frame.sprite.frames[frameNumber]`.
    ---@type integer
    frameNumber = nil,

    ---Gets or sets the duration of this frame in the animation in seconds. E.g. `0.3333` means that this frame will be `1/3` of a second in the screen when the animation is being played.
    ---@type number
    duration = nil,

    ---Returns `Frame` object in the previous frame number or `nil` if this is the first frame.
    ---@type Frame | nil
    previous = nil,

    ---Returns `Frame` object in the next frame number or `nil` if this is the last frame.
    ---@type Frame | nil
    next = nil,
}
