

base_wordld = Concord.world()

print(move_system,draw_system)

base_wordld:addSystems(move_system, draw_system,select_system)
function base_wordld:onEntityAdded(entity)
    if entity['init'] then
        entity['init']()
    end
end


for k, v in pairs(Entities) do
    base_wordld:addEntity(v)
end

