--[[
    下面是工具方法，非面向对象公开的方法，面向对象的方法只会在zClass中
]]
TableDeepCopy = function(targetTab)
    if targetTab == nil then
        return nil
    end
    if type(targetTab) ~= "table" then
        return targetTab
    end
    local new_tab = {}
    local mt = getmetatable(targetTab)
    if mt ~= nil then
        setmetatable(new_tab, mt)
    end
    for i, v in pairs(targetTab) do
        if type(v) == "table" then
            new_tab[i] = TableDeepCopy(v)
        else
            new_tab[i] = v
        end
    end
    return new_tab
end
TableDeepInclude = function(srcTable, includeTable)
    if srcTable == nil then
        srcTable = {}
    end
    if type(srcTable) ~= "table" then
        return srcTable
    end
    for i, v in pairs(includeTable) do
        if type(v) == "table" then
            srcTable[i] = TableDeepCopy(v)
        else
            srcTable[i] = v
        end
    end
    return srcTable
end


-- 这个只是用来包裹方法
local zClass = {}

-- 这是原表
local mt = {
    name = 'aaa',
    -- 公用的一些方法
    log = function(this)
        print(this['name'])
    end,
    set = function(this, k, v)
        this[k] = v
    end,
    get = function(this, k)
        return this[k]
    end
}

mt["__index"] = mt
zClass.new = function(tmpTable)
    local t = nil
    if tmpTable ~= nil then
        t = TableDeepCopy(tmpTable)
    else
        t = {}
    end

    setmetatable(t, mt)
    return t
end


zClass.include = function(srcTable, ...)
    local arg = {...}
    for i=1, select("#",arg) do
        TableDeepInclude(srcTable, arg[i])
    end
    return srcTable
end


return zClass
