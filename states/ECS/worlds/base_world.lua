

base_wordld = Concord.world()

print(move_system,draw_system)

base_wordld:addSystems(move_system, draw_system)
function base_wordld:onEntityAdded(entity)
    print("add")
end


for k, v in pairs(Entities) do
    base_wordld:addEntity(v)
end

base_wordld:addEntity(require("states.ECS.entities.dialog"))