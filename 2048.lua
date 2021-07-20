-- 2048
-- Clone by Richard (Rich73)
-- Hacked together 10/04/2014
os.pullEvent = os.pullEventRaw
g = { }
tiles = { }
tiles[1]  = {"    ", 1}
tiles[2]  = {" 2  ", 2}
tiles[3]  = {" 4  ", 4}
tiles[4]  = {" 8  ", 8}
tiles[5]  = {" 16 ", 16}
tiles[6]  = {" 32 ", 32}
tiles[7]  = {" 64 ", 64}
tiles[8]  = {"128 ", 128}
tiles[9]  = {"256 ", 256}
tiles[10] = {"512 ", 512}
tiles[11] = {"1024", 1024}
tiles[12] = {"2048", 2048}
bg = "icon"
size = 4
score = 0
hiscore = 0

function createBoard()
  for i=1, size do
    g[i] = { }
    for j=1, size do
      g[i][j] = 0
    end
  end
  for j=1, 2 do
    local x, y = findEmptyPos()
    g[y][x] = 1
  end
end

function getRandomPos()
  return math.random(size), math.random(size)
end

function findEmptyPos()
  while true do
    x, y = getRandomPos()
    if g[y][x] == 0 then return x, y end
  end
end

function isFull()
  local full = true
  for i=1, size do
    for j=1, size do
      if g[i][j] == 0 then full = false end
    end
  end
  return full
end

function canMove()
  if not isFull() then return true end
  local pr = nil
  for i=1, size do
    local k = 1
    while k <= size do
      if k~=size and g[i][k] == g[i][k+1] or false then break end
      if pr and g[i][k] == pr[k] or false then break end
      k = k + 1
    end
    if k ~= size+1 then return true end
    pr = g[i]
  end
  return false
end

function moveLeft()
  for i=1, size do
    for j=2, size do
      local k = j
      while k > 1 do
        if g[i][k] == 0 then break
        elseif g[i][k] == g[i][k-1] then
          g[i][k-1] = g[i][k] + 1
          g[i][k] = 0
          score = score + math.pow(2,g[i][k-1])
          k = k-1
        elseif g[i][k-1] == 0 then
          g[i][k-1] = g[i][k]
          g[i][k] = 0
        else break end
        k = k-1
      end
    end
  end
end

function moveUp()
  for j=1, size do
    for i=2, size do
      local k = i
      while k > 1 do
        if g[k][j] == 0 then break
        elseif g[k][j] == g[k-1][j] then
          g[k-1][j] = g[k][j] + 1
          g[k][j] = 0
          score = score + math.pow(2,g[k-1][j])
          k = k-1
        elseif g[k-1][j] == 0 then
          g[k-1][j] = g[k][j]
          g[k][j] = 0
        else break end
        k = k-1
      end
    end
  end
end

function moveRight()
  flipX()
  moveLeft()
  flipX()
end

function moveDown()
  flipY()
  moveUp()
  flipY()
end

function drawBoard()
 term.setBackgroundColor(colors.black)
 term.clear()
 term.setTextColor(colors.white)
  for x=1, size do
    for y=1, size do
      term.setCursorPos(x*5-1,y*4-2)
      term.setBackgroundColor(tiles[g[y][x]+1][2])
      term.write("    ")
      term.setCursorPos(x*5-1,y*4-1)
      term.write(tiles[g[y][x]+1][1])
      term.setCursorPos(x*5-1,y*4)
      term.write("    ")
    end
  end 
  term.setCursorPos(4,18)
  term.setBackgroundColor(colors.black)
  term.write("Score: "..score)
  drawScores()
end

function drawScores()
  term.setCursorPos(4,18)
  term.setBackgroundColor(colors.black)
  term.write("  Score: "..score)
  term.setCursorPos(4,19)
  term.write("HiScore: "..hiscore)
end

function drawHome()
  term.clear()
  im = paintutils.loadImage("/2048.icon")
  paintutils.drawImage(im,2,2)
end

function table.reverse(tab)
  local newtab = { }
  for i=1, #tab do
    newtab[#tab+1-i] = tab[i]
  end
  return newtab
end

function flipX()
  for i=1, size do
    g[i] = table.reverse(g[i])
  end
end

function flipY()
  g = table.reverse(g)
end

function update()
  drawBoard()
  if not isFull() then
    local x, y = findEmptyPos()
    g[y][x] = 1
  end
  os.sleep(0.075)
end

function newGame()
  if score > hiscore then
    hiscore = score
  end
  score = 0
  term.setCursorPos(9,18)
  term.setBackgroundColor(colors.white)
  term.setTextColor(colors.black)
  term.clearLine()
  term.write("GAME OVER!")
  term.setCursorPos(8,19)
  term.clearLine()
  term.write("New game? y/n")
  while true do
    local event, key = os.pullEvent("key")
    if event=="key" then
      if key==keys.y then return true end
      if key==keys.n then
        shell.run("store")
        return false 
      end
    end
  end
end

drawHome()

os.sleep(2)
while true do
  createBoard()
  while canMove() do
    drawBoard()
    event, key = os.pullEvent("key")
    if event == "key" then
      if key == keys.left then moveLeft()
      elseif key == keys.right then 
        moveRight()
        update()
      elseif key == keys.up then
        moveUp()
        update()
      elseif key == keys.down then
        moveDown()
        update()
      elseif key == keys.q then
        break
      end
    end
  end
  drawBoard()
  if not newGame() then
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    break
  end
end