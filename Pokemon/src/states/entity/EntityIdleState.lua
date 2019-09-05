--[[
    GD50
    Pokemon

    Author: Franklin Ader
    adereinstein1@gmail.com
]]

EntityIdleState = Class{__includes = EntityBaseState}

function EntityIdleState:init(entity)
    self.entity = entity
    self.entity:changeAnimation('idle-' .. self.entity.direction)
end