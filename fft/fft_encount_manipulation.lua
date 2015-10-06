-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This scripts manipulates the number of enemy.
--
-- Usage
--   1. Start this script at gariland.
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
--	-- move Gariland From Formation
	fadv(6)
	pressBtn({up=1}, 2)
	
	pressBtn({circle=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(52)
end

function attempt()
	-- move Mandalia From Gariland
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 2)  -- select Mandalia
	--pressBtn({up=1}, 2)  -- select igros
	pressBtn({circle=1}, 1)
	fadv(900)
end

function post_attempt()
	-- pass
end

function compareStatus()
end

function success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local enemy = 0

	debugPrint(string.format("-- Bunit --"))
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


------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local retry = 400
local begin_fc = emu.framecount()
local begin_date = os.date()


f = io.open("ch1_random_encount5.log", "a")
if f == nil then debugPrint("error: Could not open file") end

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)


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
		debugPrint(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))
		print(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))

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

