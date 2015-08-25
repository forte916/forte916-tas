-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script shows rng.
--
-- Usage
--   1. Start this script
--

require "psx_lib"
require "fft_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------
function drawRNG(x, y)
	x = x or 60
	y = y or 0

	local seed = memory.readdword(adr_rng)
	local rng = rand(adr_rng)

	gui.text(x, y   , string.format(" seed:%08x", seed))
	gui.text(x, y+8 , string.format(" rng :%d", rng))
end

function drawSeeds(x, y)
	x = x or 120
	y = y or 0

	local seeds = {}
	local seed = memory.readdword(adr_rng)

	for i=0, 20 do
		seeds[i] = seed
		seed = next_seed(seed)
	end

	for i=0, 20 do
		gui.text(x, y+(8*i) , string.format("%08x", seeds[i]))
	end
end


------------------------------------------------------------
-- main
------------------------------------------------------------

initial = 1

while true do

	if initial == 1 then
		-- do initial setup
		--Funit.showAll()
		Bunit.showAll()
		initial = 0
	end

	if initial == 0 then
		drawRNG()
		--drawSeeds()
		--Funit.drawAll()
		Bunit.drawAll()
	end

	emu.frameadvance()
end

