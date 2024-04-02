Menu = Object:extend()

function Menu:new()
	self.width = 800
	self.height = 250
	self.x = love.graphics.getWidth()/2 - self.width/2
	self.y = 50
end

-- this is just going to keep calling the "event listeners" bullshit
function Menu:update(dt)

end

function Menu:draw()
	love.graphics.setColor(0.6, 0.6, 0, 0.5)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1, 1)
end
