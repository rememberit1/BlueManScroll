
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

--background city scape
function scene:createScene(event) 
	
	local screenGroup = self.view -- screengroup is just a var, self.view is what actually creates the screengroup
	
	background = display.newImage("level2.png")
	screenGroup:insert(background) --must add insert:[whatever] when doing storyboard and using graphics
	

	city2 = display.newImage("cityred1.png")
	city2:setReferencePoint(display.BottomLeftReferencePoint)
	city2.x= 0	
	city2.y= 290
	screenGroup:insert(city2)
end


function start (event)
if event.phase == "began" then
storyboard.gotoScene("game2", "fade", 200)
end

end


function scene:enterScene(event) 
	--storyboard.purgeScene("game")
	storyboard.purgeScene("game2")
	storyboard.purgeScene("game")
	background:addEventListener("touch", start)

end

function scene:exitScene(event) 
	background:removeEventListener("touch", start)

end

function scene:destroyScene(event) 

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene





