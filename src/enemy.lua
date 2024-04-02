Enemy = Object:extend()

function Enemy:new(spriteSheet, x, y, speed, name)
	self.spriteSheet = spriteSheet
	self.frames = {}

	local spriteSheetWidth = spriteSheet:getWidth()
	local spriteSheetHeight = spriteSheet:getHeight()
	local frameWidth = spriteSheetWidth/7
	local frameHeight = spriteSheetHeight/8

	-- row 1
	for i = 0, 5 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*0,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 2
	for i = 0, 6 do
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
	for i = 0, 5 do
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
	for i = 0, 6 do
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

	-- row 5
	for i = 0, 5 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*4,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 6
	for i = 0, 6 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*5,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 7
	for i = 0, 5 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*6,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	-- row 8
	for i = 0, 6 do
		table.insert(
			self.frames,
			love.graphics.newQuad(
				frameWidth*i,
				frameHeight*7,
				frameWidth,
				frameHeight,
				spriteSheetWidth,
				spriteSheetHeight
			)
		)
	end

	self.x = x
	self.y = y
	self.width = frameWidth
	self.height = frameHeight
	self.speed = speed
	self.name = name
	self.isTurn = false
	self.currentFrame = 1

end

function Enemy:animate(dt)
	self.currentFrame = self.currentFrame + 10*dt
	if self.currentFrame >= 8 then
		self.currentFrame = 1
	end
end

function Enemy:draw()
	love.graphics.draw(
		self.spriteSheet,
		self.frames[math.floor(self.currentFrame)],
		self.x,
		self.y,
		0,
		3,
		3
	)
end
