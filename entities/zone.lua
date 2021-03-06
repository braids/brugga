local class = require 'lib.middleclass'
local Entity = require 'entities.entity'
local rect = require 'physics.rect'

local Zone = class('Zone', Entity)

function Zone:initialize(row, location, bumpWorld)
  Entity.initialize(self)

  self.props.isStart = false
  self.props.isEnd = false

  -- Create collision rectangle
  self.rect:set(0, 0, 32, 64)        -- Set position/size
  self.drawColor = { 0.2, 0.2, 1.0, 1.0 }

  if location == "start" then
    self.props.name = ("startZone%d"):format(row)
    self.props.isStart = true
    self.drawColor = { 0.5, 0.5, 0.2, 1.0 }
    self.rect:setPos(225 - (75 * row) - self.rect.w, 15 + (185 * row) - self.rect.h) -- set at start of specific row
  elseif location == "end" then
    self.props.name = ("endZone%d"):format(row)
    self.props.isEnd = true
    self.drawColor = { 0.2, 0.5, 0.5, 1.0 }
    self.rect:setPos(780 + (40 * row), 15 + (185 * row) - self.rect.h) -- set at start of specific row
  end

  self:addToWorld(bumpWorld)
end

return Zone
