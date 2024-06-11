local resource = require("states.ECS.entities.reource")


local resource_shui = Class.clone(resource)
resource_shui:give("drawable")


resource_shui.name = "resource_shui"

resource_shui.position = {x = 300, y = 100}

resource_shui.rect = {width = 100, height = 100}

function resource_shui:draw()
    love.graphics.setColor(0,0,1,1)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.rect.width, self.rect.height)
end


function resource_shui:newInstance()
    local c = Class.clone(resource_shui)
    c.position.x = math.random(-100,1000)
    c.position.y = math.random(-100,1000)
    c.rect.width = math.random(10,1000)
    c.rect.height = math.random(10,1000)
    return c
end

return resource_shui 


