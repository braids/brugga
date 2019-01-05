local class = require 'lib.middleclass'
local bump = require 'lib.bump'
local rect = require 'physics.rect'
local cargo = require 'lib.cargo'
flux = require 'lib.flux'
require 'lib.pl'    -- provides on-demand lading on the penlight sublibraries

-- Should be the only global
gameWorld = {}

function love.load()
  gameWorld.random = love.math.newRandomGenerator()
  gameWorld.random:setSeed(os.time())
  math.randomseed(os.time())

  gameWorld.settings = require('ui.settings'):new()
  gameWorld.settings:load()
  gameWorld.settings:save()

  gameWorld.assets = cargo.init('assets')
  gameWorld.colors = require('ui.colors')
  gameWorld.sound = require('ui.sound'):new()

  gameWorld.paletteswap = require('ui.paletteswap'):new()

  -- Comment this out to disable debug print
  --gameWorld.debug = require('ui.debug'):new()

  --gameWorld.playerInput = require('player.controls')
  gameWorld.playerInput = require('ai'):new()

  gameWorld.gameState = require('gamestates.manager'):new()
  gameWorld.playerData = require('player.playerdata'):new()
  gameWorld.playerData:reset()
  gameWorld.gameState:setState('splash')
end

function love.update(dt)
  require('lib.lurker').update()
  flux.update(dt)
  gameWorld.gameState:update(dt)
  gameWorld.sound:update(dt)
  gameWorld.playerInput:update()  -- update the input immediately so everything else can use the up to date info
  if gameWorld.debug then gameWorld.debug:update(dt) end
end

function love.draw()
  gameWorld.gameState:draw()
  if gameWorld.debug then gameWorld.debug:draw() end
end

function love.quit()
end

function love.focus(f)
  if not f and gameWorld.gameState:getCurrent() == 'gameplay' then
--    gameWorld.gameState:pushState('pause')
  end
end

-- switch to a newly connected joystick
function love.joystickadded(j)
  if gameWorld.playerInput then gameWorld.playerInput.joystick = j end
end
