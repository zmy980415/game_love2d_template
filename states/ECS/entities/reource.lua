local Window = require 'libs.UI.window'

local resource = Classic:extend()
resource.window = Window.new(1,400,300)
function resource:new()
    self.value = math.random(100,2000) -- 资源储量
    self.curValue = self.value
end

function resource:init(maxV) 
    self.curValue , self.value = maxV , maxV
end

function resource:getValue()
    return self.curValue
end

function resource:setValue(v)
    self.curValue = v
end

-- 开发资源
function resource:develop(v)
    v = v or 0.1
    self.curValue = self.curValue - v
    if(self.curValue <= 0) then
        base_wordld:removeEntity(self.prop)
        self.prop:destroy()
        dialog:add("资源耗尽")
    end
   return self.curValue,self.name
end

function resource.drawInfo(this)
    resource.window.userArea.call_draw = function(a)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print(this.name, 10, 10)
        love.graphics.print(this.curValue, 10, 30)
        love.graphics.print(this.value, 10, 50)
    end
end

return resource