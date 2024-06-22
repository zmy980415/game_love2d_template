-- 移动系统
local coms = ECS.component_table
local reource_manager_system =  ECS.System("process", 1, ECS.Query.All({coms.resource_manager}))
function reource_manager_system:update(Time)
    local dt = Time.DeltaFixed
    for i, e in self:Result():Iterator() do
        e:update(dt)
    end
end
function reource_manager_system:draw()
    for i, e in self:Result():Iterator() do
        -- e.parent():draw()
    end
end

return reource_manager_system