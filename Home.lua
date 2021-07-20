w, h = term.getSize()
paintutils.drawFilledBox(1, 1, w, h, colors.cyan)
paintutils.drawFilledBox(1, 1, w, 1, colors.gray)
term.setTextColor(colors.black)
--APP STORE ICON
paintutils.drawFilledBox(2, 16, 6, 19, colors.white)
term.setCursorPos(3,17)
print("App")
term.setCursorPos(2,18)
print("Store")

paintutils.drawFilledBox(8, 16, 12, 19, colors.white)

paintutils.drawFilledBox(15, 16, 19, 19, colors.white)
--SETTINGS APP ICON
paintutils.drawFilledBox(21, 16, 25, 19, colors.white)
paintutils.drawFilledBox(22, 17, 24, 18, colors.gray)
--BUTTONS
while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (xPos > 2 and xPos < 6) and (yPos > 16 and yPos < 19) then
        shell.run("store.lua")
    elseif (xPos > 21 and xPos < 25) and (yPos > 16 and yPos < 19) then
        shell.run("settings.lua")
    end
end