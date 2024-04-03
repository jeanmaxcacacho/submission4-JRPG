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
		-- mouse interaction
		local mx, my = love.mouse.getPosition()
		local hover = mx > self.x and
		mx < self.x + self.width and
		my > self.y and
		my < self.y + self.height

		local color = {0.4, 0.7, 0.3, 0.5}

		-- the timing is right, but the detection is ass
		if hover then
			color = {1, 1, 1, 1}
		end

		love.graphics.setColor(unpack(color))
		love.graphics.rectangle(
			"fill",
			self.x,
			y + pegY,
			self.width,
			self.height
		)

		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.print(
			self.entity.actions[i],
			self.font,
			self.x + self.width/2 - self.font:getWidth(self.entity.actions[i])/2,
			self.y - self.height/2 + self.font:getHeight(self.entity.actions[i])/2 + 5 + pegY
		)
		love.graphics.setColor(1, 1, 1, 1)

		pegY = pegY + (self.height/2 + margin)
	end

end
