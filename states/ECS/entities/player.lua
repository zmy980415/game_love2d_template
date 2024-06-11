
--[[
    定义所有可选择的玩家类
]]


local player= Concord.entity()
    :give("position", 50, 50)
    :give("velocity", 100, 100)
    :give("drawable")
    :give("isPlayer")
    :give("select")
    :give("target",50,50)

function player:move(dt)
    if self.select == true then
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
    
end


return player
