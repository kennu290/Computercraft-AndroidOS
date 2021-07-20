w, h = term.getSize()
paintutils.drawFilledBox(1, 1, w, h, colors.white)
paintutils.drawFilledBox(1, 1, w, 1, colors.gray)

paintutils.drawFilledBox(4,4,11,6, colors.blue)

paintutils.drawFilledBox(4,9,11,11, colors.blue)

paintutils.drawFilledBox(16,4,23,6, colors.blue)

paintutils.drawFilledBox(16,9,23,11, colors.blue)

term.setCursorPos(0,0)

while true do
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    if (xPos > 4 and xPos < 11) and (yPos > 4 and yPos < 6) then
        --APP 1 SELECTED
    elseif (xPos > 4 and xPos < 11) and (yPos > 9 and yPos < 11) then
        --APP 2 SELECTED
    elseif (xPos > 16 and xPos < 23) and (yPos > 4 and yPos < 6) then
        --APP 3 SELECTED
    elseif (xPos > 16 and xPos < 23) and (yPos > 9 and yPos < 11) then
        --APP 4 SELECTED
    end
  end