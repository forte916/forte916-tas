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
function drawRetry(count, x, y)
	x = x or 0
	y = y or 30

	gui.text(x, y   , string.format(" retry:%d", count))
end


------------------------------------------------------------
-- GarilandParty
------------------------------------------------------------

GarilandParty = {}
GarilandParty.logname = "ch1_2_gariland_party4.log"

GarilandParty.best_st = {}
GarilandParty.cur_st = {}

function GarilandParty.logHeader()
	debugPrint(string.format("-- Bunit Legend --"))
	debugPrint(string.format("%s", Bunit.info_header4))
	debugPrint(string.format("80, 2,4a,30 |  1,40, 6 | 53,61 |  43,10 | 150- 70,161 | 145,181 |"))
	debugPrint(string.format("80, 3,4a,40 |  1,34, 6 | 50,67 |  44,10 | 168- 18,163 | 140,161 |"))
	debugPrint(string.format("80, 4,4b,20 |  1,45, 6 | 57,70 |  38,11 | 104- 14,194 | 137,127 |"))
	debugPrint(string.format("81, 5,4a,20 |  1,36, 6 | 62,63 |  41,11 | 155- 75,173 | 141,191 |"))
	debugPrint(string.format("81, 6,4a,30 |  1,79, 6 | 56,59 |  41,11 | 146- 66,107 | 198,169 |"))
	debugPrint(string.format("81, 7,4b, 0 |  1,37, 6 | 58,61 |  36,11 | 169- 89,117 | 145,179 |"))
	debugPrint(string.format(""))
end

function GarilandParty.pre_attempt()
	fadv(2)
	pressBtn({circle=1}, 1)
end

function GarilandParty.attempt()
	pressBtn({x=1}, 1)
	fadv(5500)

	for i=1, 120 do
		pressBtn({circle=1}, 9)
	end

end

function GarilandParty.post_attempt()
	-- pass
end


function GarilandParty.checkCalcGrind(prpt)
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

	if calc_sum > 1999 then
		debugPrint(string.format("calc_st = %s", calc_st))
		print(string.format("calc_st = %s", calc_st))
	end

	return calc_sum
end

function GarilandParty.fitChemist(prpt)
	local good_fit = 0
	local best_fit = 0

	if Bunit.isJobSquire(prpt) == true then
		if prpt.total_JP_chemist > 190 then
			best_fit = best_fit + 1
		elseif prpt.total_JP_chemist > 179 then
			good_fit = good_fit + 1
		end
	elseif Bunit.isJobChemist(prpt) == true then
		if prpt.total_JP_chemist > 160 then
			best_fit = best_fit + 1
		elseif prpt.total_JP_chemist > 139 then
			good_fit = good_fit + 1
		end
	end

	if best_fit > 0 then
		return "best"
	elseif good_fit > 0 then
		return "good"
	end
end

function GarilandParty.fitWizard(prpt, str)
	local good_fit = 0
	local best_fit = 0
	local fit = nil

	if Bunit.isFemale(prpt) ~= 0 then
		if prpt.faith > 70 then
			best_fit = best_fit + 1
			str = string.format("%s, faith+", str)
		elseif prpt.faith > 67 then
			good_fit = good_fit + 1
			str = string.format("%s, faith-", str)
		end
	elseif Bunit.isMale(prpt) ~= 0 then
		if prpt.faith > 70 then
			good_fit = good_fit + 1
			str = string.format("%s, faith-", str)
		end
	end

	fit = GarilandParty.fitChemist(prpt)
	if fit == "best" then
		best_fit = best_fit + 1
	elseif fit == "good" then
		good_fit = good_fit + 1
	end

	if best_fit > 1 then
		str = string.format("%s, wizard+", str)
		return "best", str
	elseif good_fit > 1 or (best_fit + good_fit) > 1 then
		str = string.format("%s, wizard-", str)
		return "good", str
	end
	return nil, str
end

function GarilandParty.fitSquire(prpt)
	local good_fit = 0
	local best_fit = 0

	if Bunit.isJobSquire(prpt) == true then
		if prpt.total_JP_squire > 135 then
			best_fit = best_fit + 1
		elseif prpt.total_JP_squire > 119 then
			good_fit = good_fit + 1
		end
	elseif Bunit.isJobChemist(prpt) == true then
		if prpt.total_JP_squire > 165 then
			best_fit = best_fit + 1
		elseif prpt.total_JP_squire > 149 then
			good_fit = good_fit + 1
		end
	end

	if best_fit > 0 then
		return "best"
	elseif good_fit > 0 then
		return "good"
	end
	return nil
end

function GarilandParty.fitKnight(prpt, str)
	local good_fit = 0
	local best_fit = 0
	local fit = nil

	fit = GarilandParty.fitSquire(prpt)
	if fit == "best" then
		best_fit = best_fit + 1
	elseif fit == "good" then
		good_fit = good_fit + 1
	end

	if prpt.total_JP_knight > 190 then
		best_fit = best_fit + 1
	elseif prpt.total_JP_knight > 169 then
		good_fit = good_fit + 1
	end

	if best_fit > 1 then
		str = string.format("%s, knight+", str)
		return "best", str
	elseif good_fit > 1 or (best_fit + good_fit) > 1 then
		str = string.format("%s, knight-", str)
		return "good", str
	end
	return nil, str
end

function GarilandParty.fitInherit(prpt, str)
	local good_fit = 0
	local best_fit = 0
	local fit = nil

	fit = GarilandParty.fitSquire(prpt)
	if fit == "best" then
		best_fit = best_fit + 1
		str = string.format("%s, squire+", str)
	elseif fit == "good" then
		good_fit = good_fit + 1
		str = string.format("%s, squire-", str)
	end

	fit = GarilandParty.fitChemist(prpt)
	if fit == "best" then
		best_fit = best_fit + 1
		str = string.format("%s, chemist+", str)
	elseif fit == "good" then
		good_fit = good_fit + 1
		str = string.format("%s, chemist-", str)
	end

	if best_fit > 1 then
		str = string.format("%s, inherit+", str)
		return "best", str
	elseif good_fit > 1 or (best_fit + good_fit) > 1 then
		str = string.format("%s, inherit-", str)
		return "good", str
	end
	return nil, str
end

function GarilandParty.success()
	local ret = nil
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local total_party = 6
	local str
	local candidate = 0
	local good_fit = 0
	local best_fit = 0

	for i=1, total_party do
		local wizard_fit = 0
		local knight_fit = 0
		local inherit_fit = 0
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info


		wizard_fit, str = GarilandParty.fitWizard(prpt, str)
		if wizard_fit == "best" then
			best_fit = best_fit + 1
		elseif wizard_fit == "good" then
			good_fit = good_fit + 1
		end

		knight_fit, str = GarilandParty.fitKnight(prpt, str)
		if knight_fit == "best" then
			best_fit = best_fit + 1
		elseif knight_fit == "good" then
			good_fit = good_fit + 1
		end

		inherit_fit, str = GarilandParty.fitInherit(prpt, str)
		if inherit_fit == "best" then
			candidate = candidate + 1
		elseif inherit_fit == "good" then
			candidate = candidate + 1
		end

--		if prpt.total_JP_wizard > 179 then
--			str = string.format("%s, wizardJP", str)
--		end

		if prpt.JP_squire > 120 then
			str = string.format("%s, squireJP", str)
		end

--		local math  = GarilandParty.checkCalcGrind(prpt)
--		if math > 1999 then
--			str = string.format("%s, math(%d)", str, math)
--		end

		debugPrint(str)
	end

	if best_fit > 2 then
		ret = "best"
	elseif good_fit > 2 or (best_fit + good_fit) > 2 then
		ret = "good"
	end

	return ret
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

local interface = GarilandParty

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end


retry = 1000

for i=0, retry do
	if initial == 1 then
		--GarilandParty.best_st.faith     = 0
		--GarilandParty.best_st.chemistJP = 0
		initial = 0
	end

	drawRetry(i, x, y)
	interface.pre_attempt()
	fadv(i)
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check result
	local result =  interface.success()
	if result then
		--debugPrint(string.format("***** best state. fc = %d, %s, rng = %08X *****", fc, GarilandParty.format_st(GarilandParty.best_st), rng))
		debugPrint(string.format("  ***** %s state. fc = %d, rng = %08X *****", result, fc, rng))
		print(string.format("  ***** %s state. retry = %d, rng = %08X *****", result, i, rng))
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

