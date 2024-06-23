--[[
    窗口：包含客户区，非客户区
    非客户区：{
        是否显示，默认同windows风格窗口
        右侧按钮组
        默认事件{
            最小化，
            显示，
            销毁，
        }
    }
    客户区：{
        采用
    }
]]


local zClass = require 'libs.class.zClass'
local Button = require 'libs.UI.button'

local Window = {
    pool = {}
}

local noUserArea = zClass.new({
    show = true,
    pos = { x = 0, y = 0 },
    size = { width = 500, height = 32 },
    defaultButtonSize = 32,
    -- buttons = {1,2},
    status = 'none',
    onQuit = function(this)
        for index, w in ipairs(Window.pool) do
            if w['noUserArea'] == this then
                table.remove(Window.pool, index)
            end
        end
        this.show = false
        for i, v in pairs(this) do
            this[i] = nil
        end
        this = nil
    end,
    onMin = function(this)
        this.userArea.show = false
    end,
    onShow = function(this)
        this.userArea.show = true
    end,
    onDraw = function(this)
        if this.show then
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(.3, .4, .7,.5)
            love.graphics.rectangle('fill', this.pos.x, this.pos.y, this.size.width, this.size.height)
            for index, btn in ipairs(this.buttons) do
                if btn ~= nil then
                    btn:onDraw()
                end
            end
            love.graphics.setColor(.5, .4, .5,1)
            love.graphics.rectangle('line', this.pos.x, this.pos.y, this.size.width, this.size.height)

            love.graphics.setColor(r, g,b,a)
        else
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(.3, .4, .7,.5)
            love.graphics.rectangle('fill', this.pos.x, this.pos.y, 100, 100)

            love.graphics.setColor(r, g,b,a)
        end
    end,
    mouseLeftHandle = function(this, typeOfMouse, button) -- typeOfMouse 1 down,2 release -- 1:left,2:right
        for index, btn in ipairs(this.buttons) do
            if btn ~= nil then
                if btn:handle(typeOfMouse, button) then
                    return
                end
            end
        end
        if this ~= nil and button == 1 and typeOfMouse == 1 then
            local x = love.mouse.getX()
            local y = love.mouse.getY()
            local bx = this.pos.x
            local by = this.pos.y
            local bw = this.size.width
            local bh = this.size.height
            if (x > bx and x < bx + bw and y > by and y < by + bh) then
                this.status = 'leftMousePressed'
            end
        end
        if this.status == 'leftMousePressed' and button == 1 and typeOfMouse == 2 then
            this.status = 'none'
        end
    end,
    initlize = function(this,rect)
        this.buttons = {}
        print(rect.width)
        if rect ~= nil then
            this.size = { width =rect.width or 500, height =rect.height or 32 }
        end
        local quitBtn = Button.new('quit', this.pos.x, this.pos.y)
        quitBtn.onClick = function()
            this.show = false
            this:onQuit()
        end
        local minBtn = Button.new('min', this.pos.x, this.pos.y)
        minBtn.onClick = function()
            this:onMin()
        end
        local showBtn = Button.new('show', this.pos.x, this.pos.y)
        showBtn.onClick = function()
            this:onShow()
        end

        table.insert(this.buttons, minBtn)
        table.insert(this.buttons, showBtn)
        table.insert(this.buttons, quitBtn)

        for index, btn in ipairs(this.buttons) do
            btn.pos.x = this.pos.x + this.size.width - (#this.buttons - index + 1) * btn.size.width
        end
    end,
    mouseMoved = function(this, x, y, dx, dy)
        if this.status == 'leftMousePressed' then
            this.pos.x = this.pos.x + dx
            this.pos.y = this.pos.y + dy
            for index, btn in ipairs(this.buttons) do
                btn:move(x, y, dx, dy)
            end
        end
    end

})

local userArea = zClass.new({
    show = true,
    pos = { x = 0, y = 0 },
    size = { width = 600, height =  400},
    canvas = nil,
    -- defaultButtonSize = 32,
    -- buttons = {1,2},
    status = 'none',
    draw = function(this) 
        love.graphics.clear()
        local r,g,b,a = love.graphics.getColor()
        love.graphics.print("this is a user area",0,0)
        if this.call_draw and type( this.call_draw ) == 'function' then
            this.call_draw();
        end
    end,

    onDraw = function (this)
        if this.show then
            local r,g,b,a = love.graphics.getColor()
                love.graphics.setColor(.2, .6, .8, 1)
                love.graphics.rectangle('fill', this.pos.x, this.pos.y, this.size.width, this.size.height)
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.push()
                
                love.graphics.setCanvas(this.canvas)
                love.graphics.translate(0, 0)
                if type(this.draw) == "function" then this:draw() end
                love.graphics.setCanvas()
                love.graphics.pop()
                love.graphics.draw(this.canvas,this.pos.x,this.pos.y)
                love.graphics.setColor(.2, .4, .7, 1)
                love.graphics.rectangle('line', this.pos.x, this.pos.y, this.size.width, this.size.height)
                love.graphics.setColor(r, g, b, a)
            
        end
    end,
    initlize = function(this,win)
        -- pos
        local pos = { x = 0, y = 0 }
        for key, value in pairs(win) do
        end
        if win['noUserArea'] ~= nil then
            pos.x = win['noUserArea'].pos.x
            pos.y = win['noUserArea'].pos.y + win['noUserArea'].size.height
            this.size.width = win['noUserArea'].size.width
        end
        this.pos.x = pos.x
        this.pos.y = pos.y
    end,
    
})


local window = zClass.new({
    sortId = -1,
    id=-1,
    show = true,
    status = 'SELECTED',
    size = { width = 0, height = 0 },
    pos = { x = 0, y = 0 },
    inArea = function (this,x,y)
        local bx = this.pos.x
        local by = this.pos.y
        local bw = this.size.width
        local bh = this.size.height
        return (x > bx and x < bx + bw and y > by and y < by + bh)
    end,
    update = function (this)
        local size = { width = 0, height = 0 }
        local pos = { x = 0, y = 0 }
        if this['noUserArea'] ~= nil then
            pos.x = this['noUserArea'].pos.x
            pos.y = this['noUserArea'].pos.y
            size.width = this['noUserArea'].size.width
            size.height = this['noUserArea'].size.height
        end
        if this['userArea'] ~= nil then
            size.width = size.width
            size.height = size.height + this['userArea'].size.height
        end

        this.pos.x = pos.x
        this.pos.y = pos.y
        this.size.width = size.width
        this.size.height = size.height
    end,
    initlize = function(this)
        -- 设置size, pos
        local size = { width = 0, height = 0 }
        local pos = { x = 0, y = 0 }
        if this['noUserArea'] ~= nil then
            pos.x = this['noUserArea'].pos.x
            pos.y = this['noUserArea'].pos.y
            size.width = this['noUserArea'].size.width
            size.height = this['noUserArea'].size.height
        end
        if this['userArea'] ~= nil then
            size.width = size.width
            size.height = size.height + this['userArea'].size.height
        end

        this.pos.x = pos.x
        this.pos.y = pos.y
        this.size.width = size.width
        this.size.height = size.height
    end,
    mouseMoved = function(this, x, y, dx, dy)
        if this.status == 'leftMousePressed' then
            this.pos.x = this.pos.x + dx
            this.pos.y = this.pos.y + dy
            if this['noUserArea'] ~= nil then
                this['noUserArea']:mouseMoved(x,y,dx,dy)
                this['userArea'].pos.x = this['noUserArea'].pos.x
                this['userArea'].pos.y = this['noUserArea'].pos.y + this['noUserArea'].size.height
            else
                this['userArea'].pos.y = this.pos.y + this.size.height
                this['userArea'].pos.x = this.pos.x
            end
        end
        this:update()
    end,
    mouseLeftHandle = function(this, typeOfMouse, button) -- typeOfMouse 1 down,2 release -- 1:left,2:right
        if this ~= nil and button == 1 and typeOfMouse == 1 then
            local x = love.mouse.getX()
            local y = love.mouse.getY()
            local bx = this.pos.x
            local by = this.pos.y
            local bw = this.size.width
            local bh = this.size.height
            if (x > bx and x < bx + bw and y > by and y < by + bh) then
                this.status = 'leftMousePressed'
            end
        end
        if this.status == 'leftMousePressed' and button == 1 and typeOfMouse == 2 then
            this.status = 'none'
        end
        if this['noUserArea'] ~= nil then
            this['noUserArea']:mouseLeftHandle(typeOfMouse,button)
        end
        -- win['noUserArea']:mouseLeftHandle(typeOfMouse, button)
    end,
    draw = function (this)
        if this['noUserArea'] ~= nil and this['noUserArea'].show then
            -- 鼠标点击处理
            this['noUserArea']:onDraw()
        end
        if this['userArea'] ~= nil and this['userArea'].show then
            -- 鼠标点击处理
            this['userArea']:onDraw()
        end
        love.graphics.print(this.id,this.pos.x,this.pos.y)
    end
})
window['noUserArea'] = {}
window['userArea'] = {}
zClass.include(window['noUserArea'], noUserArea)
zClass.include(window['userArea'], userArea)






local function sortWindows()
    table.sort(Window.pool,function (a,b)
        return a.sortId > b.sortId
    end)

end

-- 初始化 sortId
Window.sortId = 1
function Window.new(mode,width,height) -- 1 有noUserArea ,2 没有noUserArea
    local win = zClass.new(window)
    
    if mode == 2 then
        win['noUserArea'] = nil
    else
        win['noUserArea']:initlize({width=width,height=32})
    end
    win['userArea']:initlize(win)
    
    win.sortId = Window.sortId
    win.id = Window.sortId
    Window.sortId = Window.sortId + 1
    win:initlize()
    win['noUserArea'].userArea = win['userArea']
    win['userArea'].size.height = height
    win.userArea.canvas = love.graphics.newCanvas(win.userArea.size.width,win.userArea.size.height)
    table.insert(Window.pool, win)
    sortWindows()
    return win
end


function Window.mousePressedHandle(x, y, button)
    -- 判断当前选择的是哪个窗口，同时只能选择一个窗口
    if #Window.pool > 0 then
        local tempWin = nil
        local topWin = Window.pool[1]
        
        local maxSortId = Window.pool[1].sortId
        local winSize = #Window.pool
        for i=1,winSize do
            local win = Window.pool[i]
                if win:inArea(x,y) then
                    local tSortId = win.sortId
                    local curWinSortId = win.sortId
                    local poolSize = #Window.pool
                    for idx=poolSize, 1,-1 do
                        local w = Window.pool[idx]
                        if w.sortId ~= curWinSortId then
                            if w.sortId > tSortId then
                                local wSortId = w.sortId
                                w.sortId = tSortId
                                tSortId = wSortId
                            end
                        end
                    end
                    
                    win.sortId = tSortId
                    sortWindows()
                    
                    tempWin = win
                    break
                end
        end

        if tempWin ~= nil then
            
            tempWin:mouseLeftHandle(1, button)
        end
    end

    if button == 2 then
        -- Window.new()
    end
end

function Window.mouseReleasedHandle(x, y, button)
    for index, win in ipairs(Window.pool) do
        win:mouseLeftHandle(2, button)
        
    end
end

function Window.mousemoved(x, y, dx, dy)
    for index, win in ipairs(Window.pool) do
        if win['noUserArea'] ~= nil then
            
            win:mouseMoved(x, y, dx, dy)
        end
    end
end

function Window.draw()
    local winSize = #Window.pool
    for i=1,winSize do
        local win = Window.pool[winSize -i +1]
        -- if win.show then
            
            love.graphics.setColor(1, 1, 1, 1)
            win:draw()
            if i == winSize and win['userArea'].show then
                local r,g,b,a = love.graphics.getColor()
                love.graphics.setColor(.4, .8, .8, 1)
                love.graphics.rectangle('line', win.pos.x, win.pos.y, win.size.width, win.size.height)
                love.graphics.setColor(r, g, b, a)
            end
        -- end
    end
    
end

return Window
