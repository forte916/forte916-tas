-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This is a library for attack manipulation.
--
-- Usage
--   1. require "fft_attack_lib"
--

require "psx_lib"
require "fft_lib"

adr_text_flag_1FFE88 = 0x1FFE88


------------------------------------------------------------
-- OrbonneGafgarionTurn1
------------------------------------------------------------
OrbonneGafgarionTurn1 = {}
OrbonneGafgarionTurn1.logname = "ch1_orbonne_gaf_turn1_2.log"

function OrbonneGafgarionTurn1.pre_attempt()
	pressBtn({circle=1}, 1)  -- skip msg
	fadv(1)
	pressBtn({circle=1}, 1)  -- skip msg
end

function OrbonneGafgarionTurn1.attempt()
	local flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)

	pressBtn({x=1}, 1)  -- skip msg

	while flag_1FFE88 ~= 0x04 do
		fadv(1)
		flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	end
	fadv(9)
	pressBtn({r1=1, l2=1}, 1)  -- camera and zoom out in moving
	fadv(470)
end

function OrbonneGafgarionTurn1.post_attempt()
	-- pass
end

function OrbonneGafgarionTurn1.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit7)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp == 0 then
		print(string.format("  take down, hp=%d", prpt.hp))
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

function OrbonneGafgarionTurn1.waitForBest()
	local retry = 20
	local best_rng = 0x442B008C

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
-- OrbonneAgriasTurn1
------------------------------------------------------------
OrbonneAgriasTurn1 = {}
OrbonneAgriasTurn1.logname = "ch1_orbonne_agrias_turn1_1.log"

function OrbonneAgriasTurn1.pre_attempt()
	--pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)
end

function OrbonneAgriasTurn1.attempt()
	pressBtn({circle=1}, 1)
	fadv(400)
end

function OrbonneAgriasTurn1.post_attempt()
	-- pass
end

function OrbonneAgriasTurn1.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit8)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp == 0 then
		print(string.format("  take down, hp=%d", prpt.hp))
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

function OrbonneAgriasTurn1.waitForBest()
	local retry = 20
	local best_rng = 0x442B008C

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
-- OrbonneRamzaTurn2
------------------------------------------------------------
OrbonneRamzaTurn2 = {}
OrbonneRamzaTurn2.logname = "ch1_orbonne_ramza_turn2_3.log"

function OrbonneRamzaTurn2.pre_attempt()
	fadv(1)  -- for odd number retry
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
end

function OrbonneRamzaTurn2.attempt()
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(100)
end

function OrbonneRamzaTurn2.post_attempt()
	-- pass
end

function OrbonneRamzaTurn2.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp < 31 then
		print(string.format("  take down, hp=%d", prpt.hp))
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

function OrbonneRamzaTurn2.waitForBest()
	local retry = 20
	local best_rng = 0x442B008C

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
-- OrbonneAliciaTurn2
------------------------------------------------------------
OrbonneAliciaTurn2 = {}
OrbonneAliciaTurn2.logname = "ch1_orbonne_alicia_turn2_1.log"

function OrbonneAliciaTurn2.pre_attempt()
	fadv(7)
end

function OrbonneAliciaTurn2.attempt()
	local flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)

	pressBtn({circle=1}, 1)   -- execute attack

	while flag_1FFE88 ~= 0x04 do
		fadv(1)
		flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	end
	fadv(2)
	flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	while flag_1FFE88 ~= 0x04 do
		fadv(1)
		flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	end
	fadv(8)
	pressBtn({r2=1}, 1)  -- camera in moving
	fadv(220)
end

function OrbonneAliciaTurn2.post_attempt()
	-- pass
end

function OrbonneAliciaTurn2.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp == 0 then
		print(string.format("  take down, hp=%d", prpt.hp))
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end

------------------------------------------------------------
-- OrbonneAgriasTurn3
------------------------------------------------------------
OrbonneAgriasTurn3 = {}
OrbonneAgriasTurn3.logname = "ch1_orbonne_agrias_turn3_1.log"

function OrbonneAgriasTurn3.pre_attempt()
	fadv(7)
end

function OrbonneAgriasTurn3.attempt()
	local flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)

	pressBtn({circle=1}, 1)   -- execute attack

	while flag_1FFE88 ~= 0x04 do
		fadv(1)
		flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	end
	fadv(2)
	flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	while flag_1FFE88 ~= 0x04 do
		fadv(1)
		flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
	end
	fadv(8)
	pressBtn({r2=1}, 1)  -- camera in moving
	fadv(1200)  -- 16168f - 15286f
end

function OrbonneAgriasTurn3.post_attempt()
	-- pass
end

function OrbonneAgriasTurn3.success()
	local ret = false
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit9)
	debugPrint(prpt.info)

	if prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = true
	elseif prpt.hp == 0 then
		print(string.format("  take down, hp=%d", prpt.hp))
		debugPrint(string.format("  take down, hp=%d", prpt.hp))
		ret = true
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = false
	end

	return ret
end




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
Barius_Valley.logname = "ch2_barius_agrias.log"

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
		debugPrint(string.format("-- agrias.hp = %2d", prpt.hp))
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
Death_All.logname = "ch4_death_all_ubs_4th_retry270.log"

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
	local ofs_unit = adr_battle_unit2
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
CriticalHit.logname = "ch1_gariland_squire_turn3_1.log"

function CriticalHit.pre_attempt()
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)
	-- wait until 0x164908 = 0x001B

	--pressBtn({circle=1}, 3)  -- select target
	--pressBtn({circle=1}, 1)  -- confirm target
	--fadv(3)
	-- wait until 0x164908 = 0x001B
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
	local str

	prpt = Bunit.readProperty(adr_battle_unit4)
	str = prpt.info

	if prpt.critical ~= 0 then
		str = string.format("%s, critical, hp=%d", str, prpt.hp)
		print(str)
		ret = true
	elseif prpt.hp == 0 then
		str = string.format("%s, KO, hp=%d", str, prpt.hp)
		print(str)
		ret = true
	else
		ret = false
	end

	debugPrint(str)
	return ret
end

function CriticalHit.waitForBest()
	local retry = 20
	local best_rng = 0x442B008C

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
	local str

	prpt = Bunit.readProperty(adr_battle_unit)
	str = prpt.info

	injured = bit.band(prpt.status_5A, 0x01)  -- 0x01 Critical injured

	if prpt.critical ~= 0 then
		str = string.format("%s, hp=%d, critical hit", str, prpt.hp)
		print(str)
	end

	if prpt.hp == 0 then
		str = string.format("%s, hp=%d, KO", str, prpt.hp)
		print(str)
		ret = true
	elseif injured ~= 0 then
		str = string.format("%s, hp=%d, critical injured", str, prpt.hp)
		print(str)
		ret = true
	else
		ret = false
	end

	debugPrint(str)
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

