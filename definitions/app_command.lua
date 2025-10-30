---@meta

---Executes the given command named `CommandName` with the specified parameters.
---
---If the command fails to run or is disabled, it will return `false`.
---To check if a command is enabled and can be run, you can use `app.command.[COMMAND NAME].enabled` before calling it.
---@type table<string, any>
app.command = {}
