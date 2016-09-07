
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

sfx = require( "sfx" )
--forward declare the handle
sfx.soundtrack = nil


--background city scape
function scene:createScene(event) 
	 local screenGroup = self.view -- screengroup is just a var, self.view is what actually creates the screengroup
	 
	
	background = display.newImage("start.png")
	background.xScale = 1.2
	level1= display.newRoundedRect( 50, 110, 50, 50, 5 )
	level1:setFillColor( 100,0,200 )
	level2= display.newRoundedRect( 105, 110, 50, 50, 5 )
	level2:setFillColor (100,200,0)
	level3= display.newRoundedRect( 160, 110, 50, 50, 5 )
	level3:setFillColor (100,100,0)
	level4= display.newRoundedRect( 215, 110, 50, 50, 5 )
	level4:setFillColor (100,200,170)
	level5= display.newRoundedRect( 270, 110, 50, 50, 5 )
	level5:setFillColor (100,100,190)
	level6= display.newRoundedRect( 325, 110, 50, 50, 5 )
	level6:setFillColor (200,100,190)
	level7= display.newRoundedRect( 380, 110, 50, 50, 5 )
	level7:setFillColor (20,150,190)
	level8= display.newRoundedRect( 50, 170, 50, 50, 5 )
	level8:setFillColor (20,50,90)
	level9= display.newRoundedRect( 105, 170, 50, 50, 5 )
	level9:setFillColor (120,150,190)
	level10= display.newRoundedRect( 160, 170, 50, 50, 5 )
	level10:setFillColor (102,10,19)
	level11= display.newRoundedRect( 215, 170, 50, 50, 5 )
	level11:setFillColor (202,110,119)
	level12= display.newRoundedRect( 270, 170, 50, 50, 5 )
	level12:setFillColor (202,10,19)
	level13= display.newRoundedRect( 325, 170, 50, 50, 5 )
	level13:setFillColor (52,50,159)
	level14= display.newRoundedRect( 380, 170, 50, 50, 5 )
	level14:setFillColor (152,50,159)
	level15= display.newRoundedRect( 50, 230, 50, 50, 5 )
	level15:setFillColor (52,1,159)
	level16= display.newRoundedRect( 105, 230, 50, 50, 5 )
	level16:setFillColor (252,201,59)
	level17= display.newRoundedRect( 160, 230, 50, 50, 5 )
	level17:setFillColor (1,201,59)
	level18= display.newRoundedRect( 215, 230, 50, 50, 5 )
	level18:setFillColor (1,21,59)
	level19= display.newRoundedRect( 270, 230, 50, 50, 5 )
	level19:setFillColor (1,201,179)
	level20= display.newRoundedRect( 325, 230, 50, 50, 5 )
	level20:setFillColor (72,21,59)
	level21= display.newRoundedRect( 380, 230, 50, 50, 5 )
	level21:setFillColor (1,21,179)
	
	
		myText1 = display.newText( "Level 1", 50,120, native.systemFontBold, 13)
		myText2= display.newText("Level 2", 105, 120, native.systemFontBold, 13)
		myText3= display.newText("Level 3", 160, 120, native.systemFontBold, 13)
		myText4= display.newText("Level 4", 215, 120, native.systemFontBold, 13)
		myText5= display.newText("Level 5", 270, 120, native.systemFontBold, 13)
		myText6= display.newText("Level 6", 325, 120, native.systemFontBold, 13)
		myText7= display.newText("Level 7", 380, 120, native.systemFontBold, 13)
		myText8= display.newText( "Level 8", 50, 190, native.systemFontBold, 13)
		myText9= display.newText("Level 9", 105, 190, native.systemFontBold, 13)
		myText10=display.newText("Level 10",160, 190, native.systemFontBold, 13)
		myText11=display.newText("Level 11",215, 190, native.systemFontBold, 13)
		myText12=display.newText("Level 12",270, 190, native.systemFontBold, 13)
		myText13=display.newText("Level 13",325, 190, native.systemFontBold, 13)
		myText14=display.newText("Level 14",380, 190, native.systemFontBold, 13)
		myText15=display.newText("Level 15", 50, 250, native.systemFontBold, 13)
		myText16=display.newText("Level 16",105, 250, native.systemFontBold, 13)
		myText17=display.newText("Level 17",160, 250, native.systemFontBold, 13)
		myText18=display.newText("Level 18",215, 250, native.systemFontBold, 13)
		myText19=display.newText("Level 19",270, 250, native.systemFontBold, 13)
		myText20=display.newText("Level 20",325, 250, native.systemFontBold, 13)
		myText21=display.newText("Level 21",380, 250, native.systemFontBold, 13)
		
	city2 = display.newImage("city2.png")
	city2:setReferencePoint(display.BottomLeftReferencePoint)
	city2.x= -50	
	city2.y= 320
	city2.xScale = 1.2
	city2.yScale = 1.3
	
	screenGroup:insert(background) --must add insert:[whatever] when doing storyboard and using graphics
	screenGroup:insert(city2)
	screenGroup:insert (level1)
	screenGroup:insert (level2)
	screenGroup:insert (level3)
	screenGroup:insert (level4)
	screenGroup:insert (level5)
	screenGroup:insert (level6)
	screenGroup:insert (level7)
	screenGroup:insert (level8)
	screenGroup:insert (level9)
	screenGroup:insert (level10)
	screenGroup:insert (level11)
	screenGroup:insert (level12)
	screenGroup:insert (level13)
	screenGroup:insert (level14)
	screenGroup:insert (level15)
	screenGroup:insert (level16)
	screenGroup:insert (level17)
	screenGroup:insert (level18)
	screenGroup:insert (level19)
	screenGroup:insert (level20)
	screenGroup:insert (level21)
	--myText = {}
		-- for i=1, 8, 1 do 
		-- screenGroup:insert(level..i)
		-- end
	screenGroup:insert(myText1)
	screenGroup:insert(myText2)
	screenGroup:insert(myText3)
	screenGroup:insert(myText4)
	screenGroup:insert(myText5)
	screenGroup:insert(myText6)
	screenGroup:insert(myText7)
	screenGroup:insert(myText8)
	screenGroup:insert(myText9)
	screenGroup:insert(myText10)
	screenGroup:insert(myText11)
	screenGroup:insert(myText12)
	screenGroup:insert(myText13)
	screenGroup:insert(myText14)
	screenGroup:insert(myText15)
	screenGroup:insert(myText16)
	screenGroup:insert(myText17)
	screenGroup:insert(myText18)
	screenGroup:insert(myText19)
	screenGroup:insert(myText20)
	screenGroup:insert(myText21)

end


function startLevel1 (event)
if event.phase == "began" then
storyboard.gotoScene("games01", "fade", 200)
print("level 1 clicked")
end
return true
end
function startLevel2 (event)
if event.phase == "began" then
storyboard.gotoScene("games02", "fade", 200)
end
end
function startLevel3 (event)
if event.phase == "began" then
storyboard.gotoScene("games03", "fade", 200)
end
end
function startLevel4 (event)
if event.phase == "began" then
storyboard.gotoScene("games04", "fade", 200)
end
end
function startLevel5 (event)
if event.phase == "began" then
storyboard.gotoScene("games05", "fade", 200)
end
end
function startLevel6 (event)
if event.phase == "began" then
storyboard.gotoScene("games06", "fade", 200)
end
end
function startLevel7 (event)
if event.phase == "began" then
storyboard.gotoScene("games07", "fade", 200)
end
end
function startLevel8 (event)
if event.phase == "began" then
storyboard.gotoScene("games08", "fade", 200)
end
end
function startLevel9 (event)
if event.phase == "began" then
storyboard.gotoScene("games09", "fade", 200)
end
end
function startLevel10 (event)
if event.phase == "began" then
storyboard.gotoScene("games010", "fade", 200)
end
end
function startLevel11 (event)
if event.phase == "began" then
storyboard.gotoScene("games011", "fade", 200)
end
end
function startLevel12 (event)
if event.phase == "began" then
storyboard.gotoScene("games12", "fade", 200)
print("level 12 clicked")
end
end

function startLevel13 (event)
if event.phase == "began" then
storyboard.gotoScene("games13", "fade", 200)
print("level 13 clicked")
end
end
function startLevel14 (event)
if event.phase == "began" then
storyboard.gotoScene("games14", "fade", 200)
print("level 14 clicked")
end
end
function startLevel15 (event)
if event.phase == "began" then
storyboard.gotoScene("games15", "fade", 200)
print("level 15 clicked")
end
end
function startLevel16 (event)
if event.phase == "began" then
storyboard.gotoScene("gamess16", "fade", 200)
print("level 16 clicked")
end
end
function startLevel17 (event)
if event.phase == "began" then
storyboard.gotoScene("games17", "fade", 200)
print("level 17 clicked")
end
end
function startLevel18 (event)
if event.phase == "began" then
storyboard.gotoScene("games18", "fade", 200)
print("level 16 clicked")
end
end
function startLevel19 (event)
if event.phase == "began" then
storyboard.gotoScene("games19", "fade", 200)
print("level 16 clicked")
end
end
function startLevel20 (event)
if event.phase == "began" then
storyboard.gotoScene("games20", "fade", 200)
print("level 16 clicked")
end
end
function startLevel21 (event)
if event.phase == "began" then
storyboard.gotoScene("games21", "fade", 200)
print("level 16 clicked")
end
end





function scene:enterScene(event) 

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
	
	level14:addEventListener ("touch", startLevel14)
	level15:addEventListener ("touch", startLevel15)
	level16:addEventListener ("touch", startLevel16)
	level17:addEventListener ("touch", startLevel17)
	level18:addEventListener ("touch", startLevel18)
	level19:addEventListener ("touch", startLevel19)
	level20:addEventListener ("touch", startLevel20)
	level21:addEventListener ("touch", startLevel21)
	
	storyboard.purgeScene("restart")
	storyboard.purgeScene("games01")
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
	
	sfx.highestLevel = 0
	--loadhighestLevel and set it to sfx.highestLevel and set it to current level
	
	--after beating a level and coming back here, then if highest level < current, show a flash screen of what was just unlocked and set highest = new current level and save
	
	-- if sfx.currentLevel == nil
	-- then sfx.currentLevel =1
	-- end
	
	--if sfx.currentLevel > 12 then 
--this should really be highest. will change when implement save feature
	level13:addEventListener ("touch", startLevel13)
	--end

	
	audio.stop()
	sfx.songFastIsPlaying = false
	sfx.songYeahIsPlaying = false
end

function scene:exitScene(event) 
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

end

function scene:destroyScene(event) 
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene