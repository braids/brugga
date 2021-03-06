local class = require 'lib.middleclass'
local Gamestate = require 'gamestates.gamestate'
local Menu = require'ui.menu'

local Pause = class('Pause', Gamestate)


function Pause:initialize(name)
  Gamestate.initialize(self, name)

  self.w = 900
  self.h = 340

  self.x = 1280 / 2 - self.w / 2
  self.y = 720 / 2 - self.h / 2

  self.menu = Menu:new({
    { kind='text', label='Return to Game', func=function() gameWorld.gameState:exitState() end },
    { kind='text', label='Abandon Game', func=function() gameWorld.gameState:setState('ending') end },
    { kind='slider', label='SFX', get=function() return gameWorld.sound.tags.sfx.volume end, set=function(value) gameWorld.sound:setSfxVolume(value) end },
    { kind='slider', label='Music', get=function() return gameWorld.sound.tags.music.volume end, set=function(value) gameWorld.sound:setMusicVolume(value) end },
    { kind='text', label='Exit to Desktop', func=function() gameWorld.settings:save() love.event.push('quit') end },
  }, self.w, self.h)

end

function Pause:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 0.5)
  love.graphics.rectangle('fill', self.x - 20, self.y - 20, self.w + 40, self.h + 40, 16, 16, 16)
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
  self.menu:draw(self.x, self.y)
end

function Pause:exit()
  gameWorld.settings:save()
end

function Pause:update(dt)
  self.menu:update(dt)
  if gameWorld.playerInput:pressed('pause') then
    gameWorld.gameState:exitState()
  end
end

return Pause
