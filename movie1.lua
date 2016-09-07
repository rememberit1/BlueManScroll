local storyboard = require ("storyboard")
--local realStoryboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )


	
	 widget = require( "widget" )


-- local function scrollListener( event )
--     local myPhase = event.phase
--     return true
-- end


function scene:createScene(event) 
	 local screenGroupMovie = self.view

-- local function listener( event )
--     local shouldLoad = true

--     local url = event.url
--     if 1 == string.find( url, "corona:close" ) then
--         -- Close the web popup
--         shouldLoad = false
--     end

--     if event.errorCode then
--         -- Error loading page
--         print( "Error: " .. tostring( event.errorMessage ) )
--         shouldLoad = false
--     end

--     return shouldLoad
-- end

-- local options =
-- {
--     hasBackground = false,
--     baseUrl = system.DocumentsDirectory,
--     urlRequest = listener
-- }
-- native.showWebPopup( 20, 45, 430, 270, "https://www.youtube.com/watch?v=GWaI9vVdf_4", options )

 function webListener( event )
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


webView = native.newWebView( 20, 45, 430, 270 )

if ( system.getInfo( "platformName" ) ~= "iPhone OS" ) then
webView:request( "https://www.youtube.com/watch?v=GWaI9vVdf_4" )
end

webView:addEventListener( "urlRequest", webListener )


--screenGroupMovie:insert(webView)

	bonusesA = display.newImage("gameSquare.png")
	bonusesA.x = 60
	bonusesA.yScale = .2
	bonusesA.xScale = .2
	bonusesA.y = 20
	bonusesA.rotation = 90
	screenGroupMovie:insert(bonusesA)
	goBackA = display.newText( "Back", 40, 15, native.systemFont, 16)
	goBackA:setTextColor( 190, 300, 300 )
	screenGroupMovie:insert(goBackA)


	if ( "Android" == system.getInfo( "platformName" )) then
		warning = display.newText( "NOTE: Do Not Change Video Size. Do Not Leave This Page Unless You're Done Watching Movie For Now. Video: bit.ly/1QVSaDJ", 130, 10, 330, 30, native.systemFont, 11)
	warning:setTextColor( 254, 254, 254 )
	else
		warning = display.newText( "Go to this website to watch Movie 1 bit.ly/1QVSaDJ ", 140, 15, 300, 30, native.systemFont, 11)
	warning:setTextColor( 254, 254, 254 )

	end
	screenGroupMovie:insert(warning)


end


function goToBonuses (event)
-- 	 optionsA = {
--     effect = "fade",
--     time = 200,
-- }
if event.phase == "began" then
storyboard.gotoScene("bonusesScene", "fade", 200)
--realStoryboard.gotoScene("bonusesScene", "fade", 200)
end
end


function scene:show( event )
	-- screenGroupMovie = self.view

-- 	if event.phase == "did"  then
-- webView = native.newWebView( 20, 45, 430, 270 )
-- webView:request( "https://www.youtube.com/watch?v=GWaI9vVdf_4" )


	-- bonusesA = display.newImage("gameSquare.png")
	-- bonusesA.x = 60
	-- bonusesA.yScale = .2
	-- bonusesA.xScale = .2
	-- bonusesA.y = 20
	-- bonusesA.rotation = 90
	-- screenGroupMovie:insert(bonusesA)
	-- goBackA = display.newText( "Back", 40, 15, native.systemFont, 16)
	-- goBackA:setTextColor( 190, 300, 300 )
	-- screenGroupMovie:insert(goBackA)

	-- bonusesA:addEventListener("touch", goToBonuses)

--end
end

	 




	function scene:enterScene(event) 

	bonusesA:addEventListener("touch", goToBonuses)
	end


	-- function scene:hide ( event )
	-- 	    -- screenGroupMovie = self.view
    
 --    if event.phase == "will" then    
 --        if webView then
 --            webView:removeSelf()
 --            webView = nil
 --        end
 --        --bonusesA:removeEventListener("touch", goToBonuses)
 --    end
	-- end
	
	function scene:exitScene(event)

	            webView:removeSelf()
            webView = nil


		 -- native.cancelWebPopup()

	bonusesA:removeEventListener("touch", goToBonuses)	
	
	end


	
	function scene:destroyScene(event) 
	end

scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
	 