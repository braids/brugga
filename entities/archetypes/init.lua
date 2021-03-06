local class = require 'lib.middleclass'

local Archetypes = class('Archetypes')

function Archetypes:initialize()
  self.kinds = {
    require('entities.archetypes.elf_swole'),
    require('entities.archetypes.elf_female'),
    require('entities.archetypes.elf_female2'),
    require('entities.archetypes.elf_male'),
    require('entities.archetypes.snowman'),
    require('entities.archetypes.reindeer'),
}

  self.rarity_total = 0.0
  for _, arch in ipairs(self.kinds) do
    self.rarity_total = self.rarity_total + arch.rarity
  end

end

function Archetypes:getRandom()
  local pick = gameWorld.random:random(self.rarity_total)
  while true do
    for i, arch in ipairs(self.kinds) do
      pick = pick - arch.rarity
      if pick <= 0.0 then return arch end
    end
  end
  return nil
end

return Archetypes
