-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This scripts find a good status of Ramza.
-- Ramza needs high starting Squire JP and Chemist JP.
--
-- Usage
--   1. Start this script at Arazlam message.
--

require "psx_lib"
require "fft_lib"
require "fft_input_macro_lib"

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

function pre_attempt()
	fadv(1)
	pressBtn({circle=1}, 2)  -- 21173f
	pressBtn({circle=1}, 2)
end

function post_attempt()
	-- pass
end

function attempt()
	pressBtn({circle=1}, 2)
	fadv(5500)

	for i=1, 120 do
		pressBtn({circle=1}, 30)
	end

end

function compareStatus()
	local ret = false
	local best_sum = 0
	local cur_sum = 0

	debugPrint(string.format("--1 best_st:: %s", format_st(best_st)))
	debugPrint(string.format("--1 cur_st :: %s", format_st(cur_st )))

	for key, value in pairs(best_st) do
		best_sum = best_sum + value
	end

	for key, value in pairs(cur_st) do
		cur_sum = cur_sum + value
	end


	if (best_sum < cur_sum) then
		best_st = shallowcopy(cur_st)
		ret = true
		print(best_st)
	else
		ret = false
	end

	return ret
end

function success()
	local ret = false

	local cur_prpt = {}
	cur_prpt = Funit.readProperty(adr_formation_unit4)
	debugPrint(cur_prpt.info)

	cur_st.faith     = cur_prpt.faith
	cur_st.chemistJP = cur_prpt.total_JP_chemist

	ret = compareStatus()

	return ret
end

function format_st(st)
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

best_st = {}
cur_st = {}

f = io.open("ch1_2_squire_status.log", "a")
if f == nil then print("error: Could not open file") end

retry = 100

for i=0, retry do
	if initial == 1 then
		best_st.faith     = 0
		best_st.chemistJP = 0
		initial = 0
	end

	pre_attempt()
	fadv(i)
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	attempt()

	-- check status
	if success() then
		debugPrint(string.format("***** best state. fc = %d, %s, rng = %08X *****", fc, format_st(best_st), rng))

		post_attempt()
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

