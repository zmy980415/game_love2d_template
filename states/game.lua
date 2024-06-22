local game = {}

-- function game:init()
--     -- 基础世界
--     base_wordld = Concord.world()
--     function base_wordld:onEntityAdded(entity)
--         if entity['init'] then
--             entity:init()
--         end
--     end
--     dialog = require("states.ECS.entities.dialog")
--     base_wordld:addEntity(dialog)
--     for k, v in pairs(base_systems) do
--         base_wordld:addSystem(v)
--     end
-- end

function game:enter()
    base_wordld = ECS.World();
    base_wordld:AddSystem(ECS.system_table.draw_system)
--     camera = StalkerCamera()
--     player = require("states.ECS.entities.player")
--     selectEntity = require("states.ECS.entities.select_entity")
--     resourceManagerEntity = require("states.ECS.entities.impl.rource_manager")
--     base_wordld:addEntity(player)
--     base_wordld:addEntity(selectEntity)
--     base_wordld:addEntity(resourceManagerEntity)
--     dialog:add("enter game, 你好")
    
end

function game:update(dt)
    base_wordld:Update("process",os.clock())
--     base_wordld:emit("update",dt)
--     camera:follow(player.position.x,player.position.y)
--     camera:update(dt)
-- end

-- function game:keypressed(key, code)
    
-- end

-- function game:mousepressed(x, y, mbutton)
--     base_wordld:emit("mousepressed",x, y, mbutton)
end

function game:draw()
    
    base_wordld:Update("process",os.clock())
--     camera:attach()
--     love.graphics.rectangle("line",100,100,100,100)
--     base_wordld:emit("draw")

--     camera:detach()
--     camera:draw()
--     base_wordld:emit("drawNoinCarmera")

end

return game
