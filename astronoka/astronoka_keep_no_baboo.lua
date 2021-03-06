-- Astronoka
-- This script manipulate a baboo appearance.
--
-- Emulator: psxjin v2.0.2
--
-- + Usage
--   1. Start this script in a field.
--
-- + This script can
--     ++ manipulate a drop of golden seed.

require "astronoka_input_macro_lib"

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
-- Baboo
-- + Baboo is defined at astronoka_lib
-----------------------------------------------------------

function Baboo.attemptReload(func)
	-- create save state for repeat
	local pre_state = savestate.create()
	savestate.save(pre_state)

	local crr_rng1 = memory.readdword(adr_rng)
	--print(string.format("-------------------- fc = %d, rng = %08x", emu.framecount(), crr_rng1))
	TAS.exitField()

	-- read rng
	local crr_rng = memory.readdword(adr_rng)
	-- check whether the rng is changed
	print(string.format("fc = %d, rng = %08x", emu.framecount(), crr_rng))
	if crr_rng == pre_rng then
		savestate.load(pre_state)
		return false
	end

	Baboo.drawInfo()

	-- if no baboo then return true
	-- else reload savestate and return false.
	if func() then
		return true
	else
		pre_rng = crr_rng
		savestate.load(pre_state)
		return false
	end
end

function Baboo.keepNoBaboo()
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	TAS.enterBinocular()  -- enable this func if manipulare rng in binocular.

	local rng = memory.readdword(adr_rng)
	local baboos = memory.readbyte(adr_baboo_today)
	print(string.format("fc = %d, rng = %08x, baboos = %d", emu.framecount(), rng, baboos))

	if 0 == baboos then
		return true
	end

	return false
end

------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local result = false
local begin_fc = emu.framecount()
local begin_date = os.date()
pre_rng = 0
pre_feather = memory.readword(adr_total_feather)
pre_total_seed = memory.readword(adr_total_seed)


while true do

	if initial == 1 then
		--Baboo.showStatus()
		initial = 0
	end

	if initial == 0 then
		Baboo.drawInfo()
		result = Baboo.attemptReload(Baboo.keepNoBaboo)
		if result then
			break
		end
	end

	emu.frameadvance()
end

TAS.exitBinocular()  -- enable this func if manipulare rng in binocular.
joypadSetHelper(1, {up=1}, 6)  -- move cursor
joypadSetHelper(1, {up=1}, 6)  -- move cursor
TAS.exitDayNoBaboo()

Baboo.drawInfo()
local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

