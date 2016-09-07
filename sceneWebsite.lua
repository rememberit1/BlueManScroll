local storyboard = require ("storyboard")
local scene = storyboard.newScene()

function scene:createScene(event) 
	  screenGroup3 = self.view
		



	backSquare = display.newImage("gameSquare.png")
	backSquare.x = 32
	backSquare.yScale = .2
	backSquare.xScale = .2
	backSquare.y = 280
	backSquare.rotation = 90
	screenGroup3:insert(backSquare)
		
	cancel = display.newText( "Back", 15, 275, native.systemFont, 16)
	cancel:setTextColor( 190, 300, 300 )
	screenGroup3:insert(cancel)
	end
	
function goToBonus (event)
if event.phase == "began" then
	    webView:removeSelf()
		webView = nil
storyboard.gotoScene("bonusesScene", "fade", 200)
end
end
		
	function scene:enterScene(event) 
		webView = native.newWebView( 0, 10, 500, 250 )
		webView:request( "http://www.twitter.com/")
		screenGroup3:insert(webView)

	backSquare:addEventListener("touch", goToBonus)
	end
	
	function scene:exitScene(event) 
	if webView then
		webView:removeSelf()
		webView = nil
	end
	backSquare:removeEventListener("touch", goToBonus)
	end
	
	function scene:destroyScene(event) 
	end
	
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene