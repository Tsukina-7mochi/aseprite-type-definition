---@meta

---A set of functions to handle the clipboard.
---
---When calling a function with clipboard write access in a script, Aseprite will ask the user if they want to allow the function to run or stop the script.
app.clipboard = {
    ---Gets or sets the clipboard text. Returns `nil` if there is no text.
    ---@type string | nil
    text = nil,

    ---Gets or sets the clipboard [image](lua://Image). Returns `nil` if there is no image. It is recommended to set/get the value once when needed, as the operation may not always be available immediately (in some instances it may take a few milliseconds, see [#5341](https://github.com/aseprite/aseprite/issues/5341#issuecomment-3176395116)).
    ---
    ---Additionally, when calling a method on an image from the clipboard image, the image should be saved to a variable first, instead of calling the method directly on the property (this will not work: `app.clipboard.image:clear()`, see [#5341](https://github.com/aseprite/aseprite/issues/5341#issuecomment-3176395116))
    ---@type Image | nil
    image = nil,

    ---Gets the content of the clipboard, as a table.
    ---@type {
    ---  image: Image | nil,
    ---  selection: Selection | nil,
    ---  palette: Palette | nil,
    ---  tileset: Tileset | nil,
    ---  text: string | nil,
    ---}
    content = nil,

    ---Returns true if the last item copied to the clipboard was text.
    ---@type boolean
    hasText = nil,

    ---Returns true if the last item copied to the clipboard was an [image](lua://Image).
    ---@type boolean
    hasImage = nil,

    ---Clears the clipboard.
    clear = function () end,
}
