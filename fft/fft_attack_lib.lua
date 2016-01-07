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
		print(string.format("-- enemy = %2d", enemy))
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
		print(string.format("-- enemy = %2d", enemy))
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
Death_All.logname = "ch4_death_all_murond1.log"

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
		print(string.format("-- enemy = %2d", enemy))
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
-- CriticalHit
------------------------------------------------------------
CriticalHit = {}
CriticalHit.logname = "ch4_critical_dycedarg2.log"

function CriticalHit.pre_attempt()
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 12)  -- confirm target
	
	--pressBtn({circle=1}, 2)  -- select target
	--pressBtn({circle=1}, 6)  -- confirm target
	
	--pressBtn({circle=1}, 4)  -- select target
	--pressBtn({circle=1}, 5)  -- confirm target
end

function CriticalHit.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function CriticalHit.post_attempt()
	-- pass
end

function CriticalHit.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit2)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print("  critical, hp=%d", prpt.hp)
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp == 0 then
		print("  take down, hp=%d", prpt.hp)
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

function CriticalHit.waitForBest()
	local retry = 120
	local best_rng = 0x9D11A82F

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
-- CriticalInjured
------------------------------------------------------------
CriticalInjured = {}
CriticalInjured.logname = "ch4_critical_elmdor1.log"

function CriticalInjured.pre_attempt()
	--pressBtn({circle=1}, 3)  -- select target
	--pressBtn({circle=1}, 7)  -- confirm target

	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	
	--pressBtn({circle=1}, 4)  -- select target
	--pressBtn({circle=1}, 5)  -- confirm target
end

function CriticalInjured.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function CriticalInjured.post_attempt()
	-- pass
end

function CriticalInjured.success()
	local ret = false
	local prpt = {}
	local injured = 0

	prpt = Bunit.readProperty(adr_battle_unit)
	debugPrint(prpt.info)

	injured = bit.band(prpt.status_5A, 0x01)  -- 0x01 Critical injured

	if prpt.critical ~= 0 then
		print("  critical, hp=%d", prpt.hp)
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
	end

	if prpt.hp == 0 then
		print("  take down, hp=%d", prpt.hp)
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	elseif injured ~= 0 then
		print("  critical injured, hp=%d", prpt.hp)
		debugPrint(string.format("  critical injured, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

function CriticalInjured.waitForBest()
	local retry = 120
	local best_rng = 0xEB9A1D08

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

