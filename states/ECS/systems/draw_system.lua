-- 绘制系统
draw_system = Concord.system({
    pool = {"position", "drawable","drawOrder"}
})

function draw_system:draw()
    local t = table.clone( self.pool )
    -- print(t)
    -- table.sort(t, function(a, b) return a.drawOrder.v < b.drawOrder.v end)

    for _, e in ipairs(t) do
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