-----------------------------------------------------------------------------------------
--
-- Created by: Teddy Sannan
-- Created on: April 30, 2019
--
-- This file animates a character using a spritesheet to make him stand and then walk
--
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdle =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetIdleKnight = graphics.newImageSheet( "./assets/spritesheets/knightIdle.png", sheetOptionsIdle )

local sheetOptionsWalk =
{
    width = 587,
    height = 707,
    numFrames = 10
}
local sheetWalkingKnight = graphics.newImageSheet( "./assets/spritesheets/knightWalking.png", sheetOptionsWalk )


-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleKnight
    },
    {
        name = "walk",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetWalkingKnight
    }
}

-- Gets knight image
local knight = display.newSprite( sheetIdleKnight, sequence_data )
knight.x = centerX
knight.y = centerY
knight.xScale = 300/587
knight.yScale = 300/707

knight:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet so the character starts to walk
local function swapSheet()
    knight:setSequence( "walk" )
    knight:play()
    print("walk")
end

timer.performWithDelay( 2000, swapSheet )
