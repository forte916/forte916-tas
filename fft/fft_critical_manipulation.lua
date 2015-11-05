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

Bed_Desert = {}
Bed_Desert.logname = " ch2_barius_agrius.log"

function Bed_Desert.pre_attempt()
	pressBtn({circle=1}, 4)  -- select Death of math at Bed_Desert
	pressBtn({circle=1}, 6)  -- confirm target
end

function Bed_Desert.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Bed_Desert.post_attempt()
	-- pass
end

function Bed_Desert.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit2
	local enemy = 0

	debugPrint(string.format("-- Bunit --"))

	prpt = Bunit.readProperty(adr_battle_unit)
	if prpt.hp == 0 then
		debugPrint(string.format("-- agrius.hp = %2d", prpt.hp))
		return false
	end

	for i=1, 6 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		debugPrint(prpt.info)

		if prpt.hp == 0 then
			enemy = enemy + 1
		end
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == 6 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end

Zirekile_Falls = {}
Zirekile_Falls.logname = " ch2_zirekile_death.log"

function Zirekile_Falls.pre_attempt()
	pressBtn({circle=1}, 4)  -- select Death of math at Zirekile_Falls
	pressBtn({circle=1}, 6)  -- confirm target
end

function Zirekile_Falls.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Zirekile_Falls.post_attempt()
	-- pass
end

function Zirekile_Falls.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit5
	local enemy = 0

	debugPrint(string.format("-- Bunit --"))
	for i=1, 5 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		debugPrint(prpt.info)

		if prpt.hp == 0 then
			enemy = enemy + 1
		end
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == 5 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end

Barius_Valley = {}
Barius_Valley.logname = " ch2_barius_agrius.log"

function Barius_Valley.pre_attempt()
	pressBtn({circle=1}, 4)  -- select Bolt3 of math at Barius_Valley
	pressBtn({circle=1}, 6)  -- confirm target
end

function Barius_Valley.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Barius_Valley.post_attempt()
	-- pass
end

function Barius_Valley.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit2
	local enemy = 0

	debugPrint(string.format("-- Bunit --"))

	prpt = Bunit.readProperty(adr_battle_unit)
	if prpt.hp == 0 then
		debugPrint(string.format("-- agrius.hp = %2d", prpt.hp))
		return false
	end

	for i=1, 6 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		debugPrint(prpt.info)

		if prpt.hp == 0 then
			enemy = enemy + 1
		end
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == 6 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end

Critical = {}
Critical.logname = " critical_chN_turnN.log"

function Critical.pre_attempt()
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
end

function Critical.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Critical.post_attempt()
	-- pass
end

function Critical.success()
	local ret = false

	local cur_prpt = {}
	cur_prpt = Bunit.readProperty(adr_battle_unit)
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
local retry = 200
local begin_fc = emu.framecount()
local begin_date = os.date()

interface = Critical

f = io.open(interface.logname, "a")
if f == nil then debugPrint("error: Could not open file") end

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)

--debugPrint(string.format("----- pre_attempt=none, attempt=select, confirm, execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, attempt=confirm, execute -----", i, fc, rng))
debugPrint(string.format("----- pre_attempt=select, confirm, attempt=execute -----", i, fc, rng))
--debugPrint(string.format("----- pre_attempt=select, confirm, execute, attempt=none -----", i, fc, rng))

for i=0, retry do
	if initial == 1 then
		initial = 0
	end

	interface.pre_attempt()
	fadv(i)
	local fc = emu.framecount()
	local rng = memory.readdword(adr_rng)
	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	-- check status
	if interface.success() then
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X *****", fc, rng))
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

