local resource = require("states.ECS.entities.reource")


local resource_tu = resource:extend() --Class.clone(resource)
-- resource_tu:implement(resource)

function resource_tu:new()
    self.super:new()
    self:init(math.random(100,2000))
    self.name = "resource_tu"
    local prop= Concord.entity()
    :give("resource")
    :give("position")
    :give("drawable")
    :give("drawOrder",1)
    prop.parent = function()
        return self
    end
    self.prop = prop
    self.prop.position = {x = 300, y = 100}
    self.rect = {width = 100, height = 100}
    -- local c = Class.clone(resource_tu)
    self.prop.position.x = math.random(-100,1000)
    self.prop.position.y = math.random(-100,1000)
    self.rect.width = math.sqrt(self.curValue) 
    self.rect.height = math.sqrt(self.curValue)
end
function resource_tu:printPairs()
    for k, v in pairs(self) do
      print("===",k, v)
    end
end


function resource_tu:draw()
    local x2, y2 = camera:getMousePosition()
    love.graphics.setColor(0.5,0.6,1,1)
    self.rect.width = math.sqrt(self.curValue) 
    self.rect.height = math.sqrt(self.curValue)
    love.graphics.rectangle("fill", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
    if Utils.inRect(x2,y2,{x = self.prop.position.x, y = self.prop.position.y, w = self.rect.width, h = self.rect.height}) then
        love.graphics.setColor(1,0.5,1,1)
        love.graphics.rectangle("line", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
        self:drawInfo()
    end
    love.graphics.setColor(1,1,1,1)
    love.graphics.print('=='..math.floor(self.curValue)..'/'..self.value, self.prop.position.x, self.prop.position.y)
end


-- function resource_tu:newInstance()
--     local c = Class.clone(resource_tu)
--     c.position.x = math.random(-100,1000)
--     c.position.y = math.random(-100,1000)
--     c.rect.width = math.random(10,20)
--     c.rect.height = math.random(10,20)
--     return c
-- end

return resource_tu 


