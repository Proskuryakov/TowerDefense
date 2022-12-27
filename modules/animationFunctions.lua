--[[
================================================================================================
Lua Module File:  animationFunctions.lua

Module Summary:  Contains both Window and Button Cascading Animation Functions as reusable code.
Derived from the Defold Main Menu Example at: https://www.defold.com/tutorials/main-menu/

================================================================================================
]]

-- The table "M" contains the module
local M = {}


-- ---------------------------------------------------------------------------------------------
-- Window Animation Functions

function M.animateWindow2(self, node)
	DEBUG_MESSAGE = "Animating Window"
	-- Animates scale to 100%
	local s = 1.0
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.4, 0)
end


function M.animateWindow1(node, d)
	-- Change Scale to reduce size
	local start_scale = 0.01
	gui.set_scale(node, vmath.vector4(start_scale, start_scale, start_scale, 0))

	-- Get the current color and set alpha to 0 as a basis for fading up
	local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	from_color.w = 0
	gui.set_color(node, from_color)

	-- Animate the alpha value from 0 to 1
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 1.5, d)

	-- Animate the scale up to 150%
	local s = 1.5
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 1.2,
	d, M.animateWindow2)
end


-- ---------------------------------------------------------------------------------------------
-- Button Animation Functions

function M.animateButton4(self, node)
	-- animate scale to 100%
	local s = 1
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.12, 0)
end


function M.animateButton3(self, node)
	-- animate scale to 106%
	local s = 1.06
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.12,
	0, M.animateButton4)
end


function M.animateButton2(self, node)
	-- animate scale to 98%
	local s = 0.98
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.12,
	0, M.animateButton3)
end


function M.animateButton1(node, d)
	-- set scale to 70%
	local start_scale = 0.7
	gui.set_scale(node, vmath.vector4(start_scale, start_scale, start_scale, 0))

	-- get current color and set alpha to 0 to fade up
	local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	from_color.w = 0
	gui.set_color(node, from_color)

	-- animate alpha value from 0 to 1
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 0.2, d)

	-- animate scale from %70 to 110%
	local s = 1.1
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 0.2,
	d, M.animateButton2)
end


function M.animateButtonPress(node, d)
	DEBUG_MESSAGE2 = "Executing M.animateButtonPress"
	-- get the current color and set alpha to 0.85 to fade the button
	local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	from_color.w = 0.85
	gui.set_color(node, from_color)

	-- animate alpha value from current to to_color
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 0.1, d)

	-- animate scale up to 95%
	local s = 1.2
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 0.1, d)
end


function M.animateButtonRelease(node, d)

	-- animate scale back to 100%
	local s = 1.0
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 0.1, d)
end


-- ---------------------------------------------------------------------------------------------
-- Image Zoom In / Zoom Out - Animation
function M.nextStep()
	print ("Exit Game")
end


function M.animateImage2(self, node)
	-- Animates scale back to 100%
	local s = 1.0
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.4,
			0, M.nextStep)
end


function M.animateImage(node, d)

	-- Change Scale to reduce size
	local start_scale = 0.0001
	gui.set_scale(node, vmath.vector4(start_scale, start_scale, start_scale, 0))

	-- Get the current color and set alpha to 0 as a basis for fading up
	local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	from_color.w = 0
	gui.set_color(node, from_color)

	-- Animate the alpha value from 0 to 1
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 1.5, d)

	-- Animate the scale up to 150%
	local s = 1.5
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 4,
			d, M.animateImage2)
end


-- ---------------------------------------------------------------------------------------------
-- Game Logo Animation Functions

function M.completeSplash(self)
	DEBUG_MESSAGE = "Start the Game"

	-- Start a New Game after a short pause
	local setupDelay = 1.0
	self.timer_id = timer.delay(setupDelay, false, 
		function() msg.post("/controller", "splashComplete") end )	

end


function M.animateGameLogo3(self, node)
	DEBUG_MESSAGE = "Animating gameLogo3"

	-- Get the current color and set alpha to 0 as a basis for fading out
	local to_color = gui.get_color(node)
	to_color.w = 0
	local delay = 4.0

	-- Animate the alpha value from 1 to 0
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 1.5,
	delay, M.completeSplash)
end


function M.animateGameLogo2(self, node)
	DEBUG_MESSAGE = "Animating gameLogo2"
	-- Animates scale to 100%
	local s = 1.0
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 1.4,
	0, M.animateGameLogo3)
end


function M.animateGameLogo1(node, d)
	DEBUG_MESSAGE = "Animating gameLogo1"

	-- Get the current color and set alpha to 0 as a basis for fading up
	--local from_color = gui.get_color(gameNode)
	local to_color = gui.get_color(node)
	to_color.w = 1.0
	--gui.set_color(gameNode, from_color)

	-- Animate the alpha value from 0 to 1
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 1.5, d)

	-- Animate the scale up to 110%
	local s = 1.1
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 3.0,
	d, M.animateGameLogo2)
end


-- ---------------------------------------------------------------------------------------------
-- Developer (TactxStudios) Animation Functions

function M.animateTSLogo3(self, node)
	DEBUG_MESSAGE = "Animating TSLogo3"

	-- Get the current color and set alpha to 0 as a basis for fading up
	--local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	to_color.w = 0
	local delay = 2.0

	-- Animate the alpha value from 1 to 0
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 0.5, delay,
	M.animateGameLogo1(gui.get_node("gameLogo"), 2.0))
end


function M.animateTSLogo2(self, node)
	DEBUG_MESSAGE = "Animating TSLogo2"
	-- Animates scale to 100%
	local s = 1.0
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_INOUT, 0.4,
	0, M.animateTSLogo3)
end


function M.animateTSLogo1(node, d)
	DEBUG_MESSAGE = "Animating TSLogo1"
	local gameNode = gui.get_node("gameLogo")
	gui.set_enabled(gameNode, true)	

	-- Change Scale to reduce size
	local start_scale = 0.0001
	gui.set_scale(gameNode, vmath.vector4(start_scale, start_scale, start_scale, 0))
	gui.set_scale(node, vmath.vector4(start_scale, start_scale, start_scale, 0))

	-- Get the current color and set alpha to 0 as a basis for fading up
	local from_color = gui.get_color(node)
	local to_color = gui.get_color(node)
	from_color.w = 0
	gui.set_color(node, from_color)

	-- Animate the alpha value from 0 to 1
	gui.animate(node, gui.PROP_COLOR, to_color, gui.EASING_IN, 1.5, d)

	-- Animate the scale up to 135%
	local s = 1.35
	gui.animate(node, gui.PROP_SCALE, vmath.vector4(s, s, s, 0), gui.EASING_IN, 4,
	d, M.animateTSLogo2)
end

return M
