-- 移动系统
-- MoveSystem = Concord.system({
--     pool = {"position", "velocity"}
-- })

-- function MoveSystem:update(dt)
--     for _, e in ipairs(self.pool) do
--         e:move(dt)
--     end
-- end

require 'states.ECS.systems.move_system'
require 'states.ECS.systems.draw_system'