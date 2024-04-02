function love.load()
	-- libraries
	Object = require "lib.classic"

	-- local imports
	require "src.warrior"
	require "src.mage"
	require "src.enemy"
	require "src.menu"

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
	-- leaving the comments here but the sprite work has been moved to the entity classes
	
	-- loading sprite sheets in
	warriorSheet = love.graphics.newImage("visuals/char1sheet.png")
	mageArmorSheet = love.graphics.newImage("visuals/char2sheet.png")
	-- the mushrooms are 7 x 8 spriteSheets where the odd rows have a missing frame at the end
	-- since I don't have to do the chinese layering trick I can just make one class tbh
	enemy1_sheet = love.graphics.newImage("visuals/enemy1.png")
	enemy2_sheet = love.graphics.newImage("visuals/enemy2.png")


	-- instantiating entities
	warrior = Warrior(warriorSheet, 1000, 400, 10, "Warrior")
	mage = Mage(warriorSheet, mageArmorSheet, 1000, 550, 3, "Mage")
	enemy = Enemy(enemy1_sheet, 300, 400 + 10, 11, "Enemy 1")
	enemy2 = Enemy(enemy2_sheet, 300, 550 + 10, 12, "Enemy 2")

	entities = {warrior, mage, enemy, enemy2}

	-- I wish I could debug my own life
	for i=1, 4 do
		print(entities[i].name..": "..entities[i].speed)
	end

	-- I think it's best to just put all the turn code here
	turnQueue = {}


	-- GUI shit
	menu = Menu()

	-- TODO:
	-- refactor animation and frame drawing to use the OOP entity class (DONE)
	-- start with drawing in the enemies (DONE)
	-- then start making the UI (prospected hard part)
	-- 	* for this I'll start by first drawing rectangles on the screen
	-- game logic probs comes last TBH
end

function love.update(dt)
	warrior:animate(dt)
	mage:animate(dt)
	enemy:animate(dt)
	enemy2:animate(dt)
end

function love.draw()
	-- the frame heights and width are small so probs scale them to 1.5 x and y
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)
	warrior:draw()
	mage:draw()
	enemy:draw()
	enemy2:draw()
	menu:draw()
end
