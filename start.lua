
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

sfx = require( "sfx" )

sfx.soundtrack = nil


charActiveScore = require ("score7")
adsScore = require ("score6")
characterScore = require ("score5")
gunScore = require ("score4")
achieveScore = require("score2")
score = require( "score" )
shaker = require("shake")

 sfx.levelText = score.init({
	fontSize = 30,
	font = "Helvetica",
	x = 415,
	y = -63,
	maxDigits = 7,
	leadingZeros = false,
	filename = "levelplay.txt",
	})
	sfx.levelText:setTextColor (190, 300, 304)



	sfx.levelTextAch = achieveScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 375,
	y = -43,
	maxDigits = 7,
	leadingZeros = false,
	filename = "acheive.txt",
	})
	sfx.levelTextAch:setFillColor (90, 300, 04)


		sfx.powerGunScoreText = gunScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 375,
	y = -60,
	maxDigits = 7,
	leadingZeros = false,
	filename = "powerGun.txt",
	})
	sfx.powerGunScoreText:setFillColor (90, 300, 04)

		sfx.charScoreText = characterScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 375,
	y = -80,
	maxDigits = 7,
	leadingZeros = false,
	filename = "character.txt",
	})
	sfx.charScoreText:setFillColor (90, 300, 04)

			sfx.adsText = adsScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 275,
	y = -40,
	maxDigits = 7,
	leadingZeros = false,
	filename = "ads.txt",
	})
	sfx.adsText:setFillColor (90, 300, 04)

				sfx.charActText = charActiveScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 275,
	y = -100,
	maxDigits = 7,
	leadingZeros = false,
	filename = "charActivate.txt",
	})
	sfx.charActText:setFillColor (90, 300, 04)

	
	
function loader (event)
		loadedScore = score.load()
		if loadedScore then
			score.set(loadedScore)
		end--]]
		sfx.highestLevel = loadedScore


		loadedGunScore = gunScore.load()
	  if loadedGunScore then 
	  	sfx.powerGunTrue = loadedGunScore
	  end
		
		
		if sfx.powerGunTrue == nil then 
			sfx.powerGunTrue =0 
			gunScore.set (sfx.powerGunTrue)
			gunScore.save()
		end


	loadCharScore = characterScore.load()
	  if loadCharScore then 
	  	characterScore.set(loadCharScore)
	  	sfx.charNumber = loadCharScore
	  end
		
		if characterScore.load() == nil then 
			sfx.charNumber =0 --change later
			characterScore.set (sfx.charNumber)
			characterScore.save()
		end


			loadAdsScore = adsScore.load()
	  if loadAdsScore then 
	  	adsScore.set(loadAdsScore)
	  	sfx.freeShowAds = loadAdsScore
	  end
		
		if adsScore.load() == nil then 
			sfx.freeShowAds =1
			adsScore.set (sfx.freeShowAds)
			adsScore.save()
		end

					charPickerScore = charActiveScore.load()
	  if charPickerScore then 
	  	charActiveScore.set(charPickerScore)
	  	sfx.charFinalBool = charPickerScore
	  end
		
		if charActiveScore.load() == nil then 
			sfx.charFinalBool =0
			charActiveScore.set (sfx.charFinalBool)
			charActiveScore.save()
		end




end
loader()

function audioGone()

end
audioGone()

	if sfx.socialBool == nil then 
	sfx.socialBool = 0
	end
		if 
		sfx.highestLevel == nil then
		sfx.highestLevel = 1
		end

function clearer (event) 
-- if event.phase == "ended" then

-- 		newScore=1
-- 		sfx.highestLevel =1
-- 		achieveScore.set(newScore)
-- 		achieveScore.save()
-- 		score.set(sfx.highestLevel)
-- 		score.save()
-- 		end
-- 		return true
end

local widget = require( "widget" )


-- ScrollView listener
local function scrollListener( event )

    local myPhase = event.phase
    
    return true
end

-- Create the widget

 myScrollView = widget.newScrollView
{
    top = 0,
    left = -120,
    width = 720,
    height = display.contentHeight,
    listener = scrollListener,
	horizontalScrollDisabled =true,
	backgroundColor = { 0, 0,0},
	friction =.6
}

--background city scape
function scene:createScene(event) 
	 local screenGroup = self.view -- screengroup is just a var, self.view is what actually creates the screengroup
	
	progressionActive =true
	

	happy = audio.loadStream("happy.mp3")
	audio.setVolume( .2, { channel=19})
	bonuses= display.newRoundedRect( 155,120, 155, 30, 5 )
	bonuses:setFillColor( 0,0,0 )
	level1= display.newRoundedRect( 25, 170, 50, 50, 5 )
	level1:setFillColor( 100,0,200 )
	level2= display.newRoundedRect( 85, 170, 50, 50, 5 )
	level2:setFillColor (100,200,0)
	level3= display.newRoundedRect( 145, 170, 50, 50, 5 )
	level3:setFillColor (100,100,0)
	level4= display.newRoundedRect( 205, 170, 50, 50, 5 )
	level4:setFillColor (100,200,170)
	level5= display.newRoundedRect( 265, 170, 50, 50, 5 )
	level5:setFillColor (100,100,190)
	level6= display.newRoundedRect( 325, 170, 50, 50, 5 )
	level6:setFillColor (200,100,190)
	level7= display.newRoundedRect( 385, 170, 50, 50, 5 )
	level7:setFillColor (20,150,190)
	level8= display.newRoundedRect( 25, 230, 50, 50, 5 )
	level8:setFillColor (20,50,90)
	level9= display.newRoundedRect( 85, 230, 50, 50, 5 )
	level9:setFillColor (120,150,190)
	level10= display.newRoundedRect( 145, 230, 50, 50, 5 )
	level10:setFillColor (102,10,19)
	level11= display.newRoundedRect( 205, 230, 50, 50, 5 )
	level11:setFillColor (202,110,119)
	level12= display.newRoundedRect( 265, 230, 50, 50, 5 )
	level12:setFillColor (202,10,19)
	level13= display.newRoundedRect( 325, 230, 50, 50, 5 )
	level13:setFillColor (52,50,159)
	level14= display.newRoundedRect( 385, 230, 50, 50, 5 )
	level14:setFillColor (152,50,159)
	level15= display.newRoundedRect( 25, 290, 50, 50, 5 )
	level15:setFillColor (52,1,159)
	level16= display.newRoundedRect( 85, 290, 50, 50, 5 )
	level16:setFillColor (252,201,59)
	level17= display.newRoundedRect( 145, 290, 50, 50, 5 )
	level17:setFillColor (1,201,59)
	level18= display.newRoundedRect( 205, 290, 50, 50, 5 )
	level18:setFillColor (1,21,59)
	level19= display.newRoundedRect( 265, 290, 50, 50, 5 )
	level19:setFillColor (1,201,179)
	level20= display.newRoundedRect( 325, 290, 50, 50, 5 )
	level20:setFillColor (72,21,59)
	level21= display.newRoundedRect( 385, 290, 50, 50, 5 )
	level21:setFillColor (120,233,255)
	level22= display.newRoundedRect( 25, 350, 50, 50, 5 )
	level22:setFillColor (0,40,41)
	level23= display.newRoundedRect( 85, 350, 50, 50, 5 )
	level23:setFillColor (81,80,0)
	level24= display.newRoundedRect( 145, 350, 50, 50, 5 )
	level24:setFillColor (0,121,119)
	level25= display.newRoundedRect( 205, 350, 50, 50, 5 )
	level25:setFillColor (160,11,0)
	level26= display.newRoundedRect( 265, 350, 50, 50, 5 )
	level26:setFillColor (201,201,199)
	level27= display.newRoundedRect( 325, 350, 50, 50, 5 )
	level27:setFillColor (1,120,240)
	level28= display.newRoundedRect( 385, 350, 50, 50, 5 )
	level28:setFillColor (295,120, 0)
	level29= display.newRoundedRect( 25, 410, 50, 50, 5 )
	level29:setFillColor (249,135, 14)
	level30= display.newRoundedRect( 85, 410, 50, 50, 5 )
	level30:setFillColor (40,120, 99)
	level31= display.newRoundedRect( 145, 410, 50, 50, 5 )
	level31:setFillColor (240,135, 99)
	level32= display.newRoundedRect( 205, 410, 50, 50, 5 )
	level32:setFillColor (120,120, 44)
	level33= display.newRoundedRect( 265, 410, 50, 50, 5 )
	level33:setFillColor (140,20, 44)
	level34= display.newRoundedRect( 325, 410, 50, 50, 5 )
	level34:setFillColor (0,191, 229)
	level35= display.newRoundedRect( 385, 410, 50, 50, 5 )
	level35:setFillColor (240,220, 44)
	level36= display.newRoundedRect( 25, 470, 50, 50, 5 )
	level36:setFillColor (20, 40, 134)
	level37= display.newRoundedRect( 85, 470, 50, 50, 5 )
	level37:setFillColor (56,245, 231)
	level38= display.newRoundedRect( 145, 470, 50, 50, 5 )
	level38:setFillColor (40,245, 112)
	level39= display.newRoundedRect( 205, 470, 50, 50, 5 )
	level39:setFillColor (90,70, 94)
	level40= display.newRoundedRect( 265, 470, 50, 50, 5 )
	level40:setFillColor (19,196, 208)
	level41= display.newRoundedRect( 325, 470, 50, 50, 5 )
	level41:setFillColor (240,120, 44)
	level42= display.newRoundedRect( 385, 470, 50, 50, 5 )
	level42:setFillColor (44,77, 168)
	level43= display.newRoundedRect( 25, 530, 50, 50, 5 )
	level43:setFillColor (88,203, 39)
	level44= display.newRoundedRect( 85, 530, 50, 50, 5 )
	level44:setFillColor (213,153, 250)
	level45= display.newRoundedRect( 145, 530, 50, 50, 5 )
	level45:setFillColor (167,47, 19)
	level46= display.newRoundedRect( 205, 530, 50, 50, 5 )
	level46:setFillColor (15,212, 247)
	level47= display.newRoundedRect( 265, 530, 50, 50, 5 )
	level47:setFillColor (128,88, 56)
	level48= display.newRoundedRect( 325, 530, 50, 50, 5 )
	level48:setFillColor (7,203, 225)
	level49= display.newRoundedRect( 385, 530, 50, 50, 5 )
	level49:setFillColor (99,117, 167)	
	level50= display.newRoundedRect( 25, 590, 410, 50, 5 )
	level50:setFillColor (10,10, 10)
	about= display.newRoundedRect( 185, 650, 100, 50, 5 )
	about:setFillColor (40, 40, 40)


		changingText = display.newText( "--", 451, 70, native.systemFont, 23)
		changingText:setTextColor( 190, 300, 300 )
		bonusesText =display.newText( "Bonuses and Shopping", 170,126, native.systemFont, 12)
		myText1 = display.newText( "Level 1", 27,190, native.systemFont, 12)
		myText2= display.newText("Level 2", 87, 190, native.systemFont, 12)
		myText3= display.newText("Level 3", 147, 190, native.systemFont, 12)
		myText4= display.newText("Level 4", 207, 190, native.systemFont, 12)
		myText5= display.newText("Level 5", 267, 190, native.systemFont, 12)
		myText6= display.newText("Level 6", 327, 190, native.systemFont, 12)
		myText7= display.newText("Level 7", 387, 190, native.systemFont, 12)
		myText8= display.newText( "Level 8", 27, 250, native.systemFont, 12)
		myText9= display.newText("Level 9", 87, 250, native.systemFont, 12)
		myText10=display.newText("Level 10",147, 250, native.systemFont, 12)
		myText11=display.newText("Level 11",207, 250, native.systemFont, 12)
		myText12=display.newText("Level 12",267, 250, native.systemFont, 12)
		myText13=display.newText("Level 13",327, 250, native.systemFont, 12)
		myText14=display.newText("Level 14",387, 250, native.systemFont, 12)
		myText15=display.newText("Level 15", 27, 310, native.systemFont, 12)
		myText16=display.newText("Level 16",87, 310, native.systemFont, 12)
		myText17=display.newText("Level 17",147, 310, native.systemFont, 12)
		myText18=display.newText("Level 18",207, 310, native.systemFont, 12)
		myText19=display.newText("Level 19",267, 310, native.systemFont, 12)
		myText20=display.newText("Level 20",327, 310, native.systemFont, 12)
		myText21=display.newText("Level 21",387, 310, native.systemFont, 12)
		myText22=display.newText("Level 22",27, 370, native.systemFont, 12)
		myText23=display.newText("Level 23",87, 370, native.systemFont, 12)
		myText24=display.newText("Level 24",147, 370, native.systemFont, 12)
		myText25=display.newText("Level 25",207, 370, native.systemFont, 12)
		myText26=display.newText("Level 26",267, 370, native.systemFont, 12)
		myText27=display.newText("Level 27",327, 370, native.systemFont, 12)
		myText28=display.newText("Level 28",387, 370, native.systemFont, 12)
		myText29=display.newText("Level 29",27, 430, native.systemFont, 12)
		myText30=display.newText("Level 30",87, 430, native.systemFont, 12)
		myText31=display.newText("Level 31",147, 430, native.systemFont, 12)
		myText32=display.newText("Level 32",207, 430, native.systemFont, 12)
		myText33=display.newText("Level 33",267, 430, native.systemFont, 12)
		myText34=display.newText("Level 34",327, 430, native.systemFont, 12)
		myText35=display.newText("Level 35",387, 430, native.systemFont, 12)
		myText36=display.newText("Level 36",27, 490, native.systemFont, 12)
		myText37=display.newText("Level 37",87, 490, native.systemFont, 12)
		myText38=display.newText("Level 38",147, 490, native.systemFont, 12)
		myText39=display.newText("Level 39",206, 490, native.systemFont, 12)
		myText40=display.newText("Level 40",265, 490, native.systemFont, 12)
		myText41=display.newText("Level 41",327, 490, native.systemFont, 12)
		myText42=display.newText("Level 42",387, 490, native.systemFont, 12)
		myText43=display.newText("Level 43",27, 550, native.systemFont, 12)
		myText44=display.newText("Level 44",87, 550, native.systemFont, 12)
		myText45=display.newText("Level 45",145, 550, native.systemFont, 12)
		myText46=display.newText("Level 46",207, 550, native.systemFont, 12)
		myText47=display.newText("Level 47",267, 550, native.systemFont, 12)
		myText48=display.newText("Level 48",327, 550, native.systemFont, 12)
		myText49=display.newText("Level 49",387, 550, native.systemFont, 12)
		myText50=display.newText("Final Level",200, 605, native.systemFont, 12)
		aboutText =display.newText("About Game",200, 665, native.systemFont, 12)
		
	white = display.newRect(-50, 70, 600, 550 )
	white:setFillColor ( 255, 155, 55)
	white.xScale = 1
	white.yScale = 1.3
	
	gameDevin2 = display.newImage("gameDevin2.png")
	gameDevin2.x = 700
	gameDevin2.y = 250
	gameDevin2.xScale = .7
	gameDevin2.yScale = .7
	gameDevin2.alpha = .2
	
	machineGunBG = display.newImage("machineGunBG.png")
	machineGunBG.x = 700
	machineGunBG.y = 250
	machineGunBG.rotation =50
	machineGunBG.xScale = .7
	machineGunBG.yScale = .7
	machineGunBG.alpha = .2
	
	bed = display.newImage("bed.png")
	bed.x = 700
	bed.y = 500
	bed.xScale = .7
	bed.yScale = .7
	bed.alpha = .2
	
	explosion0 = display.newImage("explosion0.png")
	explosion0.x = 700
	explosion0.y = 500
	explosion0.xScale = .3
	explosion0.yScale = .3
	explosion0.alpha = .2
	
	blueBack =display.newImage("blueBack.jpg")
	blueBack.x =240
	blueBack.y =220
	blueBack.alpha =.5
	blueBack.xScale =.6
	blueBack.yScale =1.1

	devinLogo = display.newImage("devinLogo.png")
	devinLogo.x = 225
	devinLogo.y = 35
	devinLogo.xScale = .3
	devinLogo.yScale = .3


	
	--myScrollView:insert(background) --must add insert:[whatever] when doing storyboard and using graphics
	
	myScrollView:insert(white)
	
		myScrollView:insert(gameDevin2)
		myScrollView:insert(bed)
		myScrollView:insert(explosion0)
		myScrollView:insert(machineGunBG)
		
	
	myScrollView:insert(blueBack)
	myScrollView:insert (bonuses)
	myScrollView:insert (level1)
	myScrollView:insert (level2)
	myScrollView:insert (level3)
	myScrollView:insert (level4)
	myScrollView:insert (level5)
	myScrollView:insert (level6)
	myScrollView:insert (level7)
	myScrollView:insert (level8)
	myScrollView:insert (level9)
	myScrollView:insert (level10)
	myScrollView:insert (level11)
	myScrollView:insert (level12)
	myScrollView:insert (level13)
	myScrollView:insert (level14)
	myScrollView:insert (level15)
	myScrollView:insert (level16)
	myScrollView:insert (level17)
	myScrollView:insert (level18)
	myScrollView:insert (level19)
	myScrollView:insert (level20)
	myScrollView:insert (level21)
	myScrollView:insert (level22)
	myScrollView:insert (level23)
	myScrollView:insert (level24)
	myScrollView:insert (level25)
	myScrollView:insert (level26)
	myScrollView:insert (level27)
	myScrollView:insert (level28)
	myScrollView:insert (level29)
	myScrollView:insert (level30)
	myScrollView:insert (level31)
	myScrollView:insert (level32)
	myScrollView:insert (level33)
	myScrollView:insert (level34)
	myScrollView:insert (level35)
	myScrollView:insert (level36)
	myScrollView:insert (level37)
	myScrollView:insert (level38)
	myScrollView:insert (level39)
	myScrollView:insert (level40)
	myScrollView:insert (level41)
	myScrollView:insert (level42)
	myScrollView:insert (level43)
	myScrollView:insert (level44)
	myScrollView:insert (level45)
	myScrollView:insert (level46)
	myScrollView:insert (level47)
	myScrollView:insert (level48)
	myScrollView:insert (level49)
	myScrollView:insert (level50)
	myScrollView:insert(devinLogo)
	

		
	myScrollView:insert(bonusesText)
	myScrollView:insert(myText1)
	myScrollView:insert(myText2)
	myScrollView:insert(myText3)
	myScrollView:insert(myText4)
	myScrollView:insert(myText5)
	myScrollView:insert(myText6)
	myScrollView:insert(myText7)
	myScrollView:insert(myText8)
	myScrollView:insert(myText9)
	myScrollView:insert(myText10)
	myScrollView:insert(myText11)
	myScrollView:insert(myText12)
	myScrollView:insert(myText13)
	myScrollView:insert(myText14)
	myScrollView:insert(myText15)
	myScrollView:insert(myText16)
	myScrollView:insert(myText17)
	myScrollView:insert(myText18)
	myScrollView:insert(myText19)
	myScrollView:insert(myText20)
	myScrollView:insert(myText21)
	myScrollView:insert(myText22)
	myScrollView:insert(myText23)
	myScrollView:insert(myText24)
	myScrollView:insert(myText25)
	myScrollView:insert(myText26)
	myScrollView:insert(myText27)
	myScrollView:insert(myText28)
	myScrollView:insert(myText29)
	myScrollView:insert(myText30)
	myScrollView:insert(myText31)
	myScrollView:insert(myText32)
	myScrollView:insert(myText33)
	myScrollView:insert(myText34)
	myScrollView:insert(myText35)
	myScrollView:insert(myText36)
	myScrollView:insert(myText37)
	myScrollView:insert(myText38)
	myScrollView:insert(myText39)
	myScrollView:insert(myText40)
	myScrollView:insert(myText41)
	myScrollView:insert(myText42)
	myScrollView:insert(myText43)
	myScrollView:insert(myText44)
	myScrollView:insert(myText45)
	myScrollView:insert(myText46)
	myScrollView:insert(myText47)
	myScrollView:insert(myText48)
	myScrollView:insert(myText49)
	myScrollView:insert(myText50)
	myScrollView:insert(about)
	myScrollView:insert(aboutText)
	myScrollView:insert(workingText)

	
	
	
	letterboxTop = display.newRect(-100, -55, 600, 50)
	letterboxTop:setFillColor(0,0,0)
	letterboxBottom= display.newRect(-50, 320, 600, 50)
	letterboxBottom:setFillColor(0,0,0)
	
	sheetData = { width=192, height=192, numFrames=25, sheetContentWidth=960, sheetContentHeight=960 }
	mySheet = graphics.newImageSheet( "burst.png", sheetData )
	sequenceData = {start=1, count=25, time=1000, loopCount =6 }
	sparkle = display.newSprite( mySheet, sequenceData )
	sparkle.x = 15	
	sparkle.xScale = .8
	sparkle.yScale = .3
	sparkle.y = 85
	sparkle.alpha =0

	
	initialSquare = display.newImage("gameSquare.png")
	initialSquare.x = 245
	initialSquare.yScale = .1
	initialSquare.xScale = 2.2
	initialSquare.y = 85
	initialSquare.alpha =.8

	clearButtonOne = display.newImage("gameSquare.png")
	clearButtonOne.x = -30
	clearButtonOne.yScale = .1
	clearButtonOne.xScale = .5
	clearButtonOne.y =21
	--clearButtonOne.rotation =90
	clearButtonOne.alpha =0
	

	
	
	unlockSquare = display.newImage("gameSquare.png")
	unlockSquare.x = 230
	unlockSquare.yScale = .1
	unlockSquare.xScale = 2.2
	unlockSquare.y = 85
	unlockSquare.alpha = .8
	transition.to( unlockSquare, { time=2501, alpha =0 } )


	 function moveDevinLogo () 
	 	devinLogo.alpha = 1
	 	transition.to( devinLogo, { time=1501, alpha =.5 } )
	 end

		unlockText0 = display.newText( "Unlocked First Movie, tap Bonuses To Watch", 25,80, native.systemFont, 13)

	
	unlockText0:setFillColor( 190, 300, 300 )
	unlockText0.alpha =0
	function revealFunction0() 
	unlockText0.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText0, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText1 = display.newText( "Unlocked Red City level, Running Man song, and Wrecking powerup", 25,80, native.systemFont, 13)
	unlockText1:setTextColor( 190, 300, 300 )
	unlockText1.alpha =0
	function revealFunction1()
	unlockText1.alpha =1
    unlockSquare.alpha =1
	transition.to( unlockText1, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	

	unlockText2 = display.newText( "Unlocked Dusk level", 25,80, native.systemFont, 13)
	unlockText2:setTextColor( 190, 300, 300 )
	unlockText2.alpha =0
	function revealFunction2()
	unlockText2.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText2, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText3 = display.newText( "Unlocked Whippish powerup", 25,80, native.systemFont, 13)
	unlockText3:setTextColor( 190, 300, 300 )
	unlockText3.alpha =0
	function revealFunction3()
	unlockText3.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText3, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	

	unlockText4 = display.newText( "Unlocked Be All song", 25,80, native.systemFont, 13)
	unlockText4:setTextColor( 190, 300, 300 )
	unlockText4.alpha =0
	function revealFunction4()
	unlockText4.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText4, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText5 = display.newText( "Unlocked Wet level", 25,80, native.systemFont, 13)
	unlockText5:setTextColor( 190, 300, 300 )
	unlockText5.alpha =0
	function revealFunction5()
	unlockText5.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText5, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	

	unlockText6 = display.newText( "Unlocked Bomb powerup", 25,80, native.systemFont, 13)
	unlockText6:setTextColor( 190, 300, 300 )
	unlockText6.alpha =0
	function revealFunction6()
	unlockText6.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText6, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText7 = display.newText( "Unlocked Babe enemy and Kinetic song", 25,80, native.systemFont, 13)
	unlockText7:setTextColor( 190, 300, 300 )
	unlockText7.alpha =0
	function revealFunction7()
	unlockText7.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText7, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText8 = display.newText( "Unlocked After level", 25,80, native.systemFont, 13)
	unlockText8:setTextColor( 190, 300, 300 )
	unlockText8.alpha =0
	function revealFunction8()
	unlockText8.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText8, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText9 = display.newText( "Unlocked Fast powerup", 25,80, native.systemFont, 13)
	unlockText9:setTextColor( 190, 300, 300 )
	unlockText9.alpha =0
	function revealFunction9()
	unlockText9.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText9, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText10 = display.newText( "Unlocked Storm song", 25,80, native.systemFont, 13)
	unlockText10:setTextColor( 190, 300, 300 )
	unlockText10.alpha =0
	function revealFunction10()
	unlockText10.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText10, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText11 = display.newText( "Unlocked Mourn level", 25,80, native.systemFont, 13)
	unlockText11:setTextColor( 190, 300, 300 )
	unlockText11.alpha =0
	function revealFunction11()
	unlockText11.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText11, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText12 = display.newText( "Keep Playing More Levels", 25,80, native.systemFont, 13)

	
	unlockText12:setTextColor( 190, 300, 300 )
	unlockText12.alpha =0
	function revealFunction12()
	unlockText12.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText12, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText13 = display.newText( "Unlocked Fast Ring song", 25,80, native.systemFont, 13)
	unlockText13:setTextColor( 190, 300, 300 )
	unlockText13.alpha =0
	function revealFunction13()
	unlockText13.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText13, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText14 = display.newText( "Unlocked Fame powerup", 25,80, native.systemFont, 13)
	unlockText14:setTextColor( 190, 300, 300 )
	unlockText14.alpha =0
	function revealFunction14()
	unlockText14.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText14, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText15 = display.newText( "Unlocked Call enemy", 25,80, native.systemFont, 13)
	unlockText15:setTextColor( 190, 300, 300 )
	unlockText15.alpha =0
	function revealFunction15()
	unlockText15.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText15, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText16 = display.newText( "Unlocked Yeah Right song", 25,80, native.systemFont, 13)
	unlockText16:setTextColor( 190, 300, 300 )
	unlockText16.alpha =0
	function revealFunction16()
	unlockText16.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText16, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText17 = display.newText( "Unlocked Valley level", 25,80, native.systemFont, 13)
	unlockText17:setTextColor( 190, 300, 300 )
	unlockText17.alpha =0
	function revealFunction17()
	unlockText17.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText17, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText18 = display.newText( "Unlocked Protect powerup", 25,80, native.systemFont, 13)
	unlockText18:setTextColor( 190, 300, 300 )
	unlockText18.alpha =0
	function revealFunction18()
	unlockText18.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText18, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText19 = display.newText( "Unlocked Gas enemy", 25,80, native.systemFont, 13)
	unlockText19:setTextColor( 190, 300, 300 )
	unlockText19.alpha =0
	function revealFunction19()
	unlockText19.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText19, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText20 = display.newText( "Unlocked All is Right song", 25,80, native.systemFont, 13)
	unlockText20:setTextColor( 190, 300, 300 )
	unlockText20.alpha =0
	function revealFunction20()
	unlockText20.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText20, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText21 = display.newText( "Unlocked And What song", 25,80, native.systemFont, 13)
	unlockText21:setTextColor( 190, 300, 300 )
	unlockText21.alpha =0
	function revealFunction21()
	unlockText21.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText21, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText22 = display.newText( "Sorry, you unlocked nothing this time", 25,80, native.systemFont, 13)


	unlockText22:setTextColor( 190, 300, 300 )
	unlockText22.alpha =0
	function revealFunction22()
	unlockText22.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText22, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText23 = display.newText( "Unlocked Cough enemy", 25,80, native.systemFont, 13)
	unlockText23:setTextColor( 190, 300, 300 )
	unlockText23.alpha =0
	function revealFunction23()
	unlockText23.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText23, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText24 = display.newText( "Unlocked High Tech Level", 25,80, native.systemFont, 13)
	unlockText24:setTextColor( 190, 300, 300 )
	unlockText24.alpha =0
	function revealFunction24()
	unlockText24.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText24, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText25 = display.newText( "Unlocked Banging song ", 25,80, native.systemFont, 13)
	unlockText25:setTextColor( 190, 300, 300 )
	unlockText25.alpha =0
	function revealFunction25()
	unlockText25.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText25, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText26 = display.newText( "Keep Playing More Levels", 25,80, native.systemFont, 13)

	
	unlockText26:setTextColor( 190, 300, 300 )
	unlockText26.alpha =0
	function revealFunction26()
	unlockText26.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText26, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText27 = display.newText( "Unlocked Charlie Brown song", 25,80, native.systemFont, 13)
	unlockText27:setTextColor( 190, 300, 300 )
	unlockText27.alpha =0
	function revealFunction27()
	unlockText27.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText27, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText28 = display.newText( "Unlocked Hot Juice enemy", 25,80, native.systemFont, 13)
	unlockText28:setTextColor( 190, 300, 300 )
	unlockText28.alpha =0
	function revealFunction28()
	unlockText28.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText28, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText29 = display.newText( "Nothing, why does your greedy self always expect something?", 25,80, native.systemFont, 13)
	unlockText29:setTextColor( 190, 300, 300 )
	unlockText29.alpha =0
	function revealFunction29()
	unlockText29.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText29, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText30 = display.newText( "Unlocked Kick Pause song", 25,80, native.systemFont, 13)
	unlockText30:setTextColor( 190, 300, 300 )
	unlockText30.alpha =0
	function revealFunction30()
	unlockText30.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText30, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	unlockText31 = display.newText("What?! Get back to playing before I whoop you", 25,80, native.systemFont, 13)

	unlockText31:setTextColor( 190, 300, 300 )
	unlockText31.alpha =0
	function revealFunction31()
	unlockText31.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText31, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end




	unlockText32 = display.newText( "Unlocked She Got song", 25,80, native.systemFont, 13)
	unlockText32:setTextColor( 190, 300, 300 )
	unlockText32.alpha =0
	function revealFunction32()
	unlockText32.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText32, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end
	
	
	unlockText33 = display.newText( "Unlocked Bird level", 25,80, native.systemFont, 13)
	unlockText33:setTextColor( 190, 300, 300 )
	unlockText33.alpha =0
	function revealFunction33()
	unlockText33.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText33, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText34 = display.newText( "You finger me all this time and you feel entilted to a reward?", 25,80, native.systemFont, 13)
	unlockText34:setTextColor( 190, 300, 300 )
	unlockText34.alpha =0
	function revealFunction34()
	unlockText34.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText34, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText35 = display.newText( "Keep Playing More Levels", 25,80, native.systemFont, 13)

	unlockText35:setTextColor( 190, 300, 300 )
	unlockText35.alpha =0
	function revealFunction35()
	unlockText35.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText35, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText36 = display.newText( "Unlocked Lit level", 25,80, native.systemFont, 13)
	unlockText36:setTextColor( 190, 300, 300 )
	unlockText36.alpha =0
	function revealFunction36()
	unlockText36.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText36, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText37 = display.newText( "Unlocked School song", 25,80, native.systemFont, 13)
	unlockText37:setTextColor( 190, 300, 300 )
	unlockText37.alpha =0
	function revealFunction37()
	unlockText37.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText37, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText38 = display.newText( "I'm tired of saying this. You're not getting anything.", 25,80, native.systemFont, 13)


	unlockText38:setTextColor( 190, 300, 300 )
	unlockText38.alpha =0
	function revealFunction38()
	unlockText38.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText38, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText39 = display.newText( "You just unlocked your mom...your mom getting DI...nevermind", 25,80, native.systemFont, 13)

	unlockText39:setTextColor( 190, 300, 300 )
	unlockText39.alpha =0
	function revealFunction39()
	unlockText39.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText39, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText40 = display.newText( "Unlocked Money song", 25,80, native.systemFont, 13)
	unlockText40:setTextColor( 190, 300, 300 )
	unlockText40.alpha =0
	function revealFunction40()
	unlockText40.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText40, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText41 = display.newText( "Keep Playing More Levels", 25,80, native.systemFont, 13)

	
	unlockText41:setTextColor( 190, 300, 300 )
	unlockText41.alpha =0
	function revealFunction41()
	unlockText41.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText41, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText42 = display.newText( "Unlocked Green City level", 25,80, native.systemFont, 13)
	unlockText42:setTextColor( 190, 300, 300 )
	unlockText42.alpha =0
	function revealFunction42()
	unlockText42.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText42, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText43 = display.newText( "Unlocked DeeDum song", 25,80, native.systemFont, 13)
	unlockText43:setTextColor( 190, 300, 300 )
	unlockText43.alpha =0
	function revealFunction43()
	unlockText43.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText43, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText44 = display.newText( "You Unlocked dee..............zzz nuts :-(", 25,80, native.systemFont, 13)
	unlockText44:setTextColor( 190, 300, 300 )
	unlockText44.alpha =0
	function revealFunction44()
	unlockText44.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText44, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText45 = display.newText( "Unlocked Come Holla song", 25,80, native.systemFont, 13)
	unlockText45:setTextColor( 190, 300, 300 )
	unlockText45.alpha =0
	function revealFunction45()
	unlockText45.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText45, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end

	
	unlockText46 = display.newText( "You just unlocked Rosetta Stone Yoruba Edition. Sike! :-(", 25,80, native.systemFont, 13)
	unlockText46:setTextColor( 190, 300, 300 )
	unlockText46.alpha =0
	function revealFunction46()
	unlockText46.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText46, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText47 = display.newText( "Ember Roar was too lazy to create something, sorry not sorry.", 25,80, native.systemFont, 13)
	unlockText47:setTextColor( 190, 300, 300 )
	unlockText47.alpha =0
	function revealFunction47()
	unlockText47.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText47, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText48 = display.newText( "Keep playing til you get the last level. Better luck next time?", 25,80, native.systemFont, 13)

	
	unlockText48:setTextColor( 190, 300, 300 )
	unlockText48.alpha =0
	function revealFunction48()
	unlockText48.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText48, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


	unlockText49 = display.newText( "Nope. Wait, don't leave!! Why wont't anybody love me? *slits wrist*", 25,80, native.systemFont, 13)
	unlockText49:setTextColor( 190, 300, 300 )
	unlockText49.alpha =0
	function revealFunction49()
	unlockText49.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText49, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end


		unlockText50 = display.newText( "DEVIN DANGER", 25,80, native.systemFont, 13)

	
	unlockText50:setTextColor( 190, 300, 300 )
	unlockText50.alpha =0
	function revealFunction50()
	unlockText50.alpha =1
	unlockSquare.alpha =1
	transition.to( unlockText50, { time=2501, alpha =0 } )
	transition.to( unlockSquare, { time=2501, alpha =0 } )
	end
	

	loadingText = display.newText( "Wait a sec...", 40,80, native.systemFont, 13)
	loadingText:setFillColor( 190, 300, 300 )
	loadingText.alpha =1 

	scrollLeft = display.newImage ("scrollHere.png")
	scrollLeft.rotation = 270
	scrollLeft.x =15
	scrollLeft.y = 240
	scrollLeft.xScale = .10
	scrollLeft.yScale = .13

	scrollRight = display.newImage ("scrollHere.png")
	scrollRight.rotation = 90
	scrollRight.x =450
	scrollRight.y = 240
	scrollRight.xScale = .10
	scrollRight.yScale = .13



	
	screenGroup:insert(myScrollView)
	
	
	screenGroup:insert(unlockSquare)
	screenGroup:insert(sfx.levelText)
	screenGroup:insert(initialSquare)
	screenGroup:insert(clearButtonOne)
	screenGroup:insert(loadingText)
	

	screenGroup:insert(unlockText0)
	screenGroup:insert(unlockText1)
	screenGroup:insert(unlockText2)
	screenGroup:insert(unlockText3)
	screenGroup:insert(unlockText4)
	screenGroup:insert(unlockText5)
	screenGroup:insert(unlockText6)
	screenGroup:insert(unlockText7)
	screenGroup:insert(unlockText8)
	screenGroup:insert(unlockText9)
	screenGroup:insert(unlockText10)
	screenGroup:insert(unlockText11)
	screenGroup:insert(unlockText12)
	screenGroup:insert(unlockText13)
	screenGroup:insert(unlockText14)
	screenGroup:insert(unlockText15)
	screenGroup:insert(unlockText16)
	screenGroup:insert(unlockText17)
	screenGroup:insert(unlockText18)
	screenGroup:insert(unlockText19)
	screenGroup:insert(unlockText20)
	screenGroup:insert(unlockText21)
	screenGroup:insert(unlockText22)
	screenGroup:insert(unlockText23)
	screenGroup:insert(unlockText24)
	screenGroup:insert(unlockText25)
	screenGroup:insert(unlockText26)
	screenGroup:insert(unlockText27)
	screenGroup:insert(unlockText28)
	screenGroup:insert(unlockText29)
	screenGroup:insert(unlockText30)
	screenGroup:insert(unlockText31)
	screenGroup:insert(unlockText32)
	screenGroup:insert(unlockText33)
	screenGroup:insert(unlockText34)
	screenGroup:insert(unlockText35)
	screenGroup:insert(unlockText36)
	screenGroup:insert(unlockText37)
	screenGroup:insert(unlockText38)
	screenGroup:insert(unlockText39)
	screenGroup:insert(unlockText40)
	screenGroup:insert(unlockText41)
	screenGroup:insert(unlockText42)
	screenGroup:insert(unlockText43)
	screenGroup:insert(unlockText44)
	screenGroup:insert(unlockText45)
	screenGroup:insert(unlockText46)
	screenGroup:insert(unlockText47)
	screenGroup:insert(unlockText48)
	screenGroup:insert(unlockText49)
	screenGroup:insert(unlockText50)
	screenGroup:insert(sparkle)
	screenGroup:insert(changingText)
	screenGroup:insert(scrollLeft)
	screenGroup:insert(scrollRight)

end

	
function startBonuses (event)
if event.phase == "began" then
storyboard.gotoScene("bonusesScene", "fade", 200)
--timer.cancel(moveAllLevels)
end
return true
end

function startAbout (event)
if event.phase == "began" then
storyboard.gotoScene("aboutScene", "fade", 200)
end
return true
end

function startLevel1 (event)
if event.phase == "began" then
storyboard.gotoScene("games01", "fade", 200)
--timer.cancel(moveAllLevels)
end
return true
end

function startLevel2 (event)
if progressionActive then
if (sfx.highestLevel or achieveScore.load() or workingScore) >= 2 then 
if event.phase == "began" then
storyboard.gotoScene("games02", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games02", "fade", 200)
end
end
end
end

function startLevel3 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or achieveScore.load()) >= 3 then 
storyboard.gotoScene("games03", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games03", "fade", 200)
end
end
end
end

function startLevel4 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or achieveScore.load()) >= 4 then 
storyboard.gotoScene("games04", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games04", "fade", 200)
end
end
end
end
function startLevel5 (event)
if progressionActive then
if (sfx.highestLevel or achieveScore.load() ) >= 5 then 
if event.phase == "began" then
storyboard.gotoScene("games05", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games05", "fade", 200)
end
end
end
end
function startLevel6 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or achieveScore.load()) >= 6 then 
storyboard.gotoScene("games06", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games06", "fade", 200)
end
end
end
end
function startLevel7 (event)
if progressionActive then
if (sfx.highestLevel or achieveScore.load()) >= 7 then 
if event.phase == "began" then
storyboard.gotoScene("games07", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games07", "fade", 200)
end
end
end
end
function startLevel8 (event)
if progressionActive then
if (sfx.highestLevel or achieveScore.load()) >= 8 then 

if event.phase == "began" then
storyboard.gotoScene("games08", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games08", "fade", 200)
end
end
end
end
function startLevel9 (event)
if progressionActive then
if (sfx.highestLevel or achieveScore.load()) >= 9 then 

if event.phase == "began" then
storyboard.gotoScene("games09", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games09", "fade", 200)
end
end
end
end
function startLevel10 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or achieveScore.load()) >= 10 then 
storyboard.gotoScene("games010", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games010", "fade", 200)
end
end
end
end
function startLevel11 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or newScore) >= 11 then 
storyboard.gotoScene("games011", "fade", 200)
--timer.cancel(moveAllLevels)
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games011", "fade", 200)
end
end
end
end

function startLevel12 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 12 then 
storyboard.gotoScene("games12", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 12 clicked")
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games12", "fade", 200)
end
end
end 
end

function startLevel13 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or newScore) >= 13 then 
storyboard.gotoScene("games13", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 13 clicked")
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games13", "fade", 200)
end
end
end
end
function startLevel14 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 14 then 
storyboard.gotoScene("games14", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 14 clicked")
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games14", "fade", 200)
end
end
end
end
function startLevel15 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 15 then 
storyboard.gotoScene("games15", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 15 clicked")
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games15", "fade", 200)
end
end
end
end
function startLevel16 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 16 then 
storyboard.gotoScene("gamess16", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("gamess16", "fade", 200)
end
end
end
end
function startLevel17 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 17 then 
storyboard.gotoScene("games17", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 17 clicked")
end end 
else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games17", "fade", 200)
end
end end
end
function startLevel18 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 18 then 
storyboard.gotoScene("games18", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games18", "fade", 200)
end
end end 
end
function startLevel19 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 19 then 
storyboard.gotoScene("games19", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games19", "fade", 200)
end
end end end
function startLevel20 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 20 then 
if event.phase == "began" then
storyboard.gotoScene("games20", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games20", "fade", 200)
end
end end
end
function startLevel21 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 21 then 
storyboard.gotoScene("games21", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games21", "fade", 200)
end
end end end
function startLevel22 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 22 then 
storyboard.gotoScene("games22", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games22", "fade", 200)
end
end end
end
function startLevel23 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 23 then 
if event.phase == "began" then
storyboard.gotoScene("games23", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games23", "fade", 200)
end
end end end
function startLevel24 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 24 then 
storyboard.gotoScene("games24", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games24", "fade", 200)
end
end end 
end
function startLevel25 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 25 then 
if event.phase == "began" then
storyboard.gotoScene("games25", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games25", "fade", 200)
end
end end
end
function startLevel26 (event)
if progressionActive then
if event.phase == "began" then
if (sfx.highestLevel or newScore) >= 26 then 
storyboard.gotoScene("games26", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games26", "fade", 200)
end
end end end
function startLevel27 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 27 then 
if event.phase == "began" then
storyboard.gotoScene("games27", "fade", 200)
--timer.cancel(moveAllLevels)
print("level 16 clicked")
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games27", "fade", 200)
end
end end end
function startLevel28 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or newScore) >= 28 then 
storyboard.gotoScene("games28", "fade", 200)
--timer.cancel(moveAllLevels)
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games28", "fade", 200)
end
end end
end
function startLevel29 (event)
if progressionActive then
if event.phase == "began" then

if (sfx.highestLevel or newScore) >= 29 then 
storyboard.gotoScene("games29", "fade", 200)
--timer.cancel(moveAllLevels)
end end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games29", "fade", 200)
end
end end
end
function startLevel30 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 30 then 
if event.phase == "began" then
storyboard.gotoScene("games30", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games30", "fade", 200)
end
end 
end 
end 

function startLevel31 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 31 then 
if event.phase == "began" then
storyboard.gotoScene("games31", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games31", "fade", 200)
end
end 
end
end
function startLevel32 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 32 then 
if event.phase == "began" then
storyboard.gotoScene("games32", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games32", "fade", 200)
end
end 
end
end
function startLevel33 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 33 then 
if event.phase == "began" then
storyboard.gotoScene("games33", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games33", "fade", 200)
end
end 
end
end
function startLevel34 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 34 then 
if event.phase == "began" then
storyboard.gotoScene("games34", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games34", "fade", 200)
end
end 
end
end
function startLevel35 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 35 then 
if event.phase == "began" then
storyboard.gotoScene("games35", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games35", "fade", 200)
end
end 
end
end
function startLevel36 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 36 then 
if event.phase == "began" then
storyboard.gotoScene("games36", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games36", "fade", 200)
end
end 
end
end
function startLevel37 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 37 then 
if event.phase == "began" then
storyboard.gotoScene("games37", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games37", "fade", 200)
end
end 
end
end
function startLevel38 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 38 then 
if event.phase == "began" then
storyboard.gotoScene("games38", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games38", "fade", 200)
end
end 
end
end
function startLevel39 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 39 then 
if event.phase == "began" then
storyboard.gotoScene("games39", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games39", "fade", 200)
end
end 
end
end
function startLevel40 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 40 then 
if event.phase == "began" then
storyboard.gotoScene("games40", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games40", "fade", 200)
end
end 
end
end
function startLevel41 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 41 then 
if event.phase == "began" then
storyboard.gotoScene("games41", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games41", "fade", 200)
end
end 
end
end
function startLevel42 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 42 then 
if event.phase == "began" then
storyboard.gotoScene("games42", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games42", "fade", 200)
end
end 
end
end
function startLevel43 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 43 then 
if event.phase == "began" then
storyboard.gotoScene("games43", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games43", "fade", 200)
end
end 
end
end
function startLevel44 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 44 then 
if event.phase == "began" then
storyboard.gotoScene("games44", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games44", "fade", 200)
end
end 
end
end
function startLevel45 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 45 then 
if event.phase == "began" then
storyboard.gotoScene("games45", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games45", "fade", 200)
end
end 
end
end
function startLevel46 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 46 then 
if event.phase == "began" then
storyboard.gotoScene("games46", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games46", "fade", 200)
end
end 
end
end
function startLevel47 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 47 then 
if event.phase == "began" then
storyboard.gotoScene("games47", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games47", "fade", 200)
end
end 
end
end
function startLevel48 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 48 then 
if event.phase == "began" then
storyboard.gotoScene("games48", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games48", "fade", 200)
end
end 
end
end
function startLevel49 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 49 then 
if event.phase == "began" then
storyboard.gotoScene("games49", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games49", "fade", 200)
end
end 
end
end

function startLevel50 (event)
if progressionActive then
if (sfx.highestLevel or newScore) >= 50 then 
if event.phase == "began" then
storyboard.gotoScene("games50", "fade", 200)
--timer.cancel(moveAllLevels)
end
end else if progressionActive ==false then
 if event.phase == "began" then
storyboard.gotoScene("games50", "fade", 200)
end
end 
end
end



	function throb()
	
	--print("its throbbing")

	moveDevinLogo()
	
	movebonuses = timer.performWithDelay(1, function (a)
	transition.to( bonuses, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( bonusesText, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( bonuses, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( bonusesText, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )

	transition.to( about, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( aboutText, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( about, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( aboutText, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )

	end, 1)
	
	
	level1Active =true


	
	if (sfx.highestLevel or newScore) >= 1 then 
		
	moveLevel1 = timer.performWithDelay(1, function (a)
	transition.to( level1, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText1, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level1, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText1, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	if sfx.highestLevel ==1 then 
	revealFunction0()
	end
	level2Active =true
	if (sfx.highestLevel or newScore) >= 2 then 
	moveLevel2 = timer.performWithDelay(1, function (a)
	transition.to( level2, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText2, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level2, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText2, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	if sfx.highestLevel ==2 then 
	revealFunction1()
	end
	
	level3Active =true
	if (sfx.highestLevel or newScore) >= 3 then 
	moveLevel3 = timer.performWithDelay(1, function (a)
	transition.to( level3, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText3, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level3, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText3, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	
	if sfx.highestLevel ==3 then 
	revealFunction2()
	end
	
	level4Active =true
	if (sfx.highestLevel or newScore) >= 4 then
	moveLevel4 = timer.performWithDelay(1, function (a)
	transition.to( level4, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText4, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level4, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText4, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	
	if sfx.highestLevel ==4 then 
	revealFunction3()
	end
	
	level5Active =true
	if (sfx.highestLevel or newScore) >= 5 then 
	moveLevel5 = timer.performWithDelay(1, function (a)
	transition.to( level5, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText5, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level5, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText5, { time=500, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==5 then 
	revealFunction4()
	end
	
	level6Active =true
	if (sfx.highestLevel or newScore) >= 6 then 
	moveLevel6 = timer.performWithDelay(1, function (a)
	transition.to( level6, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText6, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level6, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText6, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==6 then 
	revealFunction5()
	end
	
		
	if (sfx.highestLevel or newScore) >= 7 then
	moveLevel7 = timer.performWithDelay(1, function (a)
	transition.to( level7, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText7, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level7, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText7, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==7 then 
	revealFunction6()
	end
	
			
	if (sfx.highestLevel or newScore) >= 8 then 
	moveLevel8 = timer.performWithDelay(1, function (a)
	transition.to( level8, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText8, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level8, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText8, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==8 then 
	revealFunction7()
	end
	
	
	if (sfx.highestLevel or newScore) >= 9 then 
	moveLevel9 = timer.performWithDelay(1, function (a)
	transition.to( level9, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText9, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level9, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText9, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==9 then 
	revealFunction8()
	end
	
					 
	if (sfx.highestLevel or newScore) >= 10 then 
	moveLevel10 = timer.performWithDelay(1, function (a)
	transition.to( level10, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText10, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level10, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText10, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end	
	if sfx.highestLevel ==10 then 
	revealFunction9()
	end
	
	
	if (sfx.highestLevel or newScore) >=11 then 
	moveLevel11 = timer.performWithDelay(1, function (a)
	transition.to( level11, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText11, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level11, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText11, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==11 then 
	revealFunction10()
	end
	
	if (sfx.highestLevel or newScore) >=12 then 
	moveLevel12 = timer.performWithDelay(1, function (a)
	transition.to( level12, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText12, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level12, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText12, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==12 then 
	revealFunction11()
	end
	
	if (sfx.highestLevel or newScore) >=13 then 
	moveLevel13 = timer.performWithDelay(1, function (a)
	transition.to( level13, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText13, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level13, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText13, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==13 then 
	revealFunction12()
	end
	
	if (sfx.highestLevel or newScore) >=14 then 
	moveLevel14 = timer.performWithDelay(1, function (a)
	transition.to( level14, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText14, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level14, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText14, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==14 then 
	revealFunction13()
	end
	
	if (sfx.highestLevel or newScore) >=15 then 
	moveLevel15 = timer.performWithDelay(1, function (a)
	transition.to( level15, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText15, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level15, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText15, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
		
	if sfx.highestLevel ==15 then 
	revealFunction14()
	end
	
	if (sfx.highestLevel or newScore) >=16 then 
	moveLevel16 = timer.performWithDelay(1, function (a)
	transition.to( level16, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText16, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level16, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText16, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==16 then 
	revealFunction15()
	end
	
	if (sfx.highestLevel or newScore) >=17 then 
	moveLevel17 = timer.performWithDelay(1, function (a)
	transition.to( level17, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText17, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level17, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText17, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==17 then 
	revealFunction16()
	end
	
	if (sfx.highestLevel or newScore) >=18 then 
	moveLevel18 = timer.performWithDelay(1, function (a)
	transition.to( level18, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText18, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level18, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText18, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==18 then 
	revealFunction17()
	end
	
	if (sfx.highestLevel or newScore) >=19 then 
	moveLevel19 = timer.performWithDelay(1, function (a)
	transition.to( level19, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText19, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level19, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText19, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==19 then 
	revealFunction18()
	end
	
	if (sfx.highestLevel or newScore) >=20 then 
	moveLevel20 = timer.performWithDelay(1, function (a)
	transition.to( level20, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText20, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level20, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText20, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==20 then 
	revealFunction19()
	end
	
	if (sfx.highestLevel or newScore) >=21 then 
	moveLevel21 = timer.performWithDelay(1, function (a)
	transition.to( level21, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText21, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level21, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText21, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==21 then 
	revealFunction20()
	end
	
	if (sfx.highestLevel or newScore) >=22 then 
	moveLevel22 = timer.performWithDelay(1, function (a)
	transition.to( level22, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText22, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level22, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText22, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
			
	if sfx.highestLevel ==22 then 
	revealFunction21()
	end
	
	if (sfx.highestLevel or newScore) >=23 then 
	moveLevel23 = timer.performWithDelay(1, function (a)
	transition.to( level23, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText23, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level23, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText23, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==23 then 
	revealFunction22()
	end
	
	if (sfx.highestLevel or newScore) >=24 then 
	moveLevel24 = timer.performWithDelay(1, function (a)
	transition.to( level24, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText24, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level24, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText24, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==24 then 
	revealFunction23()
	end
	
	if (sfx.highestLevel or newScore) >=25 then 
	moveLevel25 = timer.performWithDelay(1, function (a)
	transition.to( level25, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText25, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level25, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText25, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==25 then 
	revealFunction24()
	end
	
	if (sfx.highestLevel or newScore) >=26 then 
	moveLevel26 = timer.performWithDelay(1, function (a)
	transition.to( level26, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText26, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level26, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText26, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==26 then 
	revealFunction25()
	end
	
	if (sfx.highestLevel or newScore) >=27 then 
	moveLevel27 = timer.performWithDelay(1, function (a)
	transition.to( level27, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText27, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level27, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText27, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==27 then 
	revealFunction26()
	end
	
	if (sfx.highestLevel or newScore) >=28 then 
	moveLevel28 = timer.performWithDelay(1, function (a)
	transition.to( level28, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText28, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level28, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText28, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==28 then 
	revealFunction27()
	end
	
	if (sfx.highestLevel or newScore) >=29 then 
	moveLevel29 = timer.performWithDelay(1, function (a)
	transition.to( level29, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText29, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level29, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText29, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==29 then 
	revealFunction28()
	end
	
	if (sfx.highestLevel or newScore) >=30 then 
	moveLevel30 = timer.performWithDelay(1, function (a)
	transition.to( level30, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText30, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level30, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText30, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==30 then 
	revealFunction29()
	end
	
	if (sfx.highestLevel or newScore) >=31 then 
	moveLevel31 = timer.performWithDelay(1, function (a)
	transition.to( level31, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText31, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level31, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText31, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
				
	if sfx.highestLevel ==31 then 
	revealFunction30()
	end
	
	if (sfx.highestLevel or newScore) >=32 then 
	moveLevel32 = timer.performWithDelay(1, function (a)
	transition.to( level32, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText32, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level32, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText32, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==32 then 
	revealFunction31()
	end
	
	if (sfx.highestLevel or newScore) >=33 then 
	moveLevel33 = timer.performWithDelay(1, function (a)
	transition.to( level33, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText33, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level33, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText33, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==33 then 
	revealFunction32()
	end
	
	if (sfx.highestLevel or newScore) >=34 then 
	moveLevel34 = timer.performWithDelay(1, function (a)
	transition.to( level34, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText34, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level34, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText34, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==34 then 
	revealFunction33()
	end
	
	if (sfx.highestLevel or newScore) >=35 then 
	moveLevel35 = timer.performWithDelay(1, function (a)
	transition.to( level35, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText35, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level35, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText35, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==35 then 
	revealFunction34()
	end
	
	if (sfx.highestLevel or newScore) >=36 then 
	moveLevel36 = timer.performWithDelay(1, function (a)
	transition.to( level36, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText36, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level36, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText36, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==36 then 
	revealFunction35()
	end
	
	if (sfx.highestLevel or newScore) >=37 then 
	moveLevel37 = timer.performWithDelay(1, function (a)
	transition.to( level37, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText37, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level37, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText37, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==37 then 
	revealFunction36()
	end
	
	if (sfx.highestLevel or newScore) >=38 then 
	moveLevel38 = timer.performWithDelay(1, function (a)
	transition.to( level38, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText38, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level38, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText38, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==38 then 
	revealFunction37()
	end
	
	if (sfx.highestLevel or newScore) >=39 then 
	moveLevel39 = timer.performWithDelay(1, function (a)
	transition.to( level39, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText39, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level39, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText39, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==39 then 
	revealFunction38()
	end
	
	if (sfx.highestLevel or newScore) >=40 then 
	moveLevel40 = timer.performWithDelay(1, function (a)
	transition.to( level40, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText40, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level40, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText40, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==40 then 
	revealFunction39()
	end
	
	if (sfx.highestLevel or newScore) >=41 then 
	moveLevel41 = timer.performWithDelay(1, function (a)
	transition.to( level41, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText41, { time=900, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level41, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText41, { time=100, delay=900,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
					
	if sfx.highestLevel ==41 then 
	revealFunction40()
	end
	
	if (sfx.highestLevel or newScore) >=42 then 
	moveLevel42 = timer.performWithDelay(1, function (a)
	transition.to( level42, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText42, { time=800, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level42, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText42, { time=200, delay=800,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==42 then 
	revealFunction41()
	end
	
	if (sfx.highestLevel or newScore) >=43 then 
	moveLevel43 = timer.performWithDelay(1, function (a)
	transition.to( level43, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText43, { time=700, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level43, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText43, { time=300, delay=700,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==43 then 
	revealFunction42()
	end
	
	if (sfx.highestLevel or newScore) >=44 then 
	moveLevel44 = timer.performWithDelay(1, function (a)
	transition.to( level44, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText44, { time=600, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level44, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText44, { time=400, delay=600,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==44 then 
	revealFunction43()
	end
	
	if (sfx.highestLevel or newScore) >=45 then 
	moveLevel45 = timer.performWithDelay(1, function (a)
	transition.to( level45, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText45, { time=500, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level45, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText45, { time=500, delay=500,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==45 then 
	revealFunction44()
	end
	
	if (sfx.highestLevel or newScore) >=46 then 
	moveLevel46 = timer.performWithDelay(1, function (a)
	transition.to( level46, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText46, { time=400, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level46, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText46, { time=600, delay=400,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==46 then 
	revealFunction45()
	end
	
	if (sfx.highestLevel or newScore) >=47 then 
	moveLevel47 = timer.performWithDelay(1, function (a)
	transition.to( level47, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText47, { time=300, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level47, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText47, { time=700, delay=300,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if sfx.highestLevel ==47 then 
	revealFunction46()
	end
	
	if (sfx.highestLevel or newScore) >=48 then 
	moveLevel48 = timer.performWithDelay(1, function (a)
	transition.to( level48, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText48, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level48, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText48, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	if sfx.highestLevel ==48 then 
	revealFunction47()
	end
	
	if (sfx.highestLevel or newScore) >=49 then 
	moveLevel49 = timer.performWithDelay(1, function (a)
	transition.to( level49, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText49, { time=100, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level49, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText49, { time=900, delay=100,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
	if sfx.highestLevel ==49 then 
	revealFunction48()
	end
	
	if (sfx.highestLevel or newScore) >=50 then 
	moveLevel50 = timer.performWithDelay(1, function (a)
	transition.to( level50, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( myText50, { time=200, xScale= 1.1, yScale=1.1, alpha =.6 } )
	transition.to( level50, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	transition.to( myText50, { time=800, delay=200,  xScale= .9, yScale=.9, alpha =1 } )
	end, 1)
	end
						
	if highestLevel ==50 then 
	revealFunction49()
	end	
	if highestLevel ==51 then 
	revealFunction50()
	end
	
end

function cinema ()
moveBack2 = timer.performWithDelay( 19903, function (blahBlah2) 
firstTime =false
transition.to (gameDevin2, {time = 3500, x = -250, y= 500, alpha =1, xScale =1.3, yScale=1.3})
transition.to (gameDevin2, {time = 800, delay = 3501, x= -300, y= 1200, alpha =1, xScale =.5, yScale=.5})
transition.to (gameDevin2, {time = 800, delay = 4301, x = 700, y= 1200, alpha =1})
transition.to (gameDevin2, {time = 800, delay = 5101, x = 700, y= 250, alpha =0})
transition.to (bed, {time = 3500, delay = 5902, x = -250, y= 0, alpha =1, xScale =1.3, yScale=1.3})
transition.to (bed, {time = 800, delay = 9401, x= -300, y= 1200, alpha =1, xScale =.5, yScale=.5})
transition.to (bed, {time = 800, delay = 102201, x = 700, y= 1200, alpha =1})
transition.to (bed, {time = 800, delay = 11001, x = 700, y= 500, alpha =0})
transition.to (machineGunBG, {time = 3500, delay= 12801, x = -250, y= 500, alpha =1, xScale =1.3, yScale=1.3})
transition.to (machineGunBG, {time = 800, delay = 16301, x= -300, y= 1200, alpha =1, xScale =.5, yScale=.5})
transition.to (machineGunBG, {time = 800, delay = 17103, x = 700, y= 1200, alpha =1})
transition.to (machineGunBG, {time = 800, delay = 17903, x = 700, y= 250, alpha =0})
transition.to (explosion0, {time = 3500, delay = 18702, x = -550, y= 0, alpha =1, xScale =.7, yScale=.7})
transition.to (explosion0, {time = 800, delay = 22300, x= -550, y= 1200, alpha =1, xScale =.3, yScale=.3})
transition.to (explosion0, {time = 800, delay = 23100, x = 700, y= 1200, alpha =1})
transition.to (explosion0, {time = 800, delay = 23900, x = 700, y= 500, alpha =0})
end, 0)
end

function framerate()
moveAllLevels=timer.performWithDelay(1000, throb, 0)
end

--change

			if workingScore == nil then
			workingScore =sfx.highestLevel
			end
			workingText = display.newText( workingScore, 1351, 50, native.systemFont, 23)


function scene:enterScene(event) 
-- 	sfx.showBanner=true
-- 	if sfx.showBanner then
-- 	showAd( "banner")
-- end

	if (sfx.highestLevel or newScore) == 1 then 
	bugText = display.newText( "(Force restart app if Level 1 has error)", 195,80, native.systemFont, 11)
	bugText:setFillColor( 190, 300, 300 )
	end

changingText.text = sfx.highestLevel
display.currentStage.x = 0
display.currentStage.y = 0
framerate()
cinema()

	initialSquare.alpha = .8
	loadingText.alpha =1
	timer.performWithDelay(1000, function(something) 
	loadingText.alpha=0
	initialSquare.alpha =0
	 end, 1)


display.remove(tag)
display.remove(textCounter)
display.remove(background)
display.remove(background2)
display.remove(foreground1)
display.remove(foreground2)
display.remove(foreground3)
display.remove(foreground4)
display.remove(ceiling)
display.remove(jet)
display.remove(mine1)
display.remove(mine2)
display.remove(mine3)
display.remove(target)
display.remove(wreckingBall)
display.remove(whipTarget)
display.remove(bullet1)
display.remove(bullet2)
display.remove(bullet3)
display.remove(bullet4)
display.remove(bullet5)
display.remove(bullet6)
display.remove(baby1)
display.remove(baby2)
display.remove(baby3)
display.remove(spreadLegs)
display.remove(radioWave)
display.remove(radioTarget)
display.remove(phantom)
display.remove(condom)
display.remove(codeine)
display.remove(rum)
display.remove(gunfire)
display.remove(gunfire2)
display.remove(blueGlow)
display.remove(yellowGlow)
display.remove(gameSquare)
--display.remove(menuSquare)
display.remove(goBack)
display.remove(levelSquare)
display.remove(addedTime)
display.remove(thisLevel)
display.remove(creep)
display.remove(fart)
display.remove(haze)
display.remove(angryMan)

	shootingGunActive = false
	jetEngineFiring = false
	liqActive = false
	drunkEngineAttached =false
	mollySpeed = false
	syrupEngineAttached = false
	bombActive = false
	wreckingBallActive =false
	wholeActive=false
	syrupActive=false
	protectActive =false
	liqActive=false

	about:addEventListener("touch",startAbout) 
	clearButtonOne:addEventListener("touch", clearer)
	bonuses:addEventListener("touch", startBonuses)
	level1:addEventListener("touch", startLevel1)
	level2:addEventListener ("touch", startLevel2)
	level3:addEventListener ("touch", startLevel3)
	level4:addEventListener ("touch", startLevel4)
    level5:addEventListener ("touch", startLevel5)
	level6:addEventListener ("touch", startLevel6)
	level7:addEventListener ("touch", startLevel7)
	level8:addEventListener ("touch", startLevel8)
	level9:addEventListener ("touch", startLevel9)
	level10:addEventListener ("touch", startLevel10)
	level11:addEventListener ("touch", startLevel11)
	level12:addEventListener ("touch", startLevel12)
	level13:addEventListener ("touch", startLevel13)
	level14:addEventListener ("touch", startLevel14)
	level15:addEventListener ("touch", startLevel15)
	level16:addEventListener ("touch", startLevel16)
	level17:addEventListener ("touch", startLevel17)
	level18:addEventListener ("touch", startLevel18)
	level19:addEventListener ("touch", startLevel19)
	level20:addEventListener ("touch", startLevel20)
	level21:addEventListener ("touch", startLevel21)
	level22:addEventListener ("touch", startLevel22)
	level23:addEventListener ("touch", startLevel23)
	level24:addEventListener ("touch", startLevel24)
	level25:addEventListener ("touch", startLevel25)
	level26:addEventListener ("touch", startLevel26)
	level27:addEventListener ("touch", startLevel27)
	level28:addEventListener ("touch", startLevel28)
	level29:addEventListener ("touch", startLevel29)
	level30:addEventListener ("touch", startLevel30)
	level31:addEventListener ("touch", startLevel31)
	level32:addEventListener ("touch", startLevel32)
	level33:addEventListener ("touch", startLevel33)
	level34:addEventListener ("touch", startLevel34)
	level35:addEventListener ("touch", startLevel35)
	level36:addEventListener ("touch", startLevel36)
	level37:addEventListener ("touch", startLevel37)
	level38:addEventListener ("touch", startLevel38)
	level39:addEventListener ("touch", startLevel39)
	level40:addEventListener ("touch", startLevel40)
	level41:addEventListener ("touch", startLevel41)
	level42:addEventListener ("touch", startLevel42)
	level43:addEventListener ("touch", startLevel43)
	level44:addEventListener ("touch", startLevel44)
	level45:addEventListener ("touch", startLevel45)
	level46:addEventListener ("touch", startLevel46)
	level47:addEventListener ("touch", startLevel47)
	level48:addEventListener ("touch", startLevel48)
	level49:addEventListener ("touch", startLevel49)
	level50:addEventListener ("touch", startLevel50)
	
	--storyboard.purgeScene("bonusesScene")
	storyboard.purgeScene("restart")
	--storyboard.purgeScene("games01")
	storyboard.purgeScene("games02")
	storyboard.purgeScene("games03")
	storyboard.purgeScene("games04")
	storyboard.purgeScene("games05")
	storyboard.purgeScene("games06")
	storyboard.purgeScene("games07")
	storyboard.purgeScene("games08")
	storyboard.purgeScene("games09")
	storyboard.purgeScene("games010")
	storyboard.purgeScene("games011")
	storyboard.purgeScene("games12")
	storyboard.purgeScene("games13")
	storyboard.purgeScene("games14")
	storyboard.purgeScene("games15")
	storyboard.purgeScene("gamess16")
	storyboard.purgeScene("games17")
	storyboard.purgeScene("games18")
	storyboard.purgeScene("games19")
	storyboard.purgeScene("games20")
	storyboard.purgeScene("games21")
	storyboard.purgeScene("games22")
	storyboard.purgeScene("games23")
	storyboard.purgeScene("games24")
	storyboard.purgeScene("games25")
	storyboard.purgeScene("games26")
	storyboard.purgeScene("games27")
	storyboard.purgeScene("games28")
	storyboard.purgeScene("games29")
	storyboard.purgeScene("games30")
	storyboard.purgeScene("games31")
	storyboard.purgeScene("games32")
	storyboard.purgeScene("games33")
	storyboard.purgeScene("games34")
	storyboard.purgeScene("games35")
	storyboard.purgeScene("games36")
	storyboard.purgeScene("games37")
	storyboard.purgeScene("games38")
	storyboard.purgeScene("games39")
	storyboard.purgeScene("games40")
	storyboard.purgeScene("games41")
	storyboard.purgeScene("games42")
	storyboard.purgeScene("games43")
	storyboard.purgeScene("games44")
	storyboard.purgeScene("games45")
	storyboard.purgeScene("games46")
	storyboard.purgeScene("games47")
	storyboard.purgeScene("games48")
	storyboard.purgeScene("games49")
	storyboard.purgeScene("games50")


superHighScore =sfx.highestLevel

			newScore = achieveScore.load()
		
		if newScore then
			achieveScore.set(newScore)
		end
		if newScore == nil then
			newScore = 0
		end

			
function burgundy()

		if superHighScore > newScore then--if sfx.highestLevel > achieveScore.load()
			newLevelUnlocked = timer.performWithDelay(100, function (aBunchShit)
				audio.play(happy)
				end, 1)
			--last
			newScore = superHighScore
			achieveScore.set(newScore)
			achieveScore.save()
			sparkle.alpha =1
			sparkle:play()

			workingScore = workingScore+1 -- rip out the newScore conditionals above and put them at the top in no mans land
			--then use newScore as one of the || in the progression section (since newScore seems to be the only thing working)
		end
end


timer.performWithDelay(1000, burgundy, 1)

end



function scene:exitScene(event) 
	--audio.stop()
	backgroundActive =false
	timer.cancel(moveAllLevels)
	timer.cancel(moveBack2)
	--ads.hide()
	
	about:removeEventListener("touch", startAbout) 
	bonuses:removeEventListener("touch", startBonuses)
	level1:removeEventListener("touch", startLevel1)
	level2:removeEventListener ("touch", startLevel2)
	level3:removeEventListener ("touch", startLevel3)
	level4:removeEventListener ("touch", startLevel4)
	level5:removeEventListener ("touch", startLevel5)
	level6:removeEventListener ("touch", startLevel6)
	level7:removeEventListener ("touch", startLevel7)
	level8:removeEventListener ("touch", startLevel8)
	level9:removeEventListener ("touch", startLevel9)
	level10:removeEventListener ("touch", startLevel10)
	level11:removeEventListener ("touch", startLevel11)
	level12:removeEventListener ("touch", startLevel12)
	level13:removeEventListener ("touch", startLevel13)
	level14:removeEventListener ("touch", startLevel14)
	level15:removeEventListener ("touch", startLevel15)
	level16:removeEventListener ("touch", startLevel16)
	level17:removeEventListener ("touch", startLevel17)
	level18:removeEventListener ("touch", startLevel18)
	level19:removeEventListener ("touch", startLevel19)
	level20:removeEventListener ("touch", startLevel20)
	level21:removeEventListener ("touch", startLevel21)
	level22:removeEventListener ("touch", startLevel22)
	level23:removeEventListener ("touch", startLevel23)
	level24:removeEventListener ("touch", startLevel24)
	level25:removeEventListener ("touch", startLevel25)
	level26:removeEventListener ("touch", startLevel26)
	level27:removeEventListener ("touch", startLevel27)
	level28:removeEventListener ("touch", startLevel28)
	level29:removeEventListener ("touch", startLevel29)
	level30:removeEventListener ("touch", startLevel30)
	level31:removeEventListener ("touch", startLevel31)
	level32:removeEventListener ("touch", startLevel32)
	level33:removeEventListener ("touch", startLevel33)
	level34:removeEventListener ("touch", startLevel34)
	level35:removeEventListener ("touch", startLevel35)
	level36:removeEventListener ("touch", startLevel36)
	level37:removeEventListener ("touch", startLevel37)
	level38:removeEventListener ("touch", startLevel38)
	level39:removeEventListener ("touch", startLevel39)
	level40:removeEventListener ("touch", startLevel40)
	level41:removeEventListener ("touch", startLevel41)
	level42:removeEventListener ("touch", startLevel42)
	level43:removeEventListener ("touch", startLevel43)
	level44:removeEventListener ("touch", startLevel44)
	level45:removeEventListener ("touch", startLevel45)
	level46:removeEventListener ("touch", startLevel46)
	level47:removeEventListener ("touch", startLevel47)
	level48:removeEventListener ("touch", startLevel48)
	level49:removeEventListener ("touch", startLevel49)
	level50:removeEventListener ("touch", startLevel50)

end

function scene:destroyScene(event) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene