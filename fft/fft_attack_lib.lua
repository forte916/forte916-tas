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
OrbonneGafgarionTurn1.logname = "ch1_1_orbonne_gaf_turn1_partyE4.log"
OrbonneGafgarionTurn1.retry = 100

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
		--pressBtn({r1=1}, 1)  -- 9f slower than r1, l2
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
		--pressBtn({r1=1, l2=1}, 1)  -- 12f faster than r2, l2
		pressBtn({r1=1}, 1)  -- 12f faster than r2, l2
	else
		pressBtn({r2=1, l2=1}, 1)  -- 12f slower than r1, l2
		-- r2, l2 の方は ramza が arrowed になる際に余分なスクロールが発生する
	end

	Battle.waitForStartingToSkillEffect()

	-- type2 は詠唱セリフがあるので体感で 100f 以上遅い
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

OrbonneGafgarionTurn1.best_retry = 28
OrbonneGafgarionTurn1.best_rng = 0x2BCE9D03


------------------------------------------------------------
-- OrbonneAgriasTurn1
------------------------------------------------------------
OrbonneAgriasTurn1 = {}
OrbonneAgriasTurn1.logname = "ch1_1_orbonne_agrias_turn1_partyE4.log"
OrbonneAgriasTurn1.retry = 50

function OrbonneAgriasTurn1.pre_attempt_partA()
	Battle.waitForTurnUnitNo(0x00) -- 0x00 is ramza
	-- 7f after ramza arrowed
	pressBtn({x=1}, 6)
	pressBtn({triangle=1}, 1)
	fadv(2)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(45)
	fadv(2)

	-- change option7
	pressBtn({square=1, down=1}, 2)
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

	-- change option6
	pressBtn({square=1, up=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)	-- off
	pressBtn({circle=1}, 2)

	-- change option5
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({up=1}, 2)		-- fast
	pressBtn({circle=1}, 2)

	-- change option4
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)		-- very fast
	pressBtn({circle=1}, 2)

	pressBtn({x=1}, 6)
	pressBtn({x=1}, 1)
	fadv(6)

	-- move
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 10)
	if true then
		pressBtn({down=1}, 2)
		pressBtn({down=1}, 2)
		pressBtn({down=1, right=1}, 1)
	else
		pressBtn({right=1}, 2)
		pressBtn({right=1}, 2)
		pressBtn({right=1, up=1}, 1)
	end
	if false then
		fadv(2)  -- wait here for luck manipulation
	end
	pressBtn({circle=1}, 1)

	Battle.waitForFinishedToMove()
end

function OrbonneAgriasTurn1.pre_attempt_partB()
	pressBtn({circle=1}, 1)
	Battle.waitForTurnUnitNo(0x00) -- 0x00 is ramza
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)
	if false then
		if true then
			pressBtn({up=1}, 1)  -- 試行前に up button なしで最初のフレームを手動で検証すること
		else
			pressBtn({left=1}, 1)  -- 試行前に left button なしで最初のフレームを手動で検証すること
		end
	end
end

function OrbonneAgriasTurn1.pre_attempt_type1()
	OrbonneAgriasTurn1.pre_attempt_partA()
	if false then
		--fadv(4)  -- wait here for luck manipulation
	end
	OrbonneAgriasTurn1.pre_attempt_partB()
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
	fadv(14)  -- irregular, 0xB1 again
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

OrbonneAgriasTurn1.best_retry = 14
OrbonneAgriasTurn1.best_rng = 0xCBC97365


------------------------------------------------------------
-- OrbonneAgriasTurn1_TypeB
------------------------------------------------------------
OrbonneAgriasTurn1_TypeB = {}
OrbonneAgriasTurn1_TypeB.logname = "ch1_1_orbonne_agrias_turn1_partyE4.log"
OrbonneAgriasTurn1_TypeB.retry = 50

function OrbonneAgriasTurn1_TypeB.pre_attempt()
	OrbonneAgriasTurn1.pre_attempt()
	pressBtn({circle=1}, 1)
	Battle.waitForTurnUnitNo(0x01) -- 0x01 is agrias
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneAgriasTurn1_TypeB.attempt()
	pressBtn({r2=1}, 1)  -- camera in moving

	Battle.waitForStartingToSkillEffect()
	Battle.waitForFinishedToSkillEffect()
end

function OrbonneAgriasTurn1_TypeB.post_attempt()
	-- pass
end

function OrbonneAgriasTurn1_TypeB.success()
	return OrbonneAgriasTurn1.success()
end

OrbonneAgriasTurn1_TypeB.best_retry = 14
OrbonneAgriasTurn1_TypeB.best_rng = 0xCBC97365


------------------------------------------------------------
-- OrbonneAgriasTurn1_TypeC
------------------------------------------------------------
OrbonneAgriasTurn1_TypeC = {}
OrbonneAgriasTurn1_TypeC.logname = "ch1_1_orbonne_agrias_turn1_partyE4.log"
OrbonneAgriasTurn1_TypeC.retry = 100

function OrbonneAgriasTurn1_TypeC.pre_attempt()
	OrbonneAgriasTurn1.pre_attempt_partA()
end

function OrbonneAgriasTurn1_TypeC.attempt()
	OrbonneAgriasTurn1.pre_attempt_partB()
	pressBtn({circle=1}, 1)
	Battle.waitForTurnUnitNo(0x01) -- 0x01 is agrias
	Battle.waitForStartingToSkillEffect()
	Battle.waitForFinishedToSkillEffect()
end

function OrbonneAgriasTurn1_TypeC.post_attempt()
	-- pass
end

function OrbonneAgriasTurn1_TypeC.success()
	return OrbonneAgriasTurn1.success()
end

OrbonneAgriasTurn1_TypeC.best_retry = 14
OrbonneAgriasTurn1_TypeC.best_rng = 0xCBC97365


------------------------------------------------------------
-- OrbonneAliciaTurn1
------------------------------------------------------------
OrbonneAliciaTurn1 = {}
OrbonneAliciaTurn1.logname = "ch1_1_orbonne_alicia_turn1_partyE4.log"
OrbonneAliciaTurn1.retry = 50

function OrbonneAliciaTurn1.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneAliciaTurn1.attempt()
	if false then
		pressBtn({l1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- tilt camera
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
OrbonneRadTurn1.logname = "ch1_1_orbonne_rad_turn1_partyE4.log"
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
		pressBtn({r2=1}, 1)  -- tilt camera
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

OrbonneRadTurn1.best_retry = 42
OrbonneRadTurn1.best_rng = 0x8DDD6BFB

------------------------------------------------------------
-- OrbonneRadTurn1_TypeB
------------------------------------------------------------
OrbonneRadTurn1_TypeB = {}
OrbonneRadTurn1_TypeB.logname = "ch1_1_orbonne_rad_turn1_partyE4.log"
OrbonneRadTurn1_TypeB.retry = 64

function OrbonneRadTurn1_TypeB.pre_attempt()
	Battle.waitForTurnUnitNo(0x03)  -- alicia
	Battle.waitForTurnUnitNo(0x04)  -- lavian
	Battle.waitForStartingToMove()
	fadv(4)
	pressBtn({l1=1}, 1)  -- rotate camera
	fadv(33)
	pressBtn({l1=1}, 1)  -- rotate camera
	Battle.waitForTurnUnitNo(0x05)  -- knight
	Battle.waitForTurnUnitNo(0x08)  -- archer
	Battle.waitForTurnUnitNo(0x09)  -- chemist
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneRadTurn1_TypeB.attempt()
	if true then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- tilt camera
	end
	if true then
		Battle.waitForGreenPanel()
		pressBtn({left=1, up=1}, 1)  -- move cursor
		--pressBtn({left=1, up=1}, 1)  -- move cursor
		--pressBtn({left=1, up=1}, 1)  -- move cursor
		--pressBtn({left=1, up=1}, 1)  -- move cursor
	end
	Battle.waitForTurnUnitNo(0x0A)  -- rad
	Battle.waitForStartingToMove()
	fadv(4)
	if false then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- tilt camera
	end
	Battle.waitForTurnUnitNo(0x02)  -- gaf
end

function OrbonneRadTurn1_TypeB.post_attempt()
	-- pass
end

function OrbonneRadTurn1_TypeB.success()
	return OrbonneRadTurn1.success()
end

--OrbonneRadTurn1_TypeB.best_retry = 33
--OrbonneRadTurn1_TypeB.best_rng = 0x93E3838B

OrbonneRadTurn1_TypeB.best_retry = 14
OrbonneRadTurn1_TypeB.best_rng = 0x215ECFE1


------------------------------------------------------------
-- OrbonneRadTurn1_TypeC
------------------------------------------------------------
OrbonneRadTurn1_TypeC = {}
OrbonneRadTurn1_TypeC.logname = "ch1_1_orbonne_rad_turn1_partyE4.log"
OrbonneRadTurn1_TypeC.retry = 64

function OrbonneRadTurn1_TypeC.pre_attempt()
	Battle.waitForTurnUnitNo(0x03)  -- alicia
	Battle.waitForTurnUnitNo(0x04)  -- lavian
	Battle.waitForStartingToMove()
	fadv(4)
	pressBtn({l1=1}, 1)  -- rotate camera
	fadv(33)
	pressBtn({l1=1}, 1)  -- rotate camera
	Battle.waitForTurnUnitNo(0x05)  -- knight
	Battle.waitForTurnUnitNo(0x08)  -- archer
	Battle.waitForTurnUnitNo(0x09)  -- chemist
	Battle.waitForStartingToMove()
	fadv(4)
	pressBtn({r1=1}, 1)  -- rotate camera
	if true then
		Battle.waitForGreenPanel()
		pressBtn({left=1, up=1}, 1)  -- move cursor
		pressBtn({left=1, up=1}, 1)  -- move cursor
		pressBtn({left=1, up=1}, 1)  -- move cursor
		pressBtn({left=1, up=1}, 1)  -- move cursor
	end
	Battle.waitForTurnUnitNo(0x0A)  -- rad
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneRadTurn1_TypeC.attempt()
	if false then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- tilt camera
	end
	Battle.waitForTurnUnitNo(0x02)  -- gaf
end

function OrbonneRadTurn1_TypeC.post_attempt()
	-- pass
end

function OrbonneRadTurn1_TypeC.success()
	return OrbonneRadTurn1.success()
end

OrbonneRadTurn1_TypeC.best_retry = 14
OrbonneRadTurn1_TypeC.best_rng = 0x215ECFE1


------------------------------------------------------------
-- OrbonneRadTurn1_TypeD
------------------------------------------------------------
OrbonneRadTurn1_TypeD = {}
OrbonneRadTurn1_TypeD.logname = "ch1_1_orbonne_rad_turn1_partyE4.log"
OrbonneRadTurn1_TypeD.retry = 64

function OrbonneRadTurn1_TypeD.pre_attempt()
	Battle.waitForGreenPanel()
	pressBtn({left=1, up=1}, 1)  -- move cursor
	--pressBtn({left=1, up=1}, 1)  -- move cursor
	--pressBtn({left=1, up=1}, 1)  -- move cursor
	--pressBtn({left=1, up=1}, 1)  -- move cursor

	Battle.waitForTurnUnitNo(0x0A)  -- rad
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneRadTurn1_TypeD.attempt()
	if false then
		pressBtn({r1=1}, 1)  -- rotate camera
	else
		pressBtn({r2=1}, 1)  -- tilt camera
	end
	Battle.waitForTurnUnitNo(0x02)  -- gaf
end

function OrbonneRadTurn1_TypeD.post_attempt()
	-- pass
end

function OrbonneRadTurn1_TypeD.success()
	return OrbonneRadTurn1.success()
end

OrbonneRadTurn1_TypeD.best_retry = 14
OrbonneRadTurn1_TypeD.best_rng = 0x215ECFE1


------------------------------------------------------------
-- OrbonneGafgarionTurn2
------------------------------------------------------------
OrbonneGafgarionTurn2 = {}
OrbonneGafgarionTurn2.logname = "ch1_1_orbonne_gaf_turn2_partyE4.log"
OrbonneGafgarionTurn2.retry = 54

function OrbonneGafgarionTurn2.pre_attempt()
	Battle.waitForStartingToMove()
	fadv(4)
end

function OrbonneGafgarionTurn2.attempt()
	local condition = 3
	if condition == 1 then
		pressBtn({r1=1}, 1)  -- rotate camera
	elseif condition == 2 then
		pressBtn({r2=1}, 1)  -- tilt camera
	else
		pressBtn({l1=1}, 1)  -- rotate camera
		fadv(32)
		pressBtn({l1=1}, 1)  -- rotate camera
	end
	if true then
		Battle.waitForGreenPanel()
		pressBtn({right=1, up=1}, 1)  -- move cursor
		--pressBtn({right=1, up=1}, 1)  -- move cursor
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

-- cond=3, right&up x1
OrbonneGafgarionTurn2.best_retry = 12
OrbonneGafgarionTurn2.best_rng = 0x27E21071



------------------------------------------------------------
-- OrbonneRamzaTurn2
------------------------------------------------------------
OrbonneRamzaTurn2 = {}
OrbonneRamzaTurn2.logname = "ch1_1_orbonne_ramza_turn2_partyE4.log"
OrbonneRamzaTurn2.retry = 200
OrbonneRamzaTurn2.odd_number = false

function OrbonneRamzaTurn2.logHeader()
	debugPrint(string.format("----- odd_number = %s -----", tostring(OrbonneRamzaTurn2.odd_number)))
	debugPrint(string.format(""))
end

function OrbonneRamzaTurn2.pre_attempt()
	Battle.waitForTurnUnitNo(0x00)  -- ramza
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	if false then
		pressBtn({down=1}, 1)
	else
		pressBtn({right=1}, 1)
	end
	fadv(1)

	if OrbonneRamzaTurn2.odd_number == true then
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

OrbonneRamzaTurn2.best_retry = 32
OrbonneRamzaTurn2.best_rng = 0x399BC177


------------------------------------------------------------
-- OrbonneRamzaTurn2_TypeB
------------------------------------------------------------
OrbonneRamzaTurn2_TypeB = {}
OrbonneRamzaTurn2_TypeB.logname = "ch1_1_orbonne_ramza_turn2_partyE4.log"
OrbonneRamzaTurn2_TypeB.retry = 120
OrbonneRamzaTurn2_TypeB.odd_number = false
OrbonneRamzaTurn2_TypeB.waitA = 0
OrbonneRamzaTurn2_TypeB.waitB = 0

function OrbonneRamzaTurn2_TypeB.logHeader()
	debugPrint(string.format("----- odd_number = %s, waitA = %d, waitB = %d -----", tostring(OrbonneRamzaTurn2_TypeB.odd_number), OrbonneRamzaTurn2_TypeB.waitA, OrbonneRamzaTurn2_TypeB.waitB))
	debugPrint(string.format(""))
end

function OrbonneRamzaTurn2_TypeB.pre_attempt()
	Battle.waitForTurnUnitNo(0x00)  -- ramza
	-- move
	pressBtn({circle=1}, 10)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	fadv(OrbonneRamzaTurn2_TypeB.waitA)  -- wait here for luck manipulation
	pressBtn({circle=1}, 1)
	Battle.waitForFinishedToMove()
	pressBtn({circle=1}, 1)
	Battle.waitForTurnUnitNo(0x00) -- ramza
	-- attack
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({down=1}, 1)
	fadv(1)

	if OrbonneRamzaTurn2_TypeB.odd_number == true then
		fadv(1)  -- for odd number retry
	end
	pressBtn({circle=1}, 2)  -- select target
	fadv(OrbonneRamzaTurn2_TypeB.waitB)  -- wait here for skip rng
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- wait until 0x164908 = 0x001B, which frame is 5f before shown "Menu"

	--	-- cancel and attack
	--	pressBtn({x=1}, 1)   -- execute attack
	--	fadv(3)
	--	pressBtn({circle=1}, 2)  -- select target
	--	pressBtn({circle=1}, 1)  -- confirm target
	--	fadv(5)
end

function OrbonneRamzaTurn2_TypeB.attempt()
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(100)
end

function OrbonneRamzaTurn2_TypeB.post_attempt()
	-- pass
end

function OrbonneRamzaTurn2_TypeB.success()
	local ret = nil
	local prpt = {}

	prpt = Bunit.readProperty(adr_battle_unit9) -- archer
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

--***** best state. retry = 56, fc = 15039, rng = E92D5B3B *****	odd=false, wait=0
OrbonneRamzaTurn2_TypeB.best_retry = 56
OrbonneRamzaTurn2_TypeB.best_rng = 0xE92D5B3B



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
OrbonneAliciaTurn2.logname = "ch1_1_orbonne_alicia_turn2_partyE4.log"
OrbonneAliciaTurn2.retry = 200

function OrbonneAliciaTurn2.pre_attempt()
	Battle.waitForTurnUnitNo(0x00)  -- ramza
	-- select wait
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- select wait
	fadv(8)
end

function OrbonneAliciaTurn2.attempt()
	pressBtn({circle=1}, 1)  -- ramza wait

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
	else
		debugPrint(string.format("  normal, hp=%d", prpt.hp))
		ret = nil
	end

	return ret
end

------------------------------------------------------------
-- OrbonneAliciaTurn2_TypeB
------------------------------------------------------------
OrbonneAliciaTurn2_TypeB = {}
OrbonneAliciaTurn2_TypeB.logname = "ch1_1_orbonne_alicia_turn2_partyE4.log"
OrbonneAliciaTurn2_TypeB.retry = 120
OrbonneAliciaTurn2_TypeB.camera = 1

function OrbonneAliciaTurn2_TypeB.logHeader()
	debugPrint(string.format("----- camera = %d -----", OrbonneAliciaTurn2_TypeB.camera))
	debugPrint(string.format(""))
end

function OrbonneAliciaTurn2_TypeB.pre_attempt()
	fadv(3)
end

function OrbonneAliciaTurn2_TypeB.attempt()
	if OrbonneAliciaTurn2_TypeB.camera == 1 then
		pressBtn({circle=1, r2=1}, 1)  -- ramza wait and tilt
	elseif OrbonneAliciaTurn2_TypeB.camera == 2 then
		pressBtn({circle=1, l1=1}, 1)  -- ramza wait and tilt
	else
		pressBtn({circle=1}, 1)  -- ramza wait
	end
	Battle.waitForTurnUnitNo(0x03)  -- alicia
	fadv(220)
end

function OrbonneAliciaTurn2_TypeB.post_attempt()
	-- pass
end

function OrbonneAliciaTurn2_TypeB.success()
	return OrbonneAliciaTurn2.success()
end

--***** best state. retry = 16, fc = 15160, rng = 590133C3 *****, camera=1, cursor=none
OrbonneAliciaTurn2_TypeB.best_retry = 16
OrbonneAliciaTurn2_TypeB.best_rng = 0x590133C3


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
	--pressBtn({r2=1}, 1)  -- tilt camera

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

OrbonneAgriasTurn2.best_retry = 56
OrbonneAgriasTurn2.best_rng = 0xC455188B


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
	pressBtn({r2=1}, 1)  -- tilt camera
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

