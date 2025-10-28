---@meta

json = {
    ---@param jsonText string
    ---@return any
    decode = function (jsonText) end,

    ---@param luaTable any
    ---@return string
    encode = function (luaTable) end,
}
