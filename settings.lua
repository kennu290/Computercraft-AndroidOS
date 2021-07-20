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
        os.sleep(5)
        os.reboot()

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

    term.setCursorPos(1, 19)
    print("Back")
while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (yPos == 19) then
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
