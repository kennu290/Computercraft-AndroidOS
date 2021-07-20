id = 2

function start()
    local x, y, z = gps.locate(5)
    if not x then --If gps.locate didn't work, it won't return anything. So check to see if it did.
        print("Failed to get location!")
    else
        print(x .. ", " .. y .. ", " .. z)
        rednet.send(id, x .. ", " .. y .. ", " .. z, "TRKR")
    end
end

rednet.open("back")

coroutine.create(start)