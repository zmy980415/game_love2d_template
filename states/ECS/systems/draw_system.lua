-- 绘制系统
-- draw_system = Concord.system({
--     pool = {"position", "drawable","drawOrder"}
-- })
local coms = ECS.component_table
local draw_system =  ECS.System("process", 1, ECS.Query.All({coms.position, coms.drawable, coms.drawOrder}))

function draw_system:Update(Time)
    print("=")
end

function draw_system:draw()
    for i, e in self:Result():Iterator() do
        if e.parent ~= nil and e.parent().draw ~= nil then
            e.parent():draw()
        elseif e.draw then
            e:draw()
        else
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            -- TODO 这里的绘制会在最后需要去除掉
            love.graphics.print("defaultDraw",e.position.x,e.position.y-20)
            love.graphics.rectangle("fill", e.position.x, e.position.y, 20, 20)
        end
       
    end
end

function draw_system:drawNoinCarmera()
    for _, e in ipairs(self.pool) do
        if e.drawNoinCarmera then
            e:drawNoinCarmera()
        end
       
    end
end

return draw_system