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

local interface = Death_All

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end

--debugPrint(string.format("----- pre_attempt=none, attempt=select, confirm, execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, attempt=confirm, execute -----", i, fc, rng))
debugPrint(string.format("----- pre_attempt=select, confirm, attempt=execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, confirm, execute, attempt=none -----", i, fc, rng))

retry = 400

for i=0, retry do
	interface.pre_attempt()

	if initial == 1 then
		initial = 0
		fadv(i)
		rng = memory.readdword(adr_rng)
	else
		memory.writedword(adr_rng, rng)
		rng =  next_rng(rng)
	end

	fc = emu.framecount()
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check results
	if interface.success() then
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X *****", fc, rng))
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

