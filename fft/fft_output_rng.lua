-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script outputs rng.
--
-- Usage
--   1. Start this script
--

require "psx_lib"
require "fft_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------

function logHeader()
	debugPrint(string.format("fc, rng"))
end

function outputRNG()
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()

	debugPrint(string.format("%d, %08X", fc, rng))
end

function outputNextRNG(retry , rng)
	local rnglist = {}
	local fc = emu.framecount()

	if retry == nil then retry = 500 end
	if rng == nil then rng = memory.readdword(adr_rng) end

	debugPrint(string.format("----- fc = %d, rng = %08X -----", fc, rng))

	for i=0, retry do
		rnglist[i] = rng
		rng = next_rng(rng)
	end

	for i=0, retry do
		debugPrint(string.format("%08X", rnglist[i]))
	end

	debugPrint(string.format("----- -----"))
end


------------------------------------------------------------
-- main
------------------------------------------------------------

f = io.open("next_rng_seed_0xF930D9E0_1639f.log", "a")
if f == nil then print("error: Could not open file") end

--logHeader()
--emu.registerafter(outputRNG)
--while true do
--	emu.frameadvance()
--end

outputNextRNG(1000, 0xF930D9E0)
f:flush()


print(string.format("<<< lua bot is finished <<<"))
emu.pause()
f:close()

