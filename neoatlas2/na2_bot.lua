-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- Lua BOT skeleton.
--
-- Usage
--   1. Set interface class properly.
--   2. Start this script properly.
--

require "psx_lib"
require "na2_snap_lib"

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

local interface = SkipTitle

if interface.retry ~= nil then
	retry = interface.retry
else
	retry = 500
end

for i=0, retry do
	drawRetry(i, x, y)
	interface.pre_attempt()

	if initial == 1 then
		initial = 0
	end

	fadv(i)
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	--print(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check result
	local result = interface.success()
	if result then
		print(string.format("***** %s state. retry = %d, fc = %d, rng = %08X *****", result, i, fc, rng))
		interface.post_attempt(fc)
	end

	savestate.load(state)
end


fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

