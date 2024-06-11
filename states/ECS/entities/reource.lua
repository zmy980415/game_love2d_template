local reource= Concord.entity()
    :give("resource")
    :give("position")

reource.value = 100 -- 资源储量

-- 开发资源
function reource:develop()
    reource.value = reource.value - 1
end


return reource