-- 移动任务
local coms = ECS.component_table
local task_move_system =  ECS.System("process", 1, ECS.Query.All({coms.position, coms.velocity, coms.select, coms.target}))
function task_move_system:update(Time)

    local dt = Time.DeltaFixed
    for i, entity in self:Result():Iterator() do
        local position = entity[coms.position]
        local target = entity[coms.target]
        local velocity = entity[coms.velocity]
        if position.x < target.x then
            position.x = position.x + velocity.x * dt
        end
        if position.x > target.x then
            position.x = position.x - velocity.x * dt
        end
        if position.y < target.y then
            position.y = position.y + velocity.y * dt
        end
        if position.y > target.y then
            position.y = position.y - velocity.y * dt
        end
    end
end


function task_move_system:mousepressed(x, y, mbutton)
    for i, entity in self:Result():Iterator() do
        if mbutton == 2 then
            if e.select == true then
                e.target.x, e.target.y = camera:getMousePosition()
                dialog:add("移动到" .. e.target.x .. "," .. e.target.y)
            end
        end
    end

end

function task_move_system:mousereleased(x, y, mbutton)

end

return task_move_system
