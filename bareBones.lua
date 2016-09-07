--Game Creator: Ben Akinlosotu
--How? a crap load of trial and error
--Any additional advice/help would be awesome
--changed jetactive to jetEngineFiring
--changed jetalive to jetengineAttached
--changed temporary to normal 
--changed movement to stopWatch
--(make sure to add anygirl can happen to playlist.)
local physics = require "physics"
physics.start()
physics.setGravity(0,10)
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
if(number == 2) then --change to whatever number	
tag.text = "Distance Reached" --new way to rewrite text
end 
if (number== 2600) then --change
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

--change the background AND FOREGROUND
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
	--change the foregrounds
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
	

	
	jet = display.newImage("gameDevin.png")
	jet.x = 110
	jet.y =100
	jet.xScale =1.7
	jet.yScale = 1.7
	jet.radius =1
	jet.collided = false 
	physics.addBody (jet, "static", {density = .1, bounce=.1, friction=.2,radius=10})--"dynamic" means that gravity applies to it and can do collisions with other objects (changed to "static" because of beginning animation). radius creates the collision area (smaller in this case)
	screenGroup:insert(jet)
	transition.to(jet, {time =1500, xScale =.30, yScale =.30, onComplete=jetReady})
	print(jet.x)

	jet.power = false
	
	twerkingGirlSpriteSheet = sprite.newSpriteSheet("twerkPowerup.png",154,187)
	twerkingGirlSprite = sprite.newSpriteSet(twerkingGirlSpriteSheet,1,8)
	sprite.add(twerkingGirlSprite, "twerker" ,1,8, 500, 0)
	twerkingGirl= sprite.newSprite(twerkingGirlSprite)
	twerkingGirl.x = 280
	twerkingGirl.y =100
	twerkingGirl.xScale = .4
	twerkingGirl.yScale = .4
	twerkingGirl.alpha =0
	--twerkingGirl:prepare("twerker") --change the next lines only if needed
	--twerkingGirl:play()
	--screenGroup:insert(twerkingGirl)

	fireTwerkSpriteSheet = sprite.newSpriteSheet("flame.png",166,167)
	fireTwerkSprite = sprite.newSpriteSet(fireTwerkSpriteSheet,1,6)
	sprite.add(fireTwerkSprite, "twerkFire" ,1,6, 480, 0)
	fireTwerk= sprite.newSprite(fireTwerkSprite)
	fireTwerk.x = 280
	fireTwerk.y =100
	fireTwerk.xScale = .3
	fireTwerk.yScale = .3
	fireTwerk.alpha =0
	-- fireTwerk:prepare("twerkFire")--change if necessary
	-- fireTwerk:play()
	-- screenGroup:insert(fireTwerk)
	
	whipSpriteSheet = sprite.newSpriteSheet("whipsheet.png",202,234)
	whipSprite = sprite.newSpriteSet(whipSpriteSheet,1,17)
	sprite.add(whipSprite, "whipCrack" ,1,17, 990, 0)
	whip= sprite.newSprite(whipSprite)
	whip.xScale =.5
	whip.yScale =.5
	whip.x = 280
	whip.y =100
	whip.alpha =.1
	-- whip:prepare("whipCrack")--change
	-- whip:play()
	-- screenGroup:insert(whip)
	-- whip.isVisible = false
	
	allPowerupSpriteSheet = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite = sprite.newSpriteSet(allPowerupSpriteSheet, 1,6)
	sprite.add(allPowerupSprite, "allPowerups", 1,6, 1300,0)
	powerupBox1= sprite.newSprite(allPowerupSprite)
	powerupBox1.x =700
	powerupBox1.y = 240
	powerupBox1.xScale =.8
	powerupBox1.yScale =.8
	powerupBox1.speed = 2.9
	--powerupBox1:prepare("allPowerups")--change everything
	-- powerupBox1:play()
	-- screenGroup:insert (powerupBox1)--]]
	
	allPowerupSpriteSheet2 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite2 = sprite.newSpriteSet(allPowerupSpriteSheet2, 1,6)
	sprite.add(allPowerupSprite2, "allPowerups2", 1,6, 1300,0)
	powerup2= sprite.newSprite(allPowerupSprite2)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerup2.x =600
	powerup2.y = 40
	powerup2.xScale =.6
	powerup2.yScale =.5
	powerup2.speed = 3.5
	--powerup2:prepare("allPowerups2")--change everything
	-- powerup2:play()
	-- screenGroup:insert (powerup2)--]]
	
	allPowerupSpriteSheet3 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite3 = sprite.newSpriteSet(allPowerupSpriteSheet3, 1,6)
	sprite.add(allPowerupSprite3, "allPowerups3", 1,6, 1300,0)
	powerup3= sprite.newSprite(allPowerupSprite3)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerup3.x =500
	powerup3.y = 50
	powerup3.xScale =.6
	powerup3.yScale =.5
	powerup3.speed = 3.5
	powerup3.alpha =0
	--powerup3:prepare("allPowerups3")--change everything
	--powerup3:play()
	-- screenGroup:insert (powerup3)
	
	allPowerupSpriteSheet4 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite4 = sprite.newSpriteSet(allPowerupSpriteSheet3, 1,6)
	sprite.add(allPowerupSprite4, "allPowerups4", 1,6, 1300,0)
	powerupWrecking= sprite.newSprite(allPowerupSprite4)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerupWrecking.x =50
	powerupWrecking.y = 50
	powerupWrecking.xScale =.6
	powerupWrecking.yScale =.5
	powerupWrecking:prepare("allPowerups4")
	powerupWrecking:play()
	powerupWrecking.speed = 3.5
	powerupWrecking.alpha =1
	screenGroup:insert (powerupWrecking)
	
	drunkBoxSpriteSheet = sprite.newSpriteSheet("crates.png", 53,50)
	drunkBoxSprite = sprite.newSpriteSet(drunkBoxSpriteSheet, 1,6)
	sprite.add(drunkBoxSprite, "allDrunkBox", 1,6, 1300,0)
	drunkBox= sprite.newSprite(drunkBoxSprite)--make sure to put at a position where it isnt activated when the counter reaches end of level
	drunkBox.x =700
	drunkBox.y = 300
	drunkBox.xScale =.6
	drunkBox.yScale =.3
	-- drunkBox:prepare("allDrunkBox")--change
	-- drunkBox:play()
	-- drunkBox.speed = 3.5
	-- screenGroup:insert (drunkBox)
	
	explosionSpriteSheet = sprite.newSpriteSheet("explosion2.png",128,128)
	explosionSprites = sprite.newSpriteSet(explosionSpriteSheet,1,10)
	sprite.add(explosionSprites, "explosion", 1, 10, 1100, 0)
	explosion= sprite.newSprite(explosionSprites)
	explosion.x = 100
	explosion.y = 100
	explosion.xScale = 2
	explosion.yScale = 2
	explosion:prepare("explosion")
	explosion.isVisible = false
	screenGroup:insert(explosion)
	
	-- mine1= display.newImage("mine.png")--change only if needed
	-- mine1.x = 600
	-- mine1.xScale =1.3
	-- mine1.y = math.random (90,250)
	-- mine1.speed = math.random (2,4)
	-- mine1.initY = mine1.y
	-- mine1.amp = math.random (10, 50)
	-- mine1.angle = math.random (1,360)
	-- physics.addBody (mine1, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	-- screenGroup:insert (mine1)
	-- mine1:addEventListener("collision", onCollision) --Runtime applies to the entire screen and is based on the continued happenings of events aka time. we will change runtime to mine1
	-- mine2= display.newImage("mine.png")
	-- mine2.x = 600
	-- mine2.y = math.random (90,250)
	-- mine2.speed = math.random (2,4)
	-- mine2.initY = mine2.y
	-- mine2.amp = math.random (10, 40)
	-- mine2.angle = math.random (1,360)
	-- physics.addBody (mine2, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	-- screenGroup:insert (mine2)

	-- mine3= display.newImage("mine.png")
	-- mine3.x = 600
	-- mine3.y = math.random (90,250)
	-- mine3.speed = math.random (2,4)
	-- mine3.initY = mine3.y
	-- mine3.amp = math.random (10, 50)
	-- mine3.angle = math.random (1,360)
	-- physics.addBody (mine3, "static", {density = .1, bounce=.1, friction=.2,radius=7})
	-- screenGroup:insert (mine3)

	
	-- target= display.newImage("target.png")--change all this
	-- target.xScale =.2
	-- target.yScale =.2
	-- target.alpha = .5
	-- target.x = 100
	-- target.speed = 3
	-- screenGroup:insert (target)
	
	-- target2= display.newImage("target.png")--change
	-- target2.xScale =.2
	-- target2.yScale =.2
	-- target2.alpha = .9
	-- target2.x = 130
	-- screenGroup:insert (target2)
	
	-- blackBomb=display.newImage("background/ballBomb.png")--change
	-- physics.addBody (blackBomb, "dynamic", {density = .1, bounce=.1, friction=.2,radius=20})
	-- blackBomb.xScale=.1
	-- blackBomb.yScale=.1
	-- blackBomb.alpha =.3
	-- screenGroup:insert(blackBomb)
	
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
	
	gunfireSpriteSheet = sprite.newSpriteSheet("gunfire.png",41.5,238)
	gunfireSprites = sprite.newSpriteSet(gunfireSpriteSheet,1,12)
	sprite.add(gunfireSprites, "gunfire", 1, 12, 500, 0)
	gunfire= sprite.newSprite(gunfireSprites)
	
	gunfire:setReferencePoint(display.TopCenterReferencePoint)
	gunfire.x = 200
	gunfire.y = 200
	gunfire.alpha = 0
	gunfire.yScale = .2
	gunfire.xScale = .3
	gunfire.rotation = 25
	gunfire:prepare("gunfire")
	gunfire:play()
	screenGroup:insert(gunfire)	
	
	gunfire2 = sprite.newSprite(gunfireSprites)
	gunfire2:setReferencePoint(display.TopCenterReferencePoint)
	gunfire2.x = 300
	gunfire2.y = 200
	gunfire2.alpha = 0
	gunfire2.yScale = .2
	gunfire2.xScale = .3
	gunfire2.rotation = 5
	gunfire2:prepare("gunfire")
	gunfire2:play()
	screenGroup:insert(gunfire2)
	
end

function onCollision2 ()	
		if jet.collided == false then
		jet.collided = true
		jet.bodyType = "static"
		explode()
		timer.cancel(tick)
		end
	end

normalSpeed =true
drunkSpeed =false

function scrollbackground (self, event)-- change. also self is really just a place holder for cave1, cave2 etc
	if self.x < -250 then
		self.x = 700
	else self.x = self.x - self.speed
	end
end

function scrollForeground (self, event)-- change
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

function movePowerup (self,event)--change for each level
	self.speed = 2.9
		if self.x < -150 then
		self.x = 1300
		else self.x =self.x - self.speed
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
		if jetEngineFiring == false then
		if -1 > self.rotation or self.rotation > 1 then 
		self.rotation = 0
		end
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
-- function moveMines (self, event)-- change so that that it actually more dangerous
	-- if self.x < -50 then
			-- self.x = 600--these next six lines copy from the mine variable and make it random everytime it reappears 
			-- self.y = math.random (90,250)
			-- self.speed = math.random (2,4)
			-- self.amp = math.random (10, 50)
			-- self.angle = math.random (1,360)
			-- self.rotation = 1
	-- else self.x = self.x - self.speed
	-- self.rotation = self.rotation - 3
	-- self.angle = self.angle+.1
	-- self.y = self.amp*math.sin(self.angle)+ self.initY
	-- end
-- end

function moveMine1 (self, event)-- change so that that it actually more dangerous
	if mine1Active then
	if self.x < -50 then
			self.x = 800--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (90,250)
			self.speed = math.random (3,5)
			self.amp = math.random (10, 50)
			self.angle = math.random (1,360)
			self.rotation = 1
	else self.x = self.x - self.speed
	self.rotation = self.rotation - 3
	self.angle = self.angle+.1
	self.y = self.amp*math.sin(self.angle)+ self.initY
	end
	end
	
	if mine1Active == false then 
	timer.performWithDelay(800, function (moveOffScreen)
	self.y = -100
	if self.x < -30 then 
	self.x =800 else
	self.x = self.x -4
	end
	end, 1)
	end
end


function moveMine2 (self, event)-- change so that that it actually more dangerous
	if mine2Active then
	if self.x < -50 then
			self.x = 800--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (90,250)
			self.speed = math.random (3,5)
			self.amp = math.random (10, 50)
			self.angle = math.random (1,360)
			self.rotation = 1
	else self.x = self.x - self.speed
	self.rotation = self.rotation - 3
	self.angle = self.angle+.1
	self.y = self.amp*math.sin(self.angle)+ self.initY
	end
	end
	if mine2Active == false then 
	timer.performWithDelay(800, function (moveOffScreen)
	self.y = -100
	if self.x < -30 then 
	self.x =800 else
	self.x = self.x -4
	end
	end, 1)
	end
end

function moveMine3 (self, event)-- change so that that it actually more dangerous
	if mine3Active then
	if self.x < -50 then
			self.x = 800--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (90,250)
			self.speed = math.random (3,5)
			self.amp = math.random (10, 50)
			self.angle = math.random (1,360)
			self.rotation = 1
	else self.x = self.x - self.speed
	self.rotation = self.rotation - 3
	self.angle = self.angle+.1
	self.y = self.amp*math.sin(self.angle)+ self.initY
	end
	end
	if mine3Active == false then 
	timer.performWithDelay(800, function (moveOffScreen)
	self.y = -100
	if self.x < -30 then 
	self.x =800 else
	self.x = self.x -4
	end
	end, 1)
	end
end

function moveExplodedMines (self, event)
self.y = 5
if self.x < -30 then 
self.x =500 else
self.x = self.x -3
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
	self.x = self.x+(math.random(-23,-2)) 
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
	self.x = self.x+(math.random(-24,0))
	end
end

function moveWrecking (self, event)--change for each level
	if self.x > 400 then
	 --self.x = 390
	 self.x =100 
	else self.x = self.x +4
	self.y = -200+(jet.y*2.65)
	end
end

function moveWhipCrack (self, event)
	if self.x > 180 then	 
	 self.x =1 
	else self.x = self.x +4.8
	self.y = jet.y
	end
end

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
whipperSeen = false
fireSong = audio.loadStream("assOnFire.mp3")--change the audio eventually

function crash(event)
if jetEngineAttached then
if mine1Active then
if (hasCollidedCircle(mine1, jet)) then
onCollision2()
end
end
if mine2Active then
if (hasCollidedCircle(mine2, jet)) then
onCollision2()
end
end
if mine3Active then
if (hasCollidedCircle(mine3, jet)) then
onCollision2()
end
end
end
end
 
function normal()
	jetEngineAttached = true
	twerkAlive = false
	jet.alpha= 1
	twerkingGirl.alpha =0
	fireTwerk.alpha =0
	powerupBox1.isVisible=true
	jet.bodyType = "dynamic"
	twerkActive= false
	jetEngineFiring=false
	physics.setGravity(0,10)
	audio.fadeOut( { channel=1, time=850 } )--fades out all channels,	might want to change later
	--drunk normal
	normalSpeed = true
	drunkSpeed =false
	powerup2.isVisible=true
	drunkBox.alpha =1
	transition.to(foreground3, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the xscale depending on lvl
	transition.to(foreground4, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the yscale depending on lvl
	--whip normal
	whipperSeen = false 
	powerup3.isVisible=true
end

function normal2()
	normalSpeed = true
	drunkSpeed =false
	powerup2.isVisible=true
	drunkBox.alpha =1
	transition.to(foreground3, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the xscale
	transition.to(foreground4, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the yscale
end


function normal3()
	whipperSeen = false 
	powerup3.isVisible=true
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
end

function ukauka (event)
	if (jet and hasCollidedCircle(powerupBox1, jet)) then
	jetEngineAttached = false
	twerkAlive = true
	jet.alpha= 0
	gunfire.alpha = 0
	gunfire2.alpha =0
	twerkingGirl.alpha =1
	fireTwerk.alpha =.35
	powerupBox1.isVisible=false
	fireComplicated = audio.play( fireSong )
	audio.setVolume( 0.9, { channel=1 } )
	timer.performWithDelay(10000, normal, 1)
end
--return true
end

function akuaku (event)
	if (jet and hasCollidedCircle(powerup2, jet)) then
	powerup2.isVisible=false
	normalSpeed =false
	number = number + 8
	transition.to(jet, { time=300, delay=2, xScale =.35, yScale=.8, rotation = 90} )
	
	timer.performWithDelay(5000, normal2, 1)	
end
return true
end

function drunk (event)
	if (hasCollidedCircle(drunkBox, jet)) then
	drunkBox.alpha =0
	normalSpeed =false
	drunkSpeed = true
	number = number + .5
	transition.to(foreground3, { time=1600, delay=4, xScale =1.4, yScale=1.2, rotation = 5} )--change the next for lines to look better and to make
	transition.to(foreground4, { time=1600, delay=4, xScale =1.5, yScale=1.2, rotation = -5} )--normal state proper. might actually want to delete last 
	transition.to(foreground3, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = -5} )
	transition.to(foreground4, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = 5} )
	timer.performWithDelay(5000, normal2, 1)
	end	
end

function mine1Visible (event)--change. not really repeat the same thing for all mines and enemies
mine1.alpha =1
mine1Active = true
end

function swingingWreckingBall (event)--change and add stuff
	if (--[[target and--]] hasCollidedCircle(mine1, target)) then
	mine1.alpha=.1
	mine1Active = false
	timer.performWithDelay(3000, mine1Visible, 1)
	end
--return true
end

function whipping (event)--change add stuff. make this the first powerup because the target is not timed exactly with the sprite animation
	if target2.x > 100 then 
	if (hasCollidedCircle(mine1, target2)) then
	mine1.alpha=.3
	mine1Active = false
	timer.performWithDelay(3000, mine1Visible, 1)--]]
	end	
end
end

	bulletVisible =false
function jetReady ()
	bulletVisible = true
	jet.bodyType = "dynamic"
end

 function onEnterFrame( event )
     if jetEngineFiring then
      jet:applyForce (0, -1.5, jet.x, jet.y)
     end

    twerkingGirl.x = jet.x
    twerkingGirl.y = jet.y
	fireTwerk.x = (jet.x -20)
	fireTwerk.y = (jet.y -10)
	
	whip.x= (jet.x)
	whip.y=(jet.y -35)
	
	gunfire.x = (jet.x -25)
	gunfire.y = (jet.y + 5)
	gunfire2.x = (jet.x -10)
	gunfire2.y = (jet.y + 20)
	
	--target.y = jet.y --change
    end
     
    function touchScreen (event)
	if jetEngineAttached == true then
     if event.phase == "began" then
      jetEngineFiring = true
	  if normalSpeed then
	  if bulletVisible then
	  transition.to( jet, { time=200, rotation= 45} )
	  transition.to( gunfire, { time=200, rotation= 55, alpha = .8})
	  transition.to( gunfire2, { time=200, rotation= 35, alpha = .8})
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
	  transition.to( gunfire, { time=100, rotation= 35, alpha=0} )
	  transition.to( gunfire2, { time=100, rotation= 15, alpha=0} ) 
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
	
function playCutscene (event) 
media.playVideo( "firstMovie.mp4", true, gameOver2)
end

function gameOver ()
	if counterGone == false then
	textCounter:removeSelf()
	tag:removeSelf()
	storyboard.gotoScene("restart", "fade", 200)--do a restart for every level
	end
	normal()
end

function gameOver2 () ---actually not a gameover, just happens when you reach 60 distance
storyboard.gotoScene("level2startrestart", "fade", 200)
end

function explode ()
explosion.x =jet.x
explosion.y =jet.y
explosion.isVisible = true
gunfire.isVisible = false
gunfire2.isVisible = false
explosion:play()
jet.isVisible = false
timer.performWithDelay(1200, gameOver, 1)
end

--[[
function mollySpeed --change. investigate if this works properly 
	foreground1.enterFrame = scrollforeground2
	Runtime:addEventListener("enterFrame", foreground1)
	foreground2.enterFrame = scrollforeground2
	Runtime:addEventListener("enterFrame", foreground2)
	foreground3.enterFrame = scrollforeground2
	Runtime:addEventListener("enterFrame", foreground3)
	foreground4.enterFrame = scrollforeground2
	Runtime:addEventListener("enterFrame", foreground4)
end --]]


function scene:enterScene(event) 
	background.enterFrame = scrollbackground 
	Runtime:addEventListener("enterFrame", background)
	background2.enterFrame = scrollbackground 
	Runtime:addEventListener("enterFrame", background2)
	foreground1.enterFrame = scrollCity --enterframe frame  "hey do this (scrollForeground) thirty times every second
	Runtime:addEventListener("enterFrame", foreground1)
	foreground2.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground2)
	foreground3.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground3)
	foreground4.enterFrame = scrollForeground 
	Runtime:addEventListener("enterFrame", foreground4)
	
	-- mine1.enterFrame = moveMine1 --change. only do if necessary
	-- Runtime:addEventListener("enterFrame", mine1)
	-- mine2.enterFrame = moveMine2 
	-- Runtime:addEventListener("enterFrame", mine2)
	-- mine3.enterFrame = moveMine3 
	-- Runtime:addEventListener("enterFrame", mine3)
	-- target.enterFrame = moveWrecking
	-- Runtime:addEventListener("enterFrame", target)
	-- target2.enterFrame = moveWhipCrack
	-- Runtime:addEventListener("enterFrame", target2)
	-- blackBomb.enterFrame = moveFartBomb
	-- Runtime:addEventListener("enterFrame", blackBomb)
	-- powerupBox1.enterFrame = movePowerup
	-- Runtime:addEventListener("enterFrame", powerupBox1)
	-- powerup2.enterFrame = movePowerup
	-- Runtime:addEventListener("enterFrame", powerup2)
	-- drunkBox.enterFrame = movePowerup
	-- Runtime:addEventListener("enterFrame", drunkBox)
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
		
	jet.enterFrame = containPlayer
	Runtime:addEventListener("enterFrame", jet)
	--Runtime:addEventListener("enterFrame", ukauka) --change next lines. add what is necessary
	--Runtime:addEventListener("enterFrame", akuaku)
	--Runtime:addEventListener("enterFrame", swingingWreckingBall)
	Runtime:addEventListener("enterFrame", crash)
	-- Runtime:addEventListener("enterFrame",drunk)
	-- Runtime:addEventListener("enterFrame", whipping)
	-- Runtime:addEventListener("enterFrame", minesActive)
    Runtime:addEventListener("enterFrame", onEnterFrame)
	-- Runtime:addEventListener("enterFrame", twerkEnterFrame)
	 
	Runtime:addEventListener("touch", touchScreen)
	-- Runtime:addEventListener("touch", twerkTouchScreen)	
end

function scene:exitScene(event) 
Runtime:removeEventListener("touch", touchScreen)
Runtime:removeEventListener("touch", twerkTouchScreen)

Runtime:removeEventListener("enterFrame", jet)
Runtime:removeEventListener("enterFrame", bullet1)
Runtime:removeEventListener("enterFrame", bullet2)
Runtime:removeEventListener("enterFrame", bullet3)
Runtime:removeEventListener("enterFrame", bullet4)
Runtime:removeEventListener("enterFrame", bullet5)
Runtime:removeEventListener("enterFrame", bullet6)

Runtime:removeEventListener("enterFrame", foreground1)
Runtime:removeEventListener("enterFrame", foreground2)
Runtime:removeEventListener("enterFrame", foreground3)
Runtime:removeEventListener("enterFrame", foreground4)

Runtime:removeEventListener("enterFrame", mine1)
Runtime:removeEventListener("enterFrame", mine2)
Runtime:removeEventListener("enterFrame", mine3)
Runtime:removeEventListener("enterFrame", target)
Runtime:removeEventListener("enterFrame", powerupBox1)
Runtime:removeEventListener("enterFrame", powerup2)
Runtime:removeEventListener("enterFrame", drunkBox)

Runtime:removeEventListener("enterFrame", onEnterFrame)
Runtime:removeEventListener("enterFrame", twerkEnterFrame)

Runtime:removeEventListener("enterFrame", ukauka)
Runtime:removeEventListener("enterFrame", akuaku)
Runtime:removeEventListener("enterFrame", swingingWreckingBall)
Runtime:removeEventListener("enterFrame", crash)
Runtime:removeEventListener("enterFrame", whipping)
Runtime:removeEventListener("enterFrame", drunk)
Runtime:removeEventListener("enterFrame", minesActive)


end

function scene:destroyScene(event) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)
return scene