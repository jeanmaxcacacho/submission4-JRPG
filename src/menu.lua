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

-- this is just going to keep calling the "event listeners" bullshit
function Menu:update(dt)

end

function Menu:draw()
	local margin = 20
	local pegY = 0

	for i, button in ipairs(self.buttons) do
		local y = self.y

		love.graphics.setColor(0.4, 0.7, 0.3, 0.5)
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
