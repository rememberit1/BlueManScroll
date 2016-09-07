--Game Creator: Ben Akinlosotu

local physics = require "physics"
physics.start()
physics.setGravity(0,9)

require "sprite"

local storyboard = require ("storyboard")
local scene = storyboard.newScene()

function scene:createScene(event) 
	
	local screenGroup = self.view
	


--Distance display (we will actually use timer for this)
number = 0
tag = display.newText ("Distance", 400, 298, native.systemFont, 12)
textCounter = display.newText( number, 420, 280, native.systemFont, 16)
textCounter:setTextColor( 190, 200, 200 )
counterGone = false

function stopWatch ()
tick =timer.performWithDelay(100, function (fn_counter)--fn_... is a place holder name
number = number + 1
textCounter.text = number
if(number == 20) then
tag.text = "Distance Reached" --new way to change text
end 
if (number== 600) then 
timer.cancel(tick) -- (MAYBE) timer.cancel can be used to cancel any function if that functions was first put into a timer.performWithDelay. Make the original delay 1 millisecond if delay is not necessary.
textCounter:removeSelf()
counterGone = true
tag:removeSelf()
--timer.performWithDelay(500, playCutscene, 1)
timer.performWithDelay(500, gameOver2, 1)
end
end, 0)
end
timer.performWithDelay(2000, stopWatch, 1)

	background = display.newImage("bg.png")
	 background.xScale = 1.4
	background.yScale = .9
	background.x =0
	background.y=145
	background.speed = .4
	screenGroup:insert(background)
	
	background2 = display.newImage("bg.png")
	 background2.xScale = 1.4
	background2.yScale = .9
	background2.x = 480
	background2.y=145
	background2.speed = .4
	screenGroup:insert(background2)
	 foreground1 = display.newImage("city1.png")
	foreground1:setReferencePoint(display.BottomLeftReferencePoint)
	foreground1.xScale =1.4
	foreground1.x= -50
	foreground1.y= 320
	foreground1.speed = 1	--adding(period) .etc to a variable, it is just adding a variable to a variable (changing properties of this variable). however, speed is is not a corona variable like .x or .y
	foreground1.speed2 = 4
	foreground1.speedDrunk= .2
	screenGroup:insert(foreground1)

	 foreground2 = display.newImage("city1.png")
	foreground2:setReferencePoint(display.BottomLeftReferencePoint)
	foreground2.xScale =1.4
	foreground2.x= 480	
	foreground2.y= 320
	foreground2.speed = 1
	foreground2.speed2 = 4
	foreground2.speedDrunk= .2
	screenGroup:insert(foreground2)
	
	 foreground3 = display.newImage("city2.png")
	foreground3:setReferencePoint(display.BottomLeftReferencePoint)
	foreground3.xScale =1.4
	foreground3.x= -50
	foreground3.y= 320
	foreground3.speed = 2
	foreground3.speed2 = 8
	foreground3.speedDrunk= .5
	screenGroup:insert(foreground3)

	 foreground4 = display.newImage("city2.png")
	foreground4:setReferencePoint(display.BottomLeftReferencePoint)
	foreground4.xScale =1.4
	foreground4.x= 480
	foreground4.y= 320
	foreground4.speed = 2
	foreground4.speed2 = 8
	foreground4.speedDrunk= .5
	screenGroup:insert(foreground4)

	ceiling = display.newImage("invisibleTile.png")
	ceiling:setReferencePoint(display.BottomLeftReferencePoint)
	ceiling.x= 0
	ceiling.y= -10
	physics.addBody (ceiling, "static", {density = .1, bounce=.1, friction=.2})
	screenGroup:insert(ceiling)
	
	theFloor = display.newImage("invisibleTile.png")
	theFloor:setReferencePoint(display.BottomLeftReferencePoint)
	theFloor.x= 0
	theFloor.y= 343
	physics.addBody (theFloor, "static", {density = .1, bounce=.1, friction=.2})
	screenGroup:insert(theFloor)
	
    jetSpriteSheet = sprite.newSpriteSheet("jet.png",50,17)
	jetSprites = sprite.newSpriteSet(jetSpriteSheet,1,4)
	sprite.add(jetSprites, "jets" ,1,4, 500, 0)
	--jet= sprite.newSprite(jetSprites)
	jet = display.newImage("gameDevin.png")
	jet.x = 110
	jet.y =100
	jet.xScale =1.7
	jet.yScale = 1.7
	jet.radius =1
	--jet:prepare("jets")
	--jet:play()
	jet.collided = false 
	physics.addBody (jet, "static", {density = .1, bounce=.1, friction=.2,radius=10})--"dynamic" means that gravity applies to it and can do collisions with other objects (changed to "static" because of beginning animation). radius creates the collision area (smaller in this case)
	screenGroup:insert(jet)
	--jetIntro = 
	transition.to(jet, {time =1500,  xScale =.25, yScale =.25, onComplete=jetReady})
	print(jet.x)

	jet.power = false
	
	twerkPowerupSpriteSheet = sprite.newSpriteSheet("twerkPowerup.png",154,187)
	twerkPowerupSprite = sprite.newSpriteSet(twerkPowerupSpriteSheet,1,8)
	sprite.add(twerkPowerupSprite, "twerker" ,1,8, 500, 0)
	twerkPowerup= sprite.newSprite(twerkPowerupSprite)
	twerkPowerup.x = 280
	twerkPowerup.y =100
	twerkPowerup.xScale = .4
	twerkPowerup.yScale = .4
	twerkPowerup.alpha =0
	twerkPowerup:prepare("twerker")
	twerkPowerup:play()
	screenGroup:insert(twerkPowerup)
	
	fireTwerkSpriteSheet = sprite.newSpriteSheet("flame.png",166,167)
	fireTwerkSprite = sprite.newSpriteSet(fireTwerkSpriteSheet,1,6)
	sprite.add(fireTwerkSprite, "twerkFire" ,1,6, 480, 0)
	fireTwerk= sprite.newSprite(fireTwerkSprite)
	fireTwerk.x = 280
	fireTwerk.y =100
	--fireTwerk.xScale = .3
	--fireTwerk.yScale = .3
	fireTwerk.alpha =0
	fireTwerk:prepare("twerkFire")
	fireTwerk:play()
	screenGroup:insert(fireTwerk)
	
	whipSpriteSheet = sprite.newSpriteSheet("whipsheet.png",58,67)
	whipSprite = sprite.newSpriteSet(whipSpriteSheet,1,17)
	sprite.add(whipSprite, "whipCrack" ,1,17, 990, 0)
	whip= sprite.newSprite(whipSprite)
	whip.xScale =1.1
	whip.yScale =1.1
	whip.x = 280
	whip.y =100
	whip.alpha =0
	whip:prepare("whipCrack")
	whip:play()
	screenGroup:insert(whip)
	
	allPowerupSpriteSheet = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite = sprite.newSpriteSet(allPowerupSpriteSheet, 1,6)
	sprite.add(allPowerupSprite, "allPowerups", 1,6, 1300,0)
	powerup= sprite.newSprite(allPowerupSprite)
	powerup.x =700
	powerup.y = 240
	powerup.xScale =.8
	powerup.yScale =.8
	powerup:prepare("allPowerups")
	powerup:play()
	powerup.speed = 2.9
	--physics.addBody (powerup, "static", {density = .1, bounce=.1, friction=.2,radius=17})
	screenGroup:insert (powerup)--]]
	
	allPowerupSpriteSheet2 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite2 = sprite.newSpriteSet(allPowerupSpriteSheet2, 1,6)
	sprite.add(allPowerupSprite2, "allPowerups2", 1,6, 1300,0)
	powerup2= sprite.newSprite(allPowerupSprite2)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerup2.x =600
	powerup2.y = 40
	powerup2.xScale =.6
	powerup2.yScale =.5
	powerup2:prepare("allPowerups2")
	powerup2:play()
	powerup2.speed = 3.5
	screenGroup:insert (powerup2)--]]
	
	allPowerupSpriteSheet3 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite3 = sprite.newSpriteSet(allPowerupSpriteSheet3, 1,6)
	sprite.add(allPowerupSprite3, "allPowerups3", 1,6, 1300,0)
	powerup3= sprite.newSprite(allPowerupSprite3)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerup3.x =500
	powerup3.y = 50
	powerup3.xScale =.6
	powerup3.yScale =.5
	powerup3:prepare("allPowerups3")
	powerup3:play()
	powerup3.speed = 3.5
	powerup3.alpha =0
	screenGroup:insert (powerup3)
	
	allPowerupSpriteSheet4 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite4 = sprite.newSpriteSet(allPowerupSpriteSheet3, 1,6)
	sprite.add(allPowerupSprite3, "allPowerups3", 1,6, 1300,0)
	powerupWrecking= sprite.newSprite(allPowerupSprite3)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerupWrecking.x =500
	powerupWrecking.y = 50
	powerupWrecking.xScale =.6
	powerupWrecking.yScale =.5
	powerupWrecking:prepare("allPowerups3")
	powerupWrecking:play()
	powerupWrecking.speed = 3.5
	powerupWrecking.alpha =0
	screenGroup:insert (powerupWrecking)
	
	drunkBoxSpriteSheet = sprite.newSpriteSheet("crates.png", 53,50)
	drunkBoxSprite = sprite.newSpriteSet(drunkBoxSpriteSheet, 1,6)
	sprite.add(drunkBoxSprite, "allDrunkBox", 1,6, 1300,0)
	drunkBox= sprite.newSprite(drunkBoxSprite)--make sure to put at a position where it isnt activated when the counter reaches end of level
	drunkBox.x =700
	drunkBox.y = 300
	drunkBox.xScale =.6
	drunkBox.yScale =.3
	drunkBox:prepare("allDrunkBox")
	drunkBox:play()
	drunkBox.speed = 3.5
	screenGroup:insert (drunkBox)
	
	explosionSpriteSheet = sprite.newSpriteSheet("explosion.png",24,23)
	explosionSprites = sprite.newSpriteSet(explosionSpriteSheet,1,8)
	sprite.add(explosionSprites, "explosion", 1, 8, 1000, 1)
	explosion= sprite.newSprite(explosionSprites)
	explosion.x = 100
	explosion.y = 100
	explosion.xScale = 4
	explosion.yScale = 4
	explosion:prepare("explosion")
	explosion.isVisible = false
	screenGroup:insert(explosion)
	
	mine1= display.newImage("mine.png")
	mine1.x = 600
	mine1.xScale =1.3
	mine1.y = math.random (90,250)
	mine1.speed = math.random (2,4)
	mine1.initY = mine1.y
	mine1.amp = math.random (10, 50)
	mine1.angle = math.random (1,360)
	physics.addBody (mine1, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	screenGroup:insert (mine1)
	mine1:addEventListener("collision", onCollision) --Runtime applies to the entire screen and is based on the continued happenings of events aka time. we will change runtime to mine1
	
	mine2= display.newImage("mine.png")
	mine2.x = 600
	mine2.y = math.random (90,250)
	mine2.speed = math.random (2,4)
	mine2.initY = mine2.y
	mine2.amp = math.random (10, 40)
	mine2.angle = math.random (1,360)
	physics.addBody (mine2, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	screenGroup:insert (mine2)
	mine2:addEventListener("collision", onCollision)
	--mine2:removeEventListener("collision", onCollision)

	mine3= display.newImage("mine.png")
	mine3.x = 600
	mine3.y = math.random (90,250)
	mine3.speed = math.random (2,4)
	mine3.initY = mine3.y
	mine3.amp = math.random (10, 50)
	mine3.angle = math.random (1,360)
	physics.addBody (mine3, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	screenGroup:insert (mine3)
	mine3:addEventListener("collision", onCollision)
	----mine3:removeEventListener("collision", onCollision)
	
	target= display.newImage("target.png")
	target.xScale =.2
	target.yScale =.2
	target.alpha = .5
	target.x = 100
	--target.y = 100
	target.speed = 3
	--target.initY = jet.y
	--target.amp = math.random (10, 50)
	--target.angle = math.random (1,360)
	--physics.addBody (target, "static", {density = .1, bounce=.1, friction=.2,radius=17})
	screenGroup:insert (target)
	--target:addEventListener("collision", onCollision)--]]
	
	target2= display.newImage("target.png")
	target2.xScale =.2
	target2.yScale =.2
	target2.alpha = .9
	target2.x = 130
	--target2.speed = 3
	screenGroup:insert (target2)
	
	--blackBomb = display.newCircle( jet.x, jet.y, 22)
	blackBomb=display.newImage("background/ballBomb.png")
	physics.addBody (blackBomb, "dynamic", {density = .1, bounce=.1, friction=.2,radius=20})
	blackBomb.xScale=.1
	blackBomb.yScale=.1
	blackBomb.alpha =.3
	screenGroup:insert(blackBomb)

	gunfireSpriteSheet = sprite.newSpriteSheet("gunfire.png",41.5,238)
	gunfireSprites = sprite.newSpriteSet(gunfireSpriteSheet,1,12)
	sprite.add(gunfireSprites, "gunfire", 1, 12, 500, 0)
	gunfire= sprite.newSprite(gunfireSprites)
	gunfire:setReferencePoint(display.TopCenterReferencePoint)
	gunfire.x = 200
	gunfire.y = 200
	gunfire.alpha = 0
	gunfire.yScale = .3
	gunfire.xScale = .3
	gunfire.rotation = 25
	gunfire:prepare("gunfire")
	gunfire:play()
	screenGroup:insert(gunfire)	
	
	bullet1 = display.newRect(50, 0, 2, 10)
	bullet1:setFillColor(255,255,51)
	bullet1.alpha =0
	screenGroup:insert(bullet1)
	bullet2 = display.newRect(50, 60, 2, 10)
	bullet2:setFillColor(255,255,51)
	bullet2.alpha =0
	screenGroup:insert(bullet2)
	bullet3 = display.newRect(50, 120, 2, 10)
	bullet3:setFillColor(255,255,51)
	bullet3.alpha =0
	screenGroup:insert(bullet3)
	bullet4 = display.newRect(50, 180, 2, 10)
	bullet4:setFillColor(255,255,51)
	bullet4.alpha =0
	screenGroup:insert(bullet4)
	bullet5 = display.newRect(50, 240, 2, 10)
	bullet5:setFillColor(255,255,51)
	bullet5.alpha =0
	screenGroup:insert(bullet5)
	bullet6 = display.newRect(50, 300, 2, 10)
	bullet6:setFillColor(255,255,51)
	bullet6.alpha =0
	screenGroup:insert(bullet6)
end

function onCollision2 ()	
		if jet.collided == false then
		jet.collided = true
		jet.bodyType = "static"
		--myLine.isVisible = false
		explode()
		timer.cancel(tick)
		end
	end

normalSpeed =true
drunkSpeed =false

function scrollBackground (self, event)-- change. self is really just a place holder for cave1, cave2 etc
	if self.x < -250 then
		self.x = 700
	else self.x = self.x - self.speed
	end
	
end

function scrollForeground (self, event)--change
if normalSpeed then
	if self.x < -554 then
		self.x = 480
	else self.x = self.x - self.speed	
	end
	
	elseif drunkSpeed then 
		if self.x < -554 then
		  self.x =480
		  else self.x = self.x - self.speedDrunk
		  end	
	elseif self.x < -554 then
		self.x = 480
	else self.x = self.x - self.speed2
	end
end


function movePowerup (self,event)
	self.speed = 2.9

		if self.x < -150 then
		self.x = 1300
		else self.x =self.x - self.speed
		--redJet.alpha = 1
	end
	end
	
function containPlayer (self, event)
		if self.y < -1 then 
		self.y = 0
		end
		if self.y > 301 then
		self.y = 300
		end
		
		if self.x > 111 then 
		self.x =110
		end
		
		if self.x < 109 then 
		self.x =110
		end
		
		if normalSpeed or drunkSpeed then 
		if self.rotation < 4 then 
		self.rotation =5
		end
		
		if self.rotation > 46 then 
		self.rotation =45
		end
		end
end

function moveMines (self, event)-- self is really just a place holder for foreground1, foreground2 etc
	if self.x < -50 then
			self.x = 600--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (90,250)
			self.speed = math.random (2,4)
			self.amp = math.random (10, 50)
			self.angle = math.random (1,360)
			self.rotation = 1
	
	else self.x = self.x - self.speed
	self.rotation = self.rotation - 3
	self.angle = self.angle+.1
	self.y = self.amp*math.sin(self.angle)+ self.initY
	end
	
end

function moveBullets (self, event)
if jet.x < 99 then
self.alpha = 0 
end
if self.y > 500 then
	self.y =jet.y
	self.x = 110
	else self.y = self.y+25
	self.x = self.x+(math.random(-13,-2)) 
	end
end

function moveBullets2 (self, event)
if jet.x < 99 then
self.alpha = 0 
end
if self.y > 550 then
	self.y =jet.y+30
	self.x = 110
	else self.y = self.y+23
	self.x = self.x+(math.random(-14,0))
	end
end

--lineActive = true
function moveWrecking (self, event)
	if self.x > 490 then
	 --self.x = 390
	 self.x =100
	 
	else self.x = self.x +4
	self.y = -200+(jet.y*2.65)
	--self.y = (math.pow(.1*(jet.y),2)) 	
	--[[if ( myLine ) then
				myLine.parent:remove( myLine ) -- erase previous line, if any
			end
	myLine=display.newLine(100, jet.y, self.x, self.y)
	myLine.width =15
	
		if lineActive then
	myLine.alpha = .4
		else myLine.alpha =.1 --perform with delay back to .4
		end
	myLine:setColor( 255, 0, 0)
	--]]
	end
end

function moveWhipCrack (self, event)-- self is really just a place holder for foreground1, foreground2 etc
	if self.x > 180 then	 
	 self.x =1
	 
	else self.x = self.x +4.8
	self.y = jet.y
	
	end
end

-- function moveBullets (self, event)
-- if self.y > 600 then
	-- self.y =jet.y
	-- else self.y = self.y+10
	-- end
-- end

function moveFartBomb (self, event)
	self.rotation = self.rotation + 8
	self.x = self.x+3
	if self.rotation<8 then
	self.rotation = self.rotation +8
	end
	if  self.x >275 or 0 > self.x then
	self.x = jet.x +35
	self.y = jet.y
	else if
	self.y <290 then
	self.x = jet.x+35
	else
	self.x = self.x+3
end
end
end


function hasCollidedCircle (obj1, obj2)
--[[if ( obj1 == nil ) then  --make sure the first object exists
      return false
   end
   if ( obj2 == nil ) then  --make sure the other object exists
      return false
   end--]]

   local dx = obj1.x - obj2.x
   local dy = obj1.y - obj2.y

   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = ((obj2.contentWidth/2) + (obj1.contentWidth/2))* .7

   if ( distance < objectSize ) then
      return true
   end
   return false
end
mine1Active = true
mine2Active = true
mine3Active = true


function minesActive (event)
if (mine1Active and (jet and hasCollidedCircle(mine1, jet))) --[[or 
(jet and hasCollidedCircle(mine2, jet)) or (jet and hasCollidedCircle(mine3, jet))--]]
then
onCollision2()
end
end

jetEngineAttached = true	
twerkAlive = false
twerkActive = false
jetEngineFiring = false
fireSong = audio.loadStream("assOnFire.mp3")
 
function normal()
	jetEngineAttached = true
	twerkAlive = false
	jet.alpha= 1
	twerkPowerup.alpha =0
	fireTwerk.alpha =0
	powerup.isVisible=true
	jet.bodyType = "dynamic"
	twerkActive= false
	jetEngineFiring=false
	--jet:setLinearVelocity( 0, 0)
	physics.setGravity(0,8)
	--twerkTouchScreen =nil
	audio.fadeOut( { channel=1, time=850 } )--fades out all channels,	might want to change later
end

function normal2()
	normalSpeed = true
	drunkSpeed =false
	powerup2.isVisible=true
	drunkBox.alpha =1
	transition.to(foreground3, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )
	transition.to(foreground4, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )
	--number = number + 1
	jet.xScale =.25
	jet.yScale = .25
end

whipperSeen = false
function normal3()
	whipperSeen = false 
	powerup3.isVisible=true
end

function ukauka (event)
	if (jet and hasCollidedCircle(powerup, jet)) then
	
	jetEngineAttached = false
	twerkAlive = true
	jet.alpha= 0
	twerkPowerup.alpha =1
	fireTwerk.alpha =.35
	powerup.isVisible=false
	fireComplicated = audio.play( fireSong )
	audio.setVolume( 0.9, { channel=1 } )
	timer.performWithDelay(10000, normal, 1)
end
return true
end

function akuaku (event)
	if (jet and hasCollidedCircle(powerup2, jet)) then
	powerup2.isVisible=false
	normalSpeed =false
	number = number + 8
	transition.to(jet, { time=300, delay=2, xScale =.35, yScale=.8, rotation = 90} )
	--jet.yScale = .1
	--foreground1.xScale =1.5
	
	timer.performWithDelay(5000, normal2, 1)	
end
return true
end

function drunk (event)
	if (hasCollidedCircle(drunkBox, jet)) then
	drunkBox.alpha =.3
	normalSpeed =false
	drunkSpeed = true
	number = number + .5
	transition.to(foreground3, { time=1600, delay=4, xScale =1.4, yScale=1.2, rotation = 5} )
	transition.to(foreground4, { time=1600, delay=4, xScale =1.5, yScale=1.2, rotation = -5} )
	transition.to(foreground3, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = -5} )
	transition.to(foreground4, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = 5} )
	
	timer.performWithDelay(5000, normal2, 1)
	end	
end


function mine1Visible (event)
mine1.alpha =1
mine1Active = true
end

function swingingWreckingBall (event)
	
	if (--[[target and--]] hasCollidedCircle(mine1, target)) then
	mine1.alpha=.1
	mine1Active = false
	timer.performWithDelay(3000, mine1Visible, 1)--]]
	end

--return true
end

function whipping (event)--make this the first powerup because the target is not timed exactly with the sprite animation
	if target2.x > 100 then 
	if (hasCollidedCircle(mine1, target2)) then
	
	mine1.alpha=.3
	mine1Active = false
	timer.performWithDelay(3000, mine1Visible, 1)--]]
	end
	
end
end

function swingingWreckingBall (event)
	
	if (--[[target and--]] hasCollidedCircle(mine1, target)) then	
	mine1.alpha=.1
	mine1Active = false
	timer.performWithDelay(3000, mine1Visible, 1)--]]
	end
--return true
end

bulletVisible =false
function jetReady ()
	bulletVisible = true
	jet.bodyType = "dynamic"
	
end

function jetNotReady() 
jet.bodyType = "static"
-- transition.to(a x coordintate that doesnt interfere with new powerup)
end

--[[function activateJets (self, event)
	self:applyForce (0, -1.5, self.x, self.y)
	
end--]]

 function onEnterFrame( event )
     if jetEngineFiring then
      jet:applyForce (0, -1.5, jet.x, jet.y)
	  
	  --gunfire.alpha =.7
     end
	 --if jet.x < 0 then jet.x = 110
	 --jet:applyForce (2,0,jet.x, jet.y)
	-- end
    twerkPowerup.x = jet.x
    twerkPowerup.y = jet.y
	fireTwerk.x = (jet.x -20)
	fireTwerk.y = (jet.y + 10)
	
	whip.x= (jet.x)
	whip.y=(jet.y -35)
	
	gunfire.x = (jet.x -18)
	gunfire.y = (jet.y + 20)
	
	target.y = jet.y
    end
     
    function touchScreen (event)
	if jetEngineAttached == true then
     if event.phase == "began" then
      jetEngineFiring = true
	  if normalSpeed then
	  if bulletVisible then
	  transition.to( jet, { time=200, rotation= 45} )
	  transition.to( gunfire, { time=200, rotation= 45, alpha =.7} )
	    bullet1.alpha =1
		bullet2.alpha =1
		bullet3.alpha =1
		bullet4.alpha =1
		bullet5.alpha =1
		bullet6.alpha =1
	  end
	  end
     elseif event.phase == "ended" or event.phase == "cancelled" then
      jetEngineFiring = false
	  if normalSpeed then
	  transition.to( jet, { time=700, rotation=5} )
	  transition.to( gunfire, { time=100, rotation=25, alpha=0} )
	  
		bullet1.alpha =0
		bullet2.alpha =0
		bullet3.alpha =0
		bullet4.alpha =0
		bullet5.alpha =0
		bullet6.alpha =0
	  
	end  
    end
    end
	end
	
function twerkEnterFrame( event )
     if twerkActive then	 
      jet:setLinearVelocity( 0, -164 )
	  
    end
    end
	
	function twerkTouchScreen (event)	
	if twerkAlive == true then
	jetEngineAttached = false
	 if event.phase == "began" then
	
	twerkActive = true
	jet.bodyType = "kinematic"
	
	
	 elseif event.phase == "ended" or event.phase == "cancelled" then
	 twerkActive= false
		jet:setLinearVelocity( 0, 144 )
    
	end
	end
end--]]
	
function playCutscene (event) 
media.playVideo( "firstMovie.mp4", true, gameOver2)
end

function gameOver ()
	if counterGone == false then
	textCounter:removeSelf()
	tag:removeSelf()
	storyboard.gotoScene("restart", "fade", 200)
	end
	normal()
end

function gameOver2 () ---actually not a gameover, just happens when you reach 60 distance
storyboard.gotoScene("level2startrestart", "fade", 200)
end

--user the explosion.y sprite to mimic powerup & make a new collision func
function explode ()
explosion.x =jet.x
explosion.y =jet.y
explosion.isVisible = true
explosion:play()
jet.isVisible = false
--lineActive =false

timer.performWithDelay(2500, gameOver, 1)
end

function onCollision (event)
	if event.phase == "began" then
		if jet.collided == false then
		jet.collided = true
		jet.bodyType = "static"
		--myLine.isVisible = false
		explode()
		timer.cancel(tick)
		end
	end
end



function scene:enterScene(event) 

	background.enterFrame = scrollBackground 
	Runtime:addEventListener("enterFrame", background)
	background2.enterFrame = scrollBackground 
	Runtime:addEventListener("enterFrame", background2)
	
	foreground1.enterFrame = scrollForeground --enterframe frame  "hey do this (scrollForeground) thirty times every second
	Runtime:addEventListener("enterFrame", foreground1)

	foreground2.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground2)
	print(foreground1.x)

	foreground3.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground3)

	foreground4.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground4)
	
	mine1.enterFrame = moveMines 
	Runtime:addEventListener("enterFrame", mine1)
	
	mine2.enterFrame = moveMines 
	Runtime:addEventListener("enterFrame", mine2)
	
	mine3.enterFrame = moveMines 
	Runtime:addEventListener("enterFrame", mine3)
	
	target.enterFrame = moveWrecking
	Runtime:addEventListener("enterFrame", target)
	
	target2.enterFrame = moveWhipCrack
	Runtime:addEventListener("enterFrame", target2)
	
	blackBomb.enterFrame = moveFartBomb
	Runtime:addEventListener("enterFrame", blackBomb)
	
	powerup.enterFrame = movePowerup
	Runtime:addEventListener("enterFrame", powerup)
		powerup2.enterFrame = movePowerup
		Runtime:addEventListener("enterFrame", powerup2)
		drunkBox.enterFrame = movePowerup
		Runtime:addEventListener("enterFrame", drunkBox)
		
	jet.enterFrame = containPlayer
	Runtime:addEventListener("enterFrame", jet)
	
	--Runtime:addEventListener("enterFrame", ukauka)
	--Runtime:addEventListener("enterFrame", akuaku)
	--Runtime:addEventListener("enterFrame", swingingWreckingBall)
	Runtime:addEventListener("enterFrame",drunk)
	Runtime:addEventListener("enterFrame", whipping)
	Runtime:addEventListener("enterFrame", minesActive)
		
	Runtime:addEventListener("enterFrame", onEnterFrame)
	Runtime:addEventListener("enterFrame", twerkEnterFrame)
	
	bullet1.enterFrame = moveBullets 
	Runtime:addEventListener("enterFrame", bullet1)
	bullet2.enterFrame = moveBullets 
	Runtime:addEventListener("enterFrame", bullet2)
	bullet3.enterFrame = moveBullets 
	Runtime:addEventListener("enterFrame", bullet3)
	bullet4.enterFrame = moveBullets2
	Runtime:addEventListener("enterFrame", bullet4)
	bullet5.enterFrame = moveBullets2
	Runtime:addEventListener("enterFrame", bullet5)
	bullet6.enterFrame = moveBullets2
	Runtime:addEventListener("enterFrame", bullet6)

	
	Runtime:addEventListener("touch", touchScreen)
	Runtime:addEventListener("touch", twerkTouchScreen)
	--end	
end

function scene:exitScene(event) 
Runtime:removeEventListener("touch", touchScreen)
Runtime:removeEventListener("touch", twerkTouchScreen)

Runtime:removeEventListener("enterFrame", jet)
Runtime:removeEventListener("enterFrame", foreground1)
Runtime:removeEventListener("enterFrame", foreground2)
Runtime:removeEventListener("enterFrame", foreground3)
Runtime:removeEventListener("enterFrame", foreground4)

Runtime:removeEventListener("enterFrame", mine1)
Runtime:removeEventListener("enterFrame", mine2)
Runtime:removeEventListener("enterFrame", mine3)
Runtime:removeEventListener("enterFrame", target)

Runtime:removeEventListener("enterFrame", powerup)
Runtime:removeEventListener("enterFrame", powerup2)
Runtime:removeEventListener("enterFrame", drunkBox)

Runtime:removeEventListener("enterFrame", onEnterFrame)
Runtime:removeEventListener("enterFrame", twerkEnterFrame)

Runtime:removeEventListener("enterFrame", ukauka)
Runtime:removeEventListener("enterFrame", akuaku)
Runtime:removeEventListener("enterFrame", swingingWreckingBall)
Runtime:removeEventListener("enterFrame", whipping)
Runtime:removeEventListener("enterFrame", drunk)
Runtime:removeEventListener("enterFrame", minesActive)

Runtime:removeEventListener("enterFrame", bullet1)
Runtime:removeEventListener("enterFrame", bullet2)
Runtime:removeEventListener("enterFrame", bullet3)
Runtime:removeEventListener("enterFrame", bullet4)
Runtime:removeEventListener("enterFrame", bullet5)
Runtime:removeEventListener("enterFrame", bullet6)

mine1:removeEventListener("collision", onCollision)
mine2:removeEventListener("collision", onCollision)
mine3:removeEventListener("collision", onCollision)
end

function scene:destroyScene(event) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
---change mines to hascollidedcircle to make powerups more reliable
---insert whipper power up into scene 