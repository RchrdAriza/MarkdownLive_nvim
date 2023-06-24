### Requirements
- grip
- pip
- [notify](https://github.com/rcarriga/nvim-notify) (optional)
- [which-key](https://github.com/folke/which-key.nvim) (optional)

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
  -- You can change the port as you wish
  local port = 5500
  vim.cmd("silent !grip -b % :".. port .. ">/dev/null &")

  local address = "localhost"
 
  local message = "Grip starting at http://" .. address .. ":" .. port
  -- In case you have the notify plugin installed uncomment the following lines
  -- local notify = require("notify")
  -- vim.notify(message)
  vim.api.nvim_echo({{message}}, true, {}) 
end
```
```* To stop grip```
```lua
function stop()
  vim.cmd('silent !pkill -f grip')
  
  -- In case you have the notify plugin installed uncomment the following lines
  -- local notify = require("notify")
  -- vim.notify('Grip has stopped')
  local message = "Grip has stopped"
  vim.api.nvim_echo({{message}}, true, {}) 
end 
```
To use the functions you can call them from the neovim command line like this:
```:lua start_grip()``` to start grip.

```:lua stop()``` to stop grip

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



