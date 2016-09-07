local storyboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )

socialScore  = require( "score" )
 sfx.socialText = socialScore.init({
	fontSize = 30,
	font = "Helvetica",
	x = 30,
	y = -110,
	maxDigits = 7,
	leadingZeros = false,
	filename = "socialScore.txt",
	})
	
	if sfx.socialBool == nil then 
	sfx.socialBool = 0
	end
	
	function buttonClicked (event)
	if event.phase =="ended" then 
	sfx.socialBool = 1
	socialScore.set(sfx.socialBool)
	socialScore.save()
	end
	return true
	end
	
	 widget = require( "widget" )


local function scrollListener( event )

    local myPhase = event.phase
    
    return true
end



local isSimulator = "simulator" == system.getInfo( "environment" )


widget.setTheme( "widget_theme_ios7" )
-- This is the name of the native popup to show, in this case we are showing the "social" popup
local popupName = "social"





function scene:createScene(event) 
	 local screenGroup2 = self.view

	 myScrollView2 = widget.newScrollView
{
    top = 0,
    left = 0,
    width = display.contentWidth,
    height = display.contentHeight,
    listener = scrollListener,
	horizontalScrollDisabled =true,
	backgroundColor = { 0, 0,0},
	friction =.5
}
	 
	menusquareB = display.newImage("gameSquare.png")
	menusquareB.x = 130
	menusquareB.yScale = .2
	menusquareB.xScale = .2
	menusquareB.y = 30
	menusquareB.rotation = 90
	--menusquareB.alpha = .8
	myScrollView2:insert(menusquareB)
	goBackB = display.newText( "Back", 115, 23, native.systemFont, 16)
	goBackB:setTextColor( 190, 300, 300 )
	myScrollView2:insert(goBackB)
	-- menusquareB.alpha =0
	-- goBackB.alpha =0



	storeSquare = display.newImage("gameSquare.png")
	storeSquare.x = 280
	storeSquare.yScale = .2
	storeSquare.xScale = .2
	storeSquare.y = 30
	storeSquare.rotation = 90
	--menusquareB.alpha = .8
	myScrollView2:insert(storeSquare)
	goShop = display.newText( "SHOP", 260, 25, native.systemFont, 16)
	goShop:setTextColor( 190, 300, 300 )
	myScrollView2:insert(goShop)



	
	infoSquare = display.newImage("gameSquare.png")
	infoSquare.x = 230
	infoSquare.yScale = .25
	infoSquare.xScale = .2
	infoSquare.y = 160
	infoSquare.rotation = 90
	infoSquare.alpha = .5
	info = display.newText( "Info", 220, 155, native.systemFont, 16)
	info.alpha =.6
	info:setTextColor( 190, 300, 300 )



	socialShare = display.newImage("gameSquare.png")
	socialShare.x = 225
	socialShare.yScale = .65
	socialShare.xScale = .25
	socialShare.y = 95
	socialShare.rotation = 90
	social = display.newText( "Social Share", 190, 90, native.systemFont, 17)
	social:setTextColor( 190, 300, 300 )
	myScrollView2:insert(socialShare)
	myScrollView2:insert(social)


-- if ( system.getInfo( "platformName" ) == "iPhone OS" ) then

-- 	facebookSquare= display.newImage("gameSquare.png")
-- 	facebookSquare.x = 25
-- 	facebookSquare.yScale = .65
-- 	facebookSquare.xScale = .25
-- 	facebookSquare.y = 95
-- 	facebookSquare.rotation = 90
-- 	facebookText = display.newText( "Facebook", 35, 90, native.systemFont, 17)
-- 	facebookText:setTextColor( 190, 300, 300 )
-- 	myScrollView2:insert(facebookSquare)
-- 	myScrollView2:insert(facebook)

-- 	twitterSquare= display.newImage("gameSquare.png")
-- 	twitterSquare.x = 25
-- 	twitterSquare.yScale = .65
-- 	twitterSquare.xScale = .25
-- 	facebookSquare.y = 95
-- 	facebookSquare.rotation = 90
-- 	facebookText = display.newText( "Facebook", 35, 90, native.systemFont, 17)
-- 	facebookText:setTextColor( 190, 300, 300 )
-- 	myScrollView2:insert(facebookSquare)
-- 	myScrollView2:insert(facebook)

-- 	end

	movieSquare1 = display.newImage("gameSquare.png")
	if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare1.x = 1430 
else
movieSquare1.x = 1430 
end
	movieSquare1.yScale = .20
	movieSquare1.xScale = .15
	movieSquare1.y = 25
	movieSquare1.rotation = 90
		if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare1Text = display.newText( "Movie 1", 1410, 20, native.systemFont, 13)
else
movieSquare1Text = display.newText( "Movie 1", 1410, 20, native.systemFont, 13)
end
	
	movieSquare1Text.alpha =1
	movieSquare1Text:setTextColor( 190, 300, 300 )

	movieSquare2 = display.newImage("gameSquare.png")
	if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare2.x = 1430 
else
movieSquare2.x = 1430 
end
	movieSquare2.yScale = .20
	movieSquare2.xScale = .15
	movieSquare2.y = 60
	movieSquare2.rotation = 90
	movieSquare2.alpha = .2
			if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare2Text = display.newText( "Movie 2", 1410, 20, native.systemFont, 13)
else
movieSquare2Text = display.newText( "Movie 2", 1410, 55, native.systemFont, 13)
end
	movieSquare2Text.alpha =.2
	movieSquare2Text:setTextColor( 190, 300, 300 )

	movieSquare3 = display.newImage("gameSquare.png")
		if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare3.x = 1430 
else
movieSquare3.x = 1430 
end
	movieSquare3.yScale = .20
	movieSquare3.xScale = .15
	movieSquare3.y = 95
	movieSquare3.rotation = 90
	movieSquare3.alpha =.2
			if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare3Text = display.newText( "Movie 3", 1410, 20, native.systemFont, 13)
else
movieSquare3Text = display.newText( "Movie 3", 1410, 90, native.systemFont, 13)
end
	movieSquare3Text.alpha =.2
	movieSquare3Text:setTextColor( 190, 300, 300 )

	movieSquare4 = display.newImage("gameSquare.png")
		if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare4.x = 1430 
else
movieSquare4.x = 1430 
end
	movieSquare4.yScale = .20
	movieSquare4.xScale = .15
	movieSquare4.y = 130
	movieSquare4.rotation = 90
	movieSquare4.alpha =.2
			if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare4Text = display.newText( "Movie 4", 1410, 20, native.systemFont, 13)
else
movieSquare4Text = display.newText( "Movie 4", 1410, 125, native.systemFont, 13)
end
	movieSquare4Text.alpha =.2
	movieSquare4Text:setTextColor( 190, 300, 300 )

	movieSquare5 = display.newImage("gameSquare.png")
		if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare5.x = 1430 
else
movieSquare5.x = 1430 
end
	movieSquare5.yScale = .20
	movieSquare5.xScale = .15
	movieSquare5.y = 165
	movieSquare5.rotation = 90
	movieSquare5.alpha = .2
			if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare5Text = display.newText( "Movie 5", 1410, 20, native.systemFont, 13)
else
movieSquare5Text = display.newText( "Movie 5", 1410, 160, native.systemFont, 13)
end
	movieSquare5Text.alpha =.2
	movieSquare5Text:setTextColor( 190, 300, 300 )

	movieSquare6 = display.newImage("gameSquare.png")
		if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare6.x = 1430 
else
movieSquare6.x = 1430 
end
	movieSquare6.yScale = .20
	movieSquare6.xScale = .15
	movieSquare6.y = 200
	movieSquare6.rotation = 90
	movieSquare6.alpha = .2
			if ( system.getInfo( "platformName" ) == "iPhone OS" ) then
	movieSquare6Text = display.newText( "Movie 6", 1410, 20, native.systemFont, 13)
else
movieSquare6Text = display.newText( "Movie 6", 1410, 195, native.systemFont, 13)
end
	movieSquare6Text.alpha =.2
	movieSquare6Text:setTextColor( 190, 300, 300 )

   function onShareButtonReleased( event )
   	if event.phase == "began" then
	local serviceName = event.target.id
	local isAvailable = native.canShowPopup( popupName, serviceName )

	-- For demonstration purposes, we set isAvailable to true here for Android.
	if "Android" == system.getInfo( "platformName" ) then
	---	isAvailable = true
	end

	-- If it is possible to show the popup
	--if isAvailable then
		local listener = {}
		function listener:popup( event )
			print( "name(" .. event.name .. ") type(" .. event.type .. ") action(" .. tostring(event.action) .. ") limitReached(" .. tostring(event.limitReached) .. ")" )			
		end
		
		local options = {}
		options.service = serviceName
		options.listener = listener
		
			options.message = "Download DEVIN DANGER, the crazy action game in the App or Play store, Free! #DevinDanger"

			options.url = { "http://benyemi.wix.com/devindanger" }

			options.image = {
				{ filename = "officialAd.jpg", baseDir = system.ResourceDirectory },
			}

		native.showPopup( popupName, options )
	else
		if isSimulator then
			native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the Xcode simulator", { "OK" } )
		else
			-- Popup isn't available.. Show error message
			native.showAlert( "Cannot send message.", "Please setup your " .. serviceName .. " account or check your network connection. This may mean that the app (ie Twitter) is not installed on the device)", { "OK" } )
		end
	--end
  end
end

-- Use the share intent on Android to get any platform we could want
if ( system.getInfo( "platformName" ) == "Android" ) then
	--Create a background to go behind our widget buttons
	print("do nothing right now")
	-- local buttonBackground = display.newRect( display.contentCenterX, display.contentHeight - 25, 220, 50 )
	-- buttonBackground:setFillColor( 0 )
	
	-- -- Create a share button
	-- local shareButton = widget.newButton
	-- {
	-- 	id = "share",
	-- 	left = 0,
	-- 	top = 130,
	-- 	width = 240,
	-- 	label = "Share Game",
	-- 	onRelease = onShareButtonReleased,
	-- }
	-- shareButton.x = display.contentCenterX
	elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
 -- We're on iOS and need a button for each social service we want to support
	-- Create a background to go behind our widget buttons
	local buttonBackground = display.newRect( display.contentCenterX, 80, 20, 00 )
	

	-- Create a facebook button
	-- local facebookButton = widget.newButton
	-- {
	-- 	id = "facebook",
	-- 	left = 50,
	-- 	top = 70,
	-- 	width = 40,
	-- 	label = "Share On Facebook",
	-- 	onRelease = onShareButtonReleased,
	-- }
	
	-- myScrollView2:insert(facebookButton)

	-- -- Create a twitter button
	-- local twitterButton = widget.newButton
	-- {
	-- 	id = "twitter",
	-- 	left = 250,
	-- 	top = 70,
	-- 	width = 40,
	-- 	label = "Share On Twitter",
	-- 	onRelease = onShareButtonReleased,
	-- }
	
	--myScrollView2:insert(twitterButton)
end




	-- movieFail = display.newText( "WARNING: This is the alpha version of the app, therefore movies will not be working until the end of September", 315, 15, 80, 230, native.systemFont, 8)
	-- movieFail:setTextColor( 190, 300, 300 )
	-- myScrollView2:insert(movieFail)


	basicInfo = display.newText( "The more levels you unlock, the more info will be shown here", 80, 200, native.systemFontBold, 11)
	basicInfo:setTextColor( 190, 300, 300 )
	myScrollView2:insert(basicInfo)
	
	unlockLevel1 = display.newText( "Lvl 1 Unlocks: Twerking Powerup - Strong. Makes you invicible to all enemies", 0, 225, native.systemFont, 9)
	unlockLevel1:setTextColor( 190, 300, 300 )
	myScrollView2:insert(unlockLevel1)
	
	unlockLevel2 = display.newText( "Lvl 2 Unlocks: Wrecking Ball Powerup - Medium. Depending on your movement, use to kill most enemies", 0, 255, native.systemFont, 9)
	unlockLevel2:setTextColor( 190, 300, 300 )
	unlockLevel2.alpha =0
	myScrollView2:insert(unlockLevel2)
	
	unlockLevel4 = display.newText( "Lvl 4 Unlocks: Whipping Powerup - Weak. Use moving whip's target to kill most enemies", 0, 285, native.systemFont, 9)
	unlockLevel4:setTextColor( 190, 300, 300 )
	unlockLevel4.alpha =0
	myScrollView2:insert(unlockLevel4)
	
	unlockLevel7 = display.newText( "Lvl 7 Unlocks: Bomb Powerup - Medium. Use rolling, regenerating Bomb to kill most enemies", 0, 315, native.systemFont, 9)
	unlockLevel7:setTextColor( 190, 300, 300 )
	unlockLevel7.alpha =0
	myScrollView2:insert(unlockLevel7)
	
	unlockLevel8 = display.newText( "Lvl 8 Unlocks: DNA Test Baby Enemies (not yours of course...wink wink)", 0, 345, native.systemFont, 9)
	unlockLevel8:setTextColor( 190, 300, 300 )
	unlockLevel8.alpha =0
	myScrollView2:insert(unlockLevel8)
	
	unlockLevel10 = display.newText( "Lvl 10 Unlocks: Molly Powerup - Medium. Use its 'influence' to gain 70 more yards instantly", 0, 375, native.systemFont, 9)
	unlockLevel10:setTextColor( 190, 300, 300 )
	myScrollView2:insert(unlockLevel10)
	unlockLevel10b = display.newText( "Warning: It gets weaker with each use during the same level", 0, 390, native.systemFont, 9)
	unlockLevel10b:setTextColor( 190, 300, 300 )
	unlockLevel10.alpha =0
	unlockLevel10b.alpha =0
	myScrollView2:insert(unlockLevel10b)
	
	unlockLevel15 = display.newText( "Lvl 15 Unlocks: Fame Powerup - Weak. Use social media to teleport to fame. Warning: difficult to use", 0, 420, native.systemFont, 9)
	unlockLevel15:setTextColor( 190, 300, 300 )
	unlockLevel15.alpha =0
	myScrollView2:insert(unlockLevel15)
	
	unlockLevel16 = display.newText( "Lvl 16 Unlocks: Call enemy. Powerful nerd guy phone enemy. Can ONLY be stopped by Twerk Powerup", 0, 450, native.systemFont, 9)
	unlockLevel16:setTextColor( 190, 300, 300 )
	unlockLevel16.alpha =0
	myScrollView2:insert(unlockLevel16)
	
	unlockLevel19 = display.newText( "Lvl 19 Unlocks: Protect Powerup - Strong. Use moving condom to protect against most enemies", 0, 480, native.systemFont, 9)
	unlockLevel19:setTextColor( 190, 300, 300 )
	unlockLevel19.alpha =0
	myScrollView2:insert(unlockLevel19)
	
	unlockLevel20 = display.newText( "Lvl 20 Unlocks: Pass Gas enemy. Not deadly, but its strong flatulence obscures your vision", 0, 510, native.systemFont, 9)
	unlockLevel20:setTextColor( 190, 300, 300 )
	unlockLevel20.alpha =0
	myScrollView2:insert(unlockLevel20)
	
	unlockLevel24 = display.newText( "Lvl 24 Unlocks: Cough enemy. Not deadly, but uses syrup to slow things down, including your movement", 0, 540, native.systemFont, 9)
	unlockLevel24:setTextColor( 190, 300, 300 )
	unlockLevel24.alpha =0
	myScrollView2:insert(unlockLevel24)
	
	unlockLevel29 = display.newText( "Lvl 29 Unlocks: Hot Juice enemy. Not deadly, but uses alcohol to reverse things, including how you move", 0, 570, native.systemFont, 9)
	unlockLevel29:setTextColor( 190, 300, 300 )
	unlockLevel29.alpha =0
	myScrollView2:insert(unlockLevel29)


	myScrollView2:insert(infoSquare)
	myScrollView2:insert(info)
	myScrollView2:insert(sfx.socialText)
	myScrollView2:insert(movieSquare1)
	myScrollView2:insert(movieSquare1Text)
	myScrollView2:insert(movieSquare2)
	myScrollView2:insert(movieSquare2Text)
	myScrollView2:insert(movieSquare3)
	myScrollView2:insert(movieSquare3Text)
	myScrollView2:insert(movieSquare4)
	myScrollView2:insert(movieSquare4Text)
	myScrollView2:insert(movieSquare5)
	myScrollView2:insert(movieSquare5Text)
	myScrollView2:insert(movieSquare6)
	myScrollView2:insert(movieSquare6Text)
	

	 screenGroup2:insert(myScrollView2)
	 --backSound =audio.loadSound("beep2.mp3")
	 
	 end

	 
function goToMenu (event)
if event.phase == "began" then
storyboard.gotoScene("start", "fade", 200)
end
end


function goToShop (event)
if event.phase == "began" then
if ( "Android" == system.getInfo( "platformName" )) then
storyboard.gotoScene("shopScene", "fade", 200)
else 
	storyboard.gotoScene("appleShop", "fade", 200)
end
end
end

function goToSocial (event)
if event.phase == "began" then
storyboard.gotoScene("socialScene", "fade", 200)
end
end

function goToMovie1 (event)
if event.phase == "began" then
storyboard.gotoScene("movie1", "fade", 200)
end
end

function goToMovie2 (event)
if event.phase == "began" then
storyboard.gotoScene("movie2", "fade", 200)
end
end

function goToMovie3 (event)
if event.phase == "began" then
storyboard.gotoScene("movie3", "fade", 200)
end
end

function goToMovie4 (event)
if event.phase == "began" then
storyboard.gotoScene("movie4", "fade", 200)
end
end

function goToMovie5 (event)
if event.phase == "began" then
storyboard.gotoScene("movie5", "fade", 200)
end
end

function goToMovie6 (event)
if event.phase == "began" then
storyboard.gotoScene("movie6", "fade", 200)
end
end

	function scene:enterScene(event) 

	menusquareB:addEventListener("touch", goToMenu)
	storeSquare:addEventListener("touch", goToShop)
	if "Android" == system.getInfo( "platformName" ) then
socialShare:addEventListener("touch", onShareButtonReleased)
	else
	socialShare:addEventListener("touch", goToSocial)
end
movieSquare1:addEventListener("touch", goToMovie1)
movieSquare2:addEventListener("touch", goToMovie2)
movieSquare3:addEventListener("touch", goToMovie3)
movieSquare4:addEventListener("touch", goToMovie4)
movieSquare5:addEventListener("touch", goToMovie5)
movieSquare6:addEventListener("touch", goToMovie6)
	


	
	if sfx.highestLevel >=2 then 
	unlockLevel2.alpha =1
	end
		
	if sfx.highestLevel >=4 then 
	unlockLevel4.alpha =1
	end
		
	if sfx.highestLevel >=7 then 
	unlockLevel7.alpha =1
	end
		
	if sfx.highestLevel >=8 then 
	unlockLevel8.alpha =1
	end
		
	if sfx.highestLevel >=10 then 
	unlockLevel10.alpha =1
	end
	
	if sfx.highestLevel >=10 then 
	unlockLevel10b.alpha =1
	end

	if sfx.highestLevel >=13 then 
	movieSquare2.alpha = 1
	movieSquare2Text.alpha =1
	end
		
	if sfx.highestLevel >=15 then 
	unlockLevel15.alpha =1
	end
		
	if sfx.highestLevel >=16 then 
	unlockLevel16.alpha =1
	end
		
	if sfx.highestLevel >=19 then 
	unlockLevel19.alpha =1
	end
		
	if sfx.highestLevel >=20 then 
	unlockLevel20.alpha =1
	end
		
	if sfx.highestLevel >=24 then 
	unlockLevel24.alpha =1
	end

	if sfx.highestLevel >=27 then 
	movieSquare3.alpha = 1
	movieSquare3Text.alpha =1
	end
	
	if sfx.highestLevel >=29 then 
	unlockLevel29.alpha =1
	end

	if sfx.highestLevel >=36 then 
	movieSquare4.alpha = 1
	movieSquare4Text.alpha =1
	end

	if sfx.highestLevel >=42 then 
	movieSquare5.alpha = 1
	movieSquare5Text.alpha =1
	end

		if sfx.highestLevel >=51 then 
	movieSquare6.alpha = 1
	movieSquare6Text.alpha =1
	end
	
	end
	
	function scene:exitScene(event) 
	menusquareB:removeEventListener("touch", goToMenu)
	storeSquare:removeEventListener("touch", goToShop)
	movieSquare1:removeEventListener("touch", goToMovie1)
	movieSquare2:removeEventListener("touch", goToMovie2)
	movieSquare3:removeEventListener("touch", goToMovie3)
	movieSquare4:removeEventListener("touch", goToMovie4)
	movieSquare5:removeEventListener("touch", goToMovie5)
	movieSquare6:removeEventListener("touch", goToMovie6)


	if "Android" == system.getInfo( "platformName" ) then
	socialShare:removeEventListener("touch", onShareButtonReleased)
	else
	socialShare:removeEventListener("touch", goToSocial)
	end
	end
	
	function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
	 