local resource = require("states.ECS.entities.reource")


local resource_shui = resource:extend() --Class.clone(resource)
-- resource_shui:implement(resource)

function resource_shui:new()
    self.super:new()
    self.name = "resource_shui"
    local prop= Concord.entity()
    :give("resource")
    :give("position")
    :give("drawable")
    prop.parent = function()
        return self
    end
    self.prop = prop
    self.prop.position = {x = 300, y = 100}
    self.rect = {width = 100, height = 100}
    -- local c = Class.clone(resource_shui)
    self.prop.position.x = math.random(-100,1000)
    self.prop.position.y = math.random(-100,1000)
    self.rect.width = math.random(10,20)
    self.rect.height = math.random(10,20)
end
function resource_shui:printPairs()
    for k, v in pairs(self) do
      print("===",k, v)
    end
end


function resource_shui:draw()
    love.graphics.setColor(0,0,1,1)
    love.graphics.rectangle("fill", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
    love.graphics.print('=='..self.curValue..'/'..self.value, self.prop.position.x, self.prop.position.y)
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


