local storyboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )


	
	 widget = require( "widget" )


local function scrollListener( event )
    local myPhase = event.phase
    return true
end


function scene:createScene(event) 
	 local screenGroupAbout = self.view


	menusquareApple = display.newImage("gameSquare.png")
	menusquareApple.x = 60
	menusquareApple.yScale = .2
	menusquareApple.xScale = .2
	menusquareApple.y = 30
	menusquareApple.rotation = 90
	screenGroupAbout:insert(menusquareApple)
	goBackB = display.newText( "Back", 40, 25, native.systemFont, 16)
	goBackB:setTextColor( 190, 300, 300 )
	screenGroupAbout:insert(goBackB)

	menuTwitterSquare = display.newImage("gameSquare.png")
	menuTwitterSquare.yScale = .5
	menuTwitterSquare.xScale = .2
	menuTwitterSquare.y = 200
	menuTwitterSquare.rotation = 90
	menuTwitterSquare.x = display.contentCenterX
	screenGroupAbout:insert(menuTwitterSquare)

	
	





	local isSimulator = "simulator" == system.getInfo( "environment" )

if isSimulator then
	native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or Xcode simulator", { "OK" } )
end

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- Require the widget library
local widget = require( "widget" )

-- Use the iOS 7 theme for this sample
widget.setTheme( "widget_theme_ios7" )

-- This is the name of the native popup to show, in this case we are showing the "social" popup
local popupName = "social"

-- Display a background
local background = display.newImage( "officialAd.jpg", display.contentCenterX, display.contentCenterY, true )
background.xScale = .5
background.yScale = .5

-- Display some text
local achivementText = display.newText --( "You saved the planet!\n\nTouch any of the buttons below to share your victory with your friends!", 12, 10, display.contentWidth - 20, 0, native.systemFontBold, 18 )
{
	text = "Don't be selfish!\nShare this game with all your friends on Twitter.",
	x = 50,
	y = 70,
	-- Keep our text field within inner 80% of the screen so that it won't roll off on some devices.
	width = (0.8) * display.contentWidth,
	height = 0,
	font = native.systemFontBold,
	fontSize = 18,
	align = "center",
}
screenGroupAbout:insert(achivementText)

local sendMessage = false
local sendURL = false
local sendImage = false

-- Exectuted upon touching & releasing a widget button
local function onShareButtonReleased( event )
	local serviceName = event.target.id
	local isAvailable = native.canShowPopup( popupName, serviceName )

	-- For demonstration purposes, we set isAvailable to true here for Android.
	if "Android" == system.getInfo( "platformName" ) then
		isAvailable = true
	end

	-- If it is possible to show the popup
	if isAvailable then
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
		

		-- Show the popup
		native.showPopup( popupName, options )
	else
		if isSimulator then
			native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the Xcode simulator", { "OK" } )
		else
			-- Popup isn't available.. Show error message
			native.showAlert( "Cannot send " .. serviceName .. " message.", "Please setup your " .. serviceName .. " account or check your network connection", { "OK" } )
		end
	end
end


-- local function onSwitchPress( event )
--     local switch = event.target
--     print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
--     if switch.id == "message" then
--     	sendMessage = switch.isOn
--     elseif switch.id == "url" then
--     	sendURL = switch.isOn
--     elseif switch.id == "image" then
--     	sendImage = switch.isOn
--     end
-- end

-- Create the checkbox for sending a message
-- local messageCheckbox = widget.newSwitch
-- {
--     left = 50,
--     top = 125,
--     style = "checkbox",
--     id = "message",
--     onPress = onSwitchPress
-- }
-- local messageLabel = display.newText("Send message", messageCheckbox.x + 35, messageCheckbox.y, native.systemFont, 20)
-- messageLabel:setFillColor(1)
-- messageLabel.anchorX = 0

-- -- Create the checkbox for sending a URL
-- local urlCheckbox = widget.newSwitch
-- {
--     left = 50,
--     top = 175,
--     style = "checkbox",
--     id = "url",
--     onPress = onSwitchPress
-- }
-- local urlLabel = display.newText("Send URL", urlCheckbox.x + 35, urlCheckbox.y, native.systemFont, 20)
-- urlLabel:setFillColor(1)
-- urlLabel.anchorX = 0

-- -- Create the checkbox for sending an image
-- local imageCheckbox = widget.newSwitch
-- {
--     left = 50,
--     top = 225,
--     style = "checkbox",
--     id = "image",
--     onPress = onSwitchPress
-- }
-- local imageLabel = display.newText("Send Image", imageCheckbox.x + 35, imageCheckbox.y, native.systemFont, 20)
-- imageLabel:setFillColor(1)
-- imageLabel.anchorX = 0


-- Use the share intent on Android to get any platform we could want
if "Android" == system.getInfo( "platformName" ) then

	-- Create a background to go behind our widget buttons
	local buttonBackground = display.newRect( display.contentCenterX, display.contentHeight - 25, 220, 50 )
	buttonBackground:setFillColor( 0 )

	-- Create a share button
	-- local shareButton = widget.newButton
	-- {
	-- 	id = "share",
	-- 	left = 0,
	-- 	top = 430,
	-- 	width = 240,
	-- 	label = "Show Share Popup",
	-- 	onRelease = onShareButtonReleased,
	-- }
	-- shareButton.x = display.contentCenterX
else -- We're on iOS and need a button for each social service we want to support
	-- Create a background to go behind our widget buttons
	local buttonBackground = display.newRect( display.contentCenterX, 380, 220, 200 )
	buttonBackground:setFillColor( 0 )

	-- Create a facebook button


	-- Create a twitter button
	local twitterButton = widget.newButton
	{
		id = "twitter",
		left = 0,
		top = 180,
		width = 240,
		label = "Share On Twitter",
		labelColor = { default={ .1, .5, .9 }},
		onRelease = onShareButtonReleased,
	}
		twitterButton.x = display.contentCenterX + 10
	screenGroupAbout:insert(twitterButton)

end



end

	 
function goToBonus (event)
if event.phase == "began" then
storyboard.gotoScene("bonusesScene", "fade", 200)
end
end



	function scene:enterScene(event) 

	menusquareApple:addEventListener("touch", goToBonus)
	end
	
	function scene:exitScene(event)
		
	menusquareApple:removeEventListener("touch", goToBonus)
	end
	
	function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
