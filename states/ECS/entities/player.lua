
--[[
    定义所有可选择的玩家类
]]
local animation = {
	imageSrc = "assets/images/player/player1.png",
	defaultState = "running",
	states = {
		running = {
			frameCount = 4,
			offsetY = 0,
			frameW = 48,
			frameH = 64,
			nextState = "running",
			switchDelay = 0.1
		},
		jumpStart = {
			frameCount = 4,
			offsetY = 64,
			frameW = 48,
			frameH = 64,
			nextState = "jumpEnd",
			switchDelay = 0.16
		},
		jumpEnd = {
			frameCount = 4,
			offsetY = 128,
			frameW = 48,
			frameH = 64,
			nextState = "running",
			switchDelay = 0.1
		}
	}
}


local player= Concord.entity()
    :give("position", 50, 50)
    :give("velocity", 100, 100)
    :give("drawable")
    :give("isPlayer")
    :give("select")
    :give("target",50,50)

    player.useSize = 100
    player.animation = LoveAnimation.new(animation)
    player.animation:setSpeedMultiplier(1)

function player:update(dt)
    self.animation:update(dt)
    base_wordld:query({"resource"}, function(e)
        if Utils.inCircle(self.position.x,self.position.y,{x = e.position.x,y=e.position.y,r=self.useSize}) then
            e:develop()
        end
    end)
end    

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

function player:draw()
    love.graphics.rectangle("fill", self.position.x, self.position.y, 20, 20)
    love.graphics.circle("line",self.position.x,self.position.y,self.useSize)
    local rect = self.animation:getGeometry()
    self.animation.x,self.animation.y = self.position.x - rect.width/2,self.position.y - rect.height /2
    self.animation:draw()
end

return player
