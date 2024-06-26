Warrior = Object:extend()


function Warrior:new(spriteSheet, x, y, speed, name)
	self.spriteSheet = spriteSheet
	self.frames = {}

	local spriteSheetWidth = spriteSheet:getWidth()
	local spriteSheetHeight = spriteSheet:getHeight()

	-- I already know this beforehand
	local frameWidth = spriteSheet:getWidth()/5 -- 5 columns
	local frameHeight = spriteSheet:getHeight()/4 -- 4 rows
	local maxFrames = 18

	-- row 1
	for i = 0, 4 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*0, -- for "logicability"
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 2
	for i = 0, 3 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*1,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 3
	for i = 0, 4 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*2,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 4
	for i = 0, 3 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*3,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	self.actions = {
		"attack",
		"defend",
		"wide attack",
		"use potion",
		"run away"
	}

	self.frameHeight = frameHeight
	self.frameWidth = frameWidth

	self.x = x
	self.y = y
	self.speed = speed
	self.width = frameWidth
	self.height = frameHeight
	self.name = name
	self.isTurn = false
	self.currentFrame = 1
end

function Warrior:animate(dt)
	self.currentFrame = self.currentFrame + 10*dt

	if self.currentFrame >= 6 then
		self.currentFrame = 1
	end
end

function Warrior:act(action)
	if action == "attack" then
		print(self.name.." has attacked (from class)")
	elseif action == "defend" then
		print(self.name.." has defended (from class)")
	elseif action == "wide attack" then
		print(self.name.." has wide attacked (from class)")
	elseif action == "use potion" then
		print(self.name.." has used potion (from class)")
	elseif action == "run away" then
		print(self.name.." the team has run away (from warrior class)")
		love.event.quit()
	else
		print("called but no match")
		print(action)
	end
end

function Warrior:draw()
	love.graphics.draw(
		self.spriteSheet,
		self.frames[math.floor(self.currentFrame)],
		self.x,
		self.y,
		0, -- rotations
		3, -- x scale
		3 -- y scale
	)
end
