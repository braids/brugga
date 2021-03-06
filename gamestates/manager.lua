local class = require 'lib.middleclass'


local splash = require 'gamestates.splash'
local title = require 'gamestates.title'
local gameplay = require 'gamestates.gameplay'
local ending = require 'gamestates.ending'
local credits = require 'gamestates.credits'
local pause = require 'gamestates.pause'
local tutorial = require 'gamestates.tutorial'

local GamestateManager = class('GamestateManager')

function GamestateManager:initialize()
  self.states = {
    splash = splash:new('splash'),
    title = title:new('title'),
    gameplay = gameplay:new('gameplay'),
    ending = ending:new('ending'),
    credits = credits:new('credits'),
    pause = pause:new('pause'),
    tutorial = tutorial:new('tutorial')
  }
  self.current = { }
  self:setState('splash')
end

-- Sets the state, dropping any in the stack
function GamestateManager:setState(state)
  self.current = { }
  self:pushState(state)
end

-- Enter a state by pushing it on the stack
function GamestateManager:pushState(state)
  self.current[#self.current + 1] = state
  local st = self:getState()
  st:enter()
end

-- Leave a state by popping from the stack
function GamestateManager:exitState()
  self:getState():exit()
  self.current[#self.current] = nil
  self:getState():returnTo()
end

function GamestateManager:getCurrent()
  return self.current[#self.current]
end

function GamestateManager:getState()
  return self.states[self:getCurrent()]
end

function GamestateManager:update(dt)
  self:getState():update(dt)
end

-- Here we draw all states in the stack, so pause overlays the main game
function GamestateManager:draw()
  for _, state in ipairs(self.current) do
    self.states[state]:draw()
  end

  --love.graphics.setColor(0.0,1.0,0.0,0.8)
  --love.graphics.draw(love.graphics.newText(gameWorld.assets.fonts.generic(16), self:getCurrent()), 1280 - 150, 10)
end

return GamestateManager
