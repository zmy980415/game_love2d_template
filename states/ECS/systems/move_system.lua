-- 移动系统
local coms = ECS.component_table
local move_system =  ECS.System("process", 1, ECS.Query.All({coms.position, coms.velocity}))
function move_system:update(Time)
    local dt = Time.DeltaFixed
    for i, e in self:Result():Iterator() do
        e:update(dt)
        if e.move then
            e:move(dt)
        else
            e.position.x = e.position.x + e.velocity.x * dt
            e.position.y = e.position.y + e.velocity.y * dt
        end
    end
end

return move_system