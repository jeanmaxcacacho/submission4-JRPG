function love.load()
	-- libraries
	Object = require "lib.classic"

	-- local imports

	-- screen & bg work
	screen_width = love.graphics.getWidth()
	screen_height = love.graphics.getHeight()

	bg = love.graphics.newImage("visuals/background.png")
	bg_width = bg:getWidth()
	bg_height = bg:getHeight()
	bg_scaleX = screen_width / bg_width
	bg_scaleY = screen_height / bg_height

	bg_music = love.audio.newSource("audio/bgm.mp3", "stream")
	bg_music:setLooping(true)
	love.audio.play(bg_music)

	-- sprite work
	-- both sheets have the same amt of frames and arrangement (missing 5th frame at 2nd and 4th row)
	-- (speaking of which) both sheets have 5 columns and 4 rows, each row depicting the same action
	-- both sheets also have the same width and so also same frame width and frame height
	maxFrames = 18

	charRawSheet = love.graphics.newImage("visuals/char1sheet.png")
	charRawSheetWidth = charRawSheet:getWidth()
	charRawSheetHeight = charRawSheet:getHeight()
	rawFrameWidth = charRawSheetWidth/5
	rawFrameHeight = charRawSheetHeight/4
	charRawFrames = {}

	charCostumeSheet = love.graphics.newImage("visuals/char2sheet.png")
	charCostumeSheetWidth = charCostumeSheet:getWidth()
	charCostumeSheetHeight = charCostumeSheet:getHeight()
	costumeFrameWidth = charCostumeSheetWidth/5
	costumeFrameHeight = charCostumeSheetHeight/4
	charCostumeFrames = {}
end

function love.update(dt)

end

function love.draw()
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)
end
