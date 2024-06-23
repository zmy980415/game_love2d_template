-- 绘制系统
select_system = Concord.system({
    pool = {"position", "drawable","select"}
})
isDown = false
select_rect = {
    x = 0,
    y = 0,
    x2 = 0,
    y2 = 0
}

function select_system.mousepressed( x, y, button, istouch, presses )
    if isDown == false and button == 1 then
        isDown = true
        select_rect.x, select_rect.y = camera:getMousePosition()
    end
    
end


function select_system.mousereleased( x, y, button, istouch, presses )
    if  button == 1 then
        isDown = false
    end
    
    select_rect = {
        x = 0,
        y = 0,
        x2 = 0,
        y2 = 0
    }
end

function select_system:update()
    if love.keyboard.isDown("escape") then
        for _, e in ipairs(self.pool) do
            e.select = false
        end
    end
    if isDown == true and love.keyboard.isDown('lctrl') then
        select_rect.x2, select_rect.y2 = camera:getMousePosition()
        for _, e in ipairs(self.pool) do
            if Utils.inRect(e.position.x,e.position.y,{
                x = select_rect.x,
                y = select_rect.y,
                w = select_rect.x2 - select_rect.x,
                h = select_rect.y2 - select_rect.y
            }) then
                e.select = true
            else
                e.select = false
            end
            
        end
    end
end
    
function select_system:draw()
    if isDown and love.keyboard.isDown('lctrl') then
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
    
return select_system