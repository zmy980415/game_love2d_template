

local prop= Concord.entity()
    :give("position", 0, love.graphics.getHeight() - 80)
    :give("drawable")
    :give("ui")
    :give("drawOrder",1000)

local dialog = Class.new(prop) 

dialog.stack = {}
dialog.pc = 0

function dialog:add(message)
    dialog.pc = dialog.pc + 1
    self.stack[dialog.pc] = message
end

-- 防止调用默认的绘制系统的draw方法
function dialog:draw()
   
end

function dialog:drawNoinCarmera()
    -- 绘制背景
    love.graphics.setColor(.5,.3,.4,1)
    local width = love.graphics.getWidth()
    love.graphics.rectangle("fill", self.position.x, self.position.y, width, 80)
    -- 对话框前景
    love.graphics.setColor(.2,.5,.6,1)
    love.graphics.setLineWidth(8)
    -- love.graphics.setLineStyle("rough")
    love.graphics.rectangle("line", self.position.x, self.position.y, width, 80)
    love.graphics.setLineWidth(1)
    -- 绘制内容
    
    if self.pc > 0 then
        love.graphics.setColor(1,1,1,1)
        for i = 0, 2, 1 do
            if self.stack[self.pc-i] ~= nil then
                love.graphics.print(self.stack[self.pc - i], self.position.x + 20, self.position.y + 50 - i*20)
            end
        end
        
    end

end

return dialog
