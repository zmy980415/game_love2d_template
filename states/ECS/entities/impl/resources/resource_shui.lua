local resource = require("states.ECS.entities.reource")


local resource_shui = resource:extend() --Class.clone(resource)
-- resource_shui:implement(resource)

function resource_shui:new()
    self.super:new()
    self:init(math.random(100,2000))
    self.name = "resource_shui"
    local prop= Concord.entity()
    :give("resource")
    :give("position")
    :give("drawable")
    :give("drawOrder",2)
    prop.parent = function()
        return self
    end
    self.prop = prop
    self.prop.position = {x = 300, y = 100}
    self.rect = {width = 100, height = 100}
    -- local c = Class.clone(resource_shui)
    self.prop.position.x = math.random(-100,1000)
    self.prop.position.y = math.random(-100,1000)
    self.rect.width = math.sqrt(self.curValue) 
    self.rect.height = math.sqrt(self.curValue)
end
function resource_shui:printPairs()
    for k, v in pairs(self) do
      print("===",k, v)
    end
end


function resource_shui:draw()
    local x2, y2 = camera:getMousePosition()
    love.graphics.setColor(0,0,1,1)
    self.rect.width = math.sqrt(self.curValue) 
    self.rect.height = math.sqrt(self.curValue)
    love.graphics.rectangle("fill", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
    
    if Utils.inRect(x2,y2,{x = self.prop.position.x, y = self.prop.position.y, w = self.rect.width, h = self.rect.height}) then
        love.graphics.setColor(1,0.5,1,1)
        love.graphics.rectangle("line", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
        self.drawInfo(self)
    end
    love.graphics.setColor(1,1,1,1)
    love.graphics.print('=='..math.floor(self.curValue)..'/'..self.value, self.prop.position.x, self.prop.position.y)
end


-- function resource_shui:newInstance()
--     local c = Class.clone(resource_shui)
--     c.position.x = math.random(-100,1000)
--     c.position.y = math.random(-100,1000)
--     c.rect.width = math.random(10,20)
--     c.rect.height = math.random(10,20)
--     return c
-- end

return resource_shui 


