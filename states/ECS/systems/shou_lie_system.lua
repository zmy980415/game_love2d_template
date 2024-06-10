-- 绘制系统
shou_lie_system = Concord.system({
    pool = {"position", "drawable","select"}
})

function shou_lie_system.mousepressed( x, y, button, istouch, presses )

end


function shou_lie_system.mousereleased( x, y, button, istouch, presses )

end

function shou_lie_system:update()
    
end
    
function shou_lie_system:draw()
    if isDown then
        love.graphics.setColor(0,1,0,1)
        love.graphics.rectangle("line", select_rect.x, select_rect.y, select_rect.x2-select_rect.x, select_rect.y2-select_rect.y)
        
    end
    for _, e in ipairs(self.pool) do
        if e.select == true then
            love.graphics.setColor(1,0,0,1)
            love.graphics.circle("line", e.position.x, e.position.y, 20)
            if e.draw then
                e:draw()
            else
                love.graphics.setColor(1,0,0,1)
                love.graphics.circle("line", e.position.x, e.position.y, 20)
            end
        end
    end
end
    
return shou_lie_system