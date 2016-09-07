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





	devinLogo = display.newImage("devinLogo.png")
	devinLogo.x = 235
	devinLogo.y = 290
	devinLogo.xScale = .4
	devinLogo.yScale = .4
	screenGroupAbout:insert(devinLogo)

ember = display.newImage ("presents.png")
ember.x = 220
ember.y = 140
ember.xScale = .2
ember.yScale = .2
screenGroupAbout:insert(ember)

	a = display.newText( "Created by", 170, 340, native.systemFont, 22)
	a:setTextColor( 130, 300, 300 )
	a.alpha =.4
	screenGroupAbout:insert(a)
	b = display.newText( "Ben Akinlosotu", 180, 375, native.systemFont, 14)
	b:setTextColor( 100, 300, 300 )
	b.alpha =.4
	screenGroupAbout:insert(b)

	c = display.newText( "Programmed by", 150, 420, native.systemFont, 22)
	c:setTextColor( 130, 300, 300 )
	c.alpha =.4
	screenGroupAbout:insert(c)
	d = display.newText( "Ben Akinlosotu", 180, 455, native.systemFont, 14)
	d:setTextColor( 100, 300, 300 )
	d.alpha=.4
	screenGroupAbout:insert(d)

	e = display.newText( "Cutscenes and Game Musical Score by", 40, 500, native.systemFont, 22)
	e:setTextColor( 130, 300, 300 )
	e.alpha = .4
	screenGroupAbout:insert(e)
	f = display.newText( "Ben Akinlosotu", 180, 535, native.systemFont, 14)
	f:setTextColor( 100, 300, 300 )
	f.alpha= .4
	screenGroupAbout:insert(f)

	g = display.newText( "Game Created Using", 120, 580, native.systemFont, 22)
	g:setTextColor( 130, 300, 300 )
	g.alpha=.4
	screenGroupAbout:insert(g)
	h = display.newText( "Corona SDK, Android Java, Objective-C and Lua", 90, 615, native.systemFont, 13)
	h:setTextColor( 100, 300, 300 )
	h.alpha = .4
	screenGroupAbout:insert(h)

	i = display.newText( "Special Thanks To", 130, 660, native.systemFont, 22)
	i:setTextColor( 130, 300, 300 )
	i.alpha = .4
	screenGroupAbout:insert(i)
	j = display.newText( "Mark Falkland", 180, 695, native.systemFont, 14)
	j:setTextColor( 100, 300, 300 )
	j.alpha =.4
	screenGroupAbout:insert(j)

	letterboxTop2 = display.newRect(-50, -40, 600, 80)
	letterboxTop2:setFillColor(0,0,0)
	screenGroupAbout:insert(letterboxTop2)

	menusquareB = display.newImage("gameSquare.png")
	menusquareB.x = 60
	menusquareB.yScale = .2
	menusquareB.xScale = .2
	menusquareB.y = 20
	menusquareB.rotation = 90
	screenGroupAbout:insert(menusquareB)
	goBackB = display.newText( "Back", 40, 15, native.systemFont, 16)
	goBackB:setTextColor( 190, 300, 300 )
	screenGroupAbout:insert(goBackB)



end

	 
function goToMenu (event)
if event.phase == "began" then
storyboard.gotoScene("start", "fade", 200)
end
end



	function scene:enterScene(event) 
	--	credits = timer.performWithDelay( 1, function (blahBlah3) 
	transition.to(ember, {y = -10, time = 4000})
	transition.to(devinLogo, {y = -10, time = 6000})
	transition.to( a, { y = -10, alpha =1, time = 7500 } )
	transition.to( b, { y = -10, alpha =1, time = 7900 } )
	transition.to( c, { y = -10, alpha =1, time = 10000 } )
	transition.to( d, { y = -10, alpha =1, time = 10400 } )
	transition.to( e, { y = -10, alpha =1, time = 12500 } )
	transition.to( f, { y = -10, alpha =1, time = 12900 } )
	transition.to( g, { y = -10, alpha =1, time = 14000 } )
	transition.to( h, { y = -10, alpha =1, time = 14400 } )
	transition.to( i, { y = -10, alpha =1, time = 16500 } )
	transition.to( j, { y = -10, alpha =1, time = 16900 } )
	--end, 0)
	

	menusquareB:addEventListener("touch", goToMenu)
	end
	
	function scene:exitScene(event)
		--timer.cancel(credits)
		ember.y = 140
		devinLogo.y = 290
		a.y = 340
		b.y = 375
		c.y = 420
		d.y = 455
		e.y = 500
		f.y = 535
		g.y = 580
		h.y = 615
		i.y = 660
		j.y = 695

		
	menusquareB:removeEventListener("touch", goToMenu)
	end
	
	function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
	 