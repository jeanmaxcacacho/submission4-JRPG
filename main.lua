function love.load()
	screen_width = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()

	bg = love.graphics.newImage('visuals/background.png')
	bg_width = bg:getWidth()
	bg_height = bg:getHeight()
	bg_scaleX = screen_width / bg_width
	bg_scaleY = screen_height / bg_height

	print(bg_scaleX)
	print(bg_scaleY)
end

function love.update(dt)

end

function love.draw()
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)
end
