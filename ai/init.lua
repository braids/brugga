local class = require 'lib.middleclass'

local AiPlayer = class('AiPlayer')

function AiPlayer:initialize()
  self.customers = {}
end

function AiPlayer:update(dt)
end


function AiPlayer:setCustomers(customers)
  self.customers = customers
end

function AiPlayer:importantDrinks()

end



-- Act like a controller
function AiPlayer:pressed(control)
  local n = '_handle_release_' .. control
  if self[n] then
    return self[n]()
  else
    return false
  end

end

function AiPlayer:released(control)
  local n = '_handle_' .. control
  if self[n] then
    return self[n]()
  else
    return false
  end

end

function AiPlayer:_handle_release_action()
  return true
end



function AiPlayer:_handle_action()
  if gameWorld.gameState:getCurrent() == 'splash' then return true end
  if gameWorld.gameState:getCurrent() == 'title' then
    if gameWorld.gameState:getState().menu.selected == 2 then return true end
  end
  if gameWorld.gameState:getCurrent() == 'tutorial' then return true end

  return false
end

function AiPlayer:_handle_pour()
  return false
end

function AiPlayer:_handle_swap()
  return false
end

function AiPlayer:_handle_pause()
  return false
end


function AiPlayer:_handle_up()
  if gameWorld.gameState:getCurrent() == 'title' then
    if gameWorld.gameState:getState().menu.selected > 2 then return true end
  end

  return false
end

function AiPlayer:_handle_down()
  if gameWorld.gameState:getCurrent() == 'title' then
    if gameWorld.gameState:getState().menu.selected < 2 then return true end
  end


  return false
end

function AiPlayer:_handle_left()
  return false
end

function AiPlayer:_handle_right()
  return false
end


return AiPlayer
