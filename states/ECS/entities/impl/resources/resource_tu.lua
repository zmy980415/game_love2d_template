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
    return Class.clone(resource_tu)
end
return resource_tu 


