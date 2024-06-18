local resource = require("states.ECS.entities.reource")


local resource_tu = Class.clone(resource)
resource_tu:give("drawable")


resource_tu.name = "resource_tu"

resource_tu.position = {x = -100, y = 100}

resource_tu.rect = {width = 100, height = 100}

function resource_tu:draw()
    love.graphics.setColor(226/255,165/255,115/255,1)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.rect.width, self.rect.height)
end
function resource_tu:newInstance()
    local c = Class.clone(resource_tu)
    c.position.x = math.random(-100,1000)
    c.position.y = math.random(-100,1000)
    c.rect.width = math.random(10,20)
    c.rect.height = math.random(10,20)
    return c
end
return resource_tu 


