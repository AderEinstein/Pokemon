--[[
    GD50
    Pokemon

    Author: Franklin Ader
    adereinstein1@gmail.com

    The Selection class gives us a list of textual items that link to callbacks;
    this particular implementation only has one dimension of items (vertically),
    but a more robust implementation might include columns as well for a more
    grid-like selection, as seen in many kinds of interfaces and games.
]]

Selection = Class{}

function Selection:init(def)
    self.items = def.items
    self.x = def.x
    self.y = def.y

    self.height = def.height
    self.width = def.width
    self.font = def.font or gFonts['small']

    self.gapHeight = self.height / #self.items

    self.currentSelection = 1

    self.cursorOn = def.cursorOn
    self.onClose = def.onClose
end

function Selection:update(dt)
    if self.cursorOn then
        if love.keyboard.wasPressed('up') then
            if self.currentSelection == 1 then
                self.currentSelection = #self.items
            else
                self.currentSelection = self.currentSelection - 1
            end
            
            gSounds['blip']:stop()
            gSounds['blip']:play()
        elseif love.keyboard.wasPressed('down') then
            if self.currentSelection == #self.items then
                self.currentSelection = 1
            else
                self.currentSelection = self.currentSelection + 1
            end
            
            gSounds['blip']:stop()
            gSounds['blip']:play()
        elseif love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
            self.items[self.currentSelection].onSelect()
            
            gSounds['blip']:stop()
            gSounds['blip']:play()
        end
    elseif not self.cursorOn and love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        gStateStack:pop()
        self.onClose()
    end
    
end

function Selection:render()
    local currentY = self.y

    for i = 1, #self.items do
        local paddedY = currentY + (self.gapHeight / 2) - self.font:getHeight() / 2

        if self.cursorOn then
            -- draw selection marker if cursor is on and we're at the right index
            if i == self.currentSelection then
                love.graphics.draw(gTextures['cursor'], self.x - 8, paddedY)
            end
        end

        
        if not self.cursorOn then
            love.graphics.setColor(250, 230, 216)
        end
        love.graphics.printf(self.items[i].text, self.x, paddedY, self.width, 'center')

        love.graphics.setColor(255, 255, 255)

        currentY = currentY + self.gapHeight
    end
end