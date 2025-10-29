---@meta

---Since **Aseprite v1.3-rc5** you have this `json` global namespace. It provides a couple of functions to decode JSON objects from strings to Lua objects/tables and viceversa.
json = {
    ---Parses the given `jsonText` and returns a Lua table-like object `jsonObj` that represents the given data.
    ---@param jsonText string
    ---@return any
    decode = function (jsonText) end,

    ---Converts the given Lua-table into a JSON text.
    ---@param luaTable any
    ---@return string
    encode = function (luaTable) end,
}
