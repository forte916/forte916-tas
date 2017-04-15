-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script takes best action.
--
-- Usage
--   1. Set interface class properly.
--   2. Start this script properly.
--

require "fft_attack_lib"

------------------------------------------------------------
-- initialize
------------------------------------------------------------
-- If set to true, no rerecords done by Lua are counted in the rerecord total.
-- If set to false, rerecords done by Lua count. By default, rerecords count.
movie.rerecordcounting(false)

-- maximum is fastest, if you need not render
--emu.speedmode("maximum")     -- screen rendering is disabled
emu.speedmode("turbo")       -- drops some frames
--emu.speedmode("nothrottle")  -- max spped without frameskip
--emu.speedmode("normal")      -- normal speed (test use)



------------------------------------------------------------
-- functions
------------------------------------------------------------
function waitForBest()
	local retry = 48
	local best_rng = 0x4892C5B9

	for i=0, retry do
		local rng = memory.readdword(adr_rng)
		if rng == best_rng then
			return
		else
			emu.frameadvance()
		end
	end
	print("error: Could not find best rng.")
end


------------------------------------------------------------
-- main
------------------------------------------------------------

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
local fc = emu.framecount()
local rng = memory.readdword(adr_rng)

local interface = OrbonneAgriasTurn2

--f = io.open(interface.logname, "a")
--if f == nil then print("error: Could not open file") end

retry = 0

for i=0, retry do
	interface.pre_attempt()

	if interface.waitForBest ~= nil then
		interface.waitForBest()
	else
		waitForBest()
	end

	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	print(string.format("----- fc = %d, rng = %08X -----", fc, rng))

	interface.attempt()

	-- check result
	local result =  interface.success()
	if result then
		print(string.format("  ***** %s state. retry = %d, fc = %d, rng = %08X *****", result, i, fc, rng))
		interface.post_attempt()
	else
		print(string.format("error: Could not take best action. fc = %d, rng = %08X", fc, rng))
	end
end


fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()
--f:close()

