-- Astronoka
-- This script manipulate a baboo DNA to evolve a white.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Start this script in a field.
--
-- + This script can
--     ++ manipulate a DNA of baboo.
--     ++ evolve a wthite baboo

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

	TAS.exitField()

	local crr_rng = memory.readdword(adr_rng)
	-- check whether the rng is changed
	if crr_rng == pre_rng then
		savestate.load(pre_state)
		return false
	end
	pre_rng = crr_rng

	debugPrint(string.format("fc = %d, rng = %08x", emu.framecount(), crr_rng))
	Baboo.drawInfo()


	-- if baboo weakened then return true
	-- else reload savestate and return false.
	if func() then
		showBabooStatus()
		evolve_cnt = evolve_cnt + 1

		if evolve_cnt >= 5 then
			return true
		end
	end

	savestate.load(pre_state)
	return false
end

function checkEvolveWhite()
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	TAS.exitDayBaboo()

	weakened = Baboo.evolveWhite(pre_gene_HP, pre_gene_YarukiP, pre_gene_Movement, pre_gene_Drop)
	return weakened
end

function showBabooStatus()
		crr_days = memory.readbyte(adr_days)
		yy = memory.readbyte(adr_years) + 1
		mm = crr_days / 28 + 1
		dd = crr_days % 28 + 1
		fc = emu.framecount()
		come = memory.readbyte(adr_baboo_today)

		f:write(string.format("----- year%d %d/%d , fc = %d , come = %d -----".."\n", yy, mm, dd, fc, come))
		Baboo.showStatus()
		f:flush()
end

------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local result = false
local begin_fc = emu.framecount()
local begin_date = os.date()
local retry = 0
evolve_cnt = 0
pre_rng = 0
pre_gene_HP       = {}
pre_gene_YarukiP  = {}
pre_gene_Movement = {}
pre_gene_Drop     = {}

f = io.open("baboo_white.log", "a")
if f == nil then debugPrint("error: Could not open file") end

while true do

	if initial == 1 then
		showBabooStatus()
		pre_gene_HP       = Baboo.readGene(24)
		pre_gene_YarukiP  = Baboo.readGene(30)
		pre_gene_Movement = Baboo.readGene(31)
		pre_gene_Drop     = Baboo.readGene(65)
		initial = 0
	end

	if initial == 0 then
		Baboo.drawInfo()
		debugPrint(string.format("----- retry = %d -----", retry))
		result = attemptReload(checkEvolveWhite)
		if result then
			break
		end

	end

	f:flush()
	retry = retry + 1
	emu.frameadvance()
	--TAS.soilCancel()
end


Baboo.drawInfo()
showBabooStatus()
local fc = emu.framecount()
debugPrint(string.format("<<< lua bot is finished <<<"))
debugPrint(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
debugPrint(string.format("    end:: %s,  fc = %d", os.date(), fc))
debugPrint(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

