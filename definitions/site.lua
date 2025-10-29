---@meta

---This is an object that saves the active state of the editor in a specific moment. Which active sprite, layer, frame, cel, image, etc. were in a specific moment. If you save the object: `local site = app.site` The `site` object will not be updated if the active sprite is modified.
---@class Site
local _site = {
    ---Gets the [active sprite](lua://app#appsprite) at the time the site object was created.
    ---@type Sprite
    sprite = nil,

    ---Gets the [active layer](lua://app#applayer) at the time the site object was created.
    ---@type Layer
    layer = nil,

    ---Gets the [active cel](lua://app#appcel) at the time the site object was created.
    ---@type Cel
    cel = nil,

    ---Gets the [active frame](lua://app#appframe) at the time the site object was created.
    ---@type Frame
    frame = nil,

    ---Gets the active frame number (an integer value, 1 is the first frame). Same as [app.site.frame.frameNumber](lua://Site#siteframe).
    ---@type integer
    frameNumber = nil,

    ---Gets the [active image](lua://app#appimage) at the time the site object was created.
    ---@type Image
    image = nil,

    ---Gets [TilemapMode](lua://TilemapMode#tilemapmode). On non-tilemap layers, this field returns 0.
    ---@type TilemapMode | 0
    tilemapMode = nil,

    ---Gets [TilesetMode](lua://TilesetMode#tilesetmode). On non-tilemap layers, this field returns 0.
    ---@type TilesetMode | 0
    tilesetMode = nil,
}
