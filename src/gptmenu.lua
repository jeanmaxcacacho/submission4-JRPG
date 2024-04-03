Menu = Object:extend()

-- x and y position of the list will be dependent on x and y of the character
-- the button list to render is dependent on the move set and target list of the object it is beside

function Menu:new(entity)
	-- this is because we scaled it 3x
	self.x = entity.x + entity.width*3/2 + 40
	self.y = entity.y - entity.height*3/2 - 30

	self.font = love.graphics.newFont(12)
	self.buttons = {}
	for i=1, #entity.actions do
		table.insert(self.buttons, entity.actions[i])
	end

	self.entity = entity

	self.width = 80
	self.height = 20

	
end

function Menu:draw()
    local margin = 20
    local pegY = 0
    local y = self.y

    for i, button in ipairs(self.buttons) do
        -- Calculate the position of the current button
        local buttonY = y + pegY

        -- mouse interaction
        local mx, my = love.mouse.getPosition()
        local hover = mx > self.x and
                      mx < self.x + self.width and
                      my > buttonY and
                      my < buttonY + self.height  -- Check against the height of the current button

        local color = {0.4, 0.7, 0.3, 0.5}

        -- the timing is right, but the detection is ass
        if hover then
            color = {1, 1, 1, 1}
        end

        love.graphics.setColor(unpack(color))
        love.graphics.rectangle(
            "fill",
            self.x,
            buttonY,
            self.width,
            self.height
        )

        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print(
            button,  -- Use 'button' instead of 'self.entity.actions[i]'
            self.font,
            self.x + self.width/2 - self.font:getWidth(button)/2,
            buttonY + self.height/2 - self.font:getHeight(button)/2 + 5
        )
        love.graphics.setColor(1, 1, 1, 1)

        pegY = pegY + (self.height/2 + margin)
    end
end


function Menu:mousepressed(x, y, button)
    if button == 1 then -- Check if left mouse button was pressed
        for i, btn in ipairs(self.buttons) do
            local buttonY = self.y + (i-1) * (self.height/2 + 20)

            -- Check if the mouse click was inside the current button
            if x > self.x and x < self.x + self.width and
               y > buttonY and y < buttonY + self.height then
                -- Perform the action associated with the button
                print("Button "..btn.." clicked!")
            end
        end
    end
end


function Menu:setEntity(entity)
    self.entity = entity
    -- Update the buttons based on the actions of the new entity
    self.buttons = {}
    for i = 1, #entity.actions do
        table.insert(self.buttons, entity.actions[i])
    end
end
