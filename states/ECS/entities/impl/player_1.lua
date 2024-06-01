local player = require("states.ECS.entities.player")

local player_1 = Class.clone(player)



player_1.name = "player_1"
player_1.position = {x = 100, y = 100}

function player_1:draw()
    
end

return player_1 


