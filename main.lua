-- Extension for Animo template!
-- Elliot Pace (EpaceGames.com) elliotlp@gmail.com
-- 
-- This extends Animo to export assets for Corona with graphics 2.0.
-- 
-- Be sure to put coronapatched.meta into your Animo/export_templates directory.
-- Select Corona (Graphics 2.0) from the options in Animo.
-- This sprite sheet was exported with padding of 2 just to demonstrate that it works correctly.
-- If exported with no padding, then the shapes that change scale will have bleeding artifacts on the edges.
-- 
-- Frame rate and looping in Animo do not make a difference...
-- "Forward" and "time" in shapes.lua do not have any effect as well...
-- Instead, gotoAndStop and gotoAndPlay with optional loop parameter can be specified through code.

local dt = 1.0 / 30.0
local globalTime = 0

local newShapes = require "shapes"
newShapes:load()

-- first red square (frame 1)
local newSquareSprite = newShapes:createSprite("MySquares", 1)
newSquareSprite.x = 200
newSquareSprite.y = 400
display.newCircle(newSquareSprite.x, newSquareSprite.y, 2)

-- first "1" circle (frame 1)
local newCircle = newShapes:createSprite("MyCircles", 1)
newCircle.x = 500
newCircle.y = 400
display.newCircle(newCircle.x, newCircle.y, 2)

-- flashes a four-part blinking square on the right
local loopingSquare = newShapes:createSprite("MySquares")
loopingSquare:gotoAndPlay(1)
loopingSquare.x = 750
loopingSquare.y = 350
display.newCircle(loopingSquare.x, loopingSquare.y, 2)

-- This is three pieces of MyTestShapes at the testDot location.
-- The two magenta circles should slightly touch the blue rectangle, and all three should rotate around the testDot
local test1 = newShapes:createSprite("MyTestShapes", 1)
local test2 = newShapes:createSprite("MyTestShapes", 2)
local test3 = newShapes:createSprite("MyTestShapes", 3)
local testGroup = display.newGroup()
testGroup:insert(test1)
testGroup:insert(test2)
testGroup:insert(test3)
testGroup.x = 500
testGroup.y = 200
local testDot = display.newCircle(testGroup.x, testGroup.y, 2)

-- Four squares, rotating around testDot2 location.
-- Notice the MySquares movieclip in the FLA file. The corner of the red rectangle is at the origin,
-- and the other squares are placed next to the red square.
local square1 = newShapes:createSprite("MySquares", 1)
local square2 = newShapes:createSprite("MySquares", 2) -- can either specify frame on creation of where to stop, or call gotoAndStop
local square3 = newShapes:createSprite("MySquares")
square3:gotoAndStop(3)
local square4 = newShapes:createSprite("MySquares")
square4:gotoAndStop(4)
local newGroup = display.newGroup()
newGroup:insert(square1)
newGroup:insert(square2)
newGroup:insert(square3)
newGroup:insert(square4)
newGroup.x = 120
newGroup.y = 120
local testDot2 = display.newCircle(newGroup.x, newGroup.y, 2)

newGroup.xScale = 2.1882321345
newGroup.yScale = -.573813111212

function frame(event)
	globalTime = globalTime + dt
	
	-- ensures no bleeding
	newSquareSprite.xScale = (math.sin(globalTime * 2.1839813)) * 3.83737183192
	newSquareSprite.yScale = (math.sin(globalTime * 3.1389013)) * 3.63198131398
	
	-- ensures no bleeding
	newCircle.xScale = (math.sin(globalTime * 2.1839813)) * 3.83737183192
	newCircle.yScale = (math.sin(globalTime * 3.1389013)) * 3.63198131398
	
	if newGroup then
		newGroup.rotation = newGroup.rotation + 200 * dt
	end
	if testGroup then
		testGroup.rotation = testGroup.rotation + 200 * dt
	end
end

function touchNewGroup(event)
	if newGroup then
		newGroup:removeSelf()
		newGroup = nil
	end
end

function touchTestGroup(event)
	if testGroup then
		testGroup:removeSelf()
		testGroup = nil
	end
end

newGroup:addEventListener("touch", touchNewGroup)
testGroup:addEventListener("touch", touchTestGroup)

Runtime:addEventListener("enterFrame", frame)




















