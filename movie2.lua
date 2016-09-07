local storyboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )


	
	 widget = require( "widget" )


local function scrollListener2( event )
    local myPhase = event.phase
    return true
end


function scene:createScene(event) 
	 local screenGroupMovie2 = self.view



 function webListener2( event )
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


webView2 = native.newWebView( 20, 45, 430, 270 )

if ( system.getInfo( "platformName" ) ~= "iPhone OS" ) then
webView2:request( "https://www.youtube.com/watch?v=QIax4_FolW4" )
end


webView2:addEventListener( "urlRequest", webListener2 )



	if ( "Android" == system.getInfo( "platformName" )) then
				warning = display.newText( "NOTE: Do Not Change Video Size. Do Not Leave This Page Unless You're Done Watching Movie For Now. Video: bit.ly/1YKaMrB", 130, 10, 330, 30, native.systemFont, 11)
	warning:setTextColor( 254, 254, 254 )
	else
		warning = display.newText( "Go to this website to watch Movie 2 bit.ly/1YKaMrB ", 140, 15, 300, 30, native.systemFont, 11)
	warning:setTextColor( 254, 254, 254 )
	end
	screenGroupMovie2:insert(warning)

	bonusesA = display.newImage("gameSquare.png")
	bonusesA.x = 60
	bonusesA.yScale = .2
	bonusesA.xScale = .2
	bonusesA.y = 20
	bonusesA.rotation = 90
	screenGroupMovie2:insert(bonusesA)
	goBackB = display.newText( "Back", 40, 15, native.systemFont, 16)
	goBackB:setTextColor( 190, 300, 300 )
	screenGroupMovie2:insert(goBackB)



end

	 
function goToBonuses2 (event)
if event.phase == "began" then

storyboard.gotoScene("bonusesScene", "fade", 200)
end
end



	function scene:enterScene(event) 

	bonusesA:addEventListener("touch", goToBonuses2)
	end
	
	function scene:exitScene(event)
	            webView2:removeSelf()
            webView2 = nil
		 -- native.cancelWebPopup()

	bonusesA:removeEventListener("touch", goToBonuses2)	
	
	end
	
	function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
	 