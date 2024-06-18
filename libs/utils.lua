return {
    inRect = function (x,y,rect)
        if rect.w < 0 then
            rect.x = rect.x + rect.w
            rect.w = -rect.w
        end
        if rect.h < 0 then
            rect.y = rect.y + rect.h
            rect.h = -rect.h
        end
        if x >= rect.x and x <= rect.x + rect.w and y >= rect.y and y <= rect.y + rect.h then
            return true
        end
        return false
    end,
    inCircle = function(x,y,circle)
        if circle.r < 0 then
            circle.x = circle.x + circle.r
            circle.r = -circle.r
        end
        if (x - circle.x) * (x - circle.x) + (y - circle.y) * (y - circle.y) <= circle.r * circle.r then
            return true
        end
        return false
    end
    
}