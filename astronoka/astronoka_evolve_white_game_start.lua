-- Astronoka
-- This script manipulate a baboo DNA to evolve a white.
--
-- Emulator: psxjin v2.0.2
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

	-- if the baboo droped a feather then return true
	-- else reload savestate and return false.
	if func() then
		return true
	else
		savestate.load(pre_state)
		return false
	end
end

function game_start_white()
	TAS.inputName()

	local crr_rng = memory.readdword(adr_rng)
	debugPrint(string.format("fc = %d, rng = %08x, day1", emu.framecount(), crr_rng))

	TAS.d1101()  -- plant
	TAS.d1102()
	TAS.d1103()
	TAS.d1104()  -- plant
	TAS.d1105()
	TAS.d1106()
	TAS.d1107()  -- plant, sunday
	TAS.d1108_1st()  -- first baboo
	Baboo.drawInfo()

	debugPrint(string.format(">>>> pre >>>> day8"))
	pre_gene_HP       = Baboo.readGene(24)
	pre_gene_YarukiP  = Baboo.readGene(30)
	pre_gene_Movement = Baboo.readGene(31)
	pre_gene_Drop     = Baboo.readGene(65)

	--TAS.d1108_2nd_win()  -- first baboo
	TAS.d1108_2nd_lose()
	Baboo.drawInfo()

	weakened1 = Baboo.evolveWhite(pre_gene_HP, pre_gene_YarukiP, pre_gene_Movement, pre_gene_Drop)

	debugPrint(string.format(">>>> pre >>>> day9"))
	pre_gene_HP       = Baboo.readGene(24)
	pre_gene_YarukiP  = Baboo.readGene(30)
	pre_gene_Movement = Baboo.readGene(31)
	pre_gene_Drop     = Baboo.readGene(65)

	TAS.d1109()
	TAS.exitDayBaboo()
	Baboo.drawInfo()

	weakended2 = Baboo.evolveWhite(pre_gene_HP, pre_gene_YarukiP, pre_gene_Movement, pre_gene_Drop)

	if weakened1 and weakended2 then
		debugPrint(string.format("***** weaken DNA *****"))
		return true
	end

	return false
end

function showBabooStatus()
		crr_days = memory.readbyte(adr_days)
		yy = memory.readbyte(adr_years) + 1
		mm = crr_days / 28 + 1
		dd = crr_days % 28 + 1
		fc = emu.framecount()
		win = memory.readword(adr_win_count)

		f:write(string.format("----- year%d %d/%d , fc = %d , win = %d -----".."\n", yy, mm, dd, fc, win))
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
pre_rng = 0
pre_gene_HP       = {}
pre_gene_YarukiP  = {}
pre_gene_Movement = {}
pre_gene_Drop     = {}

f = io.open("baboo_white.log", "a")
if f == nil then debugPrint("error: Could not open file") end

TAS.start()

while true do

	if initial == 1 then
		initial = 0
		showBabooStatus()
	end

	if initial == 0 then
		debugPrint(string.format("----- retry = %d -----", retry))
		result = attemptReload(game_start_white)
		if result then
			debugPrint(string.format("-- retry = %d, weaken DNA!!!!!", retry))
			showBabooStatus()
			break
		end

		if retry > 200 then
			debugPrint(string.format("-- retry = %d, finished...", retry))
			break
		end
	end

	f:flush()
	retry = retry + 1
	emu.frameadvance()
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

f:close()

