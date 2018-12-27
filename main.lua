local class = require 'lib.middleclass'
local bump = require 'lib.bump'
local rect = require 'physics.rect'
local cargo = require 'lib.cargo'
local baton = require 'lib.baton'


-- Should be the only global
gameWorld = {}

function love.load()
  gameWorld.assets = cargo.init('assets')

  gameWorld.sound = require('ui.sound'):new()

  gameWorld.playerInput = baton.new {
    controls = {
      left = {'key:left', 'key:a', 'axis:leftx-', 'button:dpleft'},
      right = {'key:right', 'key:d', 'axis:leftx+', 'button:dpright'},
      up = {'key:up', 'key:w', 'axis:lefty-', 'button:dpup'},
      down = {'key:down', 'key:s', 'axis:lefty+', 'button:dpdown'},
      ok = { 'key:return' },
    },
    pairs = {
      move = { 'left', 'right', 'up', 'down' },
    },
    joystick = love.joystick.getJoysticks()[1],
  }

  gameWorld.gamestates = require('gamestates.manager'):new()
end

function love.update(dt)
  gameWorld.playerInput:update()  -- update the input immediately so everything else can use the up to date info
  gameWorld.gamestates:update(dt)
end

function love.draw()
  gameWorld.gamestates:draw()
  love.graphics.rectangle('fill', 300, 220, 680, 40)
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end
