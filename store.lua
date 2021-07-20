os.loadAPI("json")
w, h = term.getSize()
paintutils.drawFilledBox(1, 1, w, h, colors.white)
paintutils.drawFilledBox(1, 1, w, 1, colors.gray)

paintutils.drawFilledBox(4,4,11,6, colors.blue)

paintutils.drawFilledBox(4,9,11,11, colors.blue)

paintutils.drawFilledBox(16,4,23,6, colors.blue)

paintutils.drawFilledBox(16,9,23,11, colors.blue)

term.setCursorPos(4,4)
print(" Racer!")
term.setCursorPos(4,6)
print(" 25 KST")

term.setCursorPos(16,4)
print("  2048")
term.setCursorPos(16,6)
print(" 25 KST")

function money()


end

while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (xPos > 4 and xPos < 11) and (yPos > 4 and yPos < 6) then
        --racer
        local h = fs.open("/store_keys.lua", "r")
        local data = h.readAll()
        h.close()
        if string.find(data, "racer") then
            shell.run("racer.lua")
        else
            --krist stuffs
            local h = fs.open("/store_keys.lua", "a")
            h.writeLine("racer")
            h.close()
            shell.run("wget https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/racer.lua?token=ARSWXRE6HD4NDQCA2AGWRBDA63MR2")
            shell.run("store")
            
    end

    elseif (xPos > 16 and xPos < 23) and (yPos > 4 and yPos < 6) then
        --2048
        local h = fs.open("/store_keys.lua", "r")
        local data = h.readAll()
        h.close()
        if string.find(data, "2048") then
            shell.run("2048.lua")
        else
            --krist stuffs
            local h = fs.open("/store_keys.lua", "a")
            h.writeLine("2048")
            h.close()
            shell.run("wget https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/2048.lua?token=ARSWXRGH4TJMRX7NI5XB643A63MSG")
            shell.run("wget https://raw.githubusercontent.com/kennu290/Computercraft-AndroidOS/main/2048.icon?token=ARSWXRBECK2FBJYTKB6HZNLA63MV6")
            shell.run("store")
    end

    elseif (xPos > 4 and xPos < 11) and (yPos > 9 and yPos < 11) then
        --APP 3 SELECTED
    elseif (xPos > 16 and xPos < 23) and (yPos > 9 and yPos < 11) then
        --APP 4 SELECTED
    end
  end