
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

-- if (sfx.freeShowAds == nil) then
-- sfx.freeShowAds =1
-- end 

if  (sfx.freeShowAds ~= 0) then
sfx.freeShowAds =1
	end

local provider = "admob"
-- Your application ID

local appIDBanner = "ca-app-pub-3207741469158378/6876432840"  --for your iOS interstitial
if ( system.getInfo( "platformName" ) == "Android" ) then
    appIDBanner = "ca-app-pub-3207741469158378/8914282444"  --for your Android interstitial
end

-- local appIDBanner = "ca-app-pub-3207741469158378/8914282444"
--  	"ca-app-pub-3207741469158378/6876432840"
-- Load Corona 'ads' library
 sfx.ads = require "ads"



--background city scape
function scene:createScene(event) 
	
	local screenGroup = self.view -- screengroup is just a var, self.view is what actually creates the screengroup
	
	background = display.newImage("restart.png")
	screenGroup:insert(background) --must add insert:[whatever] when doing storyboard and using graphics
	
	city2 = display.newImage("city2.png")
	city2:setReferencePoint(display.BottomLeftReferencePoint)
	city2.x= 0	
	city2.y= 260
	screenGroup:insert(city2)

	advertSuggestSquare = display.newImage("gameSquare.png")
	advertSuggestSquare.x = 250
	advertSuggestSquare.yScale = 1.4
	advertSuggestSquare.xScale = .2
	advertSuggestSquare.y = 158
	advertSuggestSquare.rotation = 90
	advertSuggestSquare.alpha = 0
	screenGroup:insert(advertSuggestSquare)

	advertText = display.newText( "Get rid of annoying ads, Click Shopping and Bonuses", 97, 153, native.systemFont, 12)
	advertText:setFillColor( 190, 300, 300 )
	advertText.alpha = 0
	screenGroup:insert(advertText)


	missleSuggestSquare = display.newImage("gameSquare.png")
	missleSuggestSquare.x = 250
	missleSuggestSquare.yScale = 1.4
	missleSuggestSquare.xScale = .2
	missleSuggestSquare.y = 198
	missleSuggestSquare.rotation = 90
	missleSuggestSquare.alpha = 0
	screenGroup:insert(missleSuggestSquare)

	missleText = display.newText( "You keep losing, Get the invincible missle at the SHOP in Bonuses", 97, 193, native.systemFont, 12)
	missleText:setFillColor( 190, 300, 300 )
	missleText.alpha = 0
	screenGroup:insert(missleText)

	adWarningSquare = display.newImage("gameSquare.png")
	adWarningSquare.x = 250
	adWarningSquare.yScale = 1.4
	adWarningSquare.xScale = .2
	adWarningSquare.y = 118
	adWarningSquare.rotation = 90
	adWarningSquare.alpha = 0
	screenGroup:insert(adWarningSquare)

	adWarningText = display.newText( "Wait Please. Ad is Loading :-/", 167, 113, native.systemFont, 12)
	adWarningText:setFillColor( 190, 300, 300 )
	adWarningText.alpha = 0
	screenGroup:insert(adWarningText)


	function moveLoading (self, event)
	self.rotation = self.rotation + 8
	end
	
	letterboxTop = display.newRect(-50, -55, 600, 50)
	letterboxTop:setFillColor(0,0,0)
	screenGroup:insert(letterboxTop)
	letterboxBottom= display.newRect(-50, 320, 600, 50)
	letterboxBottom:setFillColor(0,0,0)
	screenGroup:insert(letterboxBottom)

end
 

function start (event)
	--if %4 then timer.performwithdelay else just do as normal. this is gonna be hard fyi. work on it asap
if event.phase == "began" then



if sfx.currentLevel ==1  then
storyboard.gotoScene("games01", "fade", 10)
elseif sfx.currentLevel ==2 then
storyboard.gotoScene("games02", "fade", 10)
elseif sfx.currentLevel ==3 then
storyboard.gotoScene("games03", "fade", 10)
elseif sfx.currentLevel ==4 then
storyboard.gotoScene("games04", "fade", 10)
elseif sfx.currentLevel ==5 then
storyboard.gotoScene("games05", "fade", 10)
elseif sfx.currentLevel ==6 then
storyboard.gotoScene("games06", "fade", 10)
elseif sfx.currentLevel ==7 then
storyboard.gotoScene("games07", "fade", 10)
elseif sfx.currentLevel ==8 then
storyboard.gotoScene("games08", "fade", 10)
elseif sfx.currentLevel ==9 then
storyboard.gotoScene("games09", "fade", 10)
elseif sfx.currentLevel ==10 then
storyboard.gotoScene("games010", "fade", 10)
elseif sfx.currentLevel ==11 then
storyboard.gotoScene("games011", "fade", 10)
elseif sfx.currentLevel ==12 then
storyboard.gotoScene("games12", "fade", 10)
elseif sfx.currentLevel ==13 then
storyboard.gotoScene("games13", "fade", 10)
elseif sfx.currentLevel ==14 then
storyboard.gotoScene("games14", "fade", 10)
elseif sfx.currentLevel ==15 then
storyboard.gotoScene("games15", "fade", 10)
elseif sfx.currentLevel ==16 then
storyboard.gotoScene("gamess16", "fade", 10)
elseif sfx.currentLevel ==17 then
storyboard.gotoScene("games17", "fade", 10)
elseif sfx.currentLevel ==18 then
storyboard.gotoScene("games18", "fade", 10)
elseif sfx.currentLevel ==19 then
storyboard.gotoScene("games19", "fade", 10)
elseif sfx.currentLevel ==20 then
storyboard.gotoScene("games20", "fade", 10)
elseif sfx.currentLevel ==21 then
storyboard.gotoScene("games21", "fade", 10)
elseif sfx.currentLevel ==22 then
storyboard.gotoScene("games22", "fade", 10)
elseif sfx.currentLevel ==23 then
storyboard.gotoScene("games23", "fade", 10)
elseif sfx.currentLevel ==24 then
storyboard.gotoScene("games24", "fade", 10)
elseif sfx.currentLevel ==25 then
storyboard.gotoScene("games25", "fade", 10)
elseif sfx.currentLevel ==26 then
storyboard.gotoScene("games26", "fade", 10)
elseif sfx.currentLevel ==27 then
storyboard.gotoScene("games27", "fade", 10)
elseif sfx.currentLevel ==28 then
storyboard.gotoScene("games28", "fade", 10)
elseif sfx.currentLevel ==29 then
storyboard.gotoScene("games29", "fade", 10)
elseif sfx.currentLevel ==30 then
storyboard.gotoScene("games30", "fade", 10)
elseif sfx.currentLevel ==31 then
storyboard.gotoScene("games31", "fade", 10)
elseif sfx.currentLevel ==32 then
storyboard.gotoScene("games32", "fade", 10)
elseif sfx.currentLevel ==33 then
storyboard.gotoScene("games33", "fade", 10)
elseif sfx.currentLevel ==34 then
storyboard.gotoScene("games34", "fade", 10)
elseif sfx.currentLevel ==35 then
storyboard.gotoScene("games35", "fade", 10)
elseif sfx.currentLevel ==36 then
storyboard.gotoScene("games36", "fade", 10)
elseif sfx.currentLevel ==37 then
storyboard.gotoScene("games37", "fade", 10)
elseif sfx.currentLevel ==38 then
storyboard.gotoScene("games38", "fade", 10)
elseif sfx.currentLevel ==39 then
storyboard.gotoScene("games39", "fade", 10)
elseif sfx.currentLevel ==40 then
storyboard.gotoScene("games40", "fade", 10)
elseif sfx.currentLevel ==41 then
storyboard.gotoScene("games41", "fade", 10)
elseif sfx.currentLevel ==42 then
storyboard.gotoScene("games42", "fade", 10)
elseif sfx.currentLevel ==43 then
storyboard.gotoScene("games43", "fade", 10)
elseif sfx.currentLevel ==44 then
storyboard.gotoScene("games44", "fade", 10)
elseif sfx.currentLevel ==45 then
storyboard.gotoScene("games45", "fade", 10)
elseif sfx.currentLevel ==46 then
storyboard.gotoScene("games46", "fade", 10)
elseif sfx.currentLevel ==47 then
storyboard.gotoScene("games47", "fade", 10)
elseif sfx.currentLevel ==48 then
storyboard.gotoScene("games48", "fade", 10)
elseif sfx.currentLevel ==49 then
storyboard.gotoScene("games49", "fade", 10)


else sfx.currentLevel =50
storyboard.gotoScene("games50", "fade", 10)
end
end
print("restart clicked")
return true 
end



function scene:enterScene(event)
display.currentStage.x = 0
display.currentStage.y = 0
audio.stop(machineGunLoop)
	sfx.showAdNow=true

	if sfx.adFrequency == nil then
		sfx.adFrequency = 1
	end

	if sfx.adFrequency % 4 == 0 then 
	if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	adWarningSquare.alpha = 1
	adWarningText.alpha =1
	end
	end

	if sfx.missleSuggest == nil then
		sfx.missleSuggest = 1
	end
	if sfx.adSuggest == nil then
		sfx.adSuggest = 1
	end


	if sfx.missleSuggest %11 ==0 then 
		if sfx.powerGunTrue == 0 then
		missleSuggestSquare.alpha = 1
		missleText.alpha =1
	end
	end

	if sfx.adSuggest %10 ==0 then
		if sfx.freeShowAds ==1 then
		advertText.alpha = 1
		advertSuggestSquare.alpha =1
	end
	end

--if showAdNow == true then

	sfx.ads.load( "interstitial", { appID= appIDBanner } )

--end


 function adListener( event )
	-- event table includes:
	-- 		event.provider
	--		event.isError (e.g. true/false )
	 msg = event.response

	-- just a quick debug message to check what response we got from the library
	print("Message received from the ads library: ", msg)

	if event.isError then
		print ("Error Loading Ad")
		--showAd( "interstitial" )
		
	else if sfx.freeShowAds ==1 or nil then
		--showAd( "interstitial" )
				if ( sfx.ads.isLoaded("interstitial") ) then
					if sfx.showAdNow ==true then
						if sfx.adFrequency % 4 == 0 then 
    			sfx.ads.show("interstitial")
    			sfx.showAdNow = false
    			
    		end
    		end
				end
		--print("Successfully Loaded Ad")
	end
	    if ( event.phase == "shown" ) then
	    	sfx.showAdNow = false
	    	adWarningSquare.alpha =0
	    	adWarningText.alpha =0 
	end
end
end


--if appIDBanner then
	sfx.ads.init( provider, appIDBanner, adListener )
--end

 sysEnv = system.getInfo("environment")

 --showAd = function( adType )

	
	
	--sfx.ads.show( appIDBanner, { x=display.screenOriginX, y=100000, appID= appIDBanner } )


-- if on simulator, let user know they must build for device
if sysEnv == "simulator" then
	print( "Please build for device or Xcode simulator to test this sample.")
else
	-- start with banner ad
	--showAd( "interstitial" )
end

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
	if bombActive then 
		timer.cancel(bombGone)
		bombActive =false
		end
	

timer.cancel(moveAllLevels)
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

if ( (system.getInfo( "platformName" ) == "iPhone OS") and  (sfx.adFrequency % 4 == 0 )) then
	--if sfx.adFrequency % 4 == 0 then 
timer.performWithDelay(2200, function (iphoneStuff)
	background:addEventListener("touch", start)
end, 1)
--end
else
	background:addEventListener("touch", start)

end

end

function scene:exitScene(event) 

	sfx.ads.hide()
	sfx.adFrequency = sfx.adFrequency + 1
	sfx.missleSuggest = sfx.missleSuggest + 1
	sfx.adSuggest = sfx.adSuggest + 1
		adWarningSquare.alpha = 0
	adWarningText.alpha = 0
	--sfx.showAdNow = false
	background:removeEventListener("touch", start)
end


function scene:destroyScene(event) 

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene





