return {
    drawOrder = ECS.Component({order= 1}),
    drawable = ECS.Component(),
    isPlayer = ECS.Component(),
    position = ECS.Component({x=0,y=0}),
    rect = ECS.Component({width=0,height=0}),
    resource_manager = ECS.Component(),
    -- 标志资源组件
    resource = ECS.Component(),
    select = ECS.Component({isSelect=false}),
    target = ECS.Component({x=0,y=0}),
    velocity = ECS.Component({x=0,y=0})
}