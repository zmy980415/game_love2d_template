

local reource = Classic:extend()


function reource:new()
    self.value = 100 -- 资源储量
    self.curValue = self.value
end

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
function reource:develop(v)
    v = v or 0.1
    self.curValue = self.curValue - v
    if(self.curValue <= 0) then
        base_wordld:removeEntity(self.prop)
        self.prop:destroy()
        dialog:add("资源耗尽")
    end
   return self.curValue
end


return reource