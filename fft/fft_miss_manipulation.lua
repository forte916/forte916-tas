-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulator: psxjin v2.0.2
--
-- This scripts find a miss attack.
--
-- Usage
--   1. Start this script.
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
	fadv(7)
end

function attempt()
	pressBtn({circle=1}, 1)  -- confirm direction
	--fadv(410)
	fadv(260)
end

function post_attempt()
end

function success()
	local ret = false

	local cur_prpt = {}
	cur_prpt = Bunit.readProperty(adr_battle_unit17)
	debugPrint(cur_prpt.info)

	if cur_prpt.hit_miss == 0 then
		ret = true
		print("  hit_miss, hp="..cur_prpt.hp)
		debugPrint(string.format("  hit_miss, hp=%d", cur_prpt.hp))
	elseif cur_prpt.hp == cur_prpt.max_hp then
		ret = true
		print("  no damage, hp="..cur_prpt.hp)
		debugPrint(string.format("  no damage, hp=%d", cur_prpt.hp))
	else
		print("  damaged, hp="..cur_prpt.hp)
		debugPrint(string.format("  damaged, hp=%d", cur_prpt.hp))
		ret = false
	end

	return ret
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

f = io.open("ramza_miss_ch1_random6_1.log", "a")
if f == nil then print("error: Could not open file") end

retry = 100

for i=0, retry do
	if initial == 1 then
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
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X *****", fc, rng))
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
f:close()
emu.speedmode("normal")
emu.pause()

