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

function entityClass()
  return Entity
end

function Entity:addToWorld(bumpWorld)
  self.bumpWorld = bumpWorld
  bumpWorld:add(self.rect, self.rect.x, self.rect.y, self.rect.w, self.rect.h)
end

function Entity:draw()
  -- If no color specified, draw with all color values max
  if (self.drawColor == nil) then
    love.graphics.setColor(gameWorld.colors.white)
  end
  -- Draw rectangle
  love.graphics.rectangle(self.drawStyle, self.rect:dimensions())
end
