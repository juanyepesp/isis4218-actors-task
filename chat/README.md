# Chatroom

Esteban Gonzalez Ruales
202021225
e.gonzalez5@uniandes.edu.co

Juan Diego Yepes
poner codigo
j.yepes

Felipe Nuñez
poner codigo
poner correo

## Installation and Running the program

To run the project do the following from within the terminal from the directory of the project, in this case, from the "chat" directory:

- iex
- c "chat.exs"
- Chat.start

The messages as seen by each user will appear on the terminal and at the end all the messages that the server processed. You can see that the messages that each user sees correspond to the messages processed by the server from the time they joined to the time they left, as required in the homework. You can see an example of this with the following example:

```
-------------------------
Messages as seen by user: Nicolas
["Nicolas: This chatroom seems lively!", "--- Emma joined the chat ---",
 "Emma: Hello, I'm here.", "--- Liam joined the chat ---",
 "Liam: This chatroom seems lively!", "--- Olivia joined the chat ---",
 "--- Olivia left the chat ---", "--- Noah joined the chat ---",
 "Noah: Hello, I'm here.", "Noah: Hello, I'm here.",
 "Emma: This chatroom seems lively!", "Liam: Hello, I'm here.",
 "Nicolas: This chatroom seems lively!", "--- Emma left the chat ---",
 "Noah: Hello, I'm here.", "--- Liam left the chat ---"]


-------------------------
Messages as seen by user: Emma
["Emma: Hello, I'm here.", "--- Liam joined the chat ---",
 "Liam: This chatroom seems lively!", "--- Olivia joined the chat ---",
 "--- Olivia left the chat ---", "--- Noah joined the chat ---",
 "Noah: Hello, I'm here.", "Noah: Hello, I'm here.",
 "Emma: This chatroom seems lively!", "Liam: Hello, I'm here.",
 "Nicolas: This chatroom seems lively!"]


-------------------------
Messages as seen by user: Liam
["Liam: This chatroom seems lively!", "--- Olivia joined the chat ---",
 "--- Olivia left the chat ---", "--- Noah joined the chat ---",
 "Noah: Hello, I'm here.", "Noah: Hello, I'm here.",
 "Emma: This chatroom seems lively!", "Liam: Hello, I'm here.",
 "Nicolas: This chatroom seems lively!", "--- Emma left the chat ---",
 "Noah: Hello, I'm here."]


-------------------------
Messages as seen by user: Olivia
[]


-------------------------
Messages as seen by user: Noah
["Noah: Hello, I'm here.", "Noah: Hello, I'm here.",
 "Emma: This chatroom seems lively!", "Liam: Hello, I'm here.",
 "Nicolas: This chatroom seems lively!", "--- Emma left the chat ---",
 "Noah: Hello, I'm here.", "--- Liam left the chat ---",
 "--- Nicolas left the chat ---", "Noah: Hello, I'm here.",
 "Noah: This chatroom seems lively!", "Noah: Hello, I'm here.",
 "Noah: This chatroom seems lively!", "Noah: This chatroom seems lively!",
 "Noah: Hello, I'm here.", "Noah: This chatroom seems lively!"]


-------------------------
All messages
["--- Nicolas joined the chat ---", "Nicolas: This chatroom seems lively!",
 "--- Emma joined the chat ---", "Emma: Hello, I'm here.",
 "--- Liam joined the chat ---", "Liam: This chatroom seems lively!",
 "--- Olivia joined the chat ---", "--- Olivia left the chat ---",
 "--- Noah joined the chat ---", "Noah: Hello, I'm here.",
 "Noah: Hello, I'm here.", "Emma: This chatroom seems lively!",
 "Liam: Hello, I'm here.", "Nicolas: This chatroom seems lively!",
 "--- Emma left the chat ---", "Noah: Hello, I'm here.",
 "--- Liam left the chat ---", "--- Nicolas left the chat ---",
 "Noah: Hello, I'm here.", "Noah: This chatroom seems lively!",
 "Noah: Hello, I'm here.", "Noah: This chatroom seems lively!",
 "Noah: This chatroom seems lively!", "Noah: Hello, I'm here.",
 "Noah: This chatroom seems lively!", "--- Noah left the chat ---"]
:ok
```
