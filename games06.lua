 --Game Creator: Ben Akinlosotu
--How? a crap load of trial and error
--Any additional advice/help would be awesome
--changed jetactive to jetEngineFiring
--changed jetalive to jetengineAttached
--changed temporary to normal 
--changed movement to stopWatch

local physics = require "physics"
physics.start()
physics.setGravity(0,12)
local sprite= require "sprite"
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local sfx = require( "sfx" )

menuActive = false
function scene:createScene(event) 
	
	
local screenGroup = self.view
--Distance display (we will actually use timer for this)
number = 0
tag = display.newText ("Distance", 0, 193, native.systemFont, 12)
tag:setTextColor( 190, 300, 300 )
textCounter = display.newText( number, 35, 180, native.systemFont, 12)
textCounter:setTextColor( 190, 300, 300 )

counterGone = false

function stopWatch ()
screenGroup:insert(tag)
screenGroup:insert(textCounter)
tick =timer.performWithDelay(100, function (fn_counter)--fn_... is a place holder name

menuActive = true
transition.to( menuSquare, { time=200, alpha=.8} )
transition.to( goBack, { time=200, alpha=1} )
number = number + 1
textCounter.text = number.."/250  Yds"--change
if(number == 1) then --change to whatever number	
tag.text = "Distance Reached" --new way to rewrite text
end 
levelBeaten =false
if number > 247 then
sfx.currentLevel=7
if sfx.currentLevel > sfx.highestLevel then 
sfx.highestLevel = sfx.currentLevel
score.set(sfx.highestLevel)
score.save()
end
end
if (number > 249) then --change
timer.cancel(tick) -- (MAYBE) timer.cancel can be used to cancel any function if that functions was first put into a timer.performWithDelay. Make the original delay 1 millisecond if delay is not necessary.
levelBeaten = true
--audio.stop(machineGunLoop)
menuActive = false
menuSquare.alpha =0
goBack.alpha =0
audio.stop()

-- timer.cancel(moveBaby)--change
-- timer.cancel(moveLegs)--change

counterGone = true
--timer.performWithDelay(500, playCutscene, 1)--change
timer.performWithDelay(500, gameOver2, 1)
end
end, 0)
end
startStopWatch=timer.performWithDelay(2000, stopWatch, 1)

--change the background
	background = display.newImage("background/photoshopProjects/underwater3.png")
	 background.xScale = .94
	background.yScale = .96
	background.x = 900
	background.y=100
	background.speed = .4
	screenGroup:insert(background)
	
	background2 = display.newImage("background/photoshopProjects/underwater3.png")
	background2.xScale = .94
	background2.yScale = .96
	background2.x = 2820
	background2.y=100
	background2.speed = .4
	screenGroup:insert(background2)
		
	 foreground1 = display.newImage("background/photoshopProjects/underwater2.png")
	foreground1:setReferencePoint(display.BottomLeftReferencePoint)
	foreground1.x= -60
	foreground1.y= 400
	foreground1.xScale = .305
	foreground1.yScale = .4
	foreground1.speed = 2 --adding(period) .etc to a variable, it is just adding a variable to a variable (changing properties of this variable). speed is is not a corona variable
	screenGroup:insert(foreground1)

	 foreground2 = display.newImage("background/photoshopProjects/underwater2.png")
	foreground2:setReferencePoint(display.BottomLeftReferencePoint)
	foreground2.x= 480	
	foreground2.y= 400
	foreground2.xScale = .305
	foreground2.yScale = .4
	foreground2.speed = 2
	screenGroup:insert(foreground2)

	 foreground3 = display.newImage("background/photoshopProjects/underwater1.png")
	foreground3:setReferencePoint(display.BottomLeftReferencePoint)
	foreground3.x= -60
	foreground3.y= 320
	foreground3.xScale = .305
	foreground3.yScale = .4
	foreground3.speed = 4
	screenGroup:insert(foreground3)

	 foreground4 = display.newImage("background/photoshopProjects/underwater1.png")
	foreground4:setReferencePoint(display.BottomLeftReferencePoint)
	foreground4.x= 480
	foreground4.y= 320
	foreground4.xScale = .305
	foreground4.yScale = .4
	foreground4.speed = 4
	screenGroup:insert(foreground4)
	
				allPowerupSpriteSheet7 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite7 = sprite.newSpriteSet(allPowerupSpriteSheet7, 1,6)
	sprite.add(allPowerupSprite7, "allPowerups7", 1,6, 1300,0)
	powerupGun= sprite.newSprite(allPowerupSprite7)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerupGun.x =600
	powerupGun.y = math.random(35, 230)
	powerupGun.radius = 10
	powerupGun.xScale =.8
	powerupGun.yScale =.8
	powerupGun:prepare("allPowerups7")
	powerupGun:play()
	powerupGun.speed = 3.5
	powerupGun.alpha =1
	screenGroup:insert (powerupGun)
	green = display.newRect(600, 40, 40, 40)
	green:setFillColor(0,200,0)
	green.alpha =.7
	screenGroup:insert(green)
	missle1= display.newImage("missle.png")--change all this
	missle1.xScale =.02
	missle1.yScale =.02
	missle1.alpha = 0
	missle1.x = 300
	missle1.y = -100
	missle1.rotation = 90
	missle1.radius = 2
	screenGroup:insert (missle1)
	missle2= display.newImage("missle.png")--change all this
	missle2.xScale =.02
	missle2.yScale =.02
	missle2.alpha = 0
	missle2.rotation = 90
	missle2.x = 100
	missle2.y = -100
	missle2.radius = 2
	screenGroup:insert (missle2)

	
	ceiling = display.newImage("invisibleTile.png")
	ceiling.x= 0
	ceiling.xscale=2
	ceiling.y= -5
	physics.addBody (ceiling, "static", {density = .1, bounce=.1, friction=.2})
	screenGroup:insert(ceiling)
	theFloor = display.newImage("invisibleTile.png")
	theFloor.x= 0
	theFloor.y= 323
	physics.addBody (theFloor, "static", {density = .1, bounce=.1, friction=.2})
	screenGroup:insert(theFloor)
	
		if sfx.charNumber ==0 or sfx.charNumber == nil then
	jet = display.newImage("gameDevin2.png")
	elseif sfx.charNumber == 1 then 
		jet= display.newImage("business.png")
	elseif sfx.charNumber ==2 then
		jet = display.newImage("denzel.png")
	elseif sfx.charNumber ==3 then
		jet = display.newImage("question.png")
	elseif sfx.charNumber ==4 then
		jet = display.newImage("universal.png")
	end
	jet.x = 110
	jet.y =170
	jet.xScale =.8
	jet.yScale = .8
	jet.radius =1
	jet.collided = false 
	physics.addBody (jet, "static", {density = .1, bounce=.1, friction=.2,radius=10})--"dynamic" means that gravity applies to it and can do collisions with other objects (changed to "static" because of beginning animation). radius creates the collision area (smaller in this case)
	screenGroup:insert(jet) 
	transition.to(jet, {time =1500, xScale =.09, yScale =.09, onComplete=jetReady})
	print(jet.x)
	jet.power = false
	
	twerkingGirlSpriteSheet = sprite.newSpriteSheet("twerkPowerup.png",154,187)
	twerkingGirlSprite = sprite.newSpriteSet(twerkingGirlSpriteSheet,1,8)
	sprite.add(twerkingGirlSprite, "twerker" ,1,8, 500, 0)
	twerkingGirl= sprite.newSprite(twerkingGirlSprite)
	twerkingGirl.x = 100
	twerkingGirl.y =100
	twerkingGirl.xScale = .4
	twerkingGirl.yScale = .4
	twerkingGirl.alpha =0
	twerkingGirl:prepare("twerker") --change the next lines only if needed
	twerkingGirl:play()
	screenGroup:insert(twerkingGirl)
	fireTwerkSpriteSheet = sprite.newSpriteSheet("flame.png",166,167)
	fireTwerkSprite = sprite.newSpriteSet(fireTwerkSpriteSheet,1,6)
	sprite.add(fireTwerkSprite, "twerkFire" ,1,6, 480, 0)
	fireTwerk= sprite.newSprite(fireTwerkSprite)
	fireTwerk.x = 100
	fireTwerk.y =100
	fireTwerk.xScale = 1
	fireTwerk.yScale = 1
	fireTwerk.rotation = 90
	fireTwerk.alpha =0
	-- fireTwerk:prepare("twerkFire")--change if necessary
	-- fireTwerk:play()
	screenGroup:insert(fireTwerk)
	
	allPowerupSpriteSheet = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite = sprite.newSpriteSet(allPowerupSpriteSheet, 1,6)
	sprite.add(allPowerupSprite, "allPowerups", 1,6, 1300,0)
	powerupTwerk= sprite.newSprite(allPowerupSprite)
	powerupTwerk.x =1100
	powerupTwerk.y = 40
	powerupTwerk.xScale =.8
	powerupTwerk.yScale =.8
	powerupTwerk.speed = 3.5
	powerupTwerk:prepare("allPowerups")--change everything
	powerupTwerk:play()
	screenGroup:insert (powerupTwerk)--]]
	
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
	powerupWhip= sprite.newSprite(allPowerupSprite3)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerupWhip.x =900
	powerupWhip.y = 70
	powerupWhip.xScale =.6
	powerupWhip.yScale =.6
	powerupWhip.speed = 3.5
	powerupWhip.alpha =1
	powerupWhip:prepare("allPowerups3")--change everything
	powerupWhip:play()
	screenGroup:insert (powerupWhip)
	
	
	allPowerupSpriteSheet4 = sprite.newSpriteSheet("crates.png", 53,50)
	allPowerupSprite4 = sprite.newSpriteSet(allPowerupSpriteSheet3, 1,6)
	sprite.add(allPowerupSprite4, "allPowerups4", 1,6, 1300,0)
	powerupWrecking= sprite.newSprite(allPowerupSprite4)--make sure to put at a position where it isnt activated when the counter reaches end of level
	powerupWrecking.x =1100
	powerupWrecking.y = 150
	powerupWrecking.radius = 10
	powerupWrecking.xScale =.8
	powerupWrecking.yScale =.8
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
	
	mine1= display.newImage("mine.png")--change only if needed
	mine1.x = 800
	--mine1.xScale =1.3
	mine1.y = math.random (240,360)
	mine1.speed = math.random (5,7)
	mine1.initY = mine1.y
	mine1.amp = math.random (30, 80)
	mine1.angle = math.random (1,360)
	physics.addBody (mine1, "static", {density = .1, bounce=.1, friction=.2,radius=20})
	screenGroup:insert (mine1)
	mine2= display.newImage("mine.png")
	mine2.x = 800
	mine2.y = math.random (80,280)
	mine2.speed = math.random (5,7)
	mine2.initY = mine2.y
	mine2.amp = math.random (30, 80)
	mine2.angle = math.random (1,360)
	physics.addBody (mine2, "static", {density = .1, bounce=.1, friction=.2,radius=20})
	screenGroup:insert (mine2)
	mine3= display.newImage("mine.png")
	mine3.x = 800
	mine3.y = math.random (0,120)
	mine3.speed = math.random (5,7)
	mine3.initY = mine3.y
	mine3.amp = math.random (30, 80)
	mine3.angle = math.random (1,360)
	physics.addBody (mine3, "static", {density = .1, bounce=.1, friction=.2,radius=20})
	screenGroup:insert (mine3)
	
	target= display.newImage("target.png")--change all this
	target.xScale =.5
	target.yScale =.5
	target.alpha = 0
	target.x = 100
	target.speed = 3
	target.radius = 20
	screenGroup:insert (target)
	
	wreckingBall =  display.newImage("background/wreckingBall.png")
	wreckingBall:setReferencePoint(display.TopCenterReferencePoint)
	wreckingBall.xScale =.2
	wreckingBall.yScale =.2
	wreckingBall.alpha = 0
	wreckingBall.x = 100
	wreckingBall.y =100
	
	whipTarget= display.newImage("target.png")--change
	whipTarget.xScale =.3
	whipTarget.yScale =.3
	whipTarget.alpha = 0
	whipTarget.x = 130
	whipTarget.y = 200
	screenGroup:insert (whipTarget)
	
	screenGroup:insert (wreckingBall)
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
	
	baby1 =display.newImage("baby.png")
	baby1.x = 600
	baby1.y=180
	baby1.xScale =.1
	baby1.yScale =.08
	baby2 =display.newImage("baby.png")
	baby2.x = 600
	baby2.y=30
	baby2.xScale =.1
	baby2.yScale =.08
	baby3 =display.newImage("baby.png")
	baby3.x = 600
	baby3.y=300
	baby3.xScale =.1
	baby3.yScale =.08
	screenGroup:insert(baby1)
	screenGroup:insert(baby2)
	screenGroup:insert(baby3)
	
	spreadLegs = display.newImage("spreadLegs.png")
	spreadLegs.x = 600
	spreadLegs.y=180
	spreadLegs.xScale =.5
	spreadLegs.yScale =.4
	screenGroup:insert(spreadLegs)
	
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
	
	gunfireSpriteSheet2 = sprite.newSpriteSheet("gunfire.png",41.5,238)
	gunfireSprites2 = sprite.newSpriteSet(gunfireSpriteSheet2,1,12)
	sprite.add(gunfireSprites2, "gunfire2", 1, 12, 500, 0)
	gunfire2 = sprite.newSprite(gunfireSprites2)
	gunfire2:setReferencePoint(display.TopCenterReferencePoint)
	gunfire2.x = 300
	gunfire2.y = 200
	gunfire2.alpha = 0
	gunfire2.yScale = .2
	gunfire2.xScale = .3
	gunfire2.rotation = 5
	gunfire2:prepare("gunfire2")
	gunfire2:play()
	screenGroup:insert(gunfire2)
	
	explosionSpriteSheet2 = sprite.newSpriteSheet("explosion.png", 24,23)
	explosionSprites2 = sprite.newSpriteSet(explosionSpriteSheet2, 1,8)
	sprite.add(explosionSprites2, "explosion2", 1, 8, 900, 0)
	explosion2= sprite.newSprite(explosionSprites2)
	explosion2.x = 100
	explosion2.y = 100
	explosion2.xScale = 1
	explosion2.yScale = 1
	explosion2:prepare("explosion2")
	explosion2.alpha =0
	explosion2:play()
	screenGroup:insert(explosion2)
	
	explosionSpriteSheet3 = sprite.newSpriteSheet("explosion.png", 24,23)
	explosionSprites3 = sprite.newSpriteSet(explosionSpriteSheet3, 1,8)
	sprite.add(explosionSprites3, "explosion3", 1, 8, 900, 0)
	explosion3= sprite.newSprite(explosionSprites3)
	explosion3.x = 100
	explosion3.y = 100
	explosion3.xScale = 1
	explosion3.yScale = 1
	explosion3:prepare("explosion3")
	explosion3.alpha =0
	explosion3:play()
	screenGroup:insert(explosion3)
	
	explosionSpriteSheet4 = sprite.newSpriteSheet("explosion.png", 24,23)
	explosionSprites4 = sprite.newSpriteSet(explosionSpriteSheet4, 1,8)
	sprite.add(explosionSprites4, "explosion4", 1, 8, 900, 0)
	explosion4= sprite.newSprite(explosionSprites4)
	explosion4.x = 100
	explosion4.y = 100
	explosion4.xScale = 1
	explosion4.yScale = 1
	explosion4:prepare("explosion4")
	explosion4.alpha =0
	explosion4:play()
	screenGroup:insert(explosion4)
	
sheetData = { width=192, height=192, numFrames=25, sheetContentWidth=960, sheetContentHeight=960 }
mySheet = graphics.newImageSheet( "burst.png", sheetData )
sequenceData = {start=1, count=25, time=1200, loopCount =1 }
animation = display.newSprite( mySheet, sequenceData )
animation.x = 500 
animation.y = -150
animation.alpha =0
screenGroup:insert(animation)
sheetData2 = { width=192, height=192, numFrames=25, sheetContentWidth=960, sheetContentHeight=960 }
mySheet2 = graphics.newImageSheet( "burst.png", sheetData2 )
sequenceData2 = {start=1, count=25, time=1200, loopCount =1 }
animation2 = display.newSprite( mySheet2, sequenceData2 )
animation2.x = 500 
animation2.y = 500
animation2.alpha =0
screenGroup:insert(animation2)
	gameSquare = display.newImage("gameSquare.png")
	gameSquare.x = 10
	gameSquare.yScale = .45
	gameSquare.xScale = .30
	gameSquare.y = 187
	gameSquare.rotation = 90
	gameSquare.alpha = .8
	screenGroup:insert(gameSquare)
	menuSquare = display.newImage("gameSquare.png")
	menuSquare.x = 30
	menuSquare.yScale = .2
	menuSquare.xScale = .2
	menuSquare.y = 30
	menuSquare.rotation = 90
	--menuSquare.alpha = .8
	screenGroup:insert(menuSquare)
	goBack = display.newText( "Menu", 10, 25, native.systemFont, 16)
	goBack:setTextColor( 190, 300, 300 )
	screenGroup:insert(goBack)
	menuSquare.alpha =0
	goBack.alpha =0
	
	levelSquare = display.newImage("gameSquare.png")
	levelSquare.x = 38
	levelSquare.yScale = .2
	levelSquare.xScale = .2
	levelSquare.y = 67
	levelSquare.rotation = 90
	levelSquare.alpha = .5
	screenGroup:insert(levelSquare)
	thisLevel = display.newText( "Level 6", 15, 65, native.systemFont, 14)
	thisLevel.alpha =.9
	thisLevel:setTextColor( 190, 300, 300 )
	screenGroup:insert(thisLevel)

	pauseSquare = display.newImage("gameSquare.png")
	pauseSquare.x = 30
	pauseSquare.yScale = .2
	pauseSquare.xScale = .2
	pauseSquare.y = 105
	pauseSquare.rotation = 90
	pauseSquare.alpha = .8
	screenGroup:insert(pauseSquare)

	resumeSquare = display.newImage("gameSquare.png")
	resumeSquare.x = 38
	resumeSquare.yScale = .2
	resumeSquare.xScale = .2
	resumeSquare.y = 145
	resumeSquare.rotation = 90
	resumeSquare.alpha = .1
	screenGroup:insert(resumeSquare)
	
	pause= display.newText( "Pause", 10, 100, native.systemFont, 15)
	pause:setTextColor( 190, 300, 300 )
	pause.alpha =.8
	screenGroup:insert (pause)
	
	resume= display.newText( "Resume", 15, 140, native.systemFont, 14)
	resume:setTextColor( 190, 300, 300 )
	resume.alpha =.1
	screenGroup:insert (resume)
	
machineGun = audio.loadSound("machineGun.mp3")
machineGunEnd = audio.loadSound("machineGunEnd.mp3")
explodeSound= audio.loadStream("explosionGame.mp3")
twinkle = audio.loadSound("twinkle.mp3")
wreckingSound=audio.loadStream("wreckingSound.mp3")--change
smallBang=audio.loadSound("smallBang.mp3")
punishment = audio.loadStream("punishment.mp3")
youFather = audio.loadSound("youAreTheFather.mp3")--change
whipSound = audio.loadStream("whip.mp3")
audio.setVolume(.6 ,{channel=5})
audio.setVolume(.6 ,{hannel=3})


function whole()
moveBaby = timer.performWithDelay(12500, function (aBunchOfStuff)
transition.to( baby1, { time=1800,  delay= 100, x= -150 } )
transition.to( baby2, { time=1800, delay=500, x= -150 } )
transition.to( baby3, { time=1800, delay=900, x= -150} )
end, 0)
moveLegs= timer.performWithDelay(12500, function(OtherStuff)
transition.to( spreadLegs, { time=300, x= 430 } )
transition.to( spreadLegs, { time=300, delay=400, y= 30 } )
transition.to( spreadLegs, { time=300, delay=800, y= 300} )
transition.to( spreadLegs, { time=1300, delay=1200, x= 600, y =180 } )
audio.play(youFather, {channel=9})
end, 0)
end
--timer.performWithDelay(2000, whole, 1)--change

end



function onEnterFrame( event )
     if jetEngineFiring then
      jet:applyForce (0, -1.8, jet.x, jet.y)
     end
               green.x = powerupGun.x -3
     green.y = powerupGun.y
          green.rotation = green.rotation +4
     powerupGun.rotation = powerupGun.rotation -4

    twerkingGirl.x = jet.x
    twerkingGirl.y = jet.y
	fireTwerk.x = (jet.x)
	fireTwerk.y = (jet.y -10)
	whip.x= jet.x
	whip.y=(jet.y -35)
	
	wreckingBall.x = target.x -10
	wreckingBall.y = target.y -105
	
	explosion2.x = mine1.x
	explosion2.y = mine1.y
	explosion3.x = mine2.x
	explosion3.y = mine2.y
	explosion4.x = mine3.x
	explosion4.y = mine3.y
	
	animation.x = powerupWrecking.x
	animation.y = powerupWrecking.y
	animation2.x = powerupWhip.x
	animation2.y = powerupWhip.y

	gunfire.x = (jet.x -25)
	gunfire.y = (jet.y + 5)
	gunfire2.x = (jet.x -10)
	gunfire2.y = (jet.y + 20)
	--target.y = jet.y --change
    end

--Shake ability 
local shakeCount = 0
local xShake = 6
local yShake = 3
local shakePeriod = 2

local function shake()
   if(shakeCount % shakePeriod == 0 ) then
      display.currentStage.x = display.currentStage.x0 + math.random( -xShake, xShake )
      display.currentStage.y = display.currentStage.y0 + math.random( -yShake, yShake )
   end
   shakeCount = shakeCount + 1
end

 function startShake()
   display.currentStage.x0 = display.currentStage.x
   display.currentStage.y0 = display.currentStage.y
   shakeCount = 0
   Runtime:addEventListener( "enterFrame", shake )
end

 function stopShake()
   Runtime:removeEventListener( "enterFrame", shake )
   timer.performWithDelay( 50, 
   function() 
      display.currentStage.x = display.currentStage.x0 
      display.currentStage.y = display.currentStage.y0
   end )
end 


function onCollision2 ()
		if jet.collided == false then
					startShake()
		timer.performWithDelay(1100, stopShake)
		--end
		powerupTwerk.y = -200
		jet.collided = true
		bulletVisible = false
		wreckingBallActive = false
		if whipperSeen then
		audio.stop({channel=10})
		end
		menuActive = false
		transition.to( menuSquare, { time=200, alpha=0} )
		transition.to( goBack, { time=200, alpha=0} )
		whipperSeen=false
		jet.bodyType = "static"
		audio.play(explodeSound,{channel=6})
		explode()
		whip.alpha=0
		normalAfterWhip()
		timer.cancel(tick)
		end
	end
function menuOver () ---actually not a gameover, just happens when you reach 60 distance
jetEngineFiring = false
levelBeaten = true
audio.stop()
storyboard.gotoScene("start", "fade", 200)
end
function scrollForeground6 (self, event)-- self is really just a place holder for foreground1, foreground2 etc
	if self.x < -650 then
		self.x = 505
	else self.x = self.x - self.speed
	end
	
end

function scrollBackground6 (self, event)-- self is really just a place holder for foreground1, foreground2 etc
	if self.x < -1000 then
		self.x = 2820
	else self.x = self.x - self.speed
	end
end

function movePowerup(self,event)--change for each level
	self.speed = 2.9
		if self.x < -200 then
		self.x = 2000
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


function pausePowerup (self, event)
	self.x =self.x - 0
	end

	local cant = display.newText ("CAUTION: Powerup Won't Pause (stop cheating SMH)", 150, 143, native.systemFont, 12)
	cant:setTextColor( 230, 230, 230 )
	cant.alpha =0

runMode =true
function  react (event)
		if runMode and menuActive then
		pause.alpha=.1
		pauseSquare.alpha=.1
		resume.alpha =.8
		resumeSquare.alpha=.8

if sfx.powerGunTrue == 1 then 
		powerupGun.enterFrame = pausePowerup
	end

		--powerupTwerk.enterFrame = pausePowerup
		--powerupBomb.enterFrame = pausePowerup
		powerupWhip.enterFrame = pausePowerup
		--powerupWrecking.enterFrame =pausePowerup
		background.enterFrame = pausePowerup
		background2.enterFrame = pausePowerup
		foreground1.enterFrame =pausePowerup
		foreground2.enterFrame =pausePowerup
		foreground3.enterFrame =pausePowerup
		foreground4.enterFrame =pausePowerup

		mine1.enterFrame = pausePowerup
		mine2.enterFrame = pausePowerup
		mine3.enterFrame = pausePowerup
	if wholeActive then
		timer.pause(moveBaby)
		timer.pause(moveLegs)
		transition.pause( baby1)
		transition.pause( baby2)
		transition.pause( baby3)
	end

	if syrupActive then
		timer.pause(moveCodeine)
		transition.pause(codeine)
	end
	if wreckingBallActive then 
		target.enterFrame = pausePowerup
	end

	if whipperSeen then 
	whipTarget.enterFrame = pausePowerup
	end

	timer.pause(tick)
		Runtime:removeEventListener("touch", touchScreen)
		physics.pause()
		 audio.stop(machineGunLoop)
		if twerkAttached or wreckingBallActive or whipperSeen then 
-- local result = timer.pause( twerkTime )
-- print( "Time remaining is " .. result )
cant.alpha =1
		end
    runMode = false
	end
	return true
	end 
	

	function proact (event)
		if runMode == false then
		pause.alpha=.8
		pauseSquare.alpha=.8
		resume.alpha =.1
		resumeSquare.alpha=.1
		cant.alpha =0

if sfx.powerGunTrue == 1 then 
		powerupGun.enterFrame = movePowerup
	end

		--powerupTwerk.enterFrame = movePowerup
		--powerupBomb.enterFrame = movePowerup
		powerupWhip.enterFrame = movePowerup
		--powerupWrecking.enterFrame =movePowerup
	if wreckingBallActive then
		target.enterFrame = moveWrecking
	end
	if wholeActive then
		timer.resume(moveBaby)
		timer.resume(moveLegs)
	end
if syrupActive then
		timer.resume(moveCodeine)	
	end
		transition.resume()
	if whipperSeen then 
	whipTarget.enterFrame = moveWhipCrack
	end
		mine1.enterFrame = moveMine1
		mine2.enterFrame = moveMine2
		mine3.enterFrame = moveMine3
		background.enterFrame = scrollBackground6
		background2.enterFrame = scrollBackground6
		foreground1.enterFrame =scrollForeground6
		foreground2.enterFrame =scrollForeground6
		foreground3.enterFrame =scrollForeground6
		foreground4.enterFrame =scrollForeground6
		timer.resume(tick)
		Runtime:addEventListener("touch", touchScreen)
		physics.start()
		runMode = true
		end
		return true
	end


function moveWhipCrack (self, event)-- self is really just a place holder for foreground1, foreground2 etc
	if self.x > 180 then	 
	 self.x =1
	 if whipperSeen then
	 whipTarget.alpha =1
	 loopWhipSound=timer.performWithDelay(300, function (whipWork)
	 if whipperSeen then 
	 audio.play(whipSound, {channel=11}) 
	 end 
	 end,1)
	 end
	else self.x = self.x +4.8
	self.y = jet.y-35
	end
end

function moveMine1 (self, event)-- change so that that it actually more dangerous
	if mine1Active then
	if self.x < -50 then
			self.x = 800--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (-10,350)
			self.speed = math.random (5,7)
			self.amp = math.random (30, 90)
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
	self.x =700
	end, 1)
	end
end

function moveMine2 (self, event)-- change so that that it actually more dangerous
	if mine2Active then
	if self.x < -50 then
			self.x = 1000--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (-10,350)
			self.speed = math.random (5,7)
			self.amp = math.random (30, 90)
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
	self.x =700
	end, 1)
	end
end

function moveMine3 (self, event)-- change so that that it actually more dangerous
	if mine3Active then
	if self.x < -50 then
			self.x = 1200--these next six lines copy from the mine variable and make it random everytime it reappears 
			self.y = math.random (-10,350)
			self.speed = math.random (5,7)
			self.amp = math.random (30, 90)
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
	self.x =700
	end, 1)
	end
end

function moveMissle (self, event)--change for each level
	if self.x > 510 then
		self.y = jet.y
	 --self.x = 390
	 self.x =100 
	else self.x = self.x +5
	end
end
shootingGunActive = false
function gunAbility (event)--change and add stuff
	if (hasCollidedCircle(powerupGun, jet)) then
	shootingGunActive = true
	audio.play(twinkle,{ channel=5})
	missle1.alpha = 1
	missle2.alpha = 1
	--shootingGun.alpha =1
	powerupGun.alpha =0
	green.alpha =0
	end
	if (shootingGunActive and  (hasCollidedCircle(mine1, missle1) or (hasCollidedCircle(mine1, missle2))) ) then
	mine1.alpha=0
	explosion2.alpha =1
	mine1Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine1Visible, 1)
	timer.performWithDelay(800, function (explosionGone1)
	explosion2.alpha = 0
	end, 1)
	end
	if (shootingGunActive and  (hasCollidedCircle(mine2, missle1) or (hasCollidedCircle(mine2, missle2))) ) then	
		mine2.alpha=0
	explosion3.alpha = 1
	mine2Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine2Visible, 1)
	timer.performWithDelay(800, function (explosionGone2)
	explosion3.alpha = 0
end, 1)
	end
	if (shootingGunActive and  (hasCollidedCircle(mine3, missle1) or (hasCollidedCircle(mine3, missle2))) ) then
	mine3.alpha=0
	explosion4.alpha =1
	mine3Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine3Visible, 1)
	timer.performWithDelay(800, function (explosionGone3)
	explosion4.alpha = 0
end, 1)
	end
if wholeActive then 
	if (shootingGunActive and  (hasCollidedCircle(baby1, missle1) or (hasCollidedCircle(baby1, missle2))) ) then
	baby1.alpha=.3
	baby1Active = false
	timer.performWithDelay(5000, baby1Visible, 1)
	end
	if (shootingGunActive and  (hasCollidedCircle(baby2, missle1) or (hasCollidedCircle(baby2, missle2))) ) then
	baby2.alpha=.3
	baby2Active = false
	timer.performWithDelay(5000, baby2Visible, 1)
	end
	if (shootingGunActive and  (hasCollidedCircle(baby3, missle1) or (hasCollidedCircle(baby3, missle2))) ) then
	baby3.alpha=.3
	baby3Active = false
	timer.performWithDelay(5000, baby3Visible, 1)
	end
end
if syrupActive then 
	 if (shootingGunActive and  (hasCollidedCircle(codeine, missle1) or (hasCollidedCircle(codeine, missle2))) ) then
	 codeine.alpha=.3
	 codeineActive = false
	 timer.performWithDelay(3000, codeineVisible, 1)
	end
	end
	if liqActive then
	if (shootingGunActive and  (hasCollidedCircle(rum, missle1) or (hasCollidedCircle(rum, missle2))) ) then
	rum.alpha=.3
	drunkActive = false
	timer.performWithDelay(3000, drunkVisible, 1)
end
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
function menuTouch (event)
if menuActive then 
if event.phase == "ended" then 
if menuActive then
timer.cancel(tick) 
end
timer.cancel(startStopWatch)
levelBeaten = true
audio.stop()

if wholeActive then
timer.cancel(moveBaby)--change
timer.cancel(moveLegs)--change
end
if syrupActive then
timer.cancel(moveCodeine)--change
end
if callActive then
timer.cancel(moveRadio)
timer.cancel(moveMan)
timer.cancel(pulse)
end
if fartActive then
timer.cancel(moveCreep)
timer.cancel(moveGas)
end
if liqActive then
timer.cancel(moveRum)
end
counterGone = true
timer.performWithDelay(100, menuOver, 1)
end
end
return true
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

normalSpeed =true
drunkSpeed =false
mine1Active = true
mine2Active = true
mine3Active = true
baby1Active=true
baby2Active=true
baby3Active=true
jetEngineAttached = true	
twerkFiring = false
jetEngineFiring = false
whipperSeen = false
twerkAttached = false

function crash(event)
if jetEngineAttached then
if twerkAttached ==false then
if mine1Active then
if (hasCollidedCircle(mine1, jet)) then
onCollision2()
-- timer.cancel(moveBaby)--change
-- timer.cancel(moveLegs)--change
end
end
if mine2Active then
if (hasCollidedCircle(mine2, jet)) then
onCollision2()
-- timer.cancel(moveBaby)
-- timer.cancel(moveLegs)
end
end
if mine3Active then
if (hasCollidedCircle(mine3, jet)) then
onCollision2()
-- timer.cancel(moveBaby)
-- timer.cancel(moveLegs)
end
end

if baby1Active then
if (hasCollidedCircle(baby1, jet)) then
onCollision2()
-- timer.cancel(moveBaby)
-- timer.cancel(moveLegs)
end
end
if baby2Active then
if (hasCollidedCircle(baby2, jet)) then
onCollision2()
-- timer.cancel(moveBaby)
-- timer.cancel(moveLegs)
end
end

if baby3Active then
if (hasCollidedCircle(baby3, jet)) then
onCollision2()
-- timer.cancel(moveBaby)
-- timer.cancel(moveLegs)
end
end
end

end
end
 
function normal()
	audio.resume(sfx.beAll)
	audio.setVolume( .7, { channel=1} )
	powerupAttached = false
	twerkAttached = false
	jetEngineAttached = true
	jet.alpha= 1
	twerkingGirl.alpha =0
	fireTwerk.alpha =0
	powerupTwerk.alpha = 1
	powerupWrecking.alpha =1
	--jet.bodyType = "dynamic--MAYBE change
	twerkFiring= false
	jetEngineFiring=false
	physics.setGravity(0,12)
	normalSpeed = true
	drunkSpeed =false
	powerup2.isVisible=true
	drunkBox.alpha =1
	-- transition.to(foreground3, { time=1600, delay=0, xScale =.4, yScale=.4, rotation = 0} )--change the xscale depending on lvl
	-- transition.to(foreground4, { time=1600, delay=0, xScale =.4, yScale=.4, rotation = 0} )--change the yscale depending on lvl
end

function normal2()
	normalSpeed = true
	drunkSpeed =false
	powerup2.isVisible=true
	drunkBox.alpha =1
	transition.to(foreground3, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the xscale
	transition.to(foreground4, { time=1600, delay=0, xScale =1.4, yScale=1, rotation = 0} )--change the yscale
end

function normalAfterWhip()
	whipperSeen = false 
	whipTarget.alpha =0
	powerupWhip.alpha=1
	jet.alpha= 1
	powerupAttached = false
	whip.alpha =0
	jet.alpha=1
end



function ukauka(event)
	if (jet and hasCollidedCircle(powerupTwerk, jet)) then
	powerupAttached = true
	animation2.alpha =1
	animation2:play()
	audio.play(twinkle,{ channel=5})
	audio.fade( { channel=1, time=500, volume=0 } )
	
	fireSong=audio.loadStream("assOnFire2.mp3")
	audio.play(fireSong, {channel=2})
	--REMEMBER TO DISPOSE ALL AUDIO WHEN CHANGING TO ANOTHER LEVEL
	twerkAttached = true
	jet.alpha= 0
	twerkingGirl.alpha =1
	fireTwerk.alpha =.35
	powerupTwerk.alpha =0

	timer.performWithDelay(8000, normal, 1)
	timer.performWithDelay(7100, function(something) 
	audio.fadeOut({channel =2, time=700}) end, 
1)
	audio.setVolume( 1, { channel=2 } )
end
end

whipperSeen = false
function whippingWoman (event)--change and add stuff
	if (hasCollidedCircle(powerupWhip, jet)) then
	powerupAttached =true
	whipperSeen = true
	--whipTarget.alpha =1
	audio.play(twinkle,{ channel=5})
	audio.fade( { channel=1, time=500, volume=.3 } )
	audio.play(punishment, {channel=10})
	timer.performWithDelay(2000, function(something) 
	audio.fade({channel =1, time=500, volume=1}) end, 
	1)
	whip.alpha =1
	jet.alpha=0
	powerupWhip.alpha =0
	animation2.alpha =1
	animation2:play()
	timer.performWithDelay(9000, normalAfterWhip, 
	1)
	end
	
	if (whipperSeen and  (hasCollidedCircle(mine1, whipTarget))) then
	mine1.alpha=0
	explosion2.alpha =1
	mine1Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine1Visible, 1)
	timer.performWithDelay(800, function (explosionGone1)
	explosion2.alpha = 0
	end, 1)
	end
	if (whipperSeen and  (hasCollidedCircle(mine2, whipTarget))) then
	mine2.alpha=0
	explosion3.alpha = 1
	mine2Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine2Visible, 1)
	timer.performWithDelay(800, function (explosionGone2)
	explosion3.alpha = 0
end, 1)
	end
	if (whipperSeen and  (hasCollidedCircle(mine3, whipTarget))) then
	mine3.alpha=0
	explosion4.alpha =1
	mine3Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine3Visible, 1)
	timer.performWithDelay(800, function (explosionGone3)
	explosion4.alpha = 0
end, 1)
	end
	
	if (whipperSeen and  (hasCollidedCircle(baby1, whipTarget))) then
	baby1.alpha=.3
	baby1Active = false
	timer.performWithDelay(5000, baby1Visible, 1)
	end
	if (whipperSeen and  (hasCollidedCircle(baby2, whipTarget))) then
	baby2.alpha=.3
	baby2Active = false
	timer.performWithDelay(5000, baby2Visible, 1)
	end
	if (whipperSeen and  (hasCollidedCircle(baby3, whipTarget))) then
	baby3.alpha=.3
	baby3Active = false
	timer.performWithDelay(5000, baby3Visible, 1)
	end
end



function akuaku (event)
	if (jet and hasCollidedCircle(powerup2, jet)) then
	powerup2.isVisible=false
	normalSpeed =false
	number = number + 8
	transition.to(jet, { time=300, delay=2, xScale =.35, yScale=.8, rotation = 90})
	timer.performWithDelay(5000, normal2, 1)	
end
return true
end

-- function drunk (event)
	-- if (hasCollidedCircle(drunkBox, jet)) then
	-- drunkBox.alpha =0
	-- normalSpeed =false
	-- drunkSpeed = true
	-- number = number + .5
	-- transition.to(foreground3, { time=1600, delay=4, xScale =1.4, yScale=1.2, rotation = 5} )--change the next for lines to look better and to make
	-- transition.to(foreground4, { time=1600, delay=4, xScale =1.5, yScale=1.2, rotation = -5} )--normal state proper. might actually want to delete last 
	-- transition.to(foreground3, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = -5} )
	-- transition.to(foreground4, { time=1600, delay=2000, xScale =1.5, yScale=1.2, rotation = 5} )
	-- timer.performWithDelay(5000, normal2, 1)
	-- end	
-- end

function teleportBaby(self,event)
if self.x < -149 then
self.x = 600
end
end

function mine1Visible (event)
mine1.alpha =1
mine1Active = true
end
function mine2Visible (event)
mine2.alpha =1
mine2Active = true
end
function mine3Visible (event)
mine3.alpha =1
mine3Active = true
end

function baby1Visible (event)
baby1.alpha =1
baby1Active = true
end
function baby2Visible (event)
baby2.alpha =1
baby2Active = true
end
function baby3Visible (event)
baby3.alpha =1
baby3Active = true
end

wreckingBallActive = false
function swingingWreckingBall (event)--change and add stuff
	if (hasCollidedCircle(powerupWrecking, jet)) then
	wreckingBallActive = true
	audio.play(twinkle,{ channel=5})
	audio.fade( { channel=1, time=500, volume=.3 } )
	audio.play(wreckingSound, {channel=8})
	timer.performWithDelay(3000, function(something) 
	audio.fade({channel =1, time=500, volume=.7}) end, 
	1)
	wreckingBall.alpha =1
	powerupWrecking.alpha =0
	animation.alpha =1
	animation:play()
	timer.performWithDelay(10000, function(something) 
	wreckingBallActive =false
	wreckingBall.alpha =0
	powerupWrecking.alpha =1
	end, 
	1)
	end
	
	if (wreckingBallActive and  (hasCollidedCircle(mine1, target))) then
	mine1.alpha=0
	explosion2.alpha =1
	mine1Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine1Visible, 1)
	timer.performWithDelay(800, function (explosionGone1)
	explosion2.alpha = 0
	end, 1)
	end
	if (wreckingBallActive and  (hasCollidedCircle(mine2, target))) then
	mine2.alpha=0
	explosion3.alpha = 1
	mine2Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine2Visible, 1)
	timer.performWithDelay(800, function (explosionGone2)
	explosion3.alpha = 0
end, 1)
	end
	if (wreckingBallActive and  (hasCollidedCircle(mine3, target))) then
	mine3.alpha=0
	explosion4.alpha =1
	mine3Active = false
	audio.play(smallBang,{ channel=7})
	timer.performWithDelay(5000, mine3Visible, 1)
	timer.performWithDelay(800, function (explosionGone3)
	explosion4.alpha = 0
end, 1)
	end
	
	if (wreckingBallActive and  (hasCollidedCircle(baby1, target))) then
	baby1.alpha=.3
	baby1Active = false
	timer.performWithDelay(5000, baby1Visible, 1)
	end
	if (wreckingBallActive and  (hasCollidedCircle(baby2, target))) then
	baby2.alpha=.3
	baby2Active = false
	timer.performWithDelay(5000, baby2Visible, 1)
	end
	if (wreckingBallActive and  (hasCollidedCircle(baby3, target))) then
	baby3.alpha=.3
	baby3Active = false
	timer.performWithDelay(5000, baby3Visible, 1)
	end
end

	bulletVisible =false
function jetReady ()
	bulletVisible = true
	jet.bodyType = "dynamic"
end

	powerupAttached = false
    function touchScreen (event)
	if jetEngineAttached == true then
     if event.phase == "began" then
      jetEngineFiring = true
	  if powerupAttached == false then 
	  if normalSpeed then
	  if bulletVisible then
	  machineGunLoop=audio.play(machineGun, {channel=3, loops=-1})
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
	  end
     elseif event.phase == "ended" or event.phase == "cancelled" then
      jetEngineFiring = false
	  audio.stop(machineGunLoop)
	  if powerupAttached == false then 
	  audio.play(machineGunEnd, {channel=4})
	  end
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
	
function playCutscene (event) 
media.playVideo( "firstMovie.mp4", true, gameOver2)
end

function gameOver()
	if counterGone == false then
	storyboard.gotoScene("restart", "fade", 200)-- DONT do a restart for every level instead use a global int var, probably sfx, and set a int at the beginning of every level. do if else clause in "restart" that says go to x level if sfx.x = int x
	end
	normal()
end

function gameOver2 () ---actually not a gameover, just happens when you reach 60 distance
jetEngineFiring = false
levelBeaten = true
audio.stop()
-- audio.dispose(sfx.fastRing)
-- audio.dispose(fireSong)
-- audio.dispose(machineGun)
-- audio.dispose(machineGunEnd)
-- audio.dispose(explodeSound)
-- audio.dispose(twinkle)
-- audio.dispose(wreckingSound)
-- audio.dispose(smallBang)
-- audio.dispose(youFather)
storyboard.gotoScene("start", "fade", 200)
sfx.currentLevel=7--change
if sfx.currentLevel > sfx.highestLevel then 
sfx.highestLevel = sfx.currentLevel
score.set(sfx.highestLevel)
score.save()
end
end

function explode ()
explosion.x =jet.x
explosion.y =jet.y
explosion.isVisible = true
explosion:play()
jet.isVisible = false
gunfire.isVisible = false
gunfire2.isVisible = false
timer.performWithDelay(1200, gameOver, 1)
end

--[[
function mollySpeed --change. investigate if this works properly 
	foreground1.enterFrame = scrollForeground62
	Runtime:addEventListener("enterFrame", foreground1)
	foreground2.enterFrame = scrollForeground62
	Runtime:addEventListener("enterFrame", foreground2)
	foreground3.enterFrame = scrollForeground62
	Runtime:addEventListener("enterFrame", foreground3)
	foreground4.enterFrame = scrollForeground62
	Runtime:addEventListener("enterFrame", foreground4)
end --]]


function scene:enterScene(event) 
			if sfx.powerGunTrue == 1 then 
				missle1.enterFrame = moveMissle
	Runtime:addEventListener("enterFrame", missle1)
		missle2.enterFrame = moveMissle
	Runtime:addEventListener("enterFrame", missle2)
	powerupGun.enterFrame = movePowerup
	Runtime:addEventListener("enterFrame", powerupGun)
	Runtime:addEventListener("enterFrame", gunAbility)
	end
storyboard.purgeScene("restart")
sfx.currentLevel =6--change

sfx.beAll=audio.loadStream("beAll.mp3")--change
audio.setVolume( .7, { channel=1} )	
	function firstPlay()
    sfx.beAllPlay=audio.play(sfx.beAll, {channel=1, onComplete = function() --change twice
									  if levelBeaten == false then
									  secondPlay()
									  end
                                      end})

	end					
	
	function secondPlay() 
	sfx.beAllPlay=audio.play(sfx.beAll, {channel= 1, onComplete = function()--change twice
									  if levelBeaten == false then
									  firstPlay()
									  end
									  end})
	end
	firstPlay()							


	background.enterFrame = scrollBackground6 --change
	Runtime:addEventListener("enterFrame", background)
	background2.enterFrame = scrollBackground6 --change
	Runtime:addEventListener("enterFrame", background2)
	foreground1.enterFrame = scrollForeground6 --enterframe frame  "hey do this (scrollForeground6) thirty times every second
	Runtime:addEventListener("enterFrame", foreground1)
	foreground2.enterFrame = scrollForeground6 
	Runtime:addEventListener("enterFrame", foreground2)
	foreground3.enterFrame = scrollForeground6 
	Runtime:addEventListener("enterFrame", foreground3)
	foreground4.enterFrame = scrollForeground6 
	Runtime:addEventListener("enterFrame", foreground4)

	mine1.enterFrame = moveMine1 --change. only do if necessary
	Runtime:addEventListener("enterFrame", mine1)
	mine2.enterFrame = moveMine2
	Runtime:addEventListener("enterFrame", mine2)
	mine3.enterFrame = moveMine3
	Runtime:addEventListener("enterFrame", mine3)
	target.enterFrame = moveWrecking
	Runtime:addEventListener("enterFrame", target)
	
	baby1.enterFrame =teleportBaby
	Runtime:addEventListener ("enterFrame", baby1)
	baby2.enterFrame =teleportBaby
	Runtime:addEventListener ("enterFrame", baby2)
	baby3.enterFrame =teleportBaby
	Runtime:addEventListener ("enterFrame", baby3)
	whipTarget.enterFrame = moveWhipCrack
	Runtime:addEventListener("enterFrame", whipTarget)
	-- blackBomb.enterFrame = moveFartBomb
	-- Runtime:addEventListener("enterFrame", blackBomb)
	--powerupTwerk.enterFrame = movePowerup
	Runtime:addEventListener("enterFrame", powerupTwerk)
	--powerup2.enterFrame = movePowerup
	-- Runtime:addEventListener("enterFrame", powerup2)
	-- drunkBox.enterFrame = movePowerup
	-- Runtime:addEventListener("enterFrame", drunkBox)
	--powerupWrecking.enterFrame = movePowerup --change
	Runtime:addEventListener("enterFrame", powerupWrecking)
	powerupWhip.enterFrame = movePowerup
	Runtime:addEventListener("enterFrame", powerupWhip)
	animation.enterFrame = movePowerup
	Runtime:addEventListener("enterFrame", animation)
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
	Runtime:addEventListener("enterFrame", ukauka) --change next lines. add what is necessary
	--Runtime:addEventListener("enterFrame", akuaku)
	Runtime:addEventListener("enterFrame", swingingWreckingBall)
	Runtime:addEventListener("enterFrame", crash)
	-- Runtime:addEventListener("enterFrame",drunk)
	Runtime:addEventListener("enterFrame", whippingWoman)
    Runtime:addEventListener("enterFrame", onEnterFrame)
	Runtime:addEventListener("touch", touchScreen)
	menuSquare:addEventListener("touch", menuTouch)
	pauseSquare:addEventListener("touch", react)
	pause:addEventListener("touch", react)
	resumeSquare:addEventListener("touch", proact)
	resume:addEventListener("touch",proact)
end

function scene:exitScene(event) 
	menuSquare:removeEventListener("touch", menuTouch)

		if sfx.powerGunTrue == 1 then --change later
			Runtime:removeEventListener("enterFrame", missle1)
	Runtime:removeEventListener("enterFrame", missle2)
	Runtime:removeEventListener("enterFrame", powerupGun)
	Runtime:removeEventListener("enterFrame", gunAbility)
	end

	Runtime:removeEventListener("enterFrame", background)
	Runtime:removeEventListener("enterFrame", background2)
	Runtime:removeEventListener("enterFrame", foreground1) 
	Runtime:removeEventListener("enterFrame", foreground2)
	Runtime:removeEventListener("enterFrame", foreground3)
	Runtime:removeEventListener("enterFrame", foreground4)
	Runtime:removeEventListener("enterFrame", mine1)
	Runtime:removeEventListener("enterFrame", mine2)
	Runtime:removeEventListener("enterFrame", mine3)
	Runtime:removeEventListener("enterFrame", target)
	Runtime:removeEventListener("enterFrame", powerupTwerk)
	Runtime:removeEventListener("enterFrame", powerupWrecking)
	Runtime:removeEventListener("enterFrame", animation)
	Runtime:removeEventListener("enterFrame", bullet1)
	Runtime:removeEventListener("enterFrame", bullet2)
	Runtime:removeEventListener("enterFrame", bullet3)
	Runtime:removeEventListener("enterFrame", bullet4)
	Runtime:removeEventListener("enterFrame", bullet5)
	Runtime:removeEventListener("enterFrame", bullet6)
	Runtime:removeEventListener("enterFrame", jet)
	Runtime:removeEventListener("enterFrame", ukauka) 
	Runtime:removeEventListener("enterFrame", swingingWreckingBall)
	Runtime:removeEventListener("enterFrame", whippingWoman)
	Runtime:removeEventListener("enterFrame", whipTarget)
	Runtime:removeEventListener("enterFrame", crash)
	Runtime:removeEventListener("enterFrame", baby1)
	Runtime:removeEventListener("enterFrame", baby2)
	Runtime:removeEventListener("enterFrame", baby3)
    Runtime:removeEventListener("enterFrame", onEnterFrame)
	Runtime:removeEventListener("touch", touchScreen)
	pauseSquare:removeEventListener("touch", react)
	pauseSquare:removeEventListener("touch", react)
	resumeSquare:removeEventListener("touch", proact)
	resume:removeEventListener("touch",proact)
end

function scene:destroyScene(event) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene