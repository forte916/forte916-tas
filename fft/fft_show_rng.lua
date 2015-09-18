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
	local random = rand(adr_rng)

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

function outputRNG()
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()

	debugPrint(string.format("%d, %08X", fc, rng))
end

function outputNextRNG()
	local rnglist = {}
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()

	debugPrint(string.format("----- fc = %d, rng = %08X -----", fc, rng))

	for i=0, 200 do
		rnglist[i] = rng
		rng = next_rng(rng)
	end

	for i=0, 200 do
		debugPrint(string.format("%08X", rnglist[i]))
	end

	debugPrint(string.format("----- -----"))
end


------------------------------------------------------------
-- main
------------------------------------------------------------

initial = 1

f = io.open("next_rng.log", "a")
if f == nil then debugPrint("error: Could not open file") end

while true do

	if initial == 1 then
		outputNextRNG()
		--Funit.showAll()
		--Bunit.showAll()
		initial = 0
	end

	if initial == 0 then
		drawRNG()
		outputRNG()
		--drawNextRNG()
		--Funit.drawAll()
		--Bunit.drawAll()
	end

	f:flush()
	emu.frameadvance()
end

emu.pause()
f:close()

