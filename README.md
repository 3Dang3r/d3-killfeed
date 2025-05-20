# 🔫 D3 Killfeed - FiveM Standalone Kill Feed UI

A clean, modern, and fully standalone kill feed UI for FiveM servers. 🎯  
Displays player kills, suicides, and supports configurable screen positions! 💥

---

## 🧰 Features

- ✅ Fully standalone (no dependency on frameworks like ESX/QBCore)
- 🎨 Modern NUI design
- 📌 Customizable position: `top-left`, `top-right`, `bottom-left`, `bottom-right`, `center-left`, `center-right`
- 💬 Kill notifications broadcasted to all players
- 🔫 Suicide detection support

---


## 🖥️ Previews

 - [Killfeed Notification](https://imgur.com/a/UKjZUve)


## ⚙️ Configuration

Inside `client.lua`, modify this line to set kill feed position:

```lua
local Config = {
    Position = "center-right" -- options: top-left, top-right, bottom-left, bottom-right, center-left, center-right
}
```


## 🚀 Installation
 - Download or clone this repository.

 - Add the folder to your FiveM resources/ directory.

 - Ensure the resource in your server.cfg:

 - ensure `d3-killfeed`



## 💡 Notes
 - The UI automatically shows/hides as needed.

 - The kill feed only displays player-related events (no NPCs).

