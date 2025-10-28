---@meta

---@class Brush
local _brush = {
    ---@type BrushType
    type = nil,

    ---@type integer
    size = nil,

    ---in degrees, from -180 to 180
    ---@type number
    angle = nil,

    ---@type Image
    image = nil,

    ---@type Point
    center = nil,

    ---@type BrushPattern
    pattern = nil,

    ---@type Point
    patternOrigin = nil,
}

---@return Brush
---@overload fun(size: Size): Brush
---@overload fun(image: Image): Brush
---@overload fun(init: {
---  type: BrushType,
---  size: integer,
---  angle: integer,
---  center: Point,
---  image: Image,
---  pattern: BrushPattern,
---  patternOrigin: Point ,
---}): Brush
function Brush () end
