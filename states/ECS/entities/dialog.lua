

local prop= Concord.entity()
    :give("position", 0, 520)
    :give("drawable")

local dialog = Class.new(prop) 




function dialog:draw()
    -- 绘制背景
    love.graphics.setColor(.4,.3,.6,1)
    local width = love.graphics.getWidth()
    love.graphics.rectangle("fill", self.position.x, self.position.y, width, 80)
    -- 对话框前景

    -- 绘制内容
end

return dialog
