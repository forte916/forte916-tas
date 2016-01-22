-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This scripts find a good status of Ramza.
-- Ramza needs high starting Squire JP and Chemist JP.
--
-- Usage
--   1. Start this script at the end of Obonne battle.
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
GarilandParty.logname = "ch1_gariland_party1.log"


GarilandParty.best_st = {}
GarilandParty.cur_st = {}

function GarilandParty.pre_attempt()
	fadv(4)
end

function GarilandParty.attempt()
	pressBtn({circle=1}, 1)
	fadv(5500)

	for i=1, 120 do
		pressBtn({circle=1}, 9)
	end

end

function GarilandParty.post_attempt()
	-- pass
end

function GarilandParty.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local total_party = 6
	local str
	local candidate = 0

	for i=1, total_party do
		local good = 0
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.faith > 69 then
			good = good + 1
			str = string.format("%s, faith", str)
		end

		if prpt.total_JP_chemist > 179 then
			good = good + 1
			str = string.format("%s, chemist", str)
		end

		if prpt.total_JP_wizard > 179 then
			str = string.format("%s, wizard", str)
		end

		if prpt.total_JP_knight > 179 then
			str = string.format("%s, knight", str)
		end

		if prpt.JP_squire > 99 then
			str = string.format("%s, squireJP", str)
		end

		if good > 1 then
			candidate = candidate + 1
		end

		debugPrint(str)
	end

	debugPrint(string.format("-- candidate = %2d", candidate))
	if candidate > 0 then
		print(string.format("-- candidate = %2d", candidate))
		ret = true
	else
		ret = false
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


retry = 100

for i=0, retry do
	if initial == 1 then
		--GarilandParty.best_st.faith     = 0
		--GarilandParty.best_st.chemistJP = 0
		initial = 0
	end

	interface.pre_attempt()
	fadv(i)
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check status
	if interface.success() then
		--debugPrint(string.format("***** best state. fc = %d, %s, rng = %08X *****", fc, GarilandParty.format_st(GarilandParty.best_st), rng))

		debugPrint(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))
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

