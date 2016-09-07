local storyboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )


	
	 widget = require( "widget" )


local function scrollListener( event )
    local myPhase = event.phase
    return true
end


function scene:createScene(event) 
	 local screenGroupMovie5 = self.view

 function webListener5( event )
    if event.url then
        print( "You are visiting: " .. event.url )
    end

    if event.type then
        print( "The event.type is " .. event.type ) -- print the type of request
    end

    if event.errorCode then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end


webView5= native.newWebView( 20, 45, 430, 270 )
if ( system.getInfo( "platformName" ) ~= "iPhone OS" ) then
webView5:request( "https://www.youtube.com/watch?v=MFc-Ra61I2E" )
end

webView5:addEventListener( "urlRequest", webListener5 )



	if ( "Android" == system.getInfo( "platformName" )) then
		warning = display.newText( "NOTE: Do Not Change Video Size. Do Not Leave This Page Unless You're Done Watching Movie For Now. Video: bit.ly/1OI0aVw", 130, 10, 330, 30, native.systemFont, 11)
	warning:setTextColor( 254, 254, 254 )
	else
		warning = display.newText( "Go to this website to watch Movie 5 bit.ly/1OI0aVw ", 140, 15, 300, 30, native.systemFont, 11)

	warning:setTextColor( 254, 254, 254 )
	end
	screenGroupMovie5:insert(warning)

--native.showWebPopup( 20, 45, 430, 270, "https://www.youtube.com/watch?v=MFc-Ra61I2E", options )



	

	bonusesA = display.newImage("gameSquare.png")
	bonusesA.x = 60
	bonusesA.yScale = .2
	bonusesA.xScale = .2
	bonusesA.y = 20
	bonusesA.rotation = 90
	screenGroupMovie5:insert(bonusesA)
	goBackA = display.newText( "Back", 40, 15, native.systemFont, 16)
	goBackA:setTextColor( 190, 300, 300 )
	screenGroupMovie5:insert(goBackA)



end

	 
function goToBonuses (event)
if event.phase == "began" then

storyboard.gotoScene("bonusesScene", "fade", 200)
end
end



	function scene:enterScene(event) 

	bonusesA:addEventListener("touch", goToBonuses)
	end
	
	function scene:exitScene(event)

		webView5:removeSelf()
        webView5 = nil

	bonusesA:removeEventListener("touch", goToBonuses)	
	
	end
	
	function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
	 