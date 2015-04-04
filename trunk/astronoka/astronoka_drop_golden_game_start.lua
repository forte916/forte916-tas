-- Astronoka
-- This script manipulate a drop of golden seed.
--
-- + Emulater: psxjin v2.0.2
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

function attemptReload(func)
	-- create save state for repeat
	local pre_state = savestate.create()
	savestate.save(pre_state)

	-- if the baboo droped a feather then return true
	-- else reload savestate and return false.
	if func() then
		return true
	else
		savestate.load(pre_state)
		return false
	end
end

function game_start_golden()
	TAS.inputName()
	TAS.d1101()  -- plant
	TAS.d1102()
	TAS.d1103()
	TAS.d1104()  -- plant
	TAS.d1105()
	TAS.d1106()
	TAS.d1107()  -- plant, sunday
	TAS.d1108_1st()  -- first baboo
	local pre_total_seed = memory.readword(adr_total_seed)
	Baboo.drawInfo()
	TAS.d1108_2nd_lose()  -- first baboo
	Baboo.drawInfo()

	local crr_total_seed = memory.readword(adr_total_seed)

	if crr_total_seed > pre_total_seed then
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
local retry = 0

TAS.start()

while true do

	if initial == 1 then
		initial = 0
	end

	if initial == 0 then
		print(string.format("-- retry = %d", retry))
		result = attemptReload(game_start_golden)  -- enable if you want a golden seed
		if result then
			print(string.format("-- retry = %d, found golden!!!!!", retry))
			break
		end

		if retry > 1000 then
			print(string.format("-- retry = %d, no golden", retry))
			break
		end
	end

	retry = retry + 1
	emu.frameadvance()
end

Baboo.drawInfo()
local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

