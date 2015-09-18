-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This scripts find a critical hit.
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
	fadv(3)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
end

function attempt()
	pressBtn({circle=1}, 10)  -- execute attack
	fadv(20)
end

function post_attempt()
	fadv(106)
	pressBtn({circle=1}, 10)
end

function success()
	local ret = false

	local cur_prpt = {}
	cur_prpt = Bunit.readProperty(adr_battle_unit8)
	debugPrint(cur_prpt.info)

	if cur_prpt.critical ~= 0 then
		ret = true
		print("  critical, hp="..cur_prpt.hp)
		debugPrint(string.format("  critical, hp=%d", cur_prpt.hp))
	elseif cur_prpt.hp == 0 then
		ret = true
		print("  take down, hp="..cur_prpt.hp)
		debugPrint(string.format("  take down, hp=%d", cur_prpt.hp))
	else
		print("  normal, hp="..cur_prpt.hp)
		debugPrint(string.format("  normal, hp=%d", cur_prpt.hp))
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local retry = 100
local begin_fc = emu.framecount()
local begin_date = os.date()

f = io.open("ramza_critical_ch2_turnN.log", "a")
if f == nil then debugPrint("error: Could not open file") end

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)

--debugPrint(string.format("----- pre_attempt=none, attempt=select, confirm, execute -----", i, fc, rng))
debugPrint(string.format("----- pre_attempt=select, attempt=confirm, execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, confirm, attempt=execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, confirm, execute, attempt=none -----", i, fc, rng))

for i=0, retry do
	if initial == 1 then
		initial = 0
	end

	pre_attempt()
	fadv(i)
	local fc = emu.framecount()
	local rng = memory.readdword(adr_rng)
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


local fc = emu.framecount()
debugPrint(string.format("<<< lua bot is finished <<<"))
debugPrint(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
debugPrint(string.format("    end:: %s,  fc = %d", os.date(), fc))
debugPrint(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()
f:close()

