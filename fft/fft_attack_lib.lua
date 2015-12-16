-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This is a library for attack manipulation.
--
-- Usage
--   1. require "fft_lib"
--

require "psx_lib"
require "fft_lib"

------------------------------------------------------------
-- Zirekile_Falls
------------------------------------------------------------
Zirekile_Falls = {}
Zirekile_Falls.logname = "ch2_zirekile_death.log"

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
	local total_enemy = 5
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.hp == 0 then
			enemy = enemy + 1
			str = str.." , death"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == total_enemy then
		print(string.format("-- enemy = %2d, retry = %d", enemy, retry))
		ret = true
	else
		ret = false
	end

	return ret
end

------------------------------------------------------------
-- Barius_Valley
------------------------------------------------------------
Barius_Valley = {}
Barius_Valley.logname = "ch2_barius_agrius.log"

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
	local total_enemy = 6
	local enemy = 0
	local str

	prpt = Bunit.readProperty(adr_battle_unit)
	if prpt.hp == 0 then
		debugPrint(string.format("-- agrius.hp = %2d", prpt.hp))
		return false
	end

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.hp == 0 then
			enemy = enemy + 1
			str = str.." , death"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == total_enemy then
		print(string.format("-- enemy = %2d, retry = %d", enemy, retry))
		ret = true
	else
		ret = false
	end

	return ret
end

------------------------------------------------------------
-- Death_All
------------------------------------------------------------
Death_All = {}
Death_All.logname = "ch4_death_all_germinas3.log"

function Death_All.pre_attempt()
	pressBtn({circle=1}, 4)  -- select Death of math
	pressBtn({circle=1}, 6)  -- confirm target
end

function Death_All.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Death_All.post_attempt()
	-- pass
end

function Death_All.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 6
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.hp == 0 then
			enemy = enemy + 1
			str = str.." , death"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == total_enemy then
		print(string.format("-- enemy = %2d, retry = %d", enemy, retry))
		ret = true
	else
		ret = false
	end

	return ret
end

function Death_All.waitForBest()
	local retry = 220
	local best_rng = 0x5045AD5F

	for i=0, retry do
		local rng = memory.readdword(adr_rng)
		if rng == best_rng then
			return
		else
			emu.frameadvance()
		end
	end
	print("error: Could not find best rng.")
end

------------------------------------------------------------
-- Critical
------------------------------------------------------------
Critical = {}
Critical.logname = "critical_chN_turnN.log"

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
		print("  critical, hp=%d, retry = %d", cur_prpt.hp, retry)
		debugPrint(string.format("  critical, hp=%d", cur_prpt.hp))
	elseif cur_prpt.hp == 0 then
		ret = true
		print("  take down, hp=%d, retry = %d", cur_prpt.hp, retry)
		debugPrint(string.format("  take down, hp=%d", cur_prpt.hp))
	else
		print("  normal, hp="..cur_prpt.hp)
		debugPrint(string.format("  normal, hp=%d", cur_prpt.hp))
		ret = false
	end

	return ret
end

