# Actors Task

| Nombre | Código | Uniandes |
|--------|--------|---------|
| Esteban Gonzalez Ruales | 202021225 | e.gonzalez5 |
| Juan Diego Yepes | 202022391 | j.yepes |
| Felipe Nuñez | 202021673 | f.nunez |


## 1. Descripción

Para esta tarea, desarrollamos una sala de chat. El comportamiento de la sala de chat es bastante sencillo. En primer lugar, los usuarios pueden unirse en cualquier momento y obtener acceso inmediato a los mensajes publicados a partir de ese momento. En segundo lugar, cualquier usuario puede enviar mensajes en la sala de chat. Por último, en cualquier momento, los usuarios pueden salir de la sala de chat y dejar de recibir mensajes. Para esta tercera parte, utilizamos actores para implementar la sala de chat.

En este documento se encuentran las instrucciones sobre cómo ejecutarlo y un programa de ejemplo para la ejecución. De igual forma, se incluye un documento `REPORT.pdf` con el análisis de la implementación (e implentaciones pasadas) con el fin de hacer una reflexion sobre los diferentes modelos de concurrencia implementados sobre el problema de la sala de chat.

## 2. Instrucciones

Para ejecutar el programa, se debe tener instalado Elixir. Luego, se debe abrir la consola interactiva de elixir usando el comando `iex`. Una vez en la consola, este es el comando para ejecutar el programa:

```elixir
iex(1)> c "chat.ex"
[Chat]

iex(2)> Chat.start()
```

El archivo `chat.ex` contiene la implementación de la sala de chat utilizando actores, de igual forma, la ejecución se activa al llamar a la función `start()`. 

## 3. Ejemplo de ejecución


```elixir
iex(2)> Chat.start


-------------------------
Messages as seen by user: Nicolas
["Nicolas: Looking forward to some interesting conversations!",
 "--- Emma joined the chat ---",
 "Emma: Looking forward to some interesting conversations!",
 "--- Liam joined the chat ---", "Liam: This chatroom looks cool!",
 "--- Olivia joined the chat ---",
 "Olivia: Looking forward to some interesting conversations!",
 "--- Noah joined the chat ---", "Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!", "--- Emma left the chat ---",
 "Nicolas: I think I'll stay a while.", "Liam: This chatroom looks cool!",
 "Noah: Hey everyone, I'm here!", "Olivia: This chatroom is awesome!"]


-------------------------
Messages as seen by user: Emma
["Emma: Looking forward to some interesting conversations!",
 "--- Liam joined the chat ---", "Liam: This chatroom looks cool!",
 "--- Olivia joined the chat ---",
 "Olivia: Looking forward to some interesting conversations!",
 "--- Noah joined the chat ---", "Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!"]


-------------------------
Messages as seen by user: Liam
["Liam: This chatroom looks cool!", "--- Olivia joined the chat ---",
 "Olivia: Looking forward to some interesting conversations!",
 "--- Noah joined the chat ---", "Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!", "--- Emma left the chat ---",
 "Nicolas: I think I'll stay a while.", "Liam: This chatroom looks cool!",
 "Noah: Hey everyone, I'm here!", "Olivia: This chatroom is awesome!",
 "--- Nicolas left the chat ---", "Liam: I hope to make some friends here.",
 "Olivia: I'm excited to be here!", "Noah: Hey everyone, I'm here!",
 "Noah: I'm new here, what's up?",
 "Liam: Looking forward to some interesting conversations!",
 "Olivia: I think I'll stay a while.",
 "Olivia: Looking forward to some interesting conversations!",
 "Liam: I'm having a great time!", "Noah: This chatroom is awesome!",
 "Liam: Hey everyone, I'm here!", "Olivia: I'm new here, what's up?",
 "Noah: I'm new here, what's up?"]


-------------------------
Messages as seen by user: Olivia
["Olivia: Looking forward to some interesting conversations!",
 "--- Noah joined the chat ---", "Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!", "--- Emma left the chat ---",
 "Nicolas: I think I'll stay a while.", "Liam: This chatroom looks cool!",
 "Noah: Hey everyone, I'm here!", "Olivia: This chatroom is awesome!",
 "--- Nicolas left the chat ---", "Liam: I hope to make some friends here.",
 "Olivia: I'm excited to be here!", "Noah: Hey everyone, I'm here!",
 "Noah: I'm new here, what's up?",
 "Liam: Looking forward to some interesting conversations!",
 "Olivia: I think I'll stay a while.",
 "Olivia: Looking forward to some interesting conversations!",
 "Liam: I'm having a great time!", "Noah: This chatroom is awesome!",
 "Liam: Hey everyone, I'm here!", "Olivia: I'm new here, what's up?",
 "Noah: I'm new here, what's up?", "--- Liam left the chat ---"]


-------------------------
Messages as seen by user: Noah
["Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!", "--- Emma left the chat ---",
 "Nicolas: I think I'll stay a while.", "Liam: This chatroom looks cool!",
 "Noah: Hey everyone, I'm here!", "Olivia: This chatroom is awesome!",
 "--- Nicolas left the chat ---", "Liam: I hope to make some friends here.",
 "Olivia: I'm excited to be here!", "Noah: Hey everyone, I'm here!",
 "Noah: I'm new here, what's up?",
 "Liam: Looking forward to some interesting conversations!",
 "Olivia: I think I'll stay a while.",
 "Olivia: Looking forward to some interesting conversations!",
 "Liam: I'm having a great time!", "Noah: This chatroom is awesome!",
 "Liam: Hey everyone, I'm here!", "Olivia: I'm new here, what's up?",
 "Noah: I'm new here, what's up?", "--- Liam left the chat ---",
 "--- Olivia left the chat ---", "Noah: I'm having a great time!",
 "Noah: This chatroom is awesome!", "Noah: I hope to make some friends here.",
 "Noah: I'm here to chat and have fun!",
 "Noah: I hope to make some friends here.", "Noah: This chatroom seems lively!",
 "Noah: Let's make this chatroom even better!",
 "Noah: Looking forward to some interesting conversations!",
 "Noah: This chatroom looks cool!", "Noah: I'm here to chat and have fun!"]


-------------------------
All messages
["--- Nicolas joined the chat ---",
 "Nicolas: Looking forward to some interesting conversations!",
 "--- Emma joined the chat ---",
 "Emma: Looking forward to some interesting conversations!",
 "--- Liam joined the chat ---", "Liam: This chatroom looks cool!",
 "--- Olivia joined the chat ---",
 "Olivia: Looking forward to some interesting conversations!",
 "--- Noah joined the chat ---", "Noah: I'm excited to be here!",
 "Noah: Looking forward to some interesting conversations!",
 "Olivia: Hey everyone, I'm here!", "--- Emma left the chat ---",
 "Nicolas: I think I'll stay a while.", "Liam: This chatroom looks cool!",
 "Noah: Hey everyone, I'm here!", "Olivia: This chatroom is awesome!",
 "--- Nicolas left the chat ---", "Liam: I hope to make some friends here.",
 "Olivia: I'm excited to be here!", "Noah: Hey everyone, I'm here!",
 "Noah: I'm new here, what's up?",
 "Liam: Looking forward to some interesting conversations!",
 "Olivia: I think I'll stay a while.",
 "Olivia: Looking forward to some interesting conversations!",
 "Liam: I'm having a great time!", "Noah: This chatroom is awesome!",
 "Liam: Hey everyone, I'm here!", "Olivia: I'm new here, what's up?",
 "Noah: I'm new here, what's up?", "--- Liam left the chat ---",
 "--- Olivia left the chat ---", "Noah: I'm having a great time!",
 "Noah: This chatroom is awesome!", "Noah: I hope to make some friends here.",
 "Noah: I'm here to chat and have fun!",
 "Noah: I hope to make some friends here.", "Noah: This chatroom seems lively!",
 "Noah: Let's make this chatroom even better!",
 "Noah: Looking forward to some interesting conversations!",
 "Noah: This chatroom looks cool!", "Noah: I'm here to chat and have fun!",
 "--- Noah left the chat ---"]
:ok
```

El historial de mensajes se muestra en la consola para cada usuario y para todos los mensajes. El chatroom es representado como un proceso central al que se pueden enviar mensajes para realizar acciones como añadir usuarios, eliminar usuarios o escribir mensajes. El bucle principal del chatroom recibe estos mensajes y los maneja según su tipo. Cuando se añade un usuario, se envía un mensaje a todos los usuarios activos notificando su entrada. Cuando un usuario es eliminado, se notifica su salida a los demás usuarios. Los mensajes escritos por los usuarios también se distribuyen a todos los usuarios. Cada usuario se ejecuta como un actor independiente, generando mensajes aleatorios a intervalos aleatorios y enviándolos al chatroom. Una vez que un usuario decide salir (marcado por el mensaje de salida predefinido), su proceso se cierra. La función principal `start` inicia el chatroom y crea usuarios, mostrando los registros de los usuarios y finalmente recopilando y mostrando todos los mensajes del chat.