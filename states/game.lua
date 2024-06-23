local game = {}
local Window = require 'libs.UI.window'
local window = Window.new(1,400,100)

function game:init()

end

function game:enter()
     -- 基础世界
     base_wordld = Concord.world()
     function base_wordld:onEntityAdded(entity)
         if entity['init'] then
             entity:init()
         end
     end
     dialog = require("states.ECS.entities.impl.ui.dialog")
     base_wordld:addEntity(dialog)
     for k, v in pairs(base_systems) do
         base_wordld:addSystem(v)
     end
    camera = StalkerCamera()
    player = require("states.ECS.entities.player")
    selectEntity = require("states.ECS.entities.select_entity")
    resourceManagerEntity = require("states.ECS.entities.impl.rource_manager")
    
    base_wordld:addEntity(player)
    base_wordld:addEntity(selectEntity)
    base_wordld:addEntity(resourceManagerEntity)
    dialog:add("enter game, 你好")
    window.userArea.call_draw = function()
        -- 绘制内容
        local dLineHeight = 20
        base_wordld:query({"isPlayer"}, function()
            local index = 0
            for k, v in pairs(player.resources) do
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.print(k .. "==" .. math.floor(player.resources[k]),  10,20+  index * dLineHeight)
                index = index + 1

            end
        end)
    end
end
function game:update(dt)
    base_wordld:emit("update",dt)
    camera:follow(player.position.x,player.position.y)
    camera:update(dt)
end

function game:keypressed(key, code)
    
end

function game:mousepressed(x, y, mbutton)
    Window.mousePressedHandle(x,y,mbutton)
    base_wordld:emit("mousepressed",x, y, mbutton)
end

function game:mousereleased(x, y, mbutton)
    Window.mouseReleasedHandle(x,y,mbutton)
    base_wordld:emit("mousereleased",x, y, mbutton)
end

function love.mousemoved(x , y , dx , dy )
    Window.mousemoved(x,y,dx,dy)
    
end

function game:draw()
    camera:attach()
    love.graphics.rectangle("line",100,100,100,100)
    base_wordld:emit("draw")

    camera:detach()
    camera:draw()
    base_wordld:emit("drawNoinCarmera")
    Window.draw()
end

return game
