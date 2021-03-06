-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulator: psxjin v2.0.2
--
-- This scripts find a good status of Ramza.
-- Ramza needs high starting Squire JP and Chemist JP.
--
-- Usage
--   1. Start this script at Arazlam message.
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
-- functions
------------------------------------------------------------

Ramza = {}
Ramza.logname = "ramza_status_5.log"
Ramza.best_st = {}
Ramza.cur_st = {}

function Ramza.logHeader()
	debugPrint(string.format("-- Funit Legend --"))
	debugPrint(string.format("%s  cur_sum | ret |", Funit.info_header))
	debugPrint(string.format(""))
end

function Ramza.pre_attempt()
	--fadv(3)
	--fadv(8)
end

function Ramza.attempt()
	pressBtn({start=1}, 1)  -- skip Arazlam
	fadv(350)
end

function Ramza.post_attempt()
	Ramza.format_st(Ramza.best_st)
end


function Ramza.compareStatus(cur_sum)
	local ret = nil
	local best_sum = 0

	if not next(Ramza.best_st) then
		Ramza.best_st = shallowcopy(Ramza.cur_st)
		print(Ramza.best_st)
		return "best"
	end

	for key, value in pairs(Ramza.best_st) do
		best_sum = best_sum + value
	end

	if (best_sum < cur_sum) then
		Ramza.best_st = shallowcopy(Ramza.cur_st)
		print(Ramza.best_st)
		ret = "best"
	elseif cur_sum > 1200 then
		print(Ramza.cur_st)
		ret = "good"
	else
		ret = nil
	end

	return ret
end

function Ramza.success()
	local ret = nil
	local str
	local cur_prpt = {}
	local cur_sum = 0

	cur_prpt = Funit.readProperty(adr_formation_unit)
	str = cur_prpt.info
	if str == nil then return nil end

	Ramza.cur_st.togal_JP_squire     = cur_prpt.total_JP_squire
	Ramza.cur_st.togal_JP_chemist    = cur_prpt.total_JP_chemist
	Ramza.cur_st.total_JP_priest     = cur_prpt.total_JP_priest
	Ramza.cur_st.total_JP_wizard     = cur_prpt.total_JP_wizard
	Ramza.cur_st.total_JP_time_mage  = cur_prpt.total_JP_time_mage
	Ramza.cur_st.total_JP_oracle     = cur_prpt.total_JP_oracle
	Ramza.cur_st.total_JP_calculator = cur_prpt.total_JP_calculator

	for key, value in pairs(Ramza.cur_st) do
		cur_sum = cur_sum + value
	end

	ret = Ramza.compareStatus(cur_sum)
	if ret == nil then
		compared = ""
	else
		compared = ret
	end
	debugPrint(string.format("%s, %d, %s", str, cur_sum, compared))

	return ret
end

function Ramza.format_st(st)
	local st_info
	local st_sum = 0

	for key, value in pairs(st) do
		st_sum = st_sum + value
	end

	st_info = string.format("best = %d", st_sum)
	debugPrint(st_info)
	print(st_info)
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

local interface = Ramza

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end


retry = 1600

for i=0, retry do
	if initial == 1 then
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

