-- 移动系统
move_system = Concord.system({
    pool = {"position", "velocity"}
})

function move_system:update(dt)
    for _, e in ipairs(self.pool) do
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