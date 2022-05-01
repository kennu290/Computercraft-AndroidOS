realCode = "564372"

function factoryReset()
    w, h = term.getSize()
    paintutils.drawFilledBox(1, 1, w, h, colors.lightGray)
    paintutils.drawFilledBox(1, 1, w, 1, colors.gray)
    paintutils.drawFilledBox(1, 19, w, 19, colors.black)
    paintutils.drawFilledBox(4,6,11,8, colors.lime)
    term.setCursorPos(5,7)
    print("Affirm")
    paintutils.drawFilledBox(16,6,23,8, colors.red)
    term.setCursorPos(17,7)
    print("Cancel")
    term.setBackgroundColor(colors.black)
    

    term.setCursorPos(1, 19)
    print("Back")
while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (yPos == 19) then
        shell.run("settings.lua")
    elseif (xPos > 4 and xPos < 11) and (yPos > 6 and yPos < 8) then
        term.setBackgroundColor(colors.black)
        term.clear()
        fs.delete("home.lua")
        fs.delete("startup.lua")
        fs.delete("LOGO.lua")
        fs.delete("2048.lua")
        fs.delete("2048.icon")
        fs.delete("json")
        fs.delete("racer.lua")
        fs.delete("store.lua")
        fs.delete("tracker.lua")
        shell.run("wget", "https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/installer.lua")
        shell.run("installer.lua")

    elseif (xPos > 16 and xPos < 23) and (yPos > 6 and yPos < 8) then
        shell.run("settings.lua")
        end
    end  
end

function devAccess()
    w, h = term.getSize()
    paintutils.drawFilledBox(1, 1, w, h, colors.lightGray)
    paintutils.drawFilledBox(1, 1, w, 1, colors.gray)
    paintutils.drawFilledBox(1, 19, w, 19, colors.black)
    paintutils.drawFilledBox(4,6,11,8, colors.lime)
    term.setCursorPos(5,7)
    print("Affirm")
    paintutils.drawFilledBox(16,6,23,8, colors.red)
    term.setCursorPos(17,7)
    print("Cancel")
    term.setBackgroundColor(colors.black)
    

    term.setCursorPos(1, 19)
    print("Back")
while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (yPos == 19) then
        shell.run("settings.lua")
    elseif (xPos > 4 and xPos < 11) and (yPos > 6 and yPos < 8) then
        --DEV ACCESS ENABLED!
        term.setBackgroundColor(colors.lightGray)
        local code = read("*")
        if (realCode == code) then
            print ("epic")
            shell.run("home.lua")
        else
            shell.run("settings.lua")
        end
    elseif (xPos > 16 and xPos < 23) and (yPos > 6 and yPos < 8) then
        shell.run("settings.lua")
        end
    end  
end



function main()
w, h = term.getSize()
paintutils.drawFilledBox(1, 1, w, h, colors.lightGray)
paintutils.drawFilledBox(1, 1, w, 1, colors.gray)

paintutils.drawFilledBox(1, 3, w, 3, colors.black)
paintutils.drawFilledBox(1, 5, w, 5, colors.black)
paintutils.drawFilledBox(1, 7, w, 7, colors.black)
paintutils.drawFilledBox(1, 9, w, 9, colors.black)
term.setTextColor(colors.white)

term.setCursorPos(1, 3)
print("Krist Payment Setup")
term.setCursorPos(1, 5)
print("Factory Reset")
term.setCursorPos(1, 7)
print("Developer Access")
term.setCursorPos(1, 9)
print("Back")

local event, button, xPos, yPos = os.pullEvent("mouse_click")
if (yPos == 3) then
    shell.run("store.lua")
elseif (yPos == 5) then
    factoryReset()
elseif (yPos == 7) then
    devAccess()
elseif (yPos == 9) then
    shell.run("home.lua")
    end
end

main()
