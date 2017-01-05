-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This is a key inputs for speed run.
--
-- Usage
--   1. require "fft_input_macro_lib"
--
require "psx_lib"


------------------------------------------------------------
-- key macros
------------------------------------------------------------
TAS = {}


------------------------------------------------------------
-- game start
------------------------------------------------------------
function TAS.start()
	fc = emu.framecount()
	print(string.format("start: fc = %d", fc))

	fadv(666)               -- title
	fc = emu.framecount()

	print(string.format("skip title: fc = %d", fc))
	pressBtn({start=1}, 1)  -- skip title, 666f

	fadv(36)
	fc = emu.framecount()

	print(string.format("game start: fc = %d", fc))
	pressBtn({start=1}, 1)  -- game start, 702f

	fadv(192)
end

function TAS.skipArazlam()
	--fc = emu.framecount()
	--print(string.format("skipArazlam: fc = %d", fc))

	pressBtn({start=1}, 1)  -- skip message, 855f is fastest.
	fadv(323)
	-- determined ramza's status, 1259f
	fadv(25)
end

function TAS.skipArazlamBest()
	fc = emu.framecount()
	print(string.format("skipArazlamBest: fc = %d", fc))

	fadv(5)  -- wait for best status of ramza. SquireJP=199, ChemistJP=199

	fc = emu.framecount()
	print(string.format("skip message: fc = %d", fc))

	pressBtn({start=1}, 1)  -- skip message, 941 is best status.

	fadv(323)
	-- determined ramza's status, 1265f
	fadv(25)
end

function TAS.inputName()
	fc = emu.framecount()
	print(string.format("inputName: fc = %d", fc))

	-- shown input name
	fadv(3)
	pressBtn({square=1}, 1)  -- delete 1st letter
	fadv(5)
	pressBtn({square=1}, 1)  -- delete 2nd letter
	fadv(5)
	pressBtn({start=1},  1)  -- determin
	fadv(3)
	pressBtn({circle=1}, 1)  -- confirm
	fadv(12)
end

function TAS.inputBirthday()
	fc = emu.framecount()
	print(string.format("inputBirthday: fc = %d", fc))

	-- input birthday
	fadv(5)
	pressBtn({start=1}, 1)  -- determin
	pressBtn({circle=1}, 1)  -- confirm
	fadv(34)
end

function TAS.skipOpeningMovie()
	fc = emu.framecount()
	print(string.format("skipOpeningMovie: fc = %d", fc))

	-- starting moveie
	fadv(11)
	pressBtn({start=1}, 1)  -- skip opening movie
	fadv(324)
end

-- @deplecated
function TAS.skipOrbonne()
	fc = emu.framecount()
	print(string.format("skipOrbonne: fc = %d", fc))

	-- 1725f
	fadv(1430)
	-- agrias, 3155f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	-- agrias, 3163f
	fadv(94)

	-- ovelia, 3257f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	--fadv(xx)
	
	-- agrias, 3414f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	--fadv(xx)
	
	-- simon, 3545f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)


	-- gafgarion, 3844f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- agrias, 3888f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- gafgarion, 4066f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)
	fadv(6)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- agrias, 4190f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- gafgarion, 4252f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)
	fadv(6)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- agrias, 4312f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- ovelia, 4418f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 2)

	-- simon, 4762f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	-- ovelia, 4784f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- knight, 5121f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- simon, 5151f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- gafgarion, 5290f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- ramza, 5334f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	-- gafgarion, 5348f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- ovelia, 5670f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	-- if wait here, change enemy status.
	pressBtn({circle=1}, 2)
end

-- @deplecated
function TAS.skipOrbonneEntrance()
	-- agrias, 6762f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	
	-- enemy, 6876f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- gafgarion, 7120f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- agrias, 7232f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- gafgarion, 7284f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
end

-- @deplecated
function TAS.Ch1_1_skipOpening()
	-- gafgarion, 8239f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- agrias, 8430f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	
	-- gafgarion, 8559f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	-- wait here for luck manipulation
	pressBtn({circle=1}, 2)

end

function TAS.Ch1_1_ramza_turn1()
	-- ramza arrowed
	fadv(7)
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
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option6
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option7
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option8
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option9
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option11
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	-- change option12
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)

	pressBtn({x=1}, 6)
	pressBtn({x=1}, 1)
	fadv(6)

	-- move
	pressBtn({circle=1}, 6)  -- maybe 4f?? not 6f
	pressBtn({circle=1}, 10)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)

	-- ramza arrowed, 10012f
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({down=1}, 2)
	-- ramza standby, 10043f
	pressBtn({circle=1}, 9)
	--fadv(xx) -- wait here for luck manipulation
	pressBtn({circle=1}, 1)
	--fadv(xx)
end

function TAS.Ch1_1_ramza_turn2()
	-- ramza arrowed
	fadv(7)
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({right=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B

	-- wait here for luck manipulation
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
	
	-- arrowed
	fadv(6+1)
	Battle.fullWait()
end

function TAS.Ch1_chemist_potion()
	-- arrowed
	fadv(7)
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- item
	pressBtn({circle=1}, 9)  -- potion
	pressBtn({up=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(9)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 1)   -- skip "potion" msg
	--fadv(xx)
	
	-- arrowed
	fadv(6+1)
	Battle.fullWait()
end


-- @deplecated
function TAS.Ch1_1_ramza_turn2_old()
	-- ramza arrowed, 14694f
	--fadv(xx)

	-- ramza move, 14756f
	pressBtn({circle=1}, 10)
	pressBtn({right=1}, 1)
	pressBtn({down=1}, 1)
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)
	
	-- ramza arrowed, 14838f
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action, 14865f
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({up=1}, 1)
	fadv(1)
	-- wait here for luck manipulation
	pressBtn({circle=1}, 2)  -- select target, 14888f
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack, 14896f
	fadv(115)
	pressBtn({circle=1}, 10)
end

-- @deplecated
function TAS.Ch1_1_ramza_turn3()
	-- ramza arrowed, 18487f
	--fadv(xx)
	pressBtn({circle=1}, 18)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	--fadv(xx)

	-- ramza arrowed, 18651f
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({right=1}, 1)
	-- wait here for luck manipulation
	pressBtn({circle=1}, 2)  -- select target, 18701f
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack, 18709f
	fadv(103)
	-- ramza arrowed, 18825f
	fadv(2)
	pressBtn({circle=1}, 10)
end


function TAS.enterSoldierOffice()
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({up=1}, 7)
	pressBtn({circle=1}, 1)  -- Soldier office
	fadv(55)

	for i=1, 10 do
		pressBtn({circle=1}, 1)  -- male soldier
		fadv(13)
		pressBtn({x=1}, 1)  -- skip msg
		fadv(25)
		pressBtn({x=1}, 1)  -- skip status
		fadv(1)
		pressBtn({x=1}, 1)  -- cancel menu
		fadv(4)
	end

	pressBtn({x=1}, 1)  -- exit Soldier office
	fadv(4)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.enterFormation()
	pressBtn({triangle=1}, 5)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(49+2)
end

function TAS.selectRight()
	pressBtn({right=1}, 5)  -- select member
end

function TAS.dismiss()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({circle=1}, 3)  -- select dismiss
	-- 43947f
	pressBtn({circle=1}, 1)  -- skip message
	fadv(51)
	-- exit if return worldmap
	fadv(3)
	-- 44002f
end

function TAS.dismissRepeat()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(51)
	-- exit if return worldmap
	fadv(3)
end

function TAS.cancelMenu()
	pressBtn({x=1}, 5)
end

function TAS.jobChangeKnight()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(45+1)

	-- job ring
	pressBtn({right=1}, 1)
	fadv(14-2)
	pressBtn({right=1}, 1)
	fadv(14-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)

	pressBtn({l1=1}, 1)
	fadv(23+17)
	
	-- job ring
	pressBtn({right=1}, 1)
	fadv(14-2)
	pressBtn({right=1}, 1)
	fadv(14-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
end

function TAS.jobChangeDelita()
	pressBtn({l1=1}, 5)
	pressBtn({l1=1}, 1)
	fadv(20)
	pressBtn({right=1}, 1)
	fadv(14-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
end

function TAS.jobChangeWizard()
	pressBtn({l1=1}, 1)
	fadv(23+17)
	pressBtn({left=1}, 1)
	fadv(14-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
end

function TAS.cancelJobChange()
	pressBtn({x=1}, 1)
	fadv(45)
	-- exit if return worldmap
	fadv(2)
end

function TAS.learnItem()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)   -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 1)  -- Item
	fadv(5)
	pressBtn({circle=1}, 4)   -- Item
	pressBtn({square=1, down=1}, 6)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- EyeDrop
	pressBtn({square=1, up=1}, 2+1)
	pressBtn({circle=1}, 1)   -- select yes
	fadv(15)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Ether
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5+1)
	pressBtn({x=1}, 1)
	fadv(9)
	-- coninue to learnBlackMagic2()
end

function TAS.learnBlackMagic1()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)   -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Black Magic
	fadv(5)
	pressBtn({circle=1}, 4)   -- Black Magic
	pressBtn({square=1, down=1}, 6)
	pressBtn({up=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- Ice
	pressBtn({square=1, down=1}, 2)
	pressBtn({circle=1}, 1)   -- select yes
	fadv(17)
	pressBtn({square=1, up=1}, 3)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Bolt
	pressBtn({circle=1}, 1)  -- select yes
	fadv(3)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Bolt2
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Magic attack up
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 1)
	fadv(4)
	-- coninue to setBlackMagic()
end

function TAS.learnBlackMagic2()
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Black Magic
	fadv(5)
	pressBtn({circle=1}, 4)   -- Black Magic
	pressBtn({square=1, down=1}, 6)
	pressBtn({up=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- Ice
	pressBtn({square=1, down=1}, 2)
	pressBtn({circle=1}, 1)   -- select yes
	fadv(19)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Frog
	pressBtn({circle=1}, 1)  -- select yes
	fadv(4)
	pressBtn({square=1, up=1}, 1)
	fadv(2)
	pressBtn({circle=1}, 4)   -- Bolt2
	pressBtn({circle=1}, 1)  -- select yes
	fadv(3)
	pressBtn({up=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Bolt
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Magic attack up
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 1)
	fadv(4)
	-- coninue to setBlackMagic()
end

function TAS.setMagicAttackUp()
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 2)   -- set
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select magic attack up
	fadv(6)
	pressBtn({x=1}, 1)
	fadv(5)
	-- coninue to learnRamzaSquireWizard()
end

function TAS.learnRamzaSquireWizard()
	pressBtn({r1=1}, 5+1)
	pressBtn({r1=1}, 1)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({circle=1}, 2)   -- squire
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 2)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Gained JP-UP
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- wizard
	fadv(5)
	pressBtn({circle=1}, 2)   -- wizard
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 2)
	pressBtn({square=1, down=1}, 2)
	pressBtn({up=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- Ice
	pressBtn({square=1, down=1}, 2)
	pressBtn({circle=1}, 1)   -- select yes
	fadv(19)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Frog
	pressBtn({circle=1}, 1)  -- select yes
	fadv(3)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Death
	pressBtn({circle=1}, 1)  -- select yes
	fadv(3)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Flare
	pressBtn({circle=1}, 1)  -- select yes
	fadv(4)
	pressBtn({square=1, up=1}, 1)
	fadv(2)
	pressBtn({up=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Bolt3
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Magic attack up
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 1)
	fadv(4)
	-- continue to setRamzaSquireWizard()
end

function TAS.setRamzaSquireWizard()
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)   -- set
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)   -- select black magic
	fadv(2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select Gained JP-UP
	fadv(6)
end

function TAS.setKnightItem()
	pressBtn({r1=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	fadv(4)

	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)   -- select Item
	fadv(6)

	pressBtn({r1=1}, 1)
	fadv(5)

	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)   -- select Item
	fadv(6)

	pressBtn({x=1}, 1)
	fadv(2)
	pressBtn({x=1}, 1)
	fadv(28)
	-- exit if return worldmap
	fadv(3)
end

function TAS.removeKnightSword()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)   -- item
	fadv(26)
	pressBtn({l1=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)   -- remove
	fadv(4)
	pressBtn({circle=1}, 1)   -- remove item
	fadv(5)
end

function TAS.removeRamzaBattleBoots()
	pressBtn({l1=1}, 3)
	pressBtn({up=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)   -- remove battle boots
	fadv(5)
	pressBtn({x=1}, 1)
	fadv(5)
end

function TAS.equipWizard()
	pressBtn({l1=1}, 6)
	pressBtn({l1=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)   -- best fits
	fadv(3)
	pressBtn({circle=1}, 1)   -- select OK
	fadv(4)
	pressBtn({x=1}, 1)
	fadv(28)
	-- exit if return worldmap
	fadv(3)
end


-- @deprecated
function TAS.learnRamzaYell()
	pressBtn({l1=1}, 2)
	pressBtn({up=1}, 3)
	pressBtn({circle=1}, 10)  -- select squire
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Yell
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4)
	-- 44877f
	pressBtn({x=1}, 2)
	fadv(29-2)
	-- 44907f
end

function TAS.exitFormation()
	pressBtn({x=1}, 1)
	fadv(43+1)
end

function TAS.moveMandaliaFromFormationForEvent()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(50)
end

function TAS.moveMandaliaFromGariland()
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)
	-- if wait here, change enemy status.
	pressBtn({circle=1}, 1)
	fadv(50)
end

function TAS.ch1_3_mandalia_deploy_old()
	-- -before 3f from reverse triangle
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({l1=1, down=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch1_3_mandalia_deploy()
	-- -before 3f from reverse triangle
	pressBtn({left=1}, 1)
	pressBtn({up=1}, 1)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1, circle}, 1)
	pressBtn({l1=1, down=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({r1=1, right=1}, 2)
	pressBtn({r1=1, right=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({r1=1, up=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
end


function TAS.ch1_3_turn1_knight()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({down=1}, 1)
	pressBtn({left=1}, 1)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({right=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect

	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_3_turn1_wizard()
	-- arrowed
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	pressBtn({circle=1}, 10)  -- move
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(5)
	pressBtn({r1=1}, 1)   -- camera
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18+1)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Black Magic
	pressBtn({circle=1}, 9)  -- Bolt
	pressBtn({left=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({left=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)   -- confirm target
	fadv(4)  -- wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)  -- wait for effect

	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_3_turn1_ramza()
	-- arrowed
	fadv(5+7)
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Black Magic
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- Frog
	fadv(8)
	pressBtn({circle=1}, 3)   -- select target
	pressBtn({circle=1}, 1)   -- confirm target
	fadv(3)  -- wait until 0x164908 = 0x001A
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)  -- wait for effect

	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_3_turnN_ramza()
	-- arrowed
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({up=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
	
	-- arrowed
	fadv(6)
	Battle.fullWait()
end

function TAS.ch1_3_turnN_standby()
	-- arrowed
	fadv(7)
	-- fadv(xx)  -- wait 9f after 0x1FFE80 = 0x00B1
	Battle.fullWait()
end

function TAS.ch1_3_turn1_ramza_old()
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 9)  -- Yell
	pressBtn({circle=1}, 3)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	-- 57138f
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(285)
	-- 57424f, arrowed
	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_3_turn2_ramza_old()
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 9)  -- Yell
	pressBtn({circle=1}, 3)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 18)
	Battle.fullWait()
end

function TAS.ch1_3_turnN_ramza_Yell_old()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 9)  -- Yell
	pressBtn({circle=1}, 3)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(284)  -- Yell animation
	-- arrowed and shown AT
	fadv(6)
	Battle.fullWait()
end

function TAS.jobChangeRamza()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- job change
	fadv(46)
	pressBtn({left=1}, 15-2)
	pressBtn({left=1}, 15-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(45)
	-- exit if return worldmap
	fadv(2)
end

function TAS.learnRamzaAccumulate()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({circle=1}, 10)  -- select squire
	pressBtn({circle=1}, 4)   -- select accumulate
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4+1)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 5)   -- select set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select guts
	fadv(6)
	pressBtn({x=1}, 5)
	--- continue to learnKnightSpeedBreak
end

function TAS.learnRamzaAccumulate_old()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({circle=1}, 10)  -- select squire
	pressBtn({circle=1}, 4)   -- select accumulate
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({right=1}, 6)
	pressBtn({right=1}, 6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select gained jp up
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 5)   -- select set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 3)   -- select guts
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(3)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select gained jp jp
	fadv(5)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 1)
	fadv(31-3)
	TAS.exitFormation()
end

function TAS.learnKnightSpeedBreak()
	pressBtn({r1=1}, 2)
	pressBtn({up=1}, 1)

	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 10+2)   -- Knight
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Speed Break
	fadv(5)
	pressBtn({circle=1}, 4)   -- Speed Break
	pressBtn({circle=1}, 1)  -- select yes
	fadv(6)
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 1)
	fadv(6)

	pressBtn({l1=1}, 1)
	fadv(1)
	-- repeat
end

function TAS.setKnightBreak()
	pressBtn({r1=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)   -- select break
	fadv(6)
	-- repeat
end

function TAS.removeKnightEzuipChange()
	pressBtn({down=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 1)   -- remove
	fadv(1)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)

	pressBtn({circle=1}, 1)   -- remove ability
	fadv(6)

	pressBtn({l1=1}, 1)
	fadv(5)

	pressBtn({circle=1}, 1)   -- remove ability
	fadv(6)

	pressBtn({x=1}, 1)
	fadv(2)
	pressBtn({x=1}, 1)
	fadv(28)
	-- exit if return worldmap
	fadv(3)
end


function TAS.moveGarilandFromFormation()
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 3)
	pressBtn({up=1}, 1)
	-- if wait here, change rng.
	pressBtn({circle=1}, 1)
	fadv(50)
end

function TAS.moveGarilandFromMandalia()
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({up=1}, 1)
	-- if wait here, change enemy status.
	pressBtn({circle=1}, 1)
	fadv(50)
end

function TAS.ch1_random_battle_mandalia_deploy()
	-- -before 3f from reverse triangle
	pressBtn({right=1}, 1)
	pressBtn({up=1}, 1)
	pressBtn({right=1, circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch1_random_battle_Yell_ramza()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Yell
	pressBtn({circle=1}, 3)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(284)  -- Yell animation
	-- arrowed and shown AT
	fadv(6)
	Battle.fullWait()
end

function TAS.ch1_random_battle_down_move_ramza()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 4)   -- Accumulate
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(64+4)  -- Accumulate animation

	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_random_battle_left_move_bolt3_ramza()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- magic
	pressBtn({circle=1}, 8)   -- Bolt3
	pressBtn({up=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 1)   -- confirm target
	fadv(4)  -- wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(19)  -- prepare casting spell

	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function TAS.ch1_random_battle_Accumulate_ramza()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 4)   -- Accumulate
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(63+1)  -- Accumulate animation
	-- arrowed and shown AT
	fadv(6)
	Battle.fullWait()

	fadv(8)  -- CT calculating
	-- about 110f at goblin turn.
end

function TAS.ch1_random_battle_attack_ramza()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({down=1}, 1)    -- move cursol
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(100)
end


function TAS.ch1_random_battle_SpeedBreak()
	-- arrowed
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- break
	pressBtn({circle=1}, 9)  -- Speed Break
	pressBtn({up=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)
end


function TAS.takeCristal()
	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	-- wait here for luck manipulation
	pressBtn({circle=1}, 1)  -- take cristal
	fadv(47)
	pressBtn({circle=1}, 1)  -- select inherit
	fadv(7)
	pressBtn({circle=1}, 1)  -- show ability
	fadv(3)
	pressBtn({circle=1}, 1)  -- inherit
end


function TAS.learnTimeMagic()
	-- continued from job change
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)   -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Time Magic
	fadv(5)
	pressBtn({circle=1}, 4)   -- Time Magic
	pressBtn({square=1, down=1}, 6)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- Dont move
	pressBtn({square=1, up=1}, 2)
	pressBtn({circle=1}, 1)   -- select yes
	fadv(10)
	pressBtn({x=1}, 1)
	fadv(9)
	pressBtn({x=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Time Magic
	fadv(5)
	pressBtn({circle=1}, 4)   -- Time Magic
	pressBtn({square=1, down=1}, 6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Quick
	pressBtn({circle=1}, 1)  -- select yes
	fadv(3)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Demi2
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)

	pressBtn({right=1}, 1)
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- MP Switch
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)

	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Short Charge
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)

	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- Teleport
	pressBtn({circle=1}, 1)  -- select yes
	fadv(5)

	pressBtn({x=1}, 1)
	fadv(9)
	pressBtn({x=1}, 1)
	fadv(4)
end

function TAS.jobChangeWizardRamza_learnMagic()
	-- change wizard
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- select job change
	fadv(46)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)  -- wizard
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47)
    -- learn ability
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- select ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- priest
	fadv(5)
	pressBtn({circle=1}, 1)  -- priest
	fadv(2)
	pressBtn({square=1, down=1}, 9)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- holy
	fadv(5)
	pressBtn({circle=1}, 4)   -- select holy
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- time mage
	fadv(4)
	pressBtn({circle=1}, 10)
	pressBtn({right=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select switch mp
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({left=1}, 4)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- reflect
	fadv(5)
	pressBtn({circle=1}, 4)  -- select reflect
	pressBtn({square=1, down=1}, 4)
	pressBtn({circle=1}, 1)
	fadv(10)
	pressBtn({x=1}, 10+1)
	pressBtn({x=1}, 4)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- time mage
	fadv(5)
	pressBtn({circle=1}, 1)  -- time mage
	fadv(2)
	pressBtn({square=1, down=1}, 9)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- quick
	fadv(5)
	pressBtn({circle=1}, 4)   -- select quick
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- demi2
	fadv(5)
	pressBtn({circle=1}, 4)   -- select demi2
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({left=1}, 4)
	pressBtn({circle=1}, 4)   -- select teleport
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- calculator
	fadv(5)
	pressBtn({circle=1}, 10)
	pressBtn({right=1}, 4)
	pressBtn({circle=1}, 4)   -- select CT
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select Level
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select Hight
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select prime number
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select 5
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select 4
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select 3
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({x=1}, 4)
    -- set ability
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 4+1)   -- select set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({right=1}, 4)  -- math
	fadv(2)
	pressBtn({circle=1}, 2)   -- select math
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- select mp switch
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- select magic attack up
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select teleport
	fadv(4)
	pressBtn({x=1}, 2)
	pressBtn({x=1}, 2)
	fadv(29-2)
	TAS.exitFormation()
end

function TAS.buyThunderRod()
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(55)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)  -- fitting room
	pressBtn({circle=1}, 1)
	fadv(7)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19)
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({circle=1}, 1)  -- select right hand
	fadv(10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- thunder rod
	fadv(2)
	pressBtn({circle=1}, 1)  -- thunder rod
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- yes
	fadv(4)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(4)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.ch2_defect_member()
	-- before 1f from getting to center
	pressBtn({circle=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(69)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(69)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
end

function TAS.jobChangeGafgarion()
	pressBtn({right=1}, 2)  -- select gafgarion
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(46)
	pressBtn({right=1}, 15-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47-2)
	TAS.exitFormation()
end

function TAS.equipRamza_jobChangeMustadio()
	-- remove Ovelia
	pressBtn({r1=1}, 1)  -- select ovelia
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 1)  -- item
	fadv(27)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- remove
	fadv(2)
	pressBtn({left=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)  -- remove all
	fadv(6)
	pressBtn({x=1}, 1)  -- cancel remove
	fadv(4)
	-- equip Ramza
	pressBtn({l1=1}, 2)  -- ramza
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)  -- equip strongest
	fadv(3)
	pressBtn({circle=1}, 1)  -- OK
	fadv(4)
	pressBtn({l1=1}, 2)  -- mustadio
	pressBtn({x=1}, 1)  -- cancel ezuip
	fadv(30)
	-- job change Mustadio
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- change job
	fadv(46)
	pressBtn({right=1}, 15-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47-2)
	TAS.exitFormation()
end

function TAS.buyGreenBeret()
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(55)
	pressBtn({circle=1}, 1)  -- buy
	fadv(15)
	pressBtn({right=1}, 6)
	pressBtn({circle=1}, 2)  -- Green Beret
	pressBtn({circle=1}, 2)  -- How many
	pressBtn({circle=1}, 1)  -- yes
	fadv(4)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({x=1}, 1)  -- exit buy
	fadv(1)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(3)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.jobChangePriest_equipGreenBeret()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- change job
	fadv(46)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)  -- priest
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({circle=1}, 1)  -- equip
	fadv(2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	fadv(3)
	pressBtn({circle=1}, 1)  -- head
	fadv(10)
	pressBtn({circle=1}, 1)  -- Green Beret
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel item
	fadv(30-2)
	TAS.exitFormation()
end

function TAS.buyWizardStuff_MagicGauntret()
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(53+2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)  -- fitting room
	pressBtn({circle=1}, 1)  -- select fitting room
	fadv(7+3)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19+1)
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({circle=1}, 1)  -- select right hand
	fadv(10)
	pressBtn({circle=1}, 1)  -- Wizard Stuff
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select accessary
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({up=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 1)  -- Magic Gauntret
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- yes
	fadv(4)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(4+1)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.jobChangeWizard()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- select job change
	fadv(46)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)
	pressBtn({right=1}, 15-2)  -- wizard
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47)
	pressBtn({x=1}, 1)  -- cancel
	fadv(4)
	TAS.exitFormation()
end

function TAS.buyWizardRod_SprintShoes()
	pressBtn({x=1}, 1)  -- exit city
	fadv(5)
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(53+2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)  -- fitting room
	pressBtn({circle=1}, 1)  -- select fitting room
	fadv(7+3)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19+1)
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({circle=1}, 1)  -- select right hand
	fadv(10)
	pressBtn({circle=1}, 1)  -- Wizard Rod
	fadv(1)
	pressBtn({up=1}, 2)
	fadv(3)
	pressBtn({circle=1}, 1)  -- select accessary
	fadv(10)
	pressBtn({circle=1}, 1)  -- Sprint Shoes
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- yes
	fadv(4)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(4+1)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.equipMagicGauntlet_setCounterMagic()
	-- item
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({circle=1}, 1)  -- equip
	fadv(1+1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- accesarry
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Magic Gauntlet
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel item
	fadv(30)
	-- ability
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27+1)
	pressBtn({circle=1}, 1)   -- set
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- counter ability
	fadv(9)
	pressBtn({circle=1}, 1)  -- Counter Magic
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel set
	fadv(1)
	pressBtn({x=1}, 1)  -- cancel ability
	fadv(30-2)
	TAS.exitFormation()
end

function TAS.jobChangeSquire_setTimeMagic()
	-- job change
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- job change
	fadv(46)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47)
	-- ability
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27+1)
	pressBtn({circle=1}, 1)   -- set
	fadv(4)
	pressBtn({circle=1}, 1)  -- select slot
	fadv(9)
	pressBtn({right=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 1)  -- Time Magic
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel set
	fadv(1)
	pressBtn({x=1}, 1)  -- cancel ability
	fadv(30)
	-- item
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- best equip
	fadv(3+1)
	pressBtn({circle=1}, 1)  -- OK
	fadv(4)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(30-2)
	TAS.exitFormation()
end

function TAS.ch4_Sluice_turn1()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(6)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- time magic
	pressBtn({circle=1}, 9)   -- Quick
	pressBtn({circle=1}, 3)   -- confirm target
	pressBtn({circle=1}, 4)   -- show menu
	pressBtn({circle=1}, 1)   -- select unit
	fadv(22)  -- prepare casting spell

	-- arrowed
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
end

function TAS.ch4_Sluice_turn2()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	--fadv(xx)  -- wait for moving
end

function TAS.ch4_join_member()
	-- before 1f from getting to center
	pressBtn({circle=1}, 4)
	pressBtn({circle=1}, 1)
	fadv(250)
end

function TAS.duplicateExcalibur_buyItems()
	-- Item duplication glich
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(53+2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)  -- fitting room
	pressBtn({circle=1}, 1)  -- select fitting room
	fadv(7+3)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19+1)
	pressBtn({r1=1}, 2)  -- select orlandu
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select left hand
	fadv(10)
	pressBtn({circle=1}, 1)  -- sword
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- select best fit
	fadv(6)
	pressBtn({circle=1}, 1)  -- select OK
	fadv(5)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4+1)

	-- Buy Aegis Shield(MA+1), Flash hat(MA+1, Speed+1) for Ramza
	pressBtn({circle=1}, 1)  -- select fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19+1)
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select left hand
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({down=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 1)  -- Aegis Shield
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select head
	fadv(10)
	pressBtn({circle=1}, 1)  -- Flash Hat
	fadv(5)
	pressBtn({x=1}, 4)

	-- Buy Twist Headband(PA+2), Power Sleeve(PA+2) for Orlandu
	pressBtn({r1=1}, 2)  -- select orlandu
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select head
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({up=1}, 2)
	fadv(4)
	pressBtn({circle=1}, 1)  -- Twist Headband
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select body
	fadv(10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(4+1)
	pressBtn({circle=1}, 1)  -- Power Sleeve
	pressBtn({x=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- yes
	fadv(4)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(4+1)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.equipExcalibur_setMath()
	-- item
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({circle=1}, 1)  -- equip
	fadv(4)
	pressBtn({circle=1}, 1)  -- right hand
	fadv(10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Excalibur
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- accesarry
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Magic Gauntlet
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- body
	fadv(10)
	pressBtn({square=1, down=1}, 3)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Wizard Robe
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel item
	fadv(30)
	-- ability
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27+1)
	pressBtn({circle=1}, 1)   -- set
	fadv(4)
	pressBtn({circle=1}, 1)  -- counter ability
	fadv(9)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({right=1}, 4)  -- math
	fadv(2)
	pressBtn({circle=1}, 1)   -- select math
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel set
	fadv(1)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)   -- remove
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- move ability
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel remove
	fadv(1)
	pressBtn({x=1}, 1)  -- cancel ability
	fadv(30-2)
	TAS.exitFormation()
end


function TAS.ch4_Germinas_deploy()
	-- -before 3f from reverse triangle
	pressBtn({r1=1, left=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({start=1}, 3)
	--pressBtn({start=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch4_Limberry_outside_deploy()
	-- -before 3f from reverse triangle
	pressBtn({up=1, circle=1}, 1)
	pressBtn({r1=1, left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({down=1, circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch4_Limberry_outside_turn1()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(8)
	pressBtn({l2=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Sword skill
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Lightning Stab
	pressBtn({left=1}, 3)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(16)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)
end

function TAS.learnMove1_Orlandu()
	-- learn Move+1
	pressBtn({r1=1}, 1)  -- select Orlandu
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({circle=1}, 10+1)  -- sword master
	pressBtn({left=1}, 4)
	pressBtn({circle=1}, 4)   -- Move+1
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 3)
	-- set Move+1
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 2)  -- set
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- Move+1
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({x=1}, 1)
	fadv(30-2)
end

-- also, ch4_Murond_inside, ch4_Murond_zalbag
function TAS.ch4_Limberry_inside_deploy()
	-- -before 3f from reverse triangle
	pressBtn({up=1, circle=1}, 1)
	pressBtn({r1=1, left=1}, 1)
	pressBtn({down=1}, 1)
	pressBtn({left=1, circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch4_Limberry_zarela_deploy()
	-- -before 3f from reverse triangle
	pressBtn({circle=1}, 1)  --??
	pressBtn({r1=1, up=1}, 1)
	pressBtn({circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end


function TAS.buyThiefHat_RefrectRing()
	-- Fit Thief Hat for Orlandu
	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(53+2)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)  -- fitting room
	pressBtn({circle=1}, 1)  -- select fitting room
	fadv(7+3)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(4)
	pressBtn({circle=1}, 1)  -- select ramza
	fadv(19+1)
	pressBtn({r1=1}, 2)  -- select orlandu
	pressBtn({circle=1}, 1)  -- select fit
	fadv(3)
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- select head
	fadv(10)
	pressBtn({circle=1}, 1)  -- Thief Hat
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- exit fitting room
	fadv(4)
	pressBtn({circle=1}, 1)  -- yes

	-- Buy Thief Hat, Reflect Ring
	fadv(4)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- buy
	fadv(11)
	pressBtn({right=1}, 6)
	pressBtn({circle=1}, 2)  -- Thief Hat
	pressBtn({circle=1}, 2)  -- How many
	pressBtn({circle=1}, 1)  -- yes
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel message
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 6)
	pressBtn({square=1, down=1}, 4)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)  -- Thief Hat
	pressBtn({circle=1}, 2)  -- How many
	pressBtn({circle=1}, 1)  -- yes
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(6)
	pressBtn({x=1}, 1)  -- exit buy
	fadv(1)
	pressBtn({x=1}, 1)  -- exit shop
	fadv(3)
	pressBtn({x=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)
	pressBtn({triangle=1}, 5)  -- show menu
end

function TAS.ch4_Murond_outside_turn1()
	-- after 2f, showing status from left side.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Sword skill
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Lightning Stab
	pressBtn({up=1}, 2)
	pressBtn({right=1}, 1)
	pressBtn({up=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(7)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
	
	-- arrowed
	fadv(6)
	Battle.fullWait()
end

function TAS.equipTwistHeadband_Orlandu()
	pressBtn({r1=1}, 1)  -- select Orlandu
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({circle=1}, 1)  -- equip
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- head
	fadv(10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Twist Headband
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel item
	fadv(30-2)
	TAS.exitFormation()
end

function TAS.ch4_Murond_inside_turn1()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(5)
	pressBtn({l2=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Sword skill
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Lightning Stab
	pressBtn({up=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(16)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
end

function TAS.ch4_Kletian_turn1()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)
	-- if L2, 5f delay
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Sword skill
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Lightning Stab
	pressBtn({right=1}, 3)
	pressBtn({right=1}, 2)
	pressBtn({right=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(3)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
end

function TAS.ch4_Balk_deploy()
	-- also last battle.
	-- before 3f from reverse triangle
	pressBtn({up=1, circle=1}, 1)
	pressBtn({r1=1, left=1}, 1)
	pressBtn({down=1, circle=1}, 1)
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.ch4_Balk_turn1()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({right=1}, 1)
	pressBtn({down=1}, 1)
	pressBtn({right=1}, 2)
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(6)
	pressBtn({l2=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(3)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)  -- Sword skill
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Lightning Stab
	pressBtn({right=1}, 3)
	pressBtn({right=1}, 2)
	pressBtn({right=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 1)  -- confirm target
	fadv(23)  -- before 5f shown "Menu", wait until 0x164908 = 0x001B
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)  -- wait for effect
end

function TAS.equipThiefHat_SprintShoes_Ramza()
	-- Ramza, equip Thief Hat, Sprint Shoes, White Robe
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 1)  -- item
	fadv(27+1)
	pressBtn({circle=1}, 1)  -- equip
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- accessory
	fadv(10)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Sprint Shoes
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- body
	fadv(10)
	pressBtn({square=1, down=1}, 4)
	pressBtn({up=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- White Robe
	fadv(1)
	pressBtn({up=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- head
	fadv(10)
	pressBtn({circle=1}, 1)  -- Thief Hat
	fadv(5)
	-- Orlandu, equip Thief Hat, Reflect Ring
	pressBtn({r1=1}, 1)  -- select Orlandu
	fadv(5)
	pressBtn({circle=1}, 1)  -- head
	fadv(10)
	pressBtn({circle=1}, 1)  -- Thief Hat
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(1)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 1)  -- accessory
	fadv(10)
	pressBtn({square=1, up=1}, 4+1)
	pressBtn({up=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 1)  -- Reflect Ring
	fadv(5)
	pressBtn({x=1}, 1)  -- cancel equip
	fadv(2)
	pressBtn({x=1}, 1)  -- cancel item
	fadv(30-2)
	TAS.exitFormation()
end

function TAS.learnShortCharge_Ramza()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- time mage
	fadv(5)
	pressBtn({circle=1}, 1)  -- time mage
	fadv(2)
	pressBtn({square=1, down=1}, 9)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Demi
	fadv(5)
	pressBtn({circle=1}, 4)   -- select Demi
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select Short Charge
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)  -- Oracle
	fadv(5)
	pressBtn({circle=1}, 1)  -- Oracle
	fadv(1)
	pressBtn({right=1}, 2)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 4)   -- select mp walk
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({x=1}, 4)
    -- set ability
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 4+1)  -- set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 2)
	pressBtn({right=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 2)   -- Time Magic
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 1)
	fadv(5)
	pressBtn({circle=1}, 2)   -- Short Charge
	pressBtn({down=1}, 1)
	fadv(4)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- mp walk
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({x=1}, 1)
	fadv(30-2)
end

function TAS.ch4_altima_turn1()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- time magic
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 9)   -- Demi2
	pressBtn({left=1}, 3)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(19)  -- prepare casting spell
	-- arrowed
	fadv(6+1)
	Battle.fullWait()
end

function TAS.ch4_altima_turn3()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(5+1)
	pressBtn({l2=1}, 1)
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(3)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- time magic
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)   -- Demi
	pressBtn({left=1}, 3)
	pressBtn({left=1}, 1)
	fadv(1)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(21)  -- prepare casting spell
	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end


function TAS.skip_intermediate_save()
	-- -before 2f from shown "check"
	pressBtn({x=1}, 1)
	fadv(100)
end



function TAS.battle_deploy()
	-- -before 3f from shown reverse triangle
	pressBtn({start=1}, 3)
	pressBtn({circle=1}, 1)
	fadv(100)
end

function TAS.skip_term_of_win()
	-- -before 7f from shown term of win
	pressBtn({circle=1}, 1)
	-- fadv(66-3)
	-- fadv(8-3)
	-- -before 3f from READY
	pressBtn({circle=1}, 1)
	fadv(100)
end


function TAS.zoomout()
	pressBtn({x=1}, 5)  -- cancel menu
	pressBtn({l2=1}, 1)  -- zoom out
	pressBtn({circle=1}, 1)
	fadv(23)
	-- available to input menu again, then losts 30f
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8+1)  -- action

end

------------------------------------------------------------
-- Math skill menu order
--     + CT
--     + Level
--     + Height
--
--     + Prime
--     + 5
--     + 4
--     + 3
--
--     + Holy
--     + Bol3
--     + Death
--     + Flare
--     + Demi2
------------------------------------------------------------

function TAS.math_CT5_Flare()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- math
	pressBtn({circle=1}, 8)   -- CT
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)   -- 5
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 4)   -- Flare
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_Level4_Flare()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)   -- Level
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)   -- 4
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 4)   -- Flare
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_Level3_Holy()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)   -- Level
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)   -- 3
	pressBtn({circle=1}, 4)   -- Holy
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_CT3_Bolt3()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({circle=1}, 8)   -- CT
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)   -- 3
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)   -- Bolt3
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_Height_Prime_Demi2()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)   -- Height
	pressBtn({circle=1}, 8)   -- Prime
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 4)   -- Demi2
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_CT3_Flare()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({circle=1}, 8)   -- CT
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)   -- 3
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 4)   -- Flare
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_CT3_Death()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({circle=1}, 8)   -- CT
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)   -- 3
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)   -- Death
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.skip_battle_congratulations()
	-- before 3f shown "Congratulations"
	-- when 0x1D6500 = 0x00BB
	pressBtn({circle=1}, 4)   -- show "This operation is completed"
	pressBtn({circle=1}, 1)   -- skip congratulations
	fadv(25)
	-- when 0x1D6500 = 0x008E
	pressBtn({circle=1}, 4)   -- skip counting
	pressBtn({circle=1}, 1)   -- skip bonus money
	fadv(17)
	-- when 0x1D6500 = 0x00A7
	fadv(6)
	pressBtn({circle=1}, 6)   -- show "War Trophies"
	pressBtn({circle=1}, 6)   -- item1
	pressBtn({circle=1}, 6)   -- item2
	pressBtn({circle=1}, 6)   -- item3
end



macro_table = {
	{key = "G", func = TAS.enterFormation},
	{key = "B", func = TAS.moveMandaliaFromGariland},
	{key = "V", func = TAS.ch1_random_battle_Yell_ramza},
	{key = "C", func = TAS.ch1_random_battle_SpeedBreak},
	{key = "X", func = TAS.ch1_random_battle_attack_ramza},
	{key = "Z", func = TAS.ch1_random_battle_Accumulate_ramza},
	{key = "T", func = nil},
	{key = "Y", func = nil},
	{key = "U", func = nil},
	{key = "I", func = nil},
	{key = "O", func = nil},
	{key = "P", func = nil},
	{key = "leftbracket", func = nil},

	{key = "left" , func = nil},
	{key = "right", func = nil},
	{key = "up"   , func = nil},
	{key = "down" , func = nil},
	{key = "home" , func = nil},
	{key = "end"  , func = nil},

	{key = "1", func = nil},
	{key = "2", func = nil},
	{key = "3", func = nil},
	{key = "4", func = nil},
	{key = "5", func = nil},
	{key = "6", func = nil},
	{key = "7", func = nil},
	{key = "8", func = nil},
	{key = "9", func = nil},
	{key = "0", func = nil},
}

function doInputMacro()
	local kbd = input.get()

	for k, v in pairs(macro_table) do
		if kbd[v.key] then
			if macro_key == 0 then
				v.func()
				emu.pause()
			end
			macro_key = macro_key + 1
		else
			macro_key = 0
		end
	end
end


