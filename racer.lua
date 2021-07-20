--loadscreen:
function loadscreen()
  term.setBackgroundColor(colors.brown)
  term.setCursorPos(1,1)
  term.clear()
  term.setTextColor(colors.white)
  term.setCursorPos(1,1)
  image = paintutils.loadImage(AppDataPath.."loadimage")
  paintutils.drawImage(image,1,2)
  term.setCursorPos(1,19)
  sleep(5)  
  term.setTextColor(colors.white)
end
--config functions:
AppDataPath = "/.Konlab/Racer/"--if pockyOS then change this to /pockyOS/AppData/Racer.Konlab/.Konlab/Racer
AD1 = "/.Konlab"--if pockyOS then change this to /pockyOS/AppData/Racer.Konlab/.Konlab
AD2 = "/.Konlab/Racer"--if pockyOS then change this to AppDataPath
HS = 0
function check()
--  error(":P you tried raecr not racer!")

  
  if not fs.exists(AD1) then
    fs.makeDir(AD1)
  end
  if not fs.exists(AD2) then
    fs.makeDir(AD2)
  end
  if not fs.exists(AppDataPath) then
    error("Can't create AppData files, create theese files manually!Try creating /.Konlab/Racer [if pockyOS:pockyOS/AppData/Racer.Konlab]! If still errors report bug at forums!")
  end
  if not fs.exists(AppDataPath.."hs") then
    Hfile = fs.open(AppDataPath.."hs","w")
    Hfile.write("0")
    Hfile.close()
    
  end
  if not fs.exists(AppDataPath.."bs") then
    saveBeginSpeed(1)
  end
  if not fs.exists(AppDataPath.."sp") then
    setSprite("custom","o-o","|+|","o-o")
  end
if not fs.exists(AppDataPath.."loadimage") then
    shell.run("pastebin","get","eBXhKFSm",AppDataPath.."loadimage")
  end
end
function getHighScore()
  Hfile = fs.open(AppDataPath.."hs","r")
  HSs = Hfile.readLine()
  HS = tonumber(HSs)
  Hfile.close()
    
end
function setHighScore(newhs)
  Hfile = fs.open(AppDataPath.."hs","w")
  Hfile.write(newhs) 
  HS = newhs
  Hfile.close()
end
beginSpeed = 1
function saveBeginSpeed(bspeed)
  Sfile = fs.open(AppDataPath.."bs","w")
  Sfile.write(bspeed)
  beginSpeed = bspeed
  Sfile.close()                                           
end
function getBeginSpeed()
  Sfile = fs.open(AppDataPath.."bs","r")
  beSt = Sfile.readLine()
  beginSpeed = beSt
  Sfile.close()  
end
sapi = false
function LoadSpriteAPI()

    os.loadAPI(AppDataPath.."SpriteAPI")

end
--sprite variables, don't make it local:
spriteType = "default"
spriteline1 = "o-o"
spriteline2 = "|+|"
spriteline3 = "o-o"
function getSprite()
  spfile = fs.open(AppDataPath.."sp","r")
  spriteType = spfile.readLine()
  spriteline1 = spfile.readLine()
  if spriteline1 == nil then
    spriteline1 = "err"
  end
  spriteline2 = spfile.readLine()
  if spriteline2 == nil then
    spriteline2 = "or:"
  end
  spriteline3 = spfile.readLine()
  if spriteline3 == nil then
    spriteline3 = "fmt"
  end
  spfile.close()
end
function setSprite(type,line1,line2,line3)
  spfile = fs.open(AppDataPath.."sp","w")
  spfile.write(tostring(type).."\n"..tostring(line1).."\n"..tostring(line2).."\n"..tostring(line3).."\n")  
  spfile.close()
end
--menu and game functions:
function spriteSet()
  while true do
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.red)
  term.clear()
  term.setCursorPos(1,1)
  print("Racer - Sprite Settings")
  print()
  print("Sprite style:")
  getSprite()
  print(spriteType)
  print()
  term.setBackgroundColor(colors.white)
  term.setCursorPos(1,6)
  getSprite()
  print(spriteline1)
  print(spriteline2)
  print(spriteline3)
  print()
  print("Set to default              ")
  print()
  print("<-- Go Back                 ")
  term.setTextColor(colors.red)
  event99,button99,x18,y18 = os.pullEvent("mouse_click")
  if y18 == 12 then
    return
  end
  if y18 == 10 then
    setSprite("default","o-o","|+|","o-o")
  end
  if y18 == 6 then
    term.setCursorPos(1,6)
    term.write("   ")
    term.setCursorPos(1,6)
    input = read()
    if #input > 3 or #input < 1 then
      term.setCursorPos(1,6)
      term.write("o-o")
      spriteline1 = "o-o"
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    else
      spriteline1 = input
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    end
  elseif y18 == 7 then
    term.setCursorPos(1,7)
    term.write("   ")
    term.setCursorPos(1,7)
    input = read()
    if #input > 3 or #input < 1 then
      term.setCursorPos(1,7)
      term.write("|+|")
      spriteline2 = "|+|"
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    else
      spriteline2 = input
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    end
  elseif y18 == 8 then
    term.setCursorPos(1,8)
    term.write("   ")
    term.setCursorPos(1,8)
    input = read()
    if #input > 3 or #input < 1 then
      term.setCursorPos(1,8)
      term.write("o-o")
      spriteline3 = "o-o"
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    else
      spriteline3 = input
      setSprite("custom",spriteline1,spriteline2,spriteline3)
    end
  end   
  
  end  
end
yourSide = "l"
ver = "3.0"
function printcar(yc,side,color)
  getSprite()
  if spriteType == "default" then
  if color == colors.white then
    color = colors.red
  end
  if side == "l" then
    xc = 10
  else
    xc = 14
  end
  term.setCursorPos(xc,yc)
  term.setBackgroundColor(color)
  term.write("   ")
  term.setCursorPos(xc+1,yc-1)
  term.write(" ")
  term.setCursorPos(xc,yc-2)
  term.write("   ")
  
  end
  if spriteType == "custom" then
    if color == colors.white then
      color = colors.red
    end
    if side == "l" then
      xc = 10
    else
      xc = 14
    end
    term.setCursorPos(xc,yc)
    term.setBackgroundColor(colors.black)
    term.setTextColor(color)
    if color == colors.black then
    term.setTextColor(colors.black)
    else
    term.setTextColor(color)
    end
    
    if color ~= colors.black then
    
      term.write(spriteline1)
      term.setCursorPos(xc,yc-1)
      term.write(spriteline2)
      term.setCursorPos(xc,yc-2)
      term.write(spriteline3)
    else
      term.write("   ")    
      term.setCursorPos(xc,yc-1)
      term.write("   ")
      term.setCursorPos(xc,yc-2)
      term.write("   ")
      
    end
   term.setTextColor(colors.white)      
  end    
end
bgsSt = 0
function bgsStToNumber()
  toret = tonumber(bgsSt)
--  return toret
  bgsSt = toret
end
function options()
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.red)
  term.clear()
  term.setCursorPos(1,1)
  print("Racer - Options")
  print("")
  print("Begin speed:")
  term.setBackgroundColor(colors.white)
  print("                              ")
  print("")
  print("Sprite settings...            ")
  print("")
  print("AppData options...            ")
  print("")
  print("<-- Go back                   ")
  term.setBackgroundColor(colors.red)
  getBeginSpeed()
--  beSt = beSt^-1
  term.setCursorPos(2,4)
  beSt = tostring(beginSpeed^-1)
  term.setBackgroundColor(colors.white)
  term.write(beSt)
  term.setBackgroundColor(colors.red)
  
  
  while true do
    ev4,but4,x8,y8 = os.pullEvent("mouse_click")
    if y8 == 4 then
      term.setCursorPos(2,4)
      term.setBackgroundColor(colors.white)    
      term.write("                     ")
      term.setCursorPos(2,4)
      bgsSt = read()
      ok2,err2 = pcall(bgsStToNumber)    
      if not ok2 then
        bgsSt = 1
      end        
      if bgsSt < 1 then
        bgsSt = 1
      end  
      if bgsSt > 20 then
        bgsSt = 20
      end
      term.setCursorPos(2,4)
      term.write("                         ")
      term.setCursorPos(2,4)
      term.write(tostring(bgsSt))
      editedBS = bgsSt^-1
      saveBeginSpeed(editedBS)      
    elseif y8 == 6 then
      spriteSet()
      return
    elseif y8 == 8 then
      term.setBackgroundColor(colors.red)
      term.clear()
      term.setCursorPos(1,1)
      print("AppData Options...")
      print()
      print("Config & files:")
      list = fs.list(AppDataPath)
      foundsa = false
      iserr = false
      for k,v in pairs(list) do
        if v == "sp" then
          print(v.."   - sprite data")
        elseif v == "hs" then
          print(v.."   - high score data")
        elseif v == "bs" then
          print(v.."   - config file")
        elseif v == "SpriteAPI" then
          print(v.."   - sprite settings' API")
          foundsa = true
          elseif v == "loadimage" then
            print(v.."   - loadscreen image")
          
        else
          print(v.." error:can't identify")
          iserr = true
          
        end  
          
      end
      if foundsa == false then
        print()
        print("Please enable HTTP API and try restarting the game")
        
        print("Click to continue")
      elseif iserr then
        print()
        print("Please report at forums with the uniden. file's name")
        print("Click to continue")
      else
        print()
        print("No problems found.")
        print("Click to continue")
      end
      os.pullEvent("mouse_click")
      return
    elseif y8 == 10 then
      return
      
    end
  end
end
function credits()
  term.clear()
  term.setCursorPos(1,1)
  print("Racer - Controls")
  print("A - go to left side")
  print("D - go to right side")
  print("W - speed up game")
  print("")
  print("Click to continue")
  os.pullEvent("mouse_click")
end
char = "s"
function pull()
while true do
eventppp,char = os.pullEvent("char")
if char == "w" or char == "a" or char == "d" then
  return
end
end
end
spUp = 0
speed = tonumber(beginSpeed)
function slep()
sleep(speed)
spUp = spUp + 1
term.setCursorPos(18,18)
--term.write("spUp:"..spUp)
if speed > 0.25 then
if spUp == 15 then
  speed = speed - speed / 3
  spUp = 0
    
end
elseif speed > 0.1 then
  if spUp == 25 then
  speed = speed - speed / 4
  spUp = 0
  end
else
if spUp == 50 then
speed = speed - speed / 10
spUp = 0
end
end
end
function press()
 -- parallel.waitForAny(
parallel.waitForAny(pull,slep)
  
  os.queueEvent("key",10)  
  if char == "a" then
    yourSide = "l"
  elseif char == "d" then
    yourSide =  "r"
  --elseif char == "s" then
--    speed = speed*0.9
  end
  
end
function drawMenu()
term.setBackgroundColor(colors.lightBlue)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)
term.setBackgroundColor(colors.blue)
print("                                   ")
print("                                  ")
print("")
term.setBackgroundColor(colors.red)
print("Begin race                ")
print("")
print("Controls                  ")
print("")
print("Options                   ")
print("")
print("Exit game                 ")

end
function game()
  term.setBackgroundColor(colors.brown)
  
  term.clear()
  term.setCursorPos(1,1)
--  term.setBackgroundColor(colors.black)
  for i=1,20 do
    term.setBackgroundColor(colors.black)
    term.setCursorPos(10,i)
    term.write("       ")  
    term.setBackgroundColor(colors.white)
    term.setCursorPos(13,i)
    term.write(" ")
--    term.setBackgroundColo
  end
  
  --begin of simulation
--    printcar(5,"l",colors.red)
--    printcar(7,"r",colors.blue)
--    printcar(15,"l",colors.green)    
--simulation variables:
  score = 0
  yourSide = "l"
  enemyPos = 3
  enemySide = "r"
  enemy2Pos = -8
  enemy2Side = "l"
  getBeginSpeed()
  
  speed = tonumber(beginSpeed) -- the fastest is 0.01 the slowest 1
--main loop of game

  while true do
     term.setCursorPos(18,15)
     term.setBackgroundColor(colors.brown)
     term.write("Speed:")
     term.setCursorPos(18,16)
     spe = speed^-1
     term.write(spe)
     term.setBackgroundColor(colors.black)
     printcar(20,yourSide,colors.white)
         
     press()
     
     if yourSide == "l" then
       printcar(20,"r",colors.black)
     else
       printcar(20,"l",colors.black)
     end 
     
     --random generating enemies
     if enemyPos == 3 then
       dd = math.random(1,2)
       if dd == 1 then
       enemySide = "l"
       else
       enemySide = "r"
       end
       score = score+1
     end
     if enemy2Pos == 3 then
       score = score+1
     end
--     printcar(enemyPos,enemySide,colors.blue)
     if enemySide == "l" then
     printcar(enemyPos-1,"l",colors.black)
     else
     printcar(enemyPos-1,"r",colors.black)
     end
     printcar(enemyPos,enemySide,colors.blue)
     enemyPos = enemyPos+1
--     if enemyPos > 17 and enemySide == yourSide then
       function lose()
       term.setTextColor(colors.blue)
       term.setBackgroundColor(colors.yellow)
       term.clear()
       term.setCursorPos(1,10)
       print("Your car has crashed")
       sleep(0.5)
       term.setCursorPos(1,12)
       print("Your score is:")
       sleep(0.5)
       
       print(score)
       sleep(0.5)
       term.setCursorPos(1,15)
       print("Your Highscore is:")
       sleep(0.5)
       
       getHighScore()
       if HS < score then
         setHighScore(score)
         print("New highscore!")
       end
       print(HS)
       term.setCursorPos(1,19)
       sleep(0.75)
       print("Click to continue")
       
       os.pullEvent("mouse_click")
       return
       end
     if enemyPos > 17 and enemySide == yourSide then
       lose()
       return
     end
     if enemyPos == 21 then
       enemyPos = 3
     end    
     if enemy2Pos == 21 then
       enemy2Pos = 3
       printcar(20,enemy2Side,colors.black)
       ran = math.random(1,2)
       if ran == 1 then
         enemy2Side = "l"  
       else
         enemy2Side = "r"
       end
     end
       printcar(enemy2Pos-1,enemy2Side,colors.black)
       printcar(enemy2Pos,enemy2Side,colors.green)
       enemy2Pos = enemy2Pos + 1
       
       if enemy2Pos > 17 and enemy2Side == yourSide then
         term.clear()
         term.setCursorPos(1,1)
       --  print("You lose!")
--         sleep(1)
--         print("Click to continue")
--         os.pullEvent("mouse_click")
          lose()
         return
       end
  end   
 
  --end of simulation
--  os.pullEvent("key")
end
function main()
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.black)
  check()
  loadscreen()
--  LoadSpriteAPI()
  while true do
    drawMenu()  
    
    ev,bu,x,y = os.pullEvent("mouse_click")
    if y == 10 then
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.setCursorPos(1,1)      
      term.clear()
      break
    end
    if y == 8 then
      options()
    end      
    if y == 6 then
      credits()
    end
    if y == 4 then
      game()
    end
  end
end
kkk = false
--ok,err = pcall(main())
--main()
ok = false
err = "error"
ok,err = pcall(main)
if not kkk then
if err == "Terminated" then
print("Terminated")
else
if ok then
shell.run("store")
else
  term.setBackgroundColor(colors.red)
  term.setTextColor(colors.white)
  term.clear()
  term.setCursorPos(1,1)
  print("Crash report:")
  print()
  term.setBackgroundColor(colors.gray)
  print("                              ")
  print("Oh no Racer has crashed       ")
  print("                              ")
  
  print()
  term.setBackgroundColor(colors.gray)
  term.setCursorPos(1,7)
  term.write("                                 ")
  term.setCursorPos(1,8)
  term.write("                                 ")
  term.setTextColor(colors.red)
  term.setCursorPos(1,7)
  print(err)
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.red)
  print()
  print("Please report at cc forums!")

  print("Press any key to continue!")
  os.pullEvent("key")
  term.setBackgroundColor(colors.black)
  term.clear()
  term.setCursorPos(1,1)
--  print("--Program:end--")
  return
end 
end 
end