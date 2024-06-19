local prop = Concord.entity():give("resource_manager")

prop.max_count = 10 -- 
prop.current_count = 0 --
prop.resources = {}
prop.resourcePath = "states/ECS/entities/impl/resources"

local resourceManagerEntity = Class.new(prop)

function resourceManagerEntity:init()
    print("init rource manager"..self.resourcePath)
    -- 加载所有资源文件夹下的实体类
    local info = love.filesystem.getInfo(self.resourcePath) -- luacheck: ignore
    if info == nil or info.type ~= "directory" then
        print("bad resource directory (path '%s' not found)", self.resourcePath)
    end

    local files = love.filesystem.getDirectoryItems(self.resourcePath)
    for _, file in ipairs(files) do
        local isFile = love.filesystem.getInfo(self.resourcePath .. "/" .. file).type == "file"
        if not isFile then

        end
        if isFile and string.match(file, '%.lua$') ~= nil then
            local name = file:sub(1, #file - 4)
            local path = self.resourcePath .. "." .. name
            local p, s = path:gsub("%/", ".")
            local value = require(p)
            self.resources[name] = value
            print("load resource: " .. name,value)
        end
    end
    for i = 1, 10, 1 do
        local resource_name = "resource_shui"
        base_wordld:addEntity(self.resources[resource_name]().prop)
    end
    for i = 1, 10, 1 do
        local resource_name = "resource_tu"
        base_wordld:addEntity(self.resources[resource_name]().prop)
    end
end

function resourceManagerEntity:update(dt)
    -- if self.current_count < self.max_count then
    --     -- 创建一个资源
    --     -- 添加到资源管理器
    --     local resource_name = "resource_shui"
    --     base_wordld:addEntity(self.resources[resource_name]().prop)
    --     self.current_count = self.current_count + 1
    -- end
end

function resourceManagerEntity:newEntity(name)

end

return resourceManagerEntity
