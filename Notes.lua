--notes

--Background sprite. with new sprite style
	--[[local options =
	{ frames = require("uma").frames, }
local umaSheet = graphics.newImageSheet( "uma.png", options )
local spriteOptions = { name="uma", start=1, count=8, time=650 }
local spriteInstance1 = display.newSprite( umaSheet, spriteOptions )
spriteInstance1:setReferencePoint(display.BottomRightReferencePoint)
spriteInstance1.x = 480
spriteInstance1.y = 320
spriteInstance1.alpha = .5
spriteInstance1:play()
screenGroup:insert(spriteInstance1)--]]