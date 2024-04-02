Mage = Object:extend()

function Mage:new(charSheet, armSheet, x, y)
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

	self.x = x
	self.y = y
	self.currentFrame = 1
end

function Mage:animate(dt)
	self.currentFrame = self.currentFrame + 10*dt
	if self.currentFrame >= 6 then
		self.currentFrame = 1
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
