-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script manipulates the number of enemy.
--
-- Usage
--   1. Start this script at gariland or mandalia.
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

Speed9 = {}
Speed9.logname = "ch4_Finath_speed9.log"

function Speed9.pre_attempt()
	fadv(1)
end

function Speed9.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Speed9.post_attempt()
	-- pass
end

function Speed9.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local enemy = 0

	for i=1, 12 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		debugPrint(prpt.info)

		if prpt.no ~= 0xFF and prpt.speed > 8 then
			enemy = enemy + 1
		end
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy < 1 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end

Mandalia = {}
Mandalia.logname = "ch1_random_encount8.log"

function Mandalia.pre_attempt()
	-- move Gariland From Formation
--	fadv(4)
--	pressBtn({up=1}, 2)

--	pressBtn({circle=1}, 3)
--	pressBtn({up=1}, 2)
--	pressBtn({circle=1}, 1)
--	fadv(50+1)
end

function Mandalia.pre_attempt2()
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(50+1)

	local fc = emu.framecount()
	fadv(82362 - fc)
end

function Mandalia.attempt()
	-- move Mandalia From Gariland
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 2)  -- select Mandalia
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Mandalia.post_attempt()
	-- pass
end

function Mandalia.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local enemy = 0

	for i=1, 10 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		debugPrint(prpt.info)

		if prpt.no ~= 0xFF then
			enemy = enemy + 1
		end
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy < 3 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end


GainedJpUP = {}
GainedJpUP.logname = "ch1_gained_jp_up.log"

function GainedJpUP.pre_attempt()
	fadv(3)
end

function GainedJpUP.attempt()
	-- move Mandalia From Gariland
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 2)  -- select Mandalia
	pressBtn({circle=1}, 1)
	fadv(900)
end

function GainedJpUP.post_attempt()
	-- pass
end

function GainedJpUP.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local gained = 0

	prpt = Bunit.readProperty(ofs_unit)
	debugPrint(prpt.info)

	gained = bit.band(prpt.base_r_s_m_learned3, 0x08)  -- 0x08 means Gained Jp UP
	if gained ~= 0 then
		print(string.format("-- gained = %2d", gained))
		ret = true
	else
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

interface = Mandalia

f = io.open(interface.logname, "a")
if f == nil then debugPrint("error: Could not open file") end

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)


for i=0, retry do
	if initial == 1 then
		initial = 0
	end

	interface.pre_attempt()
	fadv(i)
	--interface.pre_attempt2()
	local fc = emu.framecount()
	local rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check status
	if interface.success() then
		debugPrint(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))
		print(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))

		interface.post_attempt()
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

