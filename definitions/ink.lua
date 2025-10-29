---@meta

---More info about each ink type behavior at [https://www.aseprite.org/docs/ink/](https://www.aseprite.org/docs/ink/).
---@class Ink
Ink = {
    ---Value `0` or `"simple"` string.
    ---@type Ink
    SIMPLE = nil,

    ---Value `1`, `"alpha_compositing"`, or `"alpha-compositing"`.
    ---@type Ink
    ALPHA_COMPOSTING = nil,

    ---Value `2`, `"copy_color"`, or `"copy-color"`.
    ---@type Ink
    COPY_COLOR = nil,

    ---Value `3`, `"lock_alpha"`, or `"lock-alpha"`.
    ---@type Ink
    LOCK_ALPHA = nil,

    ---Value `4`, or `"shading"`.
    ---@type Ink
    SHADING = nil,
}
