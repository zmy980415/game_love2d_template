-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !! This flag controls the ability to toggle the debug view.         !!
-- !! You will want to turn this to 'true' when you publish your game. !!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
RELEASE = true

-- Enables the debug stats
DEBUG = not RELEASE

CONFIG = {
    graphics = {
        filter = {
            -- FilterModes: linear (blurry) / nearest (blocky)
            -- Default filter used when scaling down
            down = "nearest",

            -- Default filter used when scaling up
            up = "nearest",

            -- Amount of anisotropic filter performed
            anisotropy = 1,
        }
    },

    window = {
        icon = 'assets/images/icon.png'
    },

    debug = {
        -- The key (scancode) that will toggle the debug state.
        -- Scancodes are independent of keyboard layout so it will always be in the same
        -- position on the keyboard. The positions are based on an American layout.
        key = '`',

        stats = {
            font            = nil, -- set after fonts are created
            fontSize        = 16,
            lineHeight      = 18,
            foreground      = {1, 1, 1, 1},
            shadow          = {0, 0, 0, 1},
            shadowOffset    = {x = 1, y = 1},
            position        = {x = 8, y = 6},

            kilobytes = false,
        },

        -- Error screen config
        error = {
            font            = nil, -- set after fonts are created
            fontSize        = 16,
            background      = {.1, .31, .5},
            foreground      = {1, 1, 1},
            shadow          = {0, 0, 0, .88},
            shadowOffset    = {x = 1, y = 1},
            position        = {x = 70, y = 70},
        },
    }
}

local function makeFont(path)
    return setmetatable({}, {
        __index = function(t, size)
            local f = love.graphics.newFont(path, size)
            rawset(t, size, f)
            return f
        end
    })
end

Fonts = {
    default = nil,

    regular         = makeFont 'assets/fonts/Roboto-Regular.ttf',
    bold            = makeFont 'assets/fonts/Roboto-Bold.ttf',
    light           = makeFont 'assets/fonts/Roboto-Light.ttf',
    thin            = makeFont 'assets/fonts/Roboto-Thin.ttf',
    regularItalic   = makeFont 'assets/fonts/Roboto-Italic.ttf',
    boldItalic      = makeFont 'assets/fonts/Roboto-BoldItalic.ttf',
    lightItalic     = makeFont 'assets/fonts/Roboto-LightItalic.ttf',
    thinItalic      = makeFont 'assets/fonts/Roboto-Italic.ttf',

    monospace       = makeFont 'assets/fonts/RobotoMono-Regular.ttf',
    cnm       = makeFont 'assets/fonts/cnm.sb.ttf',
    ipix_12px       = makeFont 'assets/fonts/ipix_12px.ttf',
    SIMFANG       = makeFont 'assets/fonts/SIMFANG.TTF',
    SIMSUN       = makeFont 'assets/fonts/SIMSUN.TTC',
    
}

-- 全局常量
G = 200


Fonts.default = Fonts.ipix_12px

CONFIG.debug.stats.font = Fonts.SIMFANG  -- 设置游戏字体
CONFIG.debug.error.font = Fonts.monospace

Lume    = require 'libs.lume'
Husl    = require 'libs.husl'
Class   = require 'libs.class'
Classic = require 'threepartlibs.classic.classic'
Vector  = require 'libs.vector'
State   = require 'libs.state'
Signal  = require 'libs.signal'
Inspect = require 'libs.inspect'
Camera  = require 'libs.camera'
Utils    = require 'libs.utils'
StalkerCamera = require("threepartlibs.STALKER_X.Camera")
Concord  = require 'threepartlibs.Concord.concord'
require 'threepartlibs.loveAnimation.animation'
Timer   = require 'libs.timer'
Loader = require 'threepartlibs.love2dassetsloader.Loader.loader'
Loader.init() -- Do not forget this!
WF = require 'threepartlibs.windfield.windfield'
-- ECS
Concord.utils.loadNamespace('states/ECS/components')
base_systems =  {}
Concord.utils.loadNamespace('states/ECS/systems', base_systems)

camera = StalkerCamera()

States = {
    game = require 'states.game',
}
