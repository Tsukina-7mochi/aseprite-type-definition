---@meta

app.fs = {
    ---@type "/" | "\\"
    pathSeparator = nil,

    ---@param fn string
    ---@return string
    filePath = function (fn) end,

    ---@param fn string
    ---@return string
    fileName = function (fn) end,

    --- @param fn string
    ---@return string
    fileExtension = function (fn) end,

    ---@param fn string
    ---@return string
    fileTitle = function (fn) end,

    ---@param fn string
    ---@return string
    filePathAndTitle = function (fn) end,

    ---@param path string
    ---@return string
    normalizePath = function (path) end,

    ---@param ... string
    ---@return string
    joinPath = function (...) end,

    ---@type string
    currentPath = nil,

    ---@type string
    appPath = nil,

    ---@type string
    tempPath = nil,

    ---@type string
    userDocsPath = nil,

    ---@type string
    userConfigPath = nil,

    ---@param fn string
    ---@return boolean
    isFile = function (fn) end,

    ---@param fn string
    ---@return boolean
    isDirectory = function (fn) end,

    ---@param fn string
    ---@return integer
    fileSize = function (fn) end,

    ---@param path string
    ---@return string[]
    listFiles = function (path) end,

    ---@param path string
    ---@return boolean
    makeDirectory = function (path) end,

    ---@param path string
    ---@return boolean
    makeAllDirectories = function (path) end,

    ---@param path string
    ---@return boolean
    removeDirectory = function (path) end,
}
