local game = {}

function game:init()

end

function game:enter()
    camera = StalkerCamera()
    player = require("states.ECS.entities.player")
    player1 = require("states.ECS.entities.impl.player_1")
    selectEntity = require("states.ECS.entities.select_entity")
    base_wordld:addEntity(player)
    base_wordld:addEntity(player1)
    base_wordld:addEntity(selectEntity)
end

function game:update(dt)
    base_wordld:emit("update",dt)
    -- print(#entities,entities.player)
    camera:follow(player.position.x,player.position.y)
    camera:update(dt)
end

function game:keypressed(key, code)

end

function game:mousepressed(x, y, mbutton)

end

function game:draw()
    

    camera:attach()
    love.graphics.rectangle("line",100,100,100,100)
    base_wordld:emit("draw")

    camera:detach()
    camera:draw()
    base_wordld:emit("drawNoinCarmera")
end

return game
