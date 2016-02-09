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
	x = x or 80
	y = y or 0

	local rng = memory.readdword(adr_rng)
	local random = rand(rng)

	gui.text(x, y   , string.format(" rng:%08X", rng))
	gui.text(x, y+8 , string.format(" rand:%d", random))
end

function drawNextRNG(x, y)
	x = x or 140
	y = y or 0

	local rnglist = {}
	local rng = memory.readdword(adr_rng)

	for i=0, 20 do
		rnglist[i] = rng
		rng = next_rng(rng)
	end

	for i=0, 20 do
		gui.text(x, y+(8*i) , string.format("%08X", rnglist[i]))
	end
end


------------------------------------------------------------
-- main
------------------------------------------------------------

initial = 1

while true do

	if initial == 1 then
		--Funit.showAll()
		Bunit.showAll()
		initial = 0
	end

	if initial == 0 then
		drawRNG()
		--drawNextRNG()
		--Funit.drawAll()
		Bunit.drawAll()
	end

	emu.frameadvance()
end

print(string.format("<<< lua bot is finished <<<"))
emu.pause()

