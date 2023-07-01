" Cargar el código Lua del plugin grip
lua << EOF
local grip = require('grip')

" Definir un comando personalizado para iniciar el servidor grip
command! StartGrip lua grip.start_grip()

" Definir un comando personalizado para detener el servidor grip
command! StopGrip lua grip.stop()

" Configurar las opciones del plugin
lua << EOF
grip.setup({
  use_notify = v:false,  " Establecer si se usa la notificación
  port = 5500  " Establecer el puerto del servidor grip
})
EOF

