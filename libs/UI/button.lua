local zClass = require 'libs.class.zClass'

local function inButton(x, y, bx, by, bw, bh)
    return x > bx and x < bx + bw and y > by and y < by + bh
end

local button = zClass.new({
    text = 'button',
    pos = { x = 0, y = 0 },
    size = { width = 100, height = 32 },
    defaultButtonSize = 32,
    status = 'none',
    move = function(this,x,y,dx,dy)
        this.pos.x = this.pos.x + dx
        this.pos.y = this.pos.y + dy
    end,
    handle = function(this, typeOfMouse, button) -- typeOfMouse 1 按下，2 放开， button 1 左键， 2 右键
        if typeOfMouse == 1 and button == 1 then
            local x = love.mouse.getX()
            local y = love.mouse.getY()
            local bx = this.pos.x
            local by = this.pos.y
            local bw = this.size.width
            local bh = this.size.height
            if (x > bx and x < bx + bw and y > by and y < by + bh) then
                this.status = 'mouseDown'
                this:onClick()
                return true
            end
        else
            this.status = 'none'
        end
        return false
    end,
    onClick = function(this)
        -- print(this.text)
        -- this.text = love.math.random() .. 'name'
    end,
    onDraw = function(this)

        local r, g, b, a = love.graphics.getColor()
        if this.status == 'mouseDown' then
            love.graphics.setColor(.3, .5, .6, .3)
        else
            love.graphics.setColor(0, .7, .2, .3)
        end
        love.graphics.rectangle('fill', this.pos.x
            , this.pos.y,
            this.size.width,
            this.size.height)
            love.graphics.setColor(0, 1, 0.6, .3)    
        love.graphics.rectangle('line', this.pos.x
            , this.pos.y,
            this.size.width,
            this.size.height)    
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print(this.text, this.pos.x
        , this.pos.y)

        love.graphics.setColor(r, g, b, a)
    end

})


local Button = {
    new = function(text, x, y)
        local btn = zClass.new(button)
        zClass.include(btn, { text = text, pos = { x = x, y = y } })
        return btn
    end,

}

return Button
