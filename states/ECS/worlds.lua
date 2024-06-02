
-- 基础世界
-- BaseWorld = Concord.world()
-- BaseWorld:addSystems(MoveSystem, DrawSystem,AnimationSystem,CollisionSystem)
require 'states.ECS.worlds.base_world'


dialog = require("states.ECS.entities.dialog")
base_wordld:addEntity(dialog)