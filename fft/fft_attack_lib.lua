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
require "fft_battle_lib"

adr_text_flag_037808 = 0x037808  -- ?byte  -- text param


------------------------------------------------------------
-- OrbonneGafgarionTurn1
------------------------------------------------------------
OrbonneGafgarionTurn1 = {}
OrbonneGafgarionTurn1.logname = "ch1_1_orbonne_gaf_turn1_79.log"
OrbonneGafgarionTurn1.retry = 500

function OrbonneGafgarionTurn1.pre_attempt()
	pressBtn({circle=1}, 1)  -- skip msg
end

function OrbonneGafgarionTurn1.attempt()
	OrbonneGafgarionTurn1.attempt_type1()
	--OrbonneGafgarionTurn1.attempt_type2()
	--OrbonneGafgarionTurn1.attempt_type3()
end

function OrbonneGafgarionTurn1.attempt_type1()
	pressBtn({x=1}, 1)  -- skip msg

	Battle.waitForStartingToMove()
	-- 恐らく zoom-in  状態の場合に 9f 待つ必要がある
	-- 恐らく zoom-out 状態の場合だと 4f 待つだけでよい
	fadv(8+1)
	if true then
		pressBtn({r1=1, l2=1}, 1)  -- 12f faster than r2, l2
	else
		pressBtn({r2=1, l2=1}, 1)  -- 12f slower than r1, l2
		-- r2, l2 の方は ramza が arrowed になる際に余分なスクロールが発生する
	end

	Battle.waitForStartingToSkillEffect()

	Battle.waitForFinishedToMove()
	-- wait until 0x164908 = 0x001C, which frame is 5f before shown "Effect"
	-- このとき x で Effect window を skip 可能
	pressBtn({x=1}, 1)

	Battle.waitForFinishedToSkillEffect()
end

function OrbonneGafgarionTurn1.attempt_type2()
	pressBtn({x=1}, 1)  -- skip msg

	local flag_037808 = memory.readword(adr_text_flag_037808)  -- text param

	Battle.waitForStartingToMove()
	-- 恐らく zoom-in  状態の場合に 9f 待つ必要がある
	-- 恐らく zoom-out 状態の場合だと 4f 待つだけでよい
	fadv(8+1)
	if true then
		pressBtn({r1=1, l2=1}, 1)  -- 12f faster than r2, l2
	else
		pressBtn({r2=1, l2=1}, 1)  -- 12f slower than r1, l2
		-- r2, l2 の方は ramza が arrowed になる際に余分なスクロールが発生する
	end

	Battle.waitForStartingToSkillEffect()

	flag_037808 = memory.readword(adr_text_flag_037808)
	while flag_037808 ~= 0x0189 do
		fadv(1)
		flag_037808 = memory.readword(adr_text_flag_037808)
	end

	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
	pressBtn({x=1}, 1)

	Battle.waitForFinishedToSkillEffect()
end


-- no_optimize, support_both_skill_msg_and_skill_name
function OrbonneGafgarionTurn1.attempt_type3()
	pressBtn({x=1}, 1)  -- skip msg

	Battle.waitForStartingToMove()
	fadv(8+1)
	if true then
		pressBtn({r1=1, l2=1}, 1)  -- 12f faster than r2, l2
	else
		pressBtn({r2=1, l2=1}, 1)  -- 12f slower than r1, l2
		-- r2, l2 の方は ramza が arrowed になる際に余分なスクロールが発生する
	end

	Battle.waitForFinishedToSkillEffect()
end

function OrbonneGafgarionTurn1.post_attempt()
	-- pass
end

function OrbonneGafgarionTurn1.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit7) -- archer
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneGafgarionTurn1.waitForBest()
	local retry = 13
	local best_rng = 0x1F5ACE66

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
OrbonneAgriasTurn1.logname = "ch1_1_orbonne_agrias_turn1_23.log"
OrbonneAgriasTurn1.retry = 200

function OrbonneAgriasTurn1.pre_attempt_type1()
	Battle.waitForTurnUnitNo(0x00) -- 0x00 is ramza
	-- 7f after ramza arrowed
	pressBtn({x=1}, 6)
	pressBtn({triangle=1}, 1)
	fadv(2)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(45)
	fadv(2)
	pressBtn({square=1, down=1}, 2)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)

	-- change option5
	pressBtn({circle=1}, 6)
	pressBtn({up=1}, 2)		-- fast
	pressBtn({circle=1}, 2)

	-- change option6
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option7
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option8
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option9
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option11
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option12
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	pressBtn({x=1}, 6)
	pressBtn({x=1}, 1)
	fadv(6)

	-- move
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 10)
	if false then
		pressBtn({down=1}, 2)
		pressBtn({down=1}, 2)
		pressBtn({down=1}, 1)
	else
		pressBtn({right=1}, 2)
		pressBtn({right=1}, 2)
		pressBtn({right=1}, 1)
	end
	pressBtn({circle=1}, 1)

	Battle.waitForFinishedToMove()

	-- wait
	pressBtn({circle=1}, 1)
	Battle.waitForTurnUnitNo(0x00) -- 0x00 is ramza
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)
	if true then
		if false then
			pressBtn({up=1}, 1)  -- 試行前に up button なしで最初のフレームを手動で検証すること
		else
			pressBtn({left=1}, 1)  -- 試行前に left button なしで最初のフレームを手動で検証すること
		end
	end
end

function OrbonneAgriasTurn1.pre_attempt_type2()
	--pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)
	pressBtn({up=1}, 1)  -- 試行前に up key なしで最初のフレームを手動で検証すること
end

function OrbonneAgriasTurn1.pre_attempt()
	OrbonneAgriasTurn1.pre_attempt_type1()
	--OrbonneAgriasTurn1.pre_attempt_type2()
end

function OrbonneAgriasTurn1.attempt()
	pressBtn({circle=1}, 1)
	Battle.waitForTurnNextUnit()  -- agrias turn
	fadv(6)  -- irregular, 0xB1 again
	Battle.waitForTurnNextUnit()  -- lavian turn
end

function OrbonneAgriasTurn1.post_attempt()
	-- pass
end

function OrbonneAgriasTurn1.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit8) -- archer
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneAgriasTurn1.waitForBest()
	local retry = 51
	local best_rng = 0x3D33D64D

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
-- OrbonneAgriasTurn1_TypeB
------------------------------------------------------------
OrbonneAgriasTurn1_TypeB = {}
OrbonneAgriasTurn1_TypeB.logname = "ch1_1_orbonne_agrias_turn1_28.log"
OrbonneAgriasTurn1_TypeB.retry = 50

function OrbonneAgriasTurn1_TypeB.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneAgriasTurn1_TypeB.attempt()
	pressBtn({r2=1}, 1)  -- camera in moving
	fadv(300)
end

function OrbonneAgriasTurn1_TypeB.post_attempt()
	-- pass
end

function OrbonneAgriasTurn1_TypeB.success()
	return OrbonneAgriasTurn1.success()
end

function OrbonneAgriasTurn1_TypeB.waitForBest()
	return OrbonneAgriasTurn1.waitForBest()
end


------------------------------------------------------------
-- OrbonneAliciaTurn1
------------------------------------------------------------
OrbonneAliciaTurn1 = {}
OrbonneAliciaTurn1.logname = "ch1_1_orbonne_alicia_turn1_23.log"
OrbonneAliciaTurn1.retry = 50

function OrbonneAliciaTurn1.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneAliciaTurn1.attempt()
	if false then
		pressBtn({l1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- angle camera
	end
	
	Battle.waitForTurnUnitNo(0x04)  -- lavian
	Battle.waitForTurnUnitNo(0x05)  -- knight
	Battle.waitForTurnUnitNo(0x08)  -- archer
	Battle.waitForTurnUnitNo(0x09)  -- chemist
	Battle.waitForTurnUnitNo(0x0A)  -- rad
	Battle.waitForTurnUnitNo(0x02)  -- gaf
end

function OrbonneAliciaTurn1.post_attempt()
	-- pass
end

function OrbonneAliciaTurn1.success()
	local ret = nil
	-- success condition: knight moves in front of ramza
	-- succeeded: retry=7, 8, 26, 28, 30, 31, 34, 35
	--return ret

	-- success condition1: knight moves in front of ramza
	-- success condition2: rad attacks knight with critical
	-- wait until 13300
	return OrbonneRadTurn1.success()
end


------------------------------------------------------------
-- OrbonneRadTurn1
------------------------------------------------------------
OrbonneRadTurn1 = {}
OrbonneRadTurn1.logname = "ch1_1_orbonne_rad_turn1_23.log"
OrbonneRadTurn1.retry = 64

function OrbonneRadTurn1.pre_attempt()
	Battle.waitForTurnUnitNo(0x08)  -- archer
	Battle.waitForStartingToMove()
	--fadv(4)
	fadv(11)
end

function OrbonneRadTurn1.attempt()
	if false then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- angle camera
	end
	Battle.waitForTurnUnitNo(0x09)  -- chemist
	Battle.waitForTurnUnitNo(0x0A)  -- rad
	Battle.waitForTurnUnitNo(0x02)  -- gaf
end

function OrbonneRadTurn1.post_attempt()
	-- pass
end

function OrbonneRadTurn1.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6) -- knight
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	elseif prpt.hp < 85 then
		print(string.format("  low HP, hp=%d", prpt.hp))
		debugPrint(string.format("  low HP, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneRadTurn1.waitForBest()
	local retry = 42
	local best_rng = 0x8DDD6BFB

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
-- OrbonneGafgarionTurn2
------------------------------------------------------------
OrbonneGafgarionTurn2 = {}
OrbonneGafgarionTurn2.logname = "ch1_1_orbonne_gaf_turn2_23.log"
OrbonneGafgarionTurn2.retry = 50

function OrbonneGafgarionTurn2.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneGafgarionTurn2.attempt()
	if false then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- angle camera
	end

	Battle.waitForStartingToSkillEffect()
	Battle.waitForFinishedToSkillEffect()
end

function OrbonneGafgarionTurn2.post_attempt()
	-- pass
end

function OrbonneGafgarionTurn2.success()
	local ret = nil
	local prpt = {}

	if false then
		prpt = Bunit.readProperty(adr_battle_unit9) -- archer
	else
		prpt = Bunit.readProperty(adr_battle_unit10) -- chemist
	end
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneGafgarionTurn2.waitForBest()
	local retry = 48
	local best_rng = 0x4892C5B9

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
OrbonneRamzaTurn2.logname = "ch1_1_orbonne_ramza_turn2_23.log"
OrbonneRamzaTurn2.retry = 200
OrbonneRamzaTurn2.odd_number_retry = true

function OrbonneRamzaTurn2.logHeader()
	debugPrint(string.format("----- odd_number_retry = %s -----", tostring(OrbonneRamzaTurn2.odd_number_retry)))
	debugPrint(string.format(""))
end

function OrbonneRamzaTurn2.pre_attempt()
	Battle.waitForTurnUnitNo(0x00)  -- 0x00 is ramza
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	if false then
		pressBtn({down=1}, 1)
	else
		pressBtn({right=1}, 1)
	end
	fadv(1)

	if OrbonneRamzaTurn2.odd_number_retry == true then
		fadv(1)  -- for odd number retry
	end
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- wait until 0x164908 = 0x001B, which frame is 5f before shown "Menu"
end

function OrbonneRamzaTurn2.attempt()
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(100)
end

function OrbonneRamzaTurn2.post_attempt()
	Battle.waitForTurnUnitNo(0x00)
	-- select wait
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- select wait
end

function OrbonneRamzaTurn2.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6) -- knight
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	--elseif prpt.hp < 37 then  -- if alicia has good compatibility
	elseif prpt.hp < 31 then  -- if alicia has normal compatibility
		print(string.format("  low HP, hp=%d", prpt.hp))
		debugPrint(string.format("  low HP, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneRamzaTurn2.waitForBest()
	local retry = 32
	local best_rng = 0x399BC177

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
-- OrbonneAliciaAgriasTurn2
------------------------------------------------------------
OrbonneAliciaAgriasTurn2 = {}
OrbonneAliciaAgriasTurn2.logname = "ch1_1_orbonne_alicia_agrias_turn2_3.log"
OrbonneAliciaAgriasTurn2.retry = 200

function OrbonneAliciaAgriasTurn2.pre_attempt()
	fadv(7)
end

function OrbonneAliciaAgriasTurn2.attempt()
	pressBtn({circle=1}, 1)   -- ramza wait

	Battle.waitForStartingToMove()
	fadv(4)
	pressBtn({r2=1}, 1)  -- camera in moving

	--fadv(800)
	fadv(1500)
end

function OrbonneAliciaAgriasTurn2.post_attempt()
	-- pass
end

function OrbonneAliciaAgriasTurn2.success()
	local ret = nil
	local enemy = 0
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6) -- knight
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		--print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		enemy = enemy + 1
	elseif prpt.critical ~= 0 then
		--print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		enemy = enemy + 1
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
	end


	--prpt = Bunit.readProperty(adr_battle_unit9) -- archer
	prpt = Bunit.readProperty(adr_battle_unit10) -- chemist
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		enemy = enemy + 1
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		enemy = enemy + 1
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
	end

	if enemy > 1 then
		ret = "best"
	end
	return ret
end


------------------------------------------------------------
-- OrbonneAliciaTurn2
------------------------------------------------------------
OrbonneAliciaTurn2 = {}
OrbonneAliciaTurn2.logname = "ch1_1_orbonne_alicia_turn2_1.log"

function OrbonneAliciaTurn2.pre_attempt()
	fadv(7)
end

function OrbonneAliciaTurn2.attempt()
	pressBtn({circle=1}, 1)   -- ramza wait

	Battle.waitForStartingToMove()  -- moving alicia
	fadv(2)
	Battle.waitForStartingToMove()  -- moving agrias
	fadv(8)
	pressBtn({r2=1}, 1)  -- camera in moving
	fadv(220)
end

function OrbonneAliciaTurn2.post_attempt()
	-- pass
end

function OrbonneAliciaTurn2.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit6)
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

------------------------------------------------------------
-- OrbonneAgriasTurn2
------------------------------------------------------------
OrbonneAgriasTurn2 = {}
OrbonneAgriasTurn2.logname = "ch1_1_orbonne_agrias_turn2_23.log"
OrbonneAgriasTurn2.retry = 200

function OrbonneAgriasTurn2.pre_attempt()
	fadv(7)
end

function OrbonneAgriasTurn2.attempt()
	pressBtn({circle=1}, 1)   -- ramza wait

	Battle.waitForTurnUnitNo(0x03)  -- alicia
	Battle.waitForTurnUnitNo(0x04)  -- lavian
	Battle.waitForTurnUnitNo(0x01)  -- agrias
	Battle.waitForStartingToMove()  -- moving agrias
	fadv(4)
	--pressBtn({r2=1}, 1)  -- angle camera

	Battle.waitForStartingToSkillEffect()
	Battle.waitForFinishedToSkillEffect()
end

function OrbonneAgriasTurn2.post_attempt()
	-- pass
end

function OrbonneAgriasTurn2.success()
	local ret = nil
	local prpt = {}

	if false then
		prpt = Bunit.readProperty(adr_battle_unit10) -- chemist
	else
		prpt = Bunit.readProperty(adr_battle_unit9) -- archer
	end
	debugPrint(prpt.info)

	if prpt.hp == 0 then
		print(string.format("  K.O, hp=%d", prpt.hp))
		debugPrint(string.format("  K.O, hp=%d", prpt.hp))
		ret = "best"
	elseif prpt.critical ~= 0 then
		print(string.format("  critical, hp=%d", prpt.hp))
		debugPrint(string.format("  critical, hp=%d", prpt.hp))
		ret = "good"
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

function OrbonneAgriasTurn2.waitForBest()
	local retry = 56
	local best_rng = 0xC455188B

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
-- OrbonneAgriasTurn2_TypeB
------------------------------------------------------------
OrbonneAgriasTurn2_TypeB = {}
OrbonneAgriasTurn2_TypeB.logname = "ch1_1_orbonne_agrias_turn2_23.log"
OrbonneAgriasTurn2_TypeB.retry = 60

function OrbonneAgriasTurn2_TypeB.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneAgriasTurn2_TypeB.attempt()
	pressBtn({r2=1}, 1)  -- angle camera
	Battle.waitForStartingToSkillEffect()
	Battle.waitForFinishedToSkillEffect()
end

function OrbonneAgriasTurn2_TypeB.post_attempt()
	-- pass
end

function OrbonneAgriasTurn2_TypeB.success()
	return OrbonneAgriasTurn2.success()
end


------------------------------------------------------------
-- MandaliaAlgusTurn1
------------------------------------------------------------
MandaliaAlgusTurn1 = {}
MandaliaAlgusTurn1.logname = "ch1_3_mandalia_algus_turn1_3.log"

function MandaliaAlgusTurn1.pre_attempt()
	--fadv(2)
end

function MandaliaAlgusTurn1.attempt()
	pressBtn({circle=1}, 1)
	fadv(300)
end

function MandaliaAlgusTurn1.post_attempt()
	-- pass
end

function MandaliaAlgusTurn1.success()
	local ret = nil
	local prpt = {}
	local str

	prpt = Bunit.readProperty(adr_battle_unit3)
	str = prpt.info

	if prpt.hp == 0 then
		str = string.format("%s, K.O, hp=%d", str, prpt.hp)
		print(str)
		ret = "best"
	end
	debugPrint(str)

	prpt = Bunit.readProperty(adr_battle_unit4)
	str = prpt.info

	if prpt.hp == 0 then
		str = string.format("%s, K.O, hp=%d", str, prpt.hp)
		print(str)
		ret = "best"
	end
	debugPrint(str)

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
	local ret = nil
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
		ret = "best"
	else
		ret = nil
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
	local ret = nil
	local prpt = {}
	local ofs_unit = adr_battle_unit2
	local total_enemy = 6
	local enemy = 0
	local str

	prpt = Bunit.readProperty(adr_battle_unit)
	if prpt.hp == 0 then
		debugPrint(string.format("-- agrias.hp = %2d", prpt.hp))
		return nil
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
		ret = "best"
	else
		ret = nil
	end

	return ret
end

------------------------------------------------------------
-- Death_All
------------------------------------------------------------
Death_All = {}
Death_All.logname = "ch2_araguay_death_all_test.log"

function Death_All.pre_attempt()
	fadv(1)
	--pressBtn({circle=1}, 4)  -- select Death of math
	--pressBtn({circle=1}, 6)  -- confirm target
end

function Death_All.attempt()
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(150)
end

function Death_All.post_attempt()
	-- pass
end

function Death_All.success()
	local ret = nil
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 7
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
		ret = "best"
	else
		ret = nil
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
--CriticalHit.logname = "ch1_gariland_squire_turn3_2.log"
CriticalHit.logname = "ch4_sluice_turn1_1.log"

function CriticalHit.pre_attempt()
	fadv(1)
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
	fadv(80)
end

function CriticalHit.post_attempt()
	-- pass
end

function CriticalHit.success()
	local ret = nil
	local prpt = {}
	local str

	prpt = Bunit.readProperty(adr_battle_unit8)
	str = prpt.info

	if prpt.hp == 0 then
		str = string.format("%s, K.O, hp=%d", str, prpt.hp)
		print(str)
		ret = "best"
	elseif prpt.critical ~= 0 then
		if Bunit.isKnockback(prpt) ~= 0 then
			str = string.format("%s, knock back", str)
		end

		str = string.format("%s, critical, hp=%d", str, prpt.hp)
		print(str)
		ret = "good"
	else
		ret = nil
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
	local ret = nil
	local prpt = {}
	local injured = 0
	local str

	prpt = Bunit.readProperty(adr_battle_unit)
	str = prpt.info

	if prpt.critical ~= 0 then
		str = string.format("%s, hp=%d, critical hit", str, prpt.hp)
		print(str)
	end

	if prpt.hp == 0 then
		str = string.format("%s, hp=%d, K.O", str, prpt.hp)
		print(str)
		ret = "best"
	elseif Bunit.isInjured(prpt) ~= 0 then
		str = string.format("%s, hp=%d, critical injured", str, prpt.hp)
		print(str)
		ret = "good"
	else
		ret = nil
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

