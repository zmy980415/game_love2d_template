
local prop= Concord.entity()
    :give("position", 50, 0)
    :give("velocity", 1, 1)
    :give("drawable")
    :give("isPlayer")


local player=Class.new(prop)

function player:move(dt)
    if love.keyboard.isDown("d") then
        self.position.x=self.position.x+1
    end
    if love.keyboard.isDown("a") then
        self.position.x=self.position.x-1
    end
    if love.keyboard.isDown("w") then
        self.position.y=self.position.y-1
    end
    if love.keyboard.isDown("s") then
        self.position.y=self.position.y+1
    end
end


return player
