-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This scripts find a good status of Ramza.
-- Ramza needs high starting Squire JP and Chemist JP.
--
-- Usage
--   1. Start this script at the end of Orbonne battle.
--

require "psx_lib"
require "fft_lib"

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
-- GarilandParty
------------------------------------------------------------

GarilandParty = {}
--GarilandParty.logname = "ch1_1_orbonne_generic_choice_partyE4.log"
GarilandParty.logname = "ch1_1_orbonne_generic_choice_partyE4_cheat.log"
GarilandParty.retry = 5000

GarilandParty.best_st = {}
GarilandParty.cur_st = {}

-- TODO: refactoring using bit flag
GarilandParty.fit = {
	faith_best   = 0,
	faith_good   = 0,
	squire_best  = 0,
	squire_good  = 0,
	chemist_best = 0,
	chemist_good = 0,
	priest_best  = 0,
	priest_good  = 0,
	wizard_best  = 0,
	wizard_good  = 0,
	knight_best  = 0,
	knight_good  = 0,
	inherit_best = 0,
	inherit_good = 0,
	math_best    = 0,
	math_good    = 0,
}
fit = GarilandParty.fit

function GarilandParty.clearFit()
	for key, value in pairs(GarilandParty.fit) do
		GarilandParty.fit[key] = 0
	end
end

function GarilandParty.incrementFit(prpt)
	for key, value in pairs(GarilandParty.fit) do
		GarilandParty.fit[key] = value + prpt[key]
	end
end

function GarilandParty.matchBestMath()
	if fit.wizard_best > 0 and fit.knight_best > 0 and fit.math_best > 0 then
		return true
	else 
		return false
	end
end

function GarilandParty.matchGoodMath()
	if (fit.wizard_best + fit.wizard_good) > 0 and (fit.knight_best + fit.knight_good) > 0 and (fit.math_best + fit.math_good) > 0 then
		return true
	else 
		return false
	end
end

function GarilandParty.matchBestPriest()
	if fit.wizard_best > 0 and fit.knight_best > 0 and fit.priest_best > 0 then
		return true
	else 
		return false
	end
end

function GarilandParty.matchGoodPriest()
	if (fit.wizard_best + fit.wizard_good) > 0 and (fit.knight_best + fit.knight_good) > 0 and (fit.priest_best + fit.priest_good) > 0 then
		return true
	else 
		return false
	end
end


function GarilandParty.matchBestWizard()
	if fit.wizard_best > 0 and fit.knight_best > 0 then
		return true
	else 
		return false
	end
end

function GarilandParty.matchGoodWizard()
	if (fit.wizard_best + fit.wizard_good) > 0 and (fit.knight_best + fit.knight_good) > 0 then
		return true
	else 
		return false
	end
end


function GarilandParty.logHeader()
	debugPrint(string.format("-- Bunit Legend --"))
	debugPrint(string.format("%s", Bunit.info_header5))
	debugPrint(string.format(" 4, 1, 4,81 |  1,88 | 71,55 | 169- 39,113 | 153 | 181,125,154,124,121 | delita"))
	debugPrint(string.format("80, 2,4a,20 |  1,87 | 48,47 | 107- 27,123 | 180 | 171,163,109,123,177 |  973 |"))
	debugPrint(string.format("80, 3,4a,91 |  1,45 | 56,61 | 100- 20,134 | 107 | 110,163,162,115,143 |  927 |"))
	debugPrint(string.format("80, 4,4b, 0 |  1,51 | 68,71 | 155- 75,118 | 177 | 171,186,109,162,149 | 1050 |"))
	debugPrint(string.format("81, 5,4a,51 |  1,49 | 60,61 | 182- 12,163 | 186 | 107,114,145,121,122 |  954 |"))
	debugPrint(string.format("81, 6,4a, 0 |  1,54 | 53,69 | 176-  6,155 | 172 | 183,168,122,198,102 | 1104 |"))
	debugPrint(string.format("81, 7,4b,30 |  1,50 | 66,61 | 195- 25,117 | 114 | 156,110,175,175,100 | 1028 |"))
	debugPrint(string.format(""))
end

function GarilandParty.pre_attempt()
	fadv(12-1)
	pressBtn({x=1}, 1)
	fadv(5)
end

function GarilandParty.attempt()
	pressBtn({x=1}, 1)
	fadv(600)

	--fadv(200)
end

function GarilandParty.post_attempt()
	-- pass
end


function GarilandParty.fitCalculator(prpt, str)
	local calc_st = {}
	local calc_sum = 0

	calc_st.total_JP_squire     = prpt.total_JP_squire
	calc_st.total_JP_chemist    = prpt.total_JP_chemist
	calc_st.total_JP_priest     = prpt.total_JP_priest
	calc_st.total_JP_wizard     = prpt.total_JP_wizard
	calc_st.total_JP_time_mage  = prpt.total_JP_time_mage
	calc_st.total_JP_oracle     = prpt.total_JP_oracle
	calc_st.total_JP_calculator = prpt.total_JP_calculator

	for key, value in pairs(calc_st) do
		calc_sum = calc_sum + value
	end
	str = string.format("%s%4d |", str, calc_sum)

	prpt.math_best = 0
	prpt.math_good = 0
	if calc_sum >= 1200 then
		prpt.math_best = 1
		str = string.format("%s, math+", str)
	elseif calc_sum >= 1160 then
		prpt.math_good = 1
		str = string.format("%s, math-", str)
	end
	return prpt, str
end

function GarilandParty.fitFaith(prpt, str)
	prpt.faith_best = 0
	prpt.faith_good = 0
	if Bunit.isFemale(prpt) ~= 0 then
		if prpt.faith > 70 then
			prpt.faith_best = 1
			str = string.format("%s, faith+", str)
		elseif prpt.faith > 67 then
			prpt.faith_good = 1
			str = string.format("%s, faith-", str)
		end
	elseif Bunit.isMale(prpt) ~= 0 then
		if prpt.faith > 70 then
			prpt.faith_good = 1
			str = string.format("%s, faith-", str)
		end
	end
	return prpt, str
end

function GarilandParty.fitChemist(prpt, str)
	prpt.chemist_best = 0
	prpt.chemist_good = 0
	if Bunit.isJobSquire(prpt) == true then
		if prpt.total_JP_chemist > 190 then
			prpt.chemist_best = 1
			str = string.format("%s, chemist+", str)
		elseif prpt.total_JP_chemist > 179 then
			prpt.chemist_good = 1
			str = string.format("%s, chemist-", str)
		end
	elseif Bunit.isJobChemist(prpt) == true then
		if prpt.total_JP_chemist > 169 then
			prpt.chemist_best = 1
			str = string.format("%s, chemist+", str)
		elseif prpt.total_JP_chemist > 139 then
			prpt.chemist_good = 1
			str = string.format("%s, chemist-", str)
		end
	end

	return prpt, str
end

function GarilandParty.fitWizard(prpt, str)
	prpt.wizard_best = 0
	prpt.wizard_good = 0
	prpt, str = GarilandParty.fitFaith(prpt, str)
	prpt, str = GarilandParty.fitChemist(prpt, str)

	if prpt.faith_best > 0 and prpt.chemist_best > 0 then
		prpt.wizard_best = 1
		str = string.format("%s, wizard+", str)
	elseif (prpt.faith_best + prpt.faith_good) > 0 and (prpt.chemist_best + prpt.chemist_good) > 0 then
		prpt.wizard_good = 1
		str = string.format("%s, wizard-", str)
	end
	return prpt, str
end

function GarilandParty.fitSquire(prpt, str)
	prpt.squire_best = 0
	prpt.squire_good = 0
	if Bunit.isJobSquire(prpt) == true then
		if prpt.total_JP_squire > 164 then
			prpt.squire_best = 1
			str = string.format("%s, squire+", str)
		elseif prpt.total_JP_squire > 139 then
			prpt.squire_good = 1
			str = string.format("%s, squire-", str)
		end
	elseif Bunit.isJobChemist(prpt) == true then
		if prpt.total_JP_squire > 179 then
			prpt.squire_best = 1
			str = string.format("%s, squire+", str)
		elseif prpt.total_JP_squire > 154 then
			prpt.squire_good = 1
			str = string.format("%s, squire-", str)
		end
	end

	return prpt, str
end

function GarilandParty.fitKnight(prpt, str)
	prpt.knight_best = 0
	prpt.knight_good = 0
	prpt, str = GarilandParty.fitSquire(prpt, str)

	if prpt.total_JP_knight > 189 and prpt.squire_best > 0 then
		prpt.knight_best = 1
		str = string.format("%s, knight+", str)
	elseif prpt.total_JP_knight > 169 and (prpt.squire_best + prpt.squire_good) > 0 then
		prpt.knight_good = 1
		str = string.format("%s, knight-", str)
	end
	return prpt, str
end

function GarilandParty.fitInherit(prpt, str)
	prpt.inherit_best = 0
	prpt.inherit_good = 0
	if prpt.squire_best > 0 and prpt.chemist_best > 0 then
		prpt.inherit_best = 1
		str = string.format("%s, inherit+", str)
	elseif (prpt.squire_best + prpt.squire_good) > 0 and (prpt.chemist_best + prpt.chemist_good) > 0 then
		prpt.inherit_good = 1
		str = string.format("%s, inherit-", str)
	end
	return prpt, str
end

function GarilandParty.fitPriest(prpt, str)
	prpt.priest_best = 0
	prpt.priest_good = 0
	--prpt, str = GarilandParty.fitChemist(prpt, str)

	if prpt.total_JP_priest > 189 and prpt.chemist_best > 0 then
		prpt.priest_best = 1
		str = string.format("%s, priest+", str)
	elseif prpt.total_JP_priest > 169 and (prpt.chemist_best + prpt.chemist_good) > 0 then
		prpt.priest_good = 1
		str = string.format("%s, priest-", str)
	end
	return prpt, str
end

function GarilandParty.successGeneric()
	local ret = nil
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local total_party = 6
	local str

	GarilandParty.clearFit()

	for i=1, total_party do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		prpt, str = GarilandParty.fitCalculator(prpt, str)

		prpt, str = GarilandParty.fitWizard(prpt, str)
		prpt, str = GarilandParty.fitKnight(prpt, str)
		prpt, str = GarilandParty.fitInherit(prpt, str)

--		if prpt.total_JP_wizard > 179 then
--			str = string.format("%s, wizardJP", str)
--		end

		if prpt.JP_squire > 120 then
			str = string.format("%s, squireJP", str)
		end

		prpt, str = GarilandParty.fitPriest(prpt, str)

		debugPrint(str)
		GarilandParty.incrementFit(prpt)
	end

	if GarilandParty.matchBestMath() then
		ret = "best_math"
	elseif GarilandParty.matchBestPriest() then
		ret = "best_priest"
	elseif GarilandParty.matchBestWizard() then
		ret = "best_wizard"
	elseif GarilandParty.matchGoodMath() then
		ret = "good_math"
	elseif GarilandParty.matchGoodPriest() then
		ret = "good_priest"
	elseif GarilandParty.matchGoodWizard() then
		ret = "good_wizard"
	end

	return ret
end

function GarilandParty.successDelita()
	local ret = nil
	local prpt = {}
	local ofs_unit = adr_battle_unit2
	local str

	prpt = Bunit.readProperty(ofs_unit)
	str = prpt.info
	str = str.."delita"

	if Bunit.isLearnedDefend(prpt) ~= 0 then
		str = str..", Defend"

		if Bunit.isSetDefend(prpt) then
			str = str.." set"
		else
			str = str.." NOT set"
		end
	end

	if Bunit.isLearnedThrowStone(prpt) ~= 0 then
		str = str..", throw stone"

		if Bunit.isSetBasicSkill(prpt) then
			str = str.." set"
		else
			str = str.." NOT set"
		end
	end

	debugPrint(str)
end

function GarilandParty.success()
	GarilandParty.successDelita()
	return GarilandParty.successGeneric()
end

-- @deplicated
function GarilandParty.compareStatus()
	local ret = false
	local best_sum = 0
	local cur_sum = 0

	debugPrint(string.format("--1 best_st:: %s", GarilandParty.format_st(GarilandParty.best_st)))
	debugPrint(string.format("--1 cur_st :: %s", GarilandParty.format_st(GarilandParty.cur_st )))

	for key, value in pairs(GarilandParty.best_st) do
		best_sum = best_sum + value
	end

	for key, value in pairs(GarilandParty.cur_st) do
		cur_sum = cur_sum + value
	end


	if (best_sum < cur_sum) then
		GarilandParty.best_st = shallowcopy(GarilandParty.cur_st)
		ret = true
		print(GarilandParty.best_st)
	else
		ret = false
	end

	return ret
end

-- @deplicated
function GarilandParty.success_old()
	local ret = false

	local cur_prpt = {}
	cur_prpt = Funit.readProperty(adr_formation_unit4)
	debugPrint(cur_prpt.info)

	GarilandParty.cur_st.faith     = cur_prpt.faith
	GarilandParty.cur_st.chemistJP = cur_prpt.total_JP_chemist

	ret = GarilandParty.compareStatus()

	return ret
end

function GarilandParty.format_st(st)
	local st_info
	local st_sum = 0

	for key, value in pairs(st) do
		st_sum = st_sum + value
	end

	st_info = string.format("faith = %d, ch_jp = %d, sum = %d", st.faith, st.chemistJP, st_sum)
	return st_info
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
local seed

local interface = GarilandParty

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end

if interface.retry ~= nil then
	retry = interface.retry
else
	retry = 500
end


for i=0, retry do
	drawRetry(i, x, y)
	interface.pre_attempt()

--	if initial == 1 then
--		initial = 0
--	end
--	fadv(i)

-- 
-- cheat retry
-- 
	if initial == 1 then
		initial = 0
		fadv(i)

		--seed = memory.readdword(adr_rng)
		--seed = 0xD0ED60DA  -- 16700f
		seed = 0x66FBF315  -- 17000f
		--seed = 0x60797F1D  -- 17343f
		--seed = 0x785C9B05  -- 17190f
		--seed = 0x4C4BFA3E
	else
		seed = next_rng(seed)
		memory.writedword(adr_rng, seed)
	end


	fc = emu.framecount()
	rng = memory.readdword(adr_rng)

	--debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X, seed = %08X -----", i, fc, rng, seed))

	interface.attempt()

	-- check result
	local result =  interface.success()
	if result then
		debugPrint(string.format("  ***** %s state. retry = %d, fc = %d, rng = %08X *****", result, i, fc, rng))
		print(string.format("  ***** %s state. retry = %d, fc = %d, rng = %08X *****", result, i, fc, rng))
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
f:close()
emu.speedmode("normal")
emu.pause()

