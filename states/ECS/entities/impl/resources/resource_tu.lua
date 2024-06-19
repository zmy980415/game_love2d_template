local resource = require("states.ECS.entities.reource")


local resource_tu = resource:extend() --Class.clone(resource)
-- resource_tu:implement(resource)

function resource_tu:new()
    self.super:new()
    self.name = "resource_tu"
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
    -- local c = Class.clone(resource_tu)
    self.prop.position.x = math.random(-100,1000)
    self.prop.position.y = math.random(-100,1000)
    self.rect.width = math.random(10,20)
    self.rect.height = math.random(10,20)
end
function resource_tu:printPairs()
    for k, v in pairs(self) do
      print("===",k, v)
    end
end


function resource_tu:draw()
    love.graphics.setColor(0.5,0.6,1,1)
    love.graphics.rectangle("fill", self.prop.position.x, self.prop.position.y, self.rect.width, self.rect.height)
    love.graphics.print('=='..self.curValue..'/'..self.value, self.prop.position.x, self.prop.position.y)
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


