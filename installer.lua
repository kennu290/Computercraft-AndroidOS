os.setComputerLabel("Samsung Galaxy Tab S7+")
print("Rename Complete. Initiating Downloader!")

fs.delete("settings.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/Home.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/LOGO.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/json")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/settings.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/startup.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/store.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/store_keys.lua")
shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/tracker.lua")
os.sleep(5)
os.reboot()
