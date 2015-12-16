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

function outputRNG()
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()

	debugPrint(string.format("%d, %08X", fc, rng))
end

function outputNextRNG()
	local rnglist = {}
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()
	local retry = 500

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

f = io.open("next_rng.log", "a")
if f == nil then print("error: Could not open file") end

--while true do
--	outputRNG()
--	emu.frameadvance()
--end

outputNextRNG()
f:flush()


print(string.format("<<< lua bot is finished <<<"))
emu.pause()
f:close()

