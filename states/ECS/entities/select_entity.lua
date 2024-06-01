
local prop= Concord.entity()
    :give("select")


local selectSystemEntity=Class.new(prop)

function selectSystemEntity:init()
    State.setAopFun(select_system['mousepressed'],'mousepressed')
    State.setAopFun(select_system['mousereleased'],'mousereleased')
end


return selectSystemEntity
