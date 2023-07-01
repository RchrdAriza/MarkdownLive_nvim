local defaults = {
    use_notify = false,
    port = 5500
}

local function setup(user_options)
  -- Mezclar las opciones del usuario con las opciones por defecto
  local options = vim.tbl_extend("force", defaults, user_options or {})
  -- Usar las opciones para modificar el comportamiento de la función start_grip
  -- ...
end

local function start_grip()
  -- Obtener las opciones de usar notify y el puerto desde la tabla de opciones
  local use_notify = options.use_notify
  local port = options.port
  -- Usar esas opciones para iniciar el servidor grip
  vim.cmd("silent !grip -b % :".. port .. ">/dev/null &")
  local address = "localhost"
  local message = "Grip starting at http://" .. address .. ":" .. port
  -- Usar o no el plugin notify según la opción
  if use_notify then
    local notify = require("notify")
    notify(message)
  else
    vim.api.nvim_echo({{message}}, true, {})
  end
end

return {
  setup = setup,
  start_grip = start_grip
}

vim.cmd('command Startg lua start_grip()')
vim.cmd('command Stopg lua stop()')
