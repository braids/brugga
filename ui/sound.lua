local class = require 'lib.middleclass'
local cargo = require 'lib.cargo'
local ripple = require 'lib.ripple'

local SoundManager = class('SoundManager')

function SoundManager:initialize()
  self.music = {}
  self.ui = {}
  self.sfx = {}
  self.voice = {}

  -- Some tags are used to control volume (music)
  -- Some tags are used to categorize sounds (male)
  self.tags = {
    ui = ripple.newTag(),
    music = ripple.newTag(),
    sfx = ripple.newTag(),
    voice = ripple.newTag(),
    drink = ripple.newTag(),
    angry = ripple.newTag(),
    mole = ripple.newTag(),
    female = ripple.newTag(),
    anykind = ripple.newTag(),
    anygender = ripple.newTag(),
    thanks = ripple.newTag(),
    enter = ripple.newTag(),
    yuck = ripple.newTag(),
    order = ripple.newTag(),
    swole = ripple.newTag(),
    elf = ripple.newTag(),
    ending = ripple.newTag(),
    loss = ripple.newTag(),
    serve = ripple.newTag(),
    brugga = ripple.newTag(),
    win = ripple.newTag(),
  }


  --self.ui.assets = cargo.init('assets')

--  for name, sound in pairs(gameWorld.assets.audio.ui) do
--    self.ui[name] = ripple.newSound({source = sound, tags = { self.tags.sfx }})
--  end
  self.ui['menuSelect'] = ripple.newSound({source = gameWorld.assets.audio.ui.menuSelect, tags = { self.tags.sfx, self.tags.ui, }})
  self.ui['menuSwitch'] = ripple.newSound({source = gameWorld.assets.audio.ui.menuSwitch, tags = { self.tags.sfx, self.tags.ui, }})
  self.ui['gameOver'] = ripple.newSound({source = gameWorld.assets.audio.ui.gameOver, tags = { self.tags.sfx, self.tags.ui, }})
  self.ui['volumeIncrease'] = ripple.newSound({source = gameWorld.assets.audio.ui.volumeIncrease, tags = { self.tags.sfx, self.tags.ui, }})
  self.ui['volumeDecrease'] = ripple.newSound({source = gameWorld.assets.audio.ui.volumeDecrease, tags = { self.tags.sfx, self.tags.ui, }})
  self.ui['musicIncrease'] = ripple.newSound({source = gameWorld.assets.audio.ui.volumeIncrease, tags = { self.tags.music, self.tags.ui, }})
  self.ui['musicDecrease'] = ripple.newSound({source = gameWorld.assets.audio.ui.volumeDecrease, tags = { self.tags.music, self.tags.ui, }})


  self.sfx['coin'] = ripple.newSound({source = gameWorld.assets.audio.sfx.money1, tags = { self.tags.sfx, }})
  self.sfx['coindown'] = ripple.newSound({source = gameWorld.assets.audio.sfx.coindown, tags = { self.tags.sfx, }})
  self.sfx['drinkCatch'] = ripple.newSound({source = gameWorld.assets.audio.sfx.glass_slide2, tags = { self.tags.sfx, }})
  self.sfx['drinkSwap'] = ripple.newSound({source = gameWorld.assets.audio.ui.handSwap, tags = { self.tags.sfx, }})
  self.sfx['drinkPour'] = ripple.newSound({source = gameWorld.assets.audio.sfx.drink_fill2, tags = { self.tags.sfx, }})
  self.sfx['drinkSend'] = ripple.newSound({source = gameWorld.assets.audio.sfx.glass_slide4, tags = { self.tags.sfx, }})
  self.sfx['drinkFall'] = ripple.newSound({source = gameWorld.assets.audio.sfx.drinkFall, tags = { self.tags.sfx, }})
  self.sfx['gameover'] = ripple.newSound({source = gameWorld.assets.audio.sfx.game_over3, tags = { self.tags.sfx, }})
  self.sfx['waveEnd'] = ripple.newSound({source = gameWorld.assets.audio.sfx.game_over4, tags = { self.tags.sfx, }})

  --for m in gameWorld.assets.music do
  --  self.music[m] = ripple.newSound({source = m, volume = gameWorld.options.musicVolume, tags = { 'music' }})
  --end
  self.music['test'] = ripple.newSound({source = gameWorld.assets.audio.music.winterstouchloop, tags = { self.tags.music, }})
  self.music['test']:setLooping(true)
  self.music['title'] = ripple.newSound({source = gameWorld.assets.audio.music.winterstouchloop, tags = { self.tags.music, }})
  self.music['title']:setLooping(true)
  self.music['gameplay'] = ripple.newSound({source = gameWorld.assets.audio.music.winterstouchloop, tags = { self.tags.music, }})
  self.music['gameplay']:setLooping(true)
  self.music['credits'] = ripple.newSound({source = gameWorld.assets.audio.music.winterstouchloop, tags = { self.tags.music, }})
  self.music['credits']:setLooping(true)
  self.music['ending'] = ripple.newSound({source = gameWorld.assets.audio.music.winterstouchloop, tags = { self.tags.music, }})
  self.music['ending']:setLooping(true)

  self.music.stacked = {}
  --local dec = love.sound.newDecoder('assets/audio/music/gameplay1'):decode()
  self.music.stacked[1] = love.sound.newDecoder('assets/audio/music/gameplay1.ogg', 4 * 1024)--:decode()
  self.music.stacked[2] = love.sound.newDecoder('assets/audio/music/gameplay2.ogg', 4 * 1024)--:decode()
  self.music.stacked[3] = love.sound.newDecoder('assets/audio/music/gameplay3.ogg', 4 * 1024)--:decode()
  self.music.stacked[4] = love.sound.newDecoder('assets/audio/music/gameplay4.ogg', 4 * 1024)--:decode()
  self.music.stacked[5] = love.sound.newDecoder('assets/audio/music/gameplay5.ogg', 4 * 1024)--:decode()
  self.music.stacked[6] = love.sound.newDecoder('assets/audio/music/gameplay6.ogg', 4 * 1024)--:decode()
  --self.music.stacked[7] = love.sound.newDecoder('assets/audio/music/gameplay7.ogg', 4 * 1024)--:decode()
  --self.music.stacked[8] = love.sound.newDecoder('assets/audio/music/gameplay8.ogg', 4 * 1024)--:decode()
  --self.music.stacked[9] = love.sound.newDecoder('assets/audio/music/gameplay9.ogg', 4 * 1024)--:decode()
  --self.music.stacked[10] = love.sound.newDecoder('assets/audio/music/gameplay10.ogg', 4 * 1024)--:decode()


  --self.music.stacked[11] = ripple.newSound({source = gameWorld.assets.audio.music.gameplay1, tags = { self.tags.music, }})

  self.stemstack = require('ui.stemstack'):new(self.music.stacked)

  self.musicPlaying = false

  if gameWorld.settings.config.sfx_volume then self:setSfxVolume(gameWorld.settings.config.sfx_volume) end
  if gameWorld.settings.config.music_volume then self:setMusicVolume(gameWorld.settings.config.music_volume) end

  self:scanVoices()
end


function SoundManager:scanVoicePath(path)
  local lf = love.filesystem
  local info = lf.getInfo(path, 'directory')

  if not info or info.type == 'file' then
    local src  = ripple.newSound( { source = love.audio.newSource(path, 'static'), } )
    local tags = self:scanTags(path)
    table.insert(tags, 'voice')
    table.insert(tags, 'sfx')
    for _, tag in ipairs(tags) do
      src:tag(self.tags[tag])
    end
    self.voice[path] = src
    return
  elseif info.type == 'directory' then
    local items = lf.getDirectoryItems(path)
    for _, item in ipairs(items) do
      self:scanVoicePath(path.."/"..item)
    end
  end

end

function SoundManager:scanVoices()

  local path = 'assets/audio/voice'
  self:scanVoicePath(path)

--  pretty.dump(self.voice)
--  pretty.dump(self.tags)


--  self:playVoice({ { 'mole', 'anygender' }, {'anykind'},})

  return
--
  --self.voice = cargo.init({
    --dir = 'assets/audio/',
    --loaders = { ogg, love.sound.newSource, },
    --processors = {
      --['.*%.ogg'] = function(asset, filename)
        --print(asset)
        --print(filename)
        ----assetimage:setFilter('nearest', 'nearest')
      --end
    --}
  --})
  --pretty.dump(self.voice)
end

function SoundManager:scanTags(path)
  local tags = {}
  for tag, _ in pairs(self.tags) do
    if string.find(path, tag) then
      table.insert(tags, tag)
    end
  end
  return tags
end

function SoundManager:update(dt)
  self.stemstack:update(dt)
end

function SoundManager:playUi(name)
  if self.ui[name] then self.ui[name]:play() end
end

function SoundManager:playSfx(name)
  if self.sfx[name] then self.sfx[name]:play() end
end


function SoundManager:playRandomFrom(possibles)
  local n = gameWorld.random:random(1, tablex.size(possibles))
  for src, _ in pairs(possibles) do
    n = n - 1
    if n == 0 then
      src:play()
      return
    end
  end
end


function SoundManager:collectSources(tags)
  local set_possibles = {}
    for _, t in ipairs(tags) do
      if self.tags[t] then
        for s, _ in pairs(self.tags[t]._sounds) do
          set_possibles[s] = true
        end
      else
      end
    end
  return set_possibles
end

function SoundManager:playVoice(tagsets)

  local possibles = {}

  for i, s in ipairs(tagsets) do
    possibles[i] = self:collectSources(s)
  end

  if #possibles < 1 then print("No tagsets match") return end

  local final_possibilities = tablex.copy(possibles[1])

  for i, p in ipairs(possibles) do
    if i > 1 then
      final_possibilities = tablex.intersection(final_possibilities, p)
    end
  end

  if tablex.size(final_possibilities) < 1 then print "no match after intersection" return end

  self:playRandomFrom(final_possibilities)
end


function SoundManager:playMusic(name)
  self.stemstack:stop()
  self.tags.music:stop()
  self.music[name]:play()
  self.musicStacked = false
  self.musicPlaying = true
end

function SoundManager:setMusicVolume(vol)
  self.tags.music.volume = vol
  gameWorld.settings.config.music_volume = vol
end

function SoundManager:setSfxVolume(vol)
  self.tags.sfx.volume = vol
  gameWorld.settings.config.sfx_volume = vol
end

function SoundManager:stopMusic()
  if self.musicPlaying and self.music[self.musicPlaying] then
    self.music[self.musicPlaying]:stop()
    self.musicPlaying = false
  end
end

function SoundManager:isMusicPlaying()
  return self.musicPlaying or self.musicStacked
end

function SoundManager:playStacked(level)
  self.tags.music:stop()
  self.stemstack:setLevel(level)
  self.musicStacked = true
  self.musicPlaying = false
end


return SoundManager
