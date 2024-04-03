Menu = Object:extend()

-- x and y position of the list will be dependent on x and y of the character
-- the button list to render is dependent on the move set and target list of the object it is beside

function Menu:new(entity)
	self.x = entity.x + entity.frameHeight*3/2
	self.y = entity.y - entity.frameWidth*3/2 -- this is because we scaled it 3x

	self.buttons = {}
	for i=1, #entity.moves do
		table.insert(buttons, entity.moves[i])
	end

	self.width = 80
	self.height = 30

	
end

-- this is just going to keep calling the "event listeners" bullshit
function Menu:update(dt)

end

function Menu:draw()
	local margin = 20

	love.graphics.setColor(0.6, 0.6, 0, 0.5)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end
