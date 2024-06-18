local reource= Concord.entity()
    :give("resource")
    :give("position")

reource.value = 100 -- 资源储量
reource.curValue = reource.value


function reource:init(maxV) 
    self.curValue , self.value = maxV , maxV
    
end

function reource:getValue()
    return self.curValue
end

function reource:setValue(v)
    self.curValue = v
end

-- 开发资源
function reource:develop()
    reource.curValue = reource.curValue - 1
    if(reource.curValue <= 0) then
        base_wordld:removeEntity(self)
        dialog:add("资源耗尽")
    end
   return reource.curValue
end


return reource