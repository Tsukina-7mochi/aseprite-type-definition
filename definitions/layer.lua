---@meta

---Layers are arranged as a stack within a sprite. Layers may nest within each other to form a hierarchy. Layers that accept children are group layers.
---@class Layer
local _layer = {
    ---Gets the [sprite](lua://Sprite) to which this layer belongs.
    ---@type Sprite
    sprite = nil,

    ---Gets or sets the layer name, a `string`.
    ---@type string
    name = nil,

    ---Gets or sets the layer opacity, a value from `0` to `255`. The layer is completely transparent when the value is `0`; opaque when the value is `255`. When the layer is a [background](lua://Layer.isBackground), returns `255`.
    ---@type integer?
    opacity = nil,

    ---Gets or sets the layer blending mode (how colors are blend with the layer below). It's expressed as an integer or a value from the [BlendMode](lua://BlendMode) enumeration.
    ---@type BlendMode?
    blendMode = nil,

    ---If a layer is a [group](lua://Layer.isGroup), gets the `table` of child layers for which the group serves as a [parent](lua://Layer.parent). If the layer is not a group, returns `nil`.
    ---@type Layer[] | nil
    layers = nil,

    ---Gets or sets the layer's parent. The parent may be either a [sprite](lua://Sprite) or a [group](lua://Layer.isGroup) layer.
    ---@type Sprite | Layer
    parent = nil,

    ---Gets or sets the layer's index in its parent's layers `table`. In other words, this is the layer's place in the local stack. Layers stack in descending order. For example, a layer with index `1` will lie beneath a layer with index `2`, assuming the layers share the same parent.
    ---@type integer
    stackIndex = nil,

    ---Returns the [uuid](lua://Uuid) of the layer.
    ---@type Uuid
    uuid = nil,

    ---Gets whether or not the layer contains [cels](lua://Cel) with [images](lua://Image).
    ---@type boolean
    isImage = nil,

    ---Gets whether or not the layer is a group and *has the capacity* to be a parent to other layers. A layer may be a group, yet have no children; in such a case, its [layers](lua://Layer.layers) property will return a table of zero length.
    ---@type boolean
    isGroup = nil,

    ---Returns true if the layer is a tilemap (contains a [tileset](lua://Layer.tileset))
    ---@type boolean
    isTilemap = nil,

    ---Gets whether or not a layer supports transparency. The opposite of the property [Layer.isBackground](lua://Layer.isBackground). For [indexed color mode](lua://ColorMode.INDEXED), the layer may contain images with a [transparent color](lua://ImageSpec.transparentColor) index. For RGB or grayscale color mode, the layer may contain images with an alpha channel.
    ---@type boolean
    isTransparent = nil,

    ---Gets whether or not a layer is a background. The opposite of the property [Layer.isTransparent](lua://Layer.isTransparent). Background layers do not contain images which support transparency. Returns `false` if the layer is a [group](lua://Layer.isGroup).
    ---@type boolean
    isBackground = nil,

    ---Gets or sets whether a layer is editable, unlocked in other words.
    isEditable = nil,

    ---Gets or sets whether or not the layer is visible.
    ---@type boolean
    isVisible = nil,

    ---Gets or sets whether a layer biases toward linked [cels](lua://Cel) when a new cel is created in the timeline.
    ---@type boolean
    isContinuous = nil,

    ---Gets or sets whether or not a [group](lua://Layer.isGroup) layer is collapsed, i.e., whether its child layers are hidden in the timeline. The opposite of the property [Layer.isExpanded](lua://Layer.isExpanded).
    ---@type boolean
    isCollapsed = nil,

    ---Gets or sets whether or not a [group](lua://Layer.isGroup) layer is expanded, meaning whether its child layers are visible in the timeline. The opposite of the property [Layer.isCollapsed](lua://Layer.isCollapsed).
    ---@type boolean
    isExpanded = nil,

    ---Gets whether or not the layer is a reference layer. You cannot change the value of this property.
    ---@type boolean
    isReference = nil,

    ---Gets a `table` of [cels](lua://Cel) in the layer. If the layer is a [group](lua://Layer.isGroup), this property will return a table of zero length.
    ---@type Cel[]
    cels = nil,

    ---Gets or sets the user-defined [color](lua://Color) of this layer in the timeline.
    ---@type Color
    color = nil,

    ---Gets or sets the user-defined data related to this layer (a text string).
    ---@type string
    data = nil,

    ---Access user-defined and extension-defined [properties](lua://Properties) of this layer.
    ---@type table<string, any>
    ---@overload fun(pluginKey: string): table<string, any>
    properties = nil,

    ---Returns a [cel](lua://Cel), if any, at the intersection of the layer and a frame. The frame may be either a [frame](lua://Frame) object or its [frame number](lua://Frame.frameNumber), an integer. If there is no cel at that intersection, returns `nil`.
    ---@param frame integer | Frame
    ---@return Cel | nil
    cel = function (self, frame) end,

    ---@type Tileset | nil
    tileset = nil,
}
