-- 移动系统
reource_manager_system = Concord.system({
    pool = {"resource_manager"}
})

function reource_manager_system:update(dt)
    for _, e in ipairs(self.pool) do
        e:update(dt)
    end
end
function reource_manager_system:draw()
    for _, e in ipairs(self.pool) do
        -- e.parent():draw()
    end
end

return reource_manager_system