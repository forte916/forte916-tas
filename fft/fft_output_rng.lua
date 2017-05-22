-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulator: psxjin v2.0.2
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
	--debugPrint("### case1: one enemy")
	debugPrint("### case2: do nothing")
	debugPrint(string.format("fc, rng"))
end

function outputRNG()
	local rng = memory.readdword(adr_rng)
	local fc = emu.framecount()
	local lagf = emu.lagged()
	local str = string.format("%d, %08X", fc, rng)

	if lagf then
		str = string.format("%s, lagged", str)
	end

	debugPrint(str)
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


function outputRNG_GameTime(retry)
	GameTime.init(0, 18, 21, 16)
	debugPrint("game time, rng, random, encount formula")

	for i=0, retry do
		local rng = GameTime.getSeed()
		local random = rand(rng)
		local encount_formula = random * 100 / 0x8000
		debugPrint(string.format("%s, %08X, %5d, %2d", GameTime.format(), rng, random, encount_formula))

		GameTime.increment()
	end

end

------------------------------------------------------------
-- main
------------------------------------------------------------

f = io.open("rolling_rng_in_entd_flag2.log", "a")
if f == nil then print("error: Could not open file") end

logHeader()
emu.registerafter(outputRNG)
while true do
	emu.frameadvance()
end

--outputNextRNG(1000, 0xFA073EF7)
--outputNextRNG()
--outputRNG_GameTime(200)
f:flush()


print(string.format("<<< lua bot is finished <<<"))
f:close()
emu.pause()

