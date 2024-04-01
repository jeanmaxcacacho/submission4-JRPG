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
	-- four for loops for each row of the sprite sheets; have to do this since not all frames have a sprite
	maxFrames = 18

	charRawSheet = love.graphics.newImage("visuals/char1sheet.png")
	charRawSheetWidth = charRawSheet:getWidth()
	charRawSheetHeight = charRawSheet:getHeight()
	rawFrameWidth = charRawSheetWidth/5
	rawFrameHeight = charRawSheetHeight/4
	charRawFrames = {}

	-- made the iterators start with 0 so that I can do the chinese width multiplication hack
	for i=0, 4 do
		table.insert(
			charRawFrames,
			love.graphics.newQuad(
				rawFrameWidth*i,
				0,
				rawFrameWidth,
				rawFrameHeight,
				charRawSheetWidth,
				charRawSheetHeight
			)
		)
	end

	for i=0, 3 do
		table.insert(
			charRawFrames,
			love.graphics.newQuad(
				rawFrameWidth*i,
				rawFrameHeight*1,
				rawFrameWidth,
				rawFrameHeight,
				charRawSheetWidth,
				charRawSheetHeight
			)
		)
	end

	for i=0, 4 do
		table.insert(
			charRawFrames,
			love.graphics.newQuad(
				rawFrameWidth*i,
				rawFrameHeight*2,
				rawFrameWidth,
				rawFrameHeight,
				charRawSheetWidth,
				charRawSheetHeight
			)
		)
	end

	for i=0, 3 do
		table.insert(
			charRawFrames,
			love.graphics.newQuad(
				rawFrameWidth*i,
				rawFrameHeight*4,
				rawFrameWidth,
				rawFrameHeight,
				charRawSheetWidth,
				charRawSheetHeight
			)
		)
	end
	

	charCostumeSheet = love.graphics.newImage("visuals/char2sheet.png")
	charCostumeSheetWidth = charCostumeSheet:getWidth()
	charCostumeSheetHeight = charCostumeSheet:getHeight()
	costumeFrameWidth = charCostumeSheetWidth/5
	costumeFrameHeight = charCostumeSheetHeight/4
	charCostumeFrames = {}

	for i=1, 5 do
	end

	for i=1, 4 do
	end

	for i=1, 5 do
	end

	for i=1, 4 do
	end

	print("raw width: "..rawFrameWidth)
	print("raw height: "..rawFrameHeight)
	print("costume width: "..costumeFrameWidth)
	print("costume height: "..costumeFrameHeight)

	-- TODO:
	-- start with drawing in the enemies
	-- then start making the UI (prospected hard part)
	-- game logic probs comes last TBH
end

function love.update(dt)

end

function love.draw()
	-- the frame heights and width are small so probs scale them to 1.5 x and y
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)
	love.graphics.draw(charRawSheet, charRawFrames[1], love.graphics.getWidth()/2 - rawFrameWidth/2, love.graphics.getHeight()/2 - rawFrameHeight/2, 0, 3, 3)
end
