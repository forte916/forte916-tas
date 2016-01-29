-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script manipulates attack action with cheat rng.
-- ex.) critical, death all and survive someone.
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
function drawRetry(count, x, y)
	x = x or 0
	y = y or 30

	gui.text(x, y   , string.format(" retry:%d", count))
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
local base_rng

local interface = CriticalHit

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end

--debugPrint(string.format("----- pre_attempt=none, attempt=select, confirm, execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, attempt=confirm, execute -----", i, fc, rng))
debugPrint(string.format("----- pre_attempt=select, confirm, attempt=execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, confirm, execute, attempt=none -----", i, fc, rng))

retry = 200

for i=0, retry do
	if initial == 1 then
		initial = 0
		fadv(i)

		state = savestate.create()
		savestate.save(state)

		base_rng = memory.readdword(adr_rng)
	else
		base_rng = next_rng(base_rng)
		memory.writedword(adr_rng, base_rng)
		--base_rng = next_rng(base_rng)  -- ?? enable Death_All, disable otherwise
	end

	drawRetry(i, x, y)
	interface.pre_attempt()

	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X, base_rng = %08X -----", i, fc, rng, base_rng))

	interface.attempt()

	-- check results
	if interface.success() then
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X*****", fc, rng))
		print(string.format("  ***** best state. retry = %d, rng = %08X *****", i, rng))
		interface.post_attempt()
	end

	f:flush()
	savestate.load(state)
end


fc = emu.framecount()
debugPrint(string.format("<<< lua bot is finished <<<"))
debugPrint(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
debugPrint(string.format("    end:: %s,  fc = %d", os.date(), fc))
debugPrint(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()
f:close()

