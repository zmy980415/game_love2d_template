-- 绘制系统
draw_system = Concord.system({
    pool = {"position", "drawable"}
})

function draw_system:draw()
    for _, e in ipairs(self.pool) do
        if e.draw then
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
            love.graphics.rectangle("fill", e.position.x, e.position.y, 100, 100)
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