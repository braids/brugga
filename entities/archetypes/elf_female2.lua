local anim8 = require('lib.anim8')
local arch = require('entities.archetypes.archetype'):new('elf_female2')

arch:addImage('main', gameWorld.assets.sprites.patrons.elf_female2)
arch:addGrid('main', anim8.newGrid(190, 291, arch.images.main:getWidth(), arch.images.main:getHeight(), 0, 27, 0))

arch:addAnimation('advance', { image = arch.images.main, grid = arch.grids.main(2, 1), rate = 0.1 } )
arch:addAnimation('drink', { image = arch.images.main, grid = arch.grids.main(1, 1), rate = 0.1 } )
arch:addAnimation('hit', { image = arch.images.main, grid = arch.grids.main(3, 1), rate = 0.1 } )


arch:addTagset({ 'female', 'anygender' })
arch:addTagset({ 'elf', 'anykind' })
arch:setRarity(100)
arch:setSpeed(1.0)

arch:setBubbleOffset(40, -160)

arch:setSwaps( { { 0xb1 / 0xFF, 0x3a / 0xFF, 0x21 / 0xFF, 1 } } )

return arch
