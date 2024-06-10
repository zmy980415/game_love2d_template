local resource = require("states.ECS.entities.reource")

local resource_tu = Class.clone(resource)



resource_tu.name = "resource_tu"
resource_tu.position = {x = 100, y = 100}

function resource_tu:draw()
    
end

return resource_tu 


