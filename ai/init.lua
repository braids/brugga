local class = require 'lib.middleclass'

local AiPlayer = class('AiPlayer')

function AiPlayer:initialize()
  self.customers = {}
  self.buttons = {
  }
  self.commands = {}
  self.debounce = false
  self.laststate = false
  self.release_s = false
end

function AiPlayer:update()
  local fresh = false

  local state = gameWorld.gameState:getCurrent()
  if state ~= laststate then
    laststate = state
    fresh = true
  end

  if state == 'splash' then
    if fresh then
      self.buttons = {}
      self:delaySet(0.2)
    end
    if self:delayComplete() then
      self:pushCommand({ 'action', })
      self:delaySet(0.2)
    end
  elseif state == 'title' then
    if fresh then
      self.buttons = {}
      self:delaySet(0.2)
    end
    if self:delayComplete() then
      self:delaySet(0.2)
      local sel = gameWorld.gameState:getState().menu.selected
      print(sel)
      if sel < 2 then
        self:pushCommand({'down'})
      elseif sel > 2 then
        self:pushCommand({'up'})
      else
        self:pushCommand({'action'})
      end
    end

  elseif state == 'tutorial' then
    if fresh then
      self.buttons = {}
      self:delaySet(0.2)
    end
    if self:delayComplete() then
      self:delaySet(0.2)
      self:pushCommand('action')
    end
  elseif state == 'gameplay' then
    if fresh then
      self.release_s = 0.2
      self.buttons = {}
      self.served = {}
      self:delaySet(0.5)
    end

    local patrons = gameWorld.gameState:getState().patrons

    if self:delayComplete() and #patrons > 0 then
      local drinkmix = patrons[1].drinkMix
      self:makeDrink(drinkmix)
      self:deliverDrink(patrons[1].row)
      --pretty.dump(drinkmix)
      self:delayStop()
    end


  elseif state == 'ending' then
  elseif state == 'credits' then
    if fresh then
      self:pushCommand({'action'})
    end
  end

  if not self.release_s or self.release_delay and self.releasedelay <= love.timer.getTime() then
    self.buttons = {}
    self.releasedelay = false
  end
  if not self.commanddelay or self.commanddelay < love.timer.getTime() then
    local c = self:nextCommand()
    --self.releasedelay = love.timer.getTime() + 0.0005
    self.commanddelay = love.timer.getTime() + 0.4
    if type(c) == 'string' then
      self.buttons[c] = true
    else
      for _, k in ipairs(c) do
        self.buttons[k] = true
      end
    end
    if self.buttons.up or self.buttons.down then
      self.releasedelay = love.timer.getTime() + (self.release_s or 0.0005)
    end
  end
end

function AiPlayer:makeDrink(drink)
  if drink.b then self:pushCommand{'pour'} end
  if drink.a then
    self:pushCommand('up')
    self:pushCommand('pour')
    self:pushCommand('down')
  end
  if drink.c then
    self:pushCommand('down')
    self:pushCommand('pour')
    self:pushCommand('up')
  end
end

function AiPlayer:deliverDrink(row)
  if row == 2 then self:pushCommand{'action'} end
  if row == 1 then
    self:pushCommand('up')
    self:pushCommand('action')
    self:pushCommand('down')
  end
  if row == 3 then
    self:pushCommand('down')
    self:pushCommand('action')
    self:pushCommand('up')
  end
end


function AiPlayer:delaySet(s)
  self.delay = love.timer.getTime() + 0.5
end

function AiPlayer:delayComplete()
  if not self.delay then return false end
  return self.delay < love.timer.getTime()
end

function AiPlayer:delayStop()
  self.delay = false
end

function AiPlayer:pushCommand(command)
  table.insert(self.commands, command)
end

function AiPlayer:nextCommand(command)
  local c = self.commands[1]
  if not c then return {} end
  table.remove(self.commands, 1)
  return c
end


function AiPlayer:pressed(key)
  if not self.buttons[key] then
    self.buttons[key] = false
  end
  return self.buttons[key]
end

function AiPlayer:released(key)
  if not self.buttons[key] then
    self.buttons[key] = false
  end
  return not self.buttons[key]
end



return AiPlayer
