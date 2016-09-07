local storyboard = require ("storyboard")
local scene = storyboard.newScene()
sfx = require( "sfx" )
iap = require("iap_badger")

function scene:createScene(event) 
	 local screenGroupApple = self.view

local catalogue = {

    --Information about the product on the app stores
    products = {

        --removeAds is the product identifier.
        --Always use this identifier to talk to IAP Badger about the purchase.
        removeAds = {
            --A list of product names or identifiers specific to apple's App Store or Google Play.
            productNames = { apple="com.emberroar.devindanger.apple.removeads1"},
            --The product type
            productType = "non-consumable",
            --This function is called when a purchase is complete.
            onPurchase = function() iap.setInventoryValue("unlockAds", true) end,--name it something other than unlock for other items
            --The function is called when a refund is made
            onRefund = function() iap.removeFromInventory("unlockAds", true) end,
        },
        getCharacters = {
            productNames = { apple="com.emberroar.devindanger.apple.characters"},
            productType = "non-consumable",
            onPurchase = function() iap.setInventoryValue("unlockCharacters", true) end,
            onRefund = function() iap.removeFromInventory("unlockCharacters", true) end,
        },
        getGun = {
            productNames = { apple="com.emberroar.devindanger.apple.missile"},
            productType = "non-consumable",
            onPurchase = function() iap.setInventoryValue("unlockMissle", true) end,
            onRefund = function() iap.removeFromInventory("unlockMissle", true) end,
        }


    },
    --An empty inventory items table
        inventoryItems = {
        unlockAds = { productType="non-consumable" },
        unlockCharacters = { productType="non-consumable" },
        unlockMissle = { productType="non-consumable" }
    }

}

local iapOptions = {
    --The catalogue generated above
    catalogue=catalogue,
    --The filename in which to save the inventory
    filename="goodies.txt",
    --Salt for the hashing algorithm
    salt = "something tr1cky to gue55!",

        --Debugging modes
    --debugMode = true,
    --If on the simulator, pretend to be the following store:
    --debugStore = "apple"
   doNotLoadInventory=true
}
--Initialise IAP
iap.init(iapOptions)

function appleRemoveAds()
    sfx.freeShowAds =0
    adsScore.set(sfx.freeShowAds)
    adsScore.save()
    adsBuyText.text = "Bought"
end

function appleGetCharacters()
        sfx.charFinalBool =1
        charActiveScore.set(sfx.charFinalBool)
        charActiveScore.save()
        whiteRectangle0.alpha =0
        blackSquare0.alpha = 0
        blackSquare1.alpha = 0
        blackSquare2.alpha = 0
        blackSquare3.alpha = 0
        blackSquare4.alpha = 0
        buyCharText.text = "Bought"
end

function appleGetGun()
        sfx.powerGunTrue  =1
        gunScore.set(sfx.powerGunTrue)
        gunScore.save()
        missleBuy.text = "Bought"
end


--Transaction is a table containing the original transaction information table passed by Corona
local function purchaseListener(product, transaction)
    --Check the product name...
    --(not really necessary with a one-product catalogue...)
    if (product=="removeAds") then
        --Remove the ads
        appleRemoveAds()
        --Tell the user the ads have been removed
        native.showAlert("Awww Yea!!", "You Got No More Ads!", {"um...OK"})

    elseif (product=="getCharacters") then
        appleGetCharacters()
        native.showAlert("Noice!!", "You Got the Ability Change Your Character's Looks", {"Yea Whatever"})
    elseif (product=="getGun") then
        appleGetGun()
        native.showAlert("That's What's Up!!", "You Got the 'Long-Life Missile Super Mega Ultra' Powerup!", {"Yea, Yea, got it"})
    end
    iap.saveInventory()
end

local function restoreListener(productName, event)
    
    --If this is the first product to be restored, remove the spinner
    --(Not really necessary in a one-product app, but I'll leave this as template
    --code for those of you writing apps with multi-products).
    if (event.firstRestoreCallback) then
        --Tell the user their items are being restore
        native.showAlert("Restore", "Your items are being restored", {"Okay"})
    adRestoreSquare.alpha = 0
    adsRestoreText.alpha = 0
    restoreWarningText.alpha = 0

    end
    
    --Remove the ads
    if (productName=="removeAds") then appleRemoveAds() end
    if (productName=="getCharacters") then appleGetCharacters() end
    if (productName=="getGun") then appleGetGun() end
    
    --Save any inventory changes
    iap.saveInventory()
    
end

 function restorePurchases(event)
    if event.phase == "ended" then
    
    --Tell IAP to initiate a purchase
    --Use the failedListener from onPurchase, which just clears away the spinner from the screen.
    --You could have a separate function that tells the user "Unable to contact the app store" or
    --similar on a timeout.
    --On the simulator, or in debug mode, this function attempts to restore all of the non-consumable
    --items in the catalogue.
    iap.restore(false, restoreListener)
    end
end

--Make the purchase
function buyRemoveAds(event)
if event.phase == "ended" then
iap.purchase("removeAds", purchaseListener)
end
end

function buyGetCharacters(event)
if event.phase == "ended" then
iap.purchase("getCharacters", purchaseListener)
end
end

function buyGetGun(event)
if event.phase == "ended" then
iap.purchase("getGun", purchaseListener)
end
end



	goBackSquare = display.newImage("gameSquare.png")
	goBackSquare.x = 30
	goBackSquare.yScale = .2
	goBackSquare.xScale = .2
	goBackSquare.y = 30
	goBackSquare.rotation = 90
	screenGroupApple:insert(goBackSquare)	
	goBack2 = display.newText( "Back", 13, 25, native.systemFont, 14)
	goBack2:setTextColor( 190, 300, 300 )
	screenGroupApple:insert(goBack2)

	buySquare = display.newImage("gameSquare.png")
	buySquare.x = 30
	buySquare.yScale = .2
	buySquare.xScale = .2
	buySquare.y = 138
	buySquare.rotation = 90
	screenGroupApple:insert(buySquare)
	adsBuyText = display.newText( "Buy", 17, 133, native.systemFont, 12)
	adsBuyText:setTextColor( 190, 300, 300 )
	screenGroupApple:insert(adsBuyText)

    adRestoreSquare =display.newImage("gameSquare.png")
    adRestoreSquare.x = 137
    adRestoreSquare.yScale = .85
    adRestoreSquare.xScale = .2
    adRestoreSquare.y = 90
    adRestoreSquare.rotation = 90
    screenGroupApple:insert(adRestoreSquare)
    adsRestoreText = display.newText( "RESTORE Previous Purchases", 55, 85, native.systemFont, 14)
    adsRestoreText:setTextColor( 190, 300, 300 )
    screenGroupApple:insert(adsRestoreText)
    --if ((iap.getInventoryValue("unlockAds")==true) and (sfx.freeShowAds ==1)) then
  --  if ((iap.getInventoryValue("unlockAds")==true)) then




if sfx.freeShowAds ==0 then
    adsBuyText.text = "Bought"
end


    charBuySquare = display.newImage("gameSquare.png")
    charBuySquare.x = 232
    charBuySquare.yScale = .2
    charBuySquare.xScale = .2
    charBuySquare.y = 138
    charBuySquare.rotation = 90
    screenGroupApple:insert(charBuySquare)
    buyCharText = display.newText( "Buy", 220, 133, native.systemFont, 12)
    buyCharText:setTextColor( 190, 300, 300 )
    screenGroupApple:insert(buyCharText)
if sfx.charFinalBool ==1 then
    buyCharText.text = "Bought"
end


    missleSquare = display.newImage("gameSquare.png")
    missleSquare.x = 30
    missleSquare.yScale = .2
    missleSquare.xScale = .2
    missleSquare.y = 238
    missleSquare.rotation = 90
    screenGroupApple:insert(missleSquare)
    missleBuy = display.newText( "Buy", 17, 233, native.systemFont, 12)
    missleBuy:setTextColor( 190, 300, 300 )
    screenGroupApple:insert(missleBuy)
if sfx.powerGunTrue  ==1 then
    missleBuy.text = "Bought"
end

restoreWarningText = display.newText("Only click RESTORE if you've bought items in the past and they're no longer available. You'll can get them again for FREE!", 
    85, 10, 175, 200, native.systemFont, 10)
restoreWarningText:setFillColor(102,178,255)
screenGroupApple:insert(restoreWarningText)
restoreWarningText: setTextColor(200, 300, 300)
screenGroupApple:insert(restoreWarningText)


    charBox = display.newRect( 142, 155, 120, 60 )
    charBox:setFillColor(102,178,255)
    charBox.alpha =1
    screenGroupApple:insert(charBox)
    characterText = display.newText( "Change your player's skin to something crazy you'll recognize from social media. Buy it, buy it now ------>>", 145, 162, 115, 200, native.systemFont, 9)
    characterText:setTextColor( 200, 300, 300 )
    screenGroupApple:insert( characterText )

    adBox = display.newRect( 7, 155, 120, 55 )
    adBox:setFillColor(102,178,255)
    adBox.alpha =1
    screenGroupApple:insert(adBox)
    adText = display.newText( "Purchase and those annoying ads won't show everytime your loser self dies :-D", 15, 162, 115, 200, native.systemFont, 9)
    adText:setTextColor( 200, 300, 300 )
    screenGroupApple:insert( adText )

        missleBox = display.newRect( 7, 255, 120, 55 )
    missleBox:setFillColor(102,178,255)
    missleBox.alpha =1
    screenGroupApple:insert(missleBox)
    missleText = display.newText( "Get a missile power-up in every level that pretty much makes you unstoppable", 15, 262, 115, 200, native.systemFont, 9)
    missleText:setTextColor( 200, 300, 300 )
    screenGroupApple:insert( missleText )




    missleShow= display.newImage("missle.png")--change all this
    missleShow.xScale =.025
    missleShow.yScale =.03
    missleShow.alpha = 1
    missleShow.x = 40
    missleShow.y = 302
    missleShow.rotation = 90
    screenGroupApple:insert (missleShow)



    -- Status text box
     statusBox = display.newRect( 150, 100, 120, 25 )
    statusBox:setFillColor(160,160,160)
    statusBox.alpha =1
    screenGroupApple:insert(statusBox)
    -- Status text
     statusText = display.newText( "Devin Chosen For You", 160, 260, native.systemFont, 11)
    statusText:setTextColor( 140, 300, 300 )
    screenGroupApple:insert( statusText )


    statusBox.y = statusText.y

    whiteRectangleBack =display.newRect( 270, 10, 250, 300 ) 
    whiteRectangleBack:setFillColor(160,160,160)
    whiteRectangleBack.alpha = 1
    screenGroupApple:insert(whiteRectangleBack)


    ---------------------------------------------------------------------------------------------
    -- widget.newSwitch() "radio"
    ---------------------------------------------------------------------------------------------

    local radioButtonText = display.newText( "Pick a Character", 335, 10, native.systemFont, 14 )
    radioButtonText:setTextColor( 190, 300, 300 )
    screenGroupApple:insert( radioButtonText )

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
    screenGroupApple:insert( gameDevinShop )

    screenGroupApple:insert( radioButton0 )
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
    screenGroupApple:insert( business )

    screenGroupApple:insert( radioButton1 )
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
    screenGroupApple:insert( denzel )
    screenGroupApple:insert( radioButton2 )
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
    screenGroupApple:insert( question )
    screenGroupApple:insert( radioButton3 )
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
    screenGroupApple:insert( universal )
    screenGroupApple:insert( radioButton4 )
    radioButton4.x = 295
    radioButton4.y = 270

    blackSquare0 = display.newRect( 277, 62, 35, 35 )
    blackSquare0:setFillColor(160,160,160)
    screenGroupApple:insert(blackSquare0)
    blackSquare1 = display.newRect( 277, 162, 35, 35 )
    blackSquare1:setFillColor(160,160,160)
    screenGroupApple:insert(blackSquare1)
    blackSquare2 = display.newRect( 277, 252, 35, 35 )
    blackSquare2:setFillColor(160,160,160)
    screenGroupApple:insert(blackSquare2)
    blackSquare3 = display.newRect( 382, 162, 35, 35 )
    blackSquare3:setFillColor(160,160,160)
    screenGroupApple:insert(blackSquare3)
    blackSquare4 = display.newRect( 382, 62, 35, 35 )
    blackSquare4:setFillColor(160,160,160)
    screenGroupApple:insert(blackSquare4)



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
    --whiteRectangle0.alpha = 0
    screenGroupApple:insert(whiteRectangle0)


    

	 end


function goToBonus (event)
if event.phase == "began" then
storyboard.gotoScene("bonusesScene", "fade", 200)
end
end


function scene:enterScene(event) 

	goBackSquare:addEventListener("touch", goToBonus)
	buySquare:addEventListener("touch", buyRemoveAds)
    adRestoreSquare:addEventListener("touch", restorePurchases)
    charBuySquare:addEventListener("touch", buyGetCharacters)
    missleSquare:addEventListener("touch", buyGetGun)
	end

	function scene:exitScene(event)
	goBackSquare:removeEventListener("touch", goToBonus)
	buySquare:removeEventListener("touch", buyRemoveAds)
    adRestoreSquare:removeEventListener("touch", restorePurchases)
    charBuySquare:removeEventListener("touch", buyGetCharacters)
    missleSquare:removeEventListener("touch", buyGetGun)
	end

		function scene:destroyScene(event) 
	end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene