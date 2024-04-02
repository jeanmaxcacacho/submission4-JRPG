-- this submission is implementing the classic turn based system

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
		print(entities[i].name .. ": " .. entities[i].speed)
	end

	-- I think it's best to just put all the turn code here in main
	turnQueue = {warrior, mage, enemy, enemy2}

	local function compareSpeed(a, b)
		return a.speed > b.speed
	end

	table.sort(turnQueue, compareSpeed)

	for i=1, #turnQueue do
		print(turnQueue[i].name)
	end

	-- turn queue start
	currentTurn = 1
	print("---QUEUE START---\n" .. turnQueue[currentTurn].name .. " current turn is " .. currentTurn)

	-- GUI shit
	menu = Menu()

	-- TODO:
	-- refactor animation and frame drawing to use the OOP entity class (DONE)
	-- start with drawing in the enemies (DONE)
	-- WE'RE DOING THE TURN QUEUE FIRST BABY
	-- 	* the numbers part of the turn queue is done :)) tbh I can probs just leave it at that since the rest I'll index
	-- then start making the UI (prospected hard part)
	-- 	* for this I'll start by first drawing rectangles on the screen
	-- game logic probs comes last TBH
	-- 	* i think kasi this is just calling arithmetic on object properties hehe xd
	-- 	* turnQueue[currentTurn].action to target, dealt {arithmetic} damage
	-- 		* print something like that I guess
end

function love.update(dt)
	warrior:animate(dt)
	mage:animate(dt)
	enemy:animate(dt)
	enemy2:animate(dt)

end

function love.keypressed(key)
	if key == "space" then
		currentTurn = currentTurn + 1
		if currentTurn > 4 then
			currentTurn = 1
		end

		if currentTurn == 1 then
			print("from ".. turnQueue[4].name .." to ".. turnQueue[currentTurn].name .. " current turn is " .. currentTurn)
		else
			print("from ".. turnQueue[currentTurn-1].name .." to ".. turnQueue[currentTurn].name .. " current turn is " .. currentTurn)
		end
	end
end

function love.draw()
	love.graphics.draw(bg, 0, 0, 0, bg_scaleX, bg_scaleY)

	-- turn indicator
	if turnQueue[currentTurn].name == "Warrior" then
		love.graphics.setColor(0, 0.7, 0)
		love.graphics.rectangle(
			"fill", 
			warrior.x + warrior.width/2 + 20,
			warrior.y - 15,
			12,
			12
		)
		love.graphics.setColor(1, 1, 1)
	elseif turnQueue[currentTurn].name == "Mage" then
		love.graphics.setColor(0, 0.7, 0)
		love.graphics.rectangle(
			"fill", 
			mage.x + mage.width/2 + 20,
			mage.y - 15,
			12,
			12
		)
		love.graphics.setColor(1, 1, 1)
	elseif turnQueue[currentTurn].name == "Enemy 1" then
		love.graphics.setColor(0, 0.7, 0)
		love.graphics.rectangle(
			"fill", 
			enemy.x + enemy.width/2 + 10,
			enemy.y - 15,
			12,
			12
		)
		love.graphics.setColor(1, 1, 1)
	elseif turnQueue[currentTurn].name == "Enemy 2" then
		love.graphics.setColor(0, 0.7, 0)
		love.graphics.rectangle(
			"fill", 
			enemy2.x + enemy2.width/2 + 10,
			enemy2.y - 15,
			12,
			12
		)
		love.graphics.setColor(1, 1, 1)
	end

	warrior:draw()
	mage:draw()
	enemy:draw()
	enemy2:draw()
	menu:draw()
end
