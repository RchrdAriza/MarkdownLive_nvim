### Requirements
- grip
- pip
- [notify](https://github.com/rcarriga/nvim-notify) (Required)
- [which-key](https://github.com/folke/which-key.nvim) (Optional)

Install grip using the python ```pip``` package manager using the following command:
```lua
-- python
pip install grip

-- python3
pip3 install grip
```
Copy the following functions to your neovim configuration file:

```* To start the grip```
```lua
function start_grip()
  local function command_exists(command)
    local handle = io.popen("command -v " .. command)
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end

  if command_exists("grip") then
    -- You can change the port as you wish
    local port = 5500
    vim.cmd("silent !grip -b % :".. port .. ">/dev/null &")

    local address = "localhost"

    local message = "Grip starting at http://" .. address .. ":" .. port
    local notify = require("notify")
    vim.notify(message)
  else

     local notify = require("notify")
     notify("Grip is not installed", "error")

  end
end

vim.cmd('command Startg lua start_grip()') -- to start grip

```
```* To stop grip```
```lua
function stop()
  vim.cmd('silent !pkill -f grip')

  local notify = require("notify")
  vim.notify('Grip has stopped')
end

vim.cmd('command Stopg lua stop()') -- to stop grip

```
To use the functions you can call them from the neovim command line like this:

```:Startg``` to start grip.

```:Stopg``` to stop grip

## Optional configuration

You can use the <a href='https://github.com/folke/which-key.nvim' target='_blank'>which-key</a> plugin to facilitate the use of the functions by adding the following lines to your which-key configuration:
```lua
-- To create a new option group
require("which-key").register({
  ["<leader>M"] = {
    name = "Markdown",
    l = { "<cmd>lua start_grip()<cr>", "Start grip" },
    s = { "<cmd>lua stop()<cr>", "Stop grip"}
  },
})
```

You may also be interested in: [LiveServer_nvim](https://www.github.com/RchrdAriza/LiveServer_nvim)

Alternatively you can use my neovim configuration, which already has this function and others. [here](https://www.github.com/RchrdAriza/NvimOnMy_Way)
