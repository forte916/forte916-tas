-- Astronoka
-- This script manipulate a drop of baboo feather.
--
-- Emulator: psxjin v2.0.2
--
-- + Usage
--   1. Start this script in a trap battle
--
-- + This script can
--     ++ manipulate a drop of baboo feather

require "astronoka_lib"

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
-- Baboo
-- + Baboo is defined at astronoka_lib
------------------------------------------------------------

function Baboo.attemptReload(func)
	-- read rng
	local crr_rng = memory.readdword(adr_rng)
	-- check whether the rng is changed
	if crr_rng == pre_rng then
		return false
	end
	
	-- create save state for repeat
	local pre_state = savestate.create()
	savestate.save(pre_state)

	Baboo.drawInfo()

	-- if the baboo droped a feather then return true
	-- else reload savestate and return false.
	if func() then
		return true
	else
		pre_rng = crr_rng
		savestate.load(pre_state)
		return false
	end
end

function Baboo.dropFeather()
	-- press select to skip battle
	Baboo.skipBattle()
	local crr_feather = memory.readword(adr_total_feather)

	if crr_feather > pre_feather then
		Baboo.postSkipBattle()
		return true
	end
	return false
end

function Baboo.dropGoldenSeedActual()
	-- press select to skip feed
	Baboo.skipFeed()
	local crr_total_seed = memory.readword(adr_total_seed)

	if crr_total_seed > pre_total_seed then
		Baboo.postSkipFeed()
		return true
	end
	return false
end

function Baboo.dropGoldenSeed()
	local retry_frm = 1500  -- range of frames: 1400 ~ 1600
	local result = false
	Baboo.loseBattle()

	for i=0, retry_frm do

		result = Baboo.attemptReload(Baboo.dropGoldenSeedActual)
		if result == true then
			return true
		end

		emu.frameadvance()
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

		local done = memory.readword(adr_trap_battle)
		if done == in_trap_battle then
			result = Baboo.attemptReload(Baboo.dropFeather)  -- disable if you want a golden seed
			--result = Baboo.attemptReload(Baboo.dropGoldenSeed)  -- enable if you want a golden seed
			if result then
				break
			end
		end

		local done2 = memory.readword(adr_reaction2)
		if done2 == reaction2_end then
			Baboo.dropFeather()  -- disable if you want a golden seed
			--Baboo.dropGoldenSeed()  -- enable if you want a golden seed
			break
		end
	end

	emu.frameadvance()
end

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

