


local storyboard = require ("storyboard")

local scene = storyboard.newScene()
    local store-- youre gonna have to make a new store for every item that can be purchased (i think). If that dont work look at the example in the similator
    local v3 = false
     
    if ( system.getInfo( "platformName" ) == "Android" ) then
        store = require( "plugin.google.iap.v3" )
        v3 = true
    elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
        store = require( "store" )
    else
    	---change uncomment this LATER
         store = require( "store" )
        -- native.showAlert( "Notice", "In-app purchases are not supported in the Corona Simulator.", { "OK" } )
    end

function scene:createScene(event) 
	  screenGroup4 = self.view


	function transactionCallback2( event )
 
       local transaction = event.transaction
       local tstate = event.transaction.state
 
       if tstate == "purchased" then
       	sfx.freeShowAds =0
 		adsScore.set(sfx.freeShowAds)
		adsScore.save()
        native.showAlert("Awww Yea!!", "You Got No More Ads!", {"um...OK"})
        cancel.text = "Bought"
            store.finishTransaction( transaction )
       elseif tstate == "consumed" then
            store.finishTransaction( transaction )
       elseif tstate == "cancelled" then
          store.finishTransaction( transaction )
       elseif tstate == "failed" then
          store.finishTransaction( transaction )
       else
          store.finishTransaction( transaction )
       end
       --print("done with store business for now")
    end

    	function transactionCallbackCharacter (event )
       local transaction = event.transaction
       local tstate = event.transaction.state
       if tstate == "purchased" then
       	sfx.charFinalBool =1
 		charActiveScore.set(sfx.charFinalBool)
		charActiveScore.save()
        native.showAlert("Noice!!", "You Got the Ability Change Your Character's Looks", {"Yea Whatever"})
        whiteRectangle0.alpha =0
        blackSquare0.alpha = 0
        blackSquare1.alpha = 0
        blackSquare2.alpha = 0
        blackSquare3.alpha = 0
        blackSquare4.alpha = 0
		buyCharText.text = "Bought"

            store.finishTransaction( transaction )
       elseif tstate == "consumed" then
            store.finishTransaction( transaction )
       elseif tstate == "cancelled" then
          store.finishTransaction( transaction )
       elseif tstate == "failed" then
          store.finishTransaction( transaction )
       else
          store.finishTransaction( transaction )
       end
       --print("done with store business for now")
     end


         	function transactionCallbackGun (event )
       local transaction = event.transaction
       local tstate = event.transaction.state
       if tstate == "purchased" then
       	sfx.powerGunTrue  =1
 		gunScore.set(sfx.powerGunTrue)
		gunScore.save()
		missleBuy.text = "Bought"
        native.showAlert("That's What's Up!!", "You Got the 'Long-Life Missile Super Mega Ultra' Powerup!", {"Yea, Yea, got it"})
            store.finishTransaction( transaction )
       elseif tstate == "consumed" then
            store.finishTransaction( transaction )
       elseif tstate == "cancelled" then
          store.finishTransaction( transaction )
       elseif tstate == "failed" then
          store.finishTransaction( transaction )
       else
          store.finishTransaction( transaction )
       end
     end


 
 	-- if ( v3 == true or store.availableStores.google ) then
  --       timer.performWithDelay( 300,
  --           function()
  --              -- store.init( "google", transactionCallback2 )
  --              --  store.restore()
  --       end )
  --   elseif ( store.availableStores.apple ) then
  --      --- timer.performWithDelay(300, function() store.init( "apple", transactionCallback2 ); end )
  --   else
  --       print( "In-app purchases are not supported on this system/device." )
  --   end
  --    if ( system.getInfo( "platformName" ) == "Android" ) then
  --       --store.consumePurchase( "com.emberroar.devindanger.autochangesfx", transactionCallback2 )
  --   elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
  --       store.purchase( {"com.tagfriendzy.light"} )
  --   else
  --      -- native.showAlert( "Notice", "In-app purchases are not supported in the Corona Simulator.", { "OK" } )
  --   end
--     return true
-- end

	function buyItemAd( event)
		if event.phase == "ended" then
		 if system.getInfo("targetAppStore") == "amazon" or system.getInfo("targetAppStore") == "google" then
	 	store.init( "google", transactionCallback2 )
         store.purchase( "com.emberroar.devindanger.removeads1" )
      -- elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
      --   store.init( "apple", storeTransaction )
      --   store.purchase("com.emberroar.devindanger.apple.removeads1")

          else
 native.showAlert( "Notice", "In-app purchases are not supported in the Corona Simulator.", { "OK" } )
   end
	end
	end

	function buyCharacter( event)
		if event.phase == "ended" then
		 if system.getInfo("targetAppStore") == "amazon" or system.getInfo("targetAppStore") == "google" then
		 	store.init( "google", transactionCallbackCharacter)
         store.purchase("com.emberroar.devindanger.characters")

      -- elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
      --   store.init( "apple", storeTransaction )
      --   store.purchase("com.emberroar.devindanger.apple.characters")
          else
 native.showAlert( "Notice", "In-app purchases are not supported in the Corona Simulator.", { "OK" } )
   end
	end
	end

	function buyGun( event)
		if event.phase == "ended" then
		 if system.getInfo("targetAppStore") == "amazon" or system.getInfo("targetAppStore") == "google" then
		 store.init( "google", transactionCallbackGun)
         store.purchase("com.emberroar.devindanger.missile")
      -- elseif ( system.getInfo( "platformName" ) == "iPhone OS" ) then
      --   store.init( "apple", storeTransaction )
      --   store.purchase("com.emberroar.devindanger.apple.missile")
          else
 native.showAlert( "Notice", "In-app purchases are not supported in the Corona Simulator.", { "OK" } )
   end
	end
	end

		
		--
	buySquare = display.newImage("gameSquare.png")
	buySquare.x = 30
	buySquare.yScale = .2
	buySquare.xScale = .2
	buySquare.y = 138
	buySquare.rotation = 90
	screenGroup4:insert(buySquare)
	cancel = display.newText( "Buy", 17, 133, native.systemFont, 12)

if sfx.freeShowAds ==0 then
	cancel.text = "Bought"
end

	cancel:setTextColor( 190, 300, 300 )
	screenGroup4:insert(cancel)

	missleSquare = display.newImage("gameSquare.png")
	missleSquare.x = 30
	missleSquare.yScale = .2
	missleSquare.xScale = .2
	missleSquare.y = 238
	missleSquare.rotation = 90
	screenGroup4:insert(missleSquare)
	missleBuy = display.newText( "Buy", 17, 233, native.systemFont, 12)
	missleBuy:setTextColor( 190, 300, 300 )
	screenGroup4:insert(missleBuy)
if sfx.powerGunTrue  ==1 then
	missleBuy.text = "Bought"
end




	charBuySquare = display.newImage("gameSquare.png")
	charBuySquare.x = 232
	charBuySquare.yScale = .2
	charBuySquare.xScale = .2
	charBuySquare.y = 30
	charBuySquare.rotation = 90
	screenGroup4:insert(charBuySquare)
	buyCharText = display.newText( "Buy", 220, 28, native.systemFont, 12)
	buyCharText:setTextColor( 190, 300, 300 )
	screenGroup4:insert(buyCharText)
if sfx.charFinalBool ==1 then
	buyCharText.text = "Bought"
end

	
	goBackSquare = display.newImage("gameSquare.png")
	goBackSquare.x = 30
	goBackSquare.yScale = .2
	goBackSquare.xScale = .2
	goBackSquare.y = 30
	goBackSquare.rotation = 90
	screenGroup4:insert(goBackSquare)
		
	goBack2 = display.newText( "Back", 13, 25, native.systemFont, 14)
	goBack2:setTextColor( 190, 300, 300 )
	screenGroup4:insert(goBack2)



	charBox = display.newRect( 142, 48, 120, 60 )
	charBox:setFillColor(102,178,255)
	charBox.alpha =1
	screenGroup4:insert(charBox)
	characterText = display.newText( "Change your player's skin to something crazy you'll recognize from social media. Buy it, buy it now", 145, 55, 115, 200, native.systemFont, 9)
	characterText:setTextColor( 200, 300, 300 )
	screenGroup4:insert( characterText )

	adBox = display.newRect( 7, 155, 120, 55 )
	adBox:setFillColor(102,178,255)
	adBox.alpha =1
	screenGroup4:insert(adBox)
	adText = display.newText( "Purchase and those annoying ads won't show everytime your loser ass dies :-D", 15, 162, 115, 200, native.systemFont, 9)
	adText:setTextColor( 200, 300, 300 )
	screenGroup4:insert( adText )

		missleBox = display.newRect( 7, 255, 120, 55 )
	missleBox:setFillColor(102,178,255)
	missleBox.alpha =1
	screenGroup4:insert(missleBox)
	missleText = display.newText( "Get a missile power-up in every level that pretty much makes you unstoppable", 15, 262, 115, 200, native.systemFont, 9)
	missleText:setTextColor( 200, 300, 300 )
	screenGroup4:insert( missleText )




	missleShow= display.newImage("missle.png")--change all this
	missleShow.xScale =.03
	missleShow.yScale =.03
	missleShow.alpha = 1
	missleShow.x = 30
	missleShow.y = 305
	missleShow.rotation = 90
	screenGroup4:insert (missleShow)



	-- Status text box
	 statusBox = display.newRect( 150, 100, 120, 25 )
	statusBox:setFillColor(160,160,160)
	statusBox.alpha =1
	screenGroup4:insert(statusBox)
	-- Status text
	 statusText = display.newText( "Devin Chosen For You", 160, 260, native.systemFont, 11)
	statusText:setTextColor( 140, 300, 300 )
	screenGroup4:insert( statusText )


	statusBox.y = statusText.y

	whiteRectangleBack =display.newRect( 270, 10, 250, 300 ) 
	whiteRectangleBack:setFillColor(160,160,160)
	whiteRectangleBack.alpha = 1
	screenGroup4:insert(whiteRectangleBack)


	---------------------------------------------------------------------------------------------
	-- widget.newSwitch() "radio"
	---------------------------------------------------------------------------------------------

	local radioButtonText = display.newText( "Pick a Character", 335, 10, native.systemFont, 14 )
	radioButtonText:setTextColor( 190, 300, 300 )
	screenGroup4:insert( radioButtonText )

	local function radioSwitchListener( event )
		--statusText.text = event.target.id .. "\nswitch.isOn = " .. tostring( event.target.isOn )
		if sfx.charFinalBool ==1 then
		if event.target.id == "Radio Switch 0" then
			sfx.charNumber =0
			characterScore.set (sfx.charNumber)
			characterScore.save()
			statusText.text = "Devin"

		elseif event.target.id == "Radio Switch 1" then
			sfx.charNumber =1
			characterScore.set (sfx.charNumber)
			characterScore.save()
			statusText.text = "Mr. Nunya Frog"
		elseif event.target.id == "Radio Switch 2" then
			sfx.charNumber =2
			characterScore.set (sfx.charNumber)
			characterScore.save()
			statusText.text = "Mr. Washington"
		elseif event.target.id == "Radio Switch 3" then
			sfx.charNumber =3
			characterScore.set (sfx.charNumber)
			characterScore.save()
			statusText.text = "Mr. WTF?"
		elseif event.target.id == "Radio Switch 4" then
			sfx.charNumber =4
			characterScore.set (sfx.charNumber)
			characterScore.save()
			statusText.text = "Mr. IDGAF"
		end 
	end
	end
	
	if loadCharScore == 0 then 
	 radioButton0 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 0",
	   initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
else
	 radioButton0 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 0",
	    onPress = radioSwitchListener,
	}
	end

	gameDevinShop = display.newImage("gameDevin2.png")
	gameDevinShop.x = 335
	gameDevinShop.y = 80
	gameDevinShop.xScale = .12
	gameDevinShop.yScale = .12
	screenGroup4:insert( gameDevinShop )

	screenGroup4:insert( radioButton0 )
	radioButton0.x = 295
	radioButton0.y = 80
	
	if loadCharScore == 1 then 
	 radioButton1 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 1",
	    initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
else 
		 radioButton1 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 1",
	    onPress = radioSwitchListener,
	}
end
	business = display.newImage("business.png")
	business.x = 455
	business.y = 80
	business.xScale = .12
	business.yScale = .12
	screenGroup4:insert( business )

	screenGroup4:insert( radioButton1 )
	radioButton1.x = 400
	radioButton1.y = 80

if loadCharScore == 2 then 
	 radioButton2 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 2",
	    initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
else 
	 radioButton2 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 2",
	    onPress = radioSwitchListener,
	}
end
	denzel = display.newImage("denzel.png")
	denzel.x = 342
	denzel.y = 180
	denzel.xScale = .12
	denzel.yScale = .12
	screenGroup4:insert( denzel )
	screenGroup4:insert( radioButton2 )
	radioButton2.x = 295
	radioButton2.y = 180



	if loadCharScore == 3 then 
	 radioButton3 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 3",
	    initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
else 
	 radioButton3 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 3",
	    onPress = radioSwitchListener,
	}
end
	question = display.newImage("question.png")
	question.x = 455
	question.y = 180
	question.xScale = .12
	question.yScale = .12
	screenGroup4:insert( question )
	screenGroup4:insert( radioButton3 )
	radioButton3.x = 400
	radioButton3.y = 180



	if loadCharScore == 4 then 
	 radioButton4 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 4",
	    initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
else 
	 radioButton4 = widget.newSwitch {
	    left = 0,
	    top = 0,
	    style = "radio",
	    id = "Radio Switch 4",
	    onPress = radioSwitchListener,
	}
end
	universal = display.newImage("universal.png")
	universal.x = 342
	universal.y = 270
	universal.xScale = .12
	universal.yScale = .12
	screenGroup4:insert( universal )
	screenGroup4:insert( radioButton4 )
	radioButton4.x = 295
	radioButton4.y = 270

	blackSquare0 = display.newRect( 277, 62, 35, 35 )
	blackSquare0:setFillColor(160,160,160)
	screenGroup4:insert(blackSquare0)
	blackSquare1 = display.newRect( 277, 162, 35, 35 )
	blackSquare1:setFillColor(160,160,160)
	screenGroup4:insert(blackSquare1)
	blackSquare2 = display.newRect( 277, 252, 35, 35 )
	blackSquare2:setFillColor(160,160,160)
	screenGroup4:insert(blackSquare2)
	blackSquare3 = display.newRect( 382, 162, 35, 35 )
	blackSquare3:setFillColor(160,160,160)
	screenGroup4:insert(blackSquare3)
	blackSquare4 = display.newRect( 382, 62, 35, 35 )
	blackSquare4:setFillColor(160,160,160)
	screenGroup4:insert(blackSquare4)



	whiteRectangle0 =display.newRect( 270, 10, 250, 300 ) 
	whiteRectangle0:setFillColor(255,255,255)

if sfx.charFinalBool ==0 then
	whiteRectangle0.alpha = .85
	blackSquare0.alpha =1
	blackSquare1.alpha =1
	blackSquare2.alpha =1
	blackSquare3.alpha =1	
	blackSquare4.alpha =1
end
if sfx.charFinalBool ==1 then
	whiteRectangle0.alpha = 0
		blackSquare0.alpha =0
	blackSquare1.alpha =0
	blackSquare2.alpha =0
	blackSquare3.alpha =0	
	blackSquare4.alpha =0
end
	whiteRectangle0.alpha = 0
	screenGroup4:insert(whiteRectangle0)


	end
	
function goToBonus (event)
if event.phase == "began" then
storyboard.gotoScene("bonusesScene", "fade", 200)
end
end
		
	function scene:enterScene(event) 
		 --  eventTranTimer= timer.performWithDelay(500, function()
		    	
	
         	--end, 0)
	buySquare:addEventListener("touch", buyItemAd)
	charBuySquare:addEventListener("touch", buyCharacter)
	missleSquare:addEventListener("touch", buyGun)
	goBackSquare:addEventListener("touch", goToBonus)
	end
	
	function scene:exitScene(event) 
	buySquare:removeEventListener("touch", buyItemAd)
	charBuySquare:removeEventListener("touch", buyCharacter)
	missleSquare:removeEventListener("touch", buyGun)
	goBackSquare:removeEventListener("touch", goToBonus)

	end
	
	function scene:destroyScene(event) 
	end
	
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene