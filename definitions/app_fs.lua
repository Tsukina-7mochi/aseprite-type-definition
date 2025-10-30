---@meta

---A set of functions to handle file names and the file system.
app.fs = {
    ---Returns the preferred path separator of the current platform, it is `/` on macOS and Linux, and `\` on Windows. Preferably you should use [app.fs.joinPath()](lua://app.fs.joinPath).
    ---@type "/" | "\\"
    pathSeparator = nil,

    ---Returns the path/directory part (as a string) of the given filename `fn`.
    ---@param fn string
    ---@return string
    filePath = function (fn) end,

    ---Returns the file name (including the extension part) of the given filename `fn`.
    ---@param fn string
    ---@return string
    fileName = function (fn) end,

    ---Returns the file extension (without including the `.`) of the given filename `fn`.
    ---@param fn string
    ---@return string
    fileExtension = function (fn) end,

    ---Returns the file title (without including the path nor the extension) of the given filename `fn`.
    ---@param fn string
    ---@return string
    fileTitle = function (fn) end,

    ---Returns the file path [joined](lua://app.fs.joinPath) with the title (without including the extension) of the given filename `fn`.
    ---@param fn string
    ---@return string
    filePathAndTitle = function (fn) end,

    ---Returns the file path converted to a canonical form for the current platform.
    ---@param path string
    ---@return string
    normalizePath = function (path) end,

    ---Can accept any number of string arguments to join together with the path separator for the current platform.
    ---@param ... string
    ---@return string
    joinPath = function (...) end,

    ---Returns the path the Aseprite executable was launched from.
    ---@type string
    currentPath = nil,

    ---Returns the installation path of Aseprite for the current platform.
    ---@type string
    appPath = nil,

    ---Returns the path for temporary files for the current platform.
    ---
    ---On macOS or Linux it will be `/tmp`, and Windows it will look like `C:\Users\username\AppData\Local\Temp\`.
    ---@type string
    tempPath = nil,

    ---Returns the current user's Documents path for the current platform.
    ---
    ---Depending on the platform, this may return the user's home directory.
    ---@type string
    userDocsPath = nil,

    ---Returns the current user's Aseprite configuration path for the current platform.
    ---
    ---You can learn about the specific location of this folder [from the Aseprite documentation](https://www.aseprite.org/docs/preferences-folder/).
    ---@type string
    userConfigPath = nil,

    ---Returns true if the given filename `fn` is a file.
    ---@param fn string
    ---@return boolean
    isFile = function (fn) end,

    ---Returns true if the given filename `fn` is a directory.
    ---@param fn string
    ---@return boolean
    isDirectory = function (fn) end,

    ---Returns the file size of the given filename `fn`.
    ---@param fn string
    ---@return integer
    fileSize = function (fn) end,

    ---Returns a list of files in the given directory `path`. The returned value is a table where each element is a file name, each file name is relative to the given `path`, they are not full path file names.
    ---@param path string
    ---@return string[]
    listFiles = function (path) end,

    ---Create one directory.
    ---
    ---Returns `true` if the directory was created.
    ---@param path string
    ---@return boolean
    makeDirectory = function (path) end,

    ---Create all directories needed to access to the `path`, so path could be `dir1/dir2/dir3` and the whole hierarchy of directories will be created.
    ---
    ---Returns `true` if all the directories were created.
    ---@param path string
    ---@return boolean
    makeAllDirectories = function (path) end,

    ---Remove the given directory (it must be empty).
    ---
    ---Returns `true` if the directory was removed (or is already removed).
    ---@param path string
    ---@return boolean
    removeDirectory = function (path) end,
}
