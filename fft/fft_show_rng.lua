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
function predictRNGList(count)
	count = count or 100

	local rnglist = {}
	local seed = readRNG()

	for i=1, count do
		rnglist[i] = { rng = seed, mark = "" }
		seed = next_rng(seed)
	end
	return rnglist
end

function drawRNGList(rnglist, x, y)
	x = x or 140
	y = y or 0

	for i=1, #rnglist, 1 do
		gui.text(x, y+(8*i) , string.format("%08X %s", rnglist[i].rng, rnglist[i].mark))
	end
end

function markRNGList(rnglist)
	local seed = readRNG()
	local found = false

	print(string.format("----10 %08X", seed))

	for i=1, #rnglist, 1 do
		print(string.format("----20 , %08X, %08X, %d", seed, rnglist[i].rng, i))
		print(string.format("----21 , %s, %s, %d", tostring(seed), tostring(rnglist[i].rng), i))
		if seed == rnglist[i].rng then
			rnglist[i].mark  = "*"
			found = true
			print(string.format("----30 , %08X, %08X, %d, found", seed, rnglist[i].rng, i))
			break
		end
	end
	if found == false then
		print(string.format("----40 %08X , update rng", seed))
		rnglist = predictRNGList(predict_count)
		print(string.format("----50 %08X , update rng", seed))
	end
	return rnglist
end

function drawRNG(x, y)
	x = x or 80
	y = y or 0

	local seed = memory.readdword(adr_rng)
	local random = rand(seed)

	gui.text(x, y   , string.format(" rng:%08X", seed))
	gui.text(x, y+8 , string.format(" rand:%d", random))
end

function drawNextRNG(x, y)
	local rnglist = predictRNGList(predict_count)
	drawRNGList(rnglist, x, y)
end


------------------------------------------------------------
-- main
------------------------------------------------------------

initial = 1
predict_count = 40
predict_list = {}

while true do

	if initial == 1 then
		--Funit.showAll()
		Bunit.showAll()
		predict_list = predictRNGList(predict_count)
		initial = 0
	end

	predict_list = markRNGList(predict_list)
	drawRNGList(predict_list, x, y)

	drawRNG()
	--drawNextRNG()
	--Funit.drawAll()
	--Bunit.drawAll()

	emu.frameadvance()
end

print(string.format("<<< lua bot is finished <<<"))
emu.pause()

