---@meta

---Type of [range](lua://Range#rangetype) selected in the timeline.
---@class RangeType
RangeType = {
    ---When there is no selection.
    ---@type RangeType
    EMPTY = nil,

    ---When the selection is in the layers.
    ---@type RangeType
    LAYERS = nil,

    ---When the selection is in the frames.
    ---@type RangeType
    FRAMES = nil,

    ---When the selection is in the cels.
    ---@type RangeType
    CELS = nil,
}
