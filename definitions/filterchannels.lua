---@meta

---@class FilterChannels
---@operator bor(FilterChannels): FilterChannels
FilterChannels = {
    ---@type FilterChannels
    RED = nil,

    ---@type FilterChannels
    GREEN = nil,

    ---@type FilterChannels
    BLUE = nil,

    ---@type FilterChannels
    ALPHA = nil,

    ---@type FilterChannels
    GRAY = nil,

    ---@type FilterChannels
    INDEX = nil,

    ---Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE`.
    ---@type FilterChannels
    RGB = nil,

    ---Same as `FilterChannels.RED | FilterChannels.GREEN | FilterChannels.BLUE | FilterChannels.ALPHA`.
    ---@type FilterChannels
    RGBA = nil,

    ---Same as `FilterChannels.GRAY | FilterChannels.ALPHA`.
    ---@type FilterChannels
    GRAYA = nil,
}
