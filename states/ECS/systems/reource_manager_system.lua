-- 移动系统
move_system = Concord.system({
    pool = {"resource_manager"}
})

function move_system:update(dt)
    for _, e in ipairs(self.pool) do
        e:update(dt)
    end
end

return move_system