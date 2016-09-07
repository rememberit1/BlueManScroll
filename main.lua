display.setStatusBar(display.HiddenStatusBar)


local storyboard =require "storyboard"
local widget = require( "widget" )
local licensing = require( "licensing" )

if ( system.getInfo( "platformName" ) == "Android" ) then
    print("DEVICE=Android")
    local licensing = require( "licensing" )
   licensing.init( "google" )
   local function licensingListener( event )
      local verified = event.isVerified
      print( "address", event.address )
       print("name", event.name)
       print("provider", event.provider)
       print("isVerified", event.isVerified)
       print("isError", event.isError)
       print("errorType", event.errorType)
       print("response", event.response)   
      if not event.isVerified then
         --failed verify app from the play store, we print a message
         print( "Binary NOT BEING VERIFIED from the Google App Store !" )
         --native.requestExit()  --assuming this is how we handle pirates
      else
           print( "Google app has been verified" )
      end
   end
   licensing.verify( licensingListener )
end



square = display.newRect(-50, 0, 600, 320 )
square:setFillColor ( 0, 0, 0)
square2 = display.newRect(-50, 0, 600, 320 )
square2:setFillColor ( 0, 0, 0)
splashScreen = display.newImage( "LoadScreen.png",480,320 )
splashScreen.x, splashScreen.y = display.contentWidth / 2, display.contentHeight-190 
splashScreen.xScale = .3
splashScreen.yScale = .3

presents = display.newImage ("presents.png")
presents.x = 240
presents.y = 240
presents.xScale = .2
presents.yScale = .2




function doStuff()
transition.dissolve( square2, splashScreen, 100 )--do another transition that uses a black square that to make it look like the intro is fading to black before the main game POPS out
intro=audio.loadStream("intro.mp3")
audio.setVolume(.5 ,{channel=20})
audio.play(intro, {channel=20}) 
end

local function removeSplash(event)
splashScreen:removeSelf()
splashscreen = nil
presents:removeSelf()
--presents = nil
square:removeSelf()
square=nil
square2:removeSelf()
square2=nil
audio.dispose(intro)
storyboard.gotoScene("start")
end 
doStuff()
timer.performWithDelay(2500,removeSplash)


--stops the android back button from working. Only works when "if ( composer.getCurrentSceneName() == "games01" ) then" is added for some reason

function onKeyEvent( event )

   local phase = event.phase
   local keyName = event.keyName
   print( event.phase, event.keyName )
--might want to add ' and phase == "up" ' to the next line
   if ( "back" == keyName ) then
      if ( composer.getCurrentSceneName() == "games01" ) then
         native.requestExit()
      -- else
      --    if ( composer.isOverlay ) then
      --       composer.hideOverlay()
      --    else
      --       composer.gotoScene( "menu", { effect="crossFade", time=500 } )
         --end
      end
      return true
   end
   return false
end
Runtime:addEventListener( "key", onKeyEvent )


