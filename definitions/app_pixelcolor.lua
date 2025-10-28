---@meta

app.pixelColor = {
    ---@param red integer
    ---@param green integer
    ---@param blue integer
    ---@return integer
    ---@overload fun(red: integer, green: integer, blue: integer, alpha: integer): integer
    rgba = function (red, green, blue) end,

    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaR = function (rgbaPixelValue) end,

    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaG = function (rgbaPixelValue) end,

    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaB = function (rgbaPixelValue) end,

    ---@param rgbaPixelValue integer
    ---@return integer
    rgbaA = function (rgbaPixelValue) end,

    ---@param gray integer
    ---@return integer
    ---@overload fun(gray: integer, alpha: integer): integer
    graya = function (gray) end,

    ---@param grayaPixelValue integer
    ---@return integer
    grayaV = function (grayaPixelValue) end,

    ---@param grayaPixelValue integer
    ---@return integer
    grayaA = function (grayaPixelValue) end,
}
