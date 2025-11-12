---@meta

---This class is used to represent the range of selected objects. It can be: A list of layers, A list of frames, A list of cels, A list of images, A list of colors, A list of slices. Or a combination of those.
---@class Range
local _range = {
    ---Returns a [RangeType](lua://RangeType#rangetype).
    ---@type RangeType
    type = nil,

    ---Returns true if the range is empty, i.e. there is no selected range in the timeline (a thick border in the timeline), only the [active cel](lua://app#appcel) in the sprite editor. This is the same as asking for `app.range.type == RangeType.EMPTY`. Note that if the range is empty, you can still use [Range.layers](lua://Range#rangelayers) to get the [active layer](lua://app#applayer) (the Range.layers property will be an array of one element, just the active layer). The same is true for [Range.frame](lua://Range#rangeframes) and [app.frame](lua://app#appframe), [Range.cel](lua://Range#rangecels) and [app.cel](lua://app#appcel), etc.
    ---@type boolean
    isEmpty = nil,

    ---[Sprite](lua://Sprite#sprite) to which this range is pointing to.
    ---@type Sprite
    sprite = nil,

    ---Returns or sets the array of selected [layers](lua://Layer#layer).
    ---@type Layer[]
    layers = nil,

    ---Returns or sets the array of selected [frames](lua://Frame#frame).
    ---@type Frame[]
    frames = nil,

    ---Returns an array of selected [cels](lua://Cel#cel).
    ---@type Cel[]
    cels = nil,

    ---Returns an array of selected [images](lua://Image#image) (images from linked cels are counted just one time in this array).
    ---@type Image[]
    images = nil,

    ---Returns an array of selected [images](lua://Image#image) in the range that are in unlocked layers (editable).
    ---@type Image[]
    editableImages = nil,

    ---Gets or sets the array of selected palette entries in the [color bar](https://www.aseprite.org/docs/color-bar/). Each element of the array is an integer (the palette index)
    ---@type integer[]
    colors = nil,

    ---Gets or sets the array of selected tile entries in the [color bar](https://www.aseprite.org/docs/color-bar/) when we are in a [tilemap layer](https://www.aseprite.org/docs/tilemap/). Each element of the array is an integer (the tile index).
    ---@type integer[]
    tiles = nil,

    ---Gets or sets the array of [selected slices](https://www.aseprite.org/docs/slices) in the sprite editor. Each element of the array is a [slice](lua://Slice#slice).
    ---@type Slice[]
    slices = nil,

    ---Returns true if the given object ([layer](lua://Layer#layer)/[frame](lua://Frame#frame)/[cel](lua://Cel#cel)/[slice](lua://Slice#slice)) is inside the selected range.
    ---@param object Layer | Frame | Cel | Slice
    ---@return boolean
    contains = function (self, object) end,

    ---Returns true if the given color index is selected in the [color bar](https://www.aseprite.org/docs/color-bar/).
    ---@param colorIndex integer
    ---@return boolean
    containsColor = function (self, colorIndex) end,

    ---Clears the current selected range of frames/layers/cels/colors.
    clear = function (self) end,
}
