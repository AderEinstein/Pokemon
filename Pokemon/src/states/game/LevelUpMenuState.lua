--[[
    GD50
    Pokemon

    Author: Franklin Ader
    adereinstein1@gmail.com
]]

LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(playerPokemon, HPIncrease, attackIncrease, defenseIncrease, speedIncrease, OnClose)
    
    self.onClose = OnClose
    self.levelUpMenu = Menu{
        x = VIRTUAL_WIDTH - 250,
        y = VIRTUAL_HEIGHT - 100,
        width = 250,
        height = 100,
        items = {
            {
                text = 'HPIncrease: '..tostring(playerPokemon.HP - HPIncrease)..' + '..HPIncrease..' = '..tostring(playerPokemon.HP)
            },
            {
                text = 'attackIncrease: '..tostring(playerPokemon.attack - attackIncrease)..' + '..attackIncrease..' = '..tostring(playerPokemon.attack)
            },
            {
                text = 'defenseIncrease: '..tostring(playerPokemon.defense - defenseIncrease)..' + '..defenseIncrease..' = '..tostring(playerPokemon.defense)
            },
            {
                text = 'speedIncrease: '..tostring(playerPokemon.speed - speedIncrease)..' + '..speedIncrease..' = '..tostring(playerPokemon.speed)
            }
        },
        onClose = self.onClose,
        cursorOn = false
    }

end

function LevelUpMenuState:update(dt)
    self.levelUpMenu:update(dt)
end

function LevelUpMenuState:render()
    self.levelUpMenu:render()
end