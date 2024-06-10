
local prop= Concord.entity()
    :give("resource")

prop.max_count = 100 -- 
prop.current_count = 0 --

local resourceManagerEntity=Class.new(prop)

function resourceManagerEntity:init()
    print("init rource manager")
end

function resourceManagerEntity:update(dt)
    if self.current_count < self.max_count then
        -- 创建一个资源
        local entity = {}
        -- 添加到资源管理器
        base_wordld:addEntity(entity)
        self.current_count = self.current_count + 1
    end
end

return resourceManagerEntity
