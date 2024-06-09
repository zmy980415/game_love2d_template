-- 移动任务
task_move_system = Concord.system({
    pool = {"position", "velocity"}
})

function task_move_system:update(dt)
    for _, e in ipairs(self.pool) do
        if e.move then
            e:move(dt)
        else
            e.position.x = e.position.x + e.velocity.x * dt
            e.position.y = e.position.y + e.velocity.y * dt
        end
    end
end