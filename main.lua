function love.load()
	Object = require "lib.classic"

	screen_width = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()

	bg = love.graphics.newImage('visuals/background.png')
	bg_width = bg:getWidth()
	bg_height = bg:getHeight()
	bg_scaleX = screen_width / bg_width
	bg_scaleY = screen_height / bg_height

	print(bg_scaleX)
	print(bg_scaleY)

	bg_music = love.audio.newSource("audio/bgm.mp3", "stream")
	bg_music:setLooping(true)
	love.audio.play(bg_music)
end

function love.update(dt)

end

function love.draw()
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)
end
