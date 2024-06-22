
--[[
    定义所有可选择的玩家类
]]
local animation = {
	imageSrc = "assets/images/player/player1.png",
	defaultState = "running",
	states = {
		running = {
			frameCount = 4,
			offsetY = 64,
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
		},
        work = {
			frameCount = 4,
			offsetY = 0,
			frameW = 48,
			frameH = 64,
			nextState = "work",
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
    :give("drawOrder",999)

    player.useSize = 100
    player.animation = LoveAnimation.new(animation)
    player.animation:setSpeedMultiplier(1)
    local anim_rect=player.animation:getGeometry()
    player.animation:setRelativeOrigin(0.5,0.5)

function player:update(dt)
    self.animation:update(dt)
    local state = self.animation:getCurrentState()
    local judgeSize = 0.5
    if state == "running" and math.abs(self.position.x -  self.target.x) < judgeSize and math.abs(self.position.y -  self.target.y) < judgeSize then
        self.animation:setState('work')
        self.position.x = self.target.x
        self.position.y = self.target.y
        dialog:add("You are now working!")
    end
    if state == "work" and (math.abs(self.position.x -  self.target.x) > judgeSize or math.abs(self.position.y -  self.target.y) > judgeSize ) then
        self.animation:setState('running') 
        dialog:add("You are now running!")
    end

    state = self.animation:getCurrentState()
    
    if state == "work" then
        local list = base_wordld:query({"resource"})
        local t = {}
        for k,e in ipairs(list) do
            if Utils.inCircle(self.position.x,self.position.y,{x = e.position.x,y=e.position.y,r=self.useSize}) then
                table.insert(t,e)
            end
        end
        for k,e in ipairs(t) do
            e.parent():develop(0.1 / #t)
        end
        -- base_wordld:query({"resource"}, function(e)
        --     if Utils.inCircle(self.position.x,self.position.y,{x = e.position.x,y=e.position.y,r=self.useSize}) then
        --         e.parent():develop()
        --     end
        -- end)
    end
    
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
    love.graphics.setColor(1,1,1,1)
    -- love.graphics.rectangle("fill", self.position.x, self.position.y, 20, 20)
    love.graphics.circle("line",self.position.x,self.position.y,self.useSize)
    
    local rect = self.animation:getGeometry()
    self.animation.x,self.animation.y = self.position.x ,self.position.y
    if math.abs(self.position.x -  self.target.x) > 1 then
        if self.position.x > self.target.x then
            self.animation:setHorizontalFlip(false);
        else
            self.animation:setHorizontalFlip(true);
        end
    end
    
    self.animation:draw()
    if self.position.x ~= self.target.x or self.position.y ~= self.target.y then
        love.graphics.line(self.position.x,self.position.y,self.target.x,self.target.y)
    end
end

return player
