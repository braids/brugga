local class = require 'lib.middleclass'

local PlayerData = class('PlayerData')

function PlayerData:initialize()
  self:reset()
end

function PlayerData:reset()
  self.score = 0
  self.wave = 1
  self.lives = 3
  self.initial_patrons = 8
  self.initial_threat = 2
  self.patron_history = {}
  self.drink_history = {}
end

function PlayerData:scoreIncrease(i)
  if i >= 0 then
    gameWorld.sound:playSfx('coin')
  else
    gameWorld.sound:playSfx('coindown')
  end
  self.score = self.score + i
end

function PlayerData:waveIncrease()
  -- Increase initial patron/threat counts
  self.initial_patrons = self.initial_patrons + 1
  self.initial_threat = self.initial_threat + 2
  self.wave = self.wave + 1
end

function PlayerData:recordPatron(patron)
  self.patron_history[#self.patron_history + 1] = patron
end

function PlayerData:recordDrink(drink)
  self.drink_history[#self.drink_history + 1] = drink
end

function PlayerData:livesDecrease(n)
  if self.lives >= 1 then self.lives = self.lives - 1 end
end

function PlayerData:livesIncrease(n)
  if self.lives <= 4 then self.lives = self.lives + 1 end
end


return PlayerData
