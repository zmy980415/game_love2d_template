-- 移动任务
process_solid_system = Concord.system({
    pool = {"position", "velocity","select","target"}
})

function process_solid_system:update(dt)
    for _, e in ipairs(self.pool) do
        if e.position.x < e.target.x then
            e.position.x = e.position.x + e.velocity.x * dt
        end
        if e.position.x > e.target.x then
            e.position.x = e.position.x - e.velocity.x * dt
        end
        if e.position.y < e.target.y then
            e.position.y = e.position.y + e.velocity.y * dt
        end
        if e.position.y > e.target.y then
            e.position.y = e.position.y - e.velocity.y * dt
        end
        
    end
end

function process_solid_system:mousepressed(x, y, mbutton)
    for _, e in ipairs(self.pool) do
        if mbutton == 2 then
            if e.select == true then
                e.target.x, e.target.y = camera:getMousePosition()
                dialog:add("移动到: "..e.target.x..","..e.target.y)
            end
        end
    end
    
end

function process_solid_system:mousereleased(x, y, mbutton)

    
    
end


return process_solid_system