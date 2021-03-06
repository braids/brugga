local class = require 'lib.middleclass'
local rect = require 'physics.rect'

local Entity = class('Entity')

function Entity:initialize()
  -- Entity state properties
  self.isActive = false

  -- Collision properties
  self.bumpWorld = nil
  self.rect = rect:new()        -- Init rectangle
  self.props = {}               -- Init properties
  self.rect.props = self.props  -- Store property info in rect

  -- Drawing properties
  self.drawStyle = 'fill'
  self.drawColor = nil
end

function Entity:addToWorld(bumpWorld)
  self.bumpWorld = bumpWorld
  self.bumpWorld:add(self.rect, self.rect.x, self.rect.y, self.rect.w, self.rect.h)
end

function Entity:update(dt)
end

function Entity:draw()
  -- If no color specified, draw with all color values max
  if (self.drawColor == nil) then
    love.graphics.setColor(gameWorld.colors.white)
  else
    love.graphics.setColor(self.drawColor)
  end
  -- Draw rectangle
  if self.animation_test then
    local image = self.animation_test[1]
    local anim = self.animation_test[2]
    anim:draw(image, self.rect.x, self.rect.y)
  else
    love.graphics.rectangle(self.drawStyle, self.rect.x, self.rect.y, self.rect.w, self.rect.h)
  end
end

return Entity
