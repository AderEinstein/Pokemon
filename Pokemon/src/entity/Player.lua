--[[
    GD50
    Pokemon

    Author: Franklin Ader
    adereinstein1@gmail.com
]]

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)

    self.party = Party {
        pokemon = {
            Pokemon(Pokemon.getRandomDef(), 5)
        }
    }
end