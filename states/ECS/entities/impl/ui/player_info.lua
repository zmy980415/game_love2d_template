-- local prop = Concord.entity():give("position", 0, 0):give("drawable"):give("ui"):give("drawOrder", 1000)

-- local userInfo = Class.new(prop)
-- userInfo.userInfos = {}

-- -- 防止调用默认的绘制系统的draw方法
-- function userInfo:draw()

-- end

-- function userInfo:drawNoinCarmera()
--     -- 绘制背景
--     love.graphics.setColor(.5, .3, .4, 1)
--     local width, height = 200, love.graphics.getHeight()
--     -- 对话框背景
--     love.graphics.setColor(.2, .5, .6, 1)
--     love.graphics.rectangle("fill", self.position.x, self.position.y, width, height)
--     -- 对话框前景
--     love.graphics.setColor(.2, .5, .6, 1)
--     love.graphics.setLineWidth(8)
--     -- love.graphics.setLineStyle("rough")
--     love.graphics.rectangle("line", self.position.x, self.position.y, width, height)
--     love.graphics.setLineWidth(1)
--     -- 绘制内容
--     local dLineHeight = 40
    
--     base_wordld:query({"isPlayer"}, function(player)
--         local index = 0
--         for k, v in pairs(player.resources) do
--             love.graphics.setColor(1, 1, 1, 1)
--             love.graphics.print(k .. "==" .. math.floor(player.resources[k]), self.position.x + 10, self.position.y + index*dLineHeight)
--             index = index + 1

--         end
--     end)


-- end

-- return userInfo
