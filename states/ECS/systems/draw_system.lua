-- 绘制系统
draw_system = Concord.system({
    pool = {"position", "drawable"}
})

function draw_system:draw()
    for _, e in ipairs(self.pool) do
        if e.draw then
            e:draw()
        else
           love.graphics.rectangle("fill", e.position.x, e.position.y, 111, 111)
        end
       
    end
end