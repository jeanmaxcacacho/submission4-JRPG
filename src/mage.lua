Mage = Object:extend()

function Mage:new(charSheet, armSheet, x, y, speed, name)
	self.charSheet = charSheet
	self.armSheet = armSheet
	self.frames = {}

	-- both sheets are basically the same dimension wise
	-- actually bite me if this is bad software engineering
	local spriteSheetWidth = charSheet:getWidth()
	local spriteSheetHeight = armSheet:getHeight()
	local frameWidth = spriteSheetWidth/5
	local frameHeight = spriteSheetHeight/4

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
		"heal",
		"slow",
		"run away"
	}

	self.x = x
	self.y = y
	self.width = frameWidth
	self.height = frameHeight
	self.speed = speed
	self.name = name
	self.isTurn = false
	self.currentFrame = 1
end

function Mage:animate(dt)
	self.currentFrame = self.currentFrame + 10*dt
	if self.currentFrame >= 6 then
		self.currentFrame = 1
	end
end

function Mage:act(action)
	if action == "attack" then
		print(self.name.." has attacked (from class)")
	elseif action == "defend" then
		print(self.name.." has defended (from class)")
	elseif action == "heal" then
		print(self.name.." has healed (from class)")
	elseif action == "slow" then
		print(self.name.." has cast slow (from class)")
	elseif action == "run away" then
		print(self.name.." the team has run away (from mage class)")
		love.event.quit()
	end
end

function Mage:draw()
	love.graphics.draw(
		self.charSheet, 
		self.frames[math.floor(self.currentFrame)],
		self.x,
		self.y,
		0,
		3,
		3
	)
	love.graphics.draw(
		self.armSheet, 
		self.frames[math.floor(self.currentFrame)],
		self.x,
		self.y,
		0,
		3,
		3
	)
end
