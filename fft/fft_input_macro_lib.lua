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

	-- 1290f
	fadv(3)
	pressBtn({circle=1}, 11)  -- delete 1st letter

	fadv(3)
	pressBtn({circle=1}, 11)  -- delete 2nd letter

	fadv(3)
	pressBtn({start=1}, 11)  -- determin

	fadv(1)
	pressBtn({circle=1}, 11)  -- confirm
	fadv(4)
end

function TAS.inputBirthday()
	fc = emu.framecount()
	print(string.format("inputBirthday: fc = %d", fc))

	-- 1348f
	fadv(5)
	pressBtn({start=1}, 1)  -- determin
	pressBtn({circle=1}, 1)  -- confirm
	fadv(34)
end

function TAS.skipOpeningMovie()
	fc = emu.framecount()
	print(string.format("skipOpeningMovie: fc = %d", fc))

	-- 1389f
	fadv(11)
	pressBtn({start=1}, 1)  -- skip opening movie
	fadv(324)
end

function TAS.skipObonne()
	fc = emu.framecount()
	print(string.format("skipObonne: fc = %d", fc))

	-- 1725f
	fadv(1430)
	-- aglias, 3155f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	-- aglias, 3163f
	fadv(94)

	-- ovelia, 3257f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	--fadv(xx)
	
	-- aglias, 3414f
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

	-- aglias, 3888f
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

	-- aglias, 4190f
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

	-- aglias, 4312f
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

function TAS.skipObonneEntrance()
	-- aglias, 6762f
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

	-- aglias, 7232f
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

function TAS.Ch1_1_skipOpening()
	-- gafgarion, 8239f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- aglias, 8430f
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

function TAS.Ch1_1_ramza1()
	-- ramza arrowed, 9580f
	fadv(9)
	pressBtn({x=1}, 6)
	pressBtn({triangle=1}, 6)
	fadv(3)
	pressBtn({up=1}, 4)
	pressBtn({circle=1}, 2)
	fadv(54)

	-- change option2
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({up=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option4
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option5
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({up=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option6
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option7
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option8
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option9
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option11
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	-- change option12
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 4)

	pressBtn({x=1}, 6)
	pressBtn({x=1}, 6)
	fadv(1)

	-- move
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 10)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 6)
	--fadv(xx)

	-- ramza arrowed, 10012f
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({down=1}, 4)
	-- ramza standby, 10043f
	pressBtn({circle=1}, 9)
	-- wait here for luck manipulation
	fadv(2)
	pressBtn({circle=1}, 2)
	--fadv(xx)

end

function TAS.Ch1_1_ramza2()
	-- ramza arrowed, 14694f
	--fadv(xx)

	-- ramza move, 14756f
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({right=1}, 4)
	pressBtn({right=1}, 2)
	pressBtn({circle=1}, 6)
	--fadv(xx)
	
	-- ramza arrowed, 14838f
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action, 14865f
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({up=1}, 4)
	-- wait here for luck manipulation
	pressBtn({circle=1}, 2)  -- select target, 14888f
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack, 14896f
	fadv(115)
	pressBtn({circle=1}, 10)
	
end

function TAS.Ch1_1_ramza2()
	-- ramza arrowed, 18487f
	--fadv(xx)
	pressBtn({circle=1}, 18)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	--fadv(xx)

	-- ramza arrowed, 18651f
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({right=1}, 4)
	-- wait here for luck manipulation
	pressBtn({circle=1}, 2)  -- select target, 18701f
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack, 18709f
	fadv(103)
	-- ramza arrowed, 18825f
	fadv(2)
	pressBtn({circle=1}, 10)
end

function TAS.Ch1_1_skipEnding()
	-- ovelia, 19403f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- aglias, 19512f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- Delita, 19835f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- ovelia, 19869f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- Delita, 19965f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- aglias, 20468f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- Delita, 20537f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- aglias, 20910f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- ramza, 21151f
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
	fadv(1)
	pressBtn({circle=1}, 2)  -- 21173f
	pressBtn({circle=1}, 2)
	-- if wait here, change our party status.
	pressBtn({circle=1}, 2)
end

function TAS.skipAcademy()
	fadv(5466)
	-- squire1, 26650f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- squire2, 26706f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- ramza, 26856f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- Delita, 26894f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- ramza, 26918f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- Delita, 26972f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- ramza, 26702f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- Delita, 27022f
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

	-- ramza, 27050f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- Delita, 27116f
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
	-- Delita, 27140f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- ramza, 27168f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- knight, 27228f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 2)

	-- knight, 27755f
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
	pressBtn({circle=1}, 2)
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
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
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- knight, 28330f
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
	fadv(1)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
end


function TAS.enterFormation()
	pressBtn({triangle=1}, 5)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(49)
end

function TAS.selectRight()
	pressBtn({right=1}, 5)  -- select member
end

function TAS.dismiss()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 3)
	-- 43947f
	pressBtn({circle=1}, 1)
	fadv(54)
	-- 44002f
end

function TAS.dismissRepeat()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({circle=1}, 6)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 2)
	fadv(53)
end

function TAS.cancelMenu()
	pressBtn({x=1}, 5)
end

function TAS.jobChangeDelita()
	pressBtn({up=1}, 2)
	-- 44279
	pressBtn({circle=1}, 2)
	fadv(44)
	-- 44325f
	pressBtn({right=1}, 15-2)
	pressBtn({circle=1}, 5)
	-- 44344f
	pressBtn({circle=1}, 2)
	fadv(56-2)
	-- 44402f
end

function TAS.jobChangeWizard()
	pressBtn({l1=1}, 5)
	fadv(37)
	pressBtn({left=1}, 15-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 2)
	fadv(59-2)
end

function TAS.cancelJobChange()
	-- 44517f
	pressBtn({x=1}, 2)
	fadv(45)
	-- 44564f
end

function TAS.learnWizard()
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(27)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 10)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- wizard
	fadv(2)
	pressBtn({circle=1}, 10)
	pressBtn({square=1, down=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 4)
	pressBtn({square=1, down=1}, 4)
	pressBtn({circle=1}, 2)
	fadv(11+1)
	pressBtn({square=1, up=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select bolt
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({right=1}, 6)
	pressBtn({right=1}, 6)
	pressBtn({circle=1}, 8)   -- select magic attack up
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4)
end

function TAS.setWizard()
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({down=1}, 3)
	pressBtn({down=1}, 3)
	fadv(2)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 2)   -- select magic attack up
	fadv(3)
	pressBtn({x=1}, 4)
	fadv(1)
end

function TAS.learnRamzaYell()
	pressBtn({l1=1}, 2)
	pressBtn({up=1}, 3)
	pressBtn({circle=1}, 10)  -- select squire
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- Yell
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4)
	-- 44877f
	pressBtn({x=1}, 2)
	fadv(29-2)
	-- 44907f

end

function TAS.exitFormation()
	-- 44905f
	pressBtn({x=1}, 1)
	fadv(43)
	-- 44949f
end

function TAS.moveMandaliaFromFormationForEvent()
	pressBtn({up=1}, 2)
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

function TAS.ch1_3_mandalia_deploy()
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

function TAS.ch1_3_turn1_wizard()
end

function TAS.ch1_3_turn1_ramza()
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4+1)
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)

	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({circle=1}, 11)  -- Yell
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	-- 57138f
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(185)
	-- 57424f, arrowed
	-- arrowed
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
end

function TAS.ch1_3_turn1_ramza()
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({circle=1}, 11)  -- Yell
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)
	-- arrowed
	fadv(9)
	pressBtn({circle=1}, 18)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 2)
end

function TAS.ch1_3_turnN_ramza_Yell()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({circle=1}, 11)  -- Yell
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(284)  -- Yell animation
	-- arrowed and shown AT
	fadv(6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
end

function TAS.jobChangeRamza()
	pressBtn({triangle=1}, 2)  -- show menu
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)
	fadv(46)
	pressBtn({left=1}, 15-2)
	pressBtn({left=1}, 15-2)
	pressBtn({circle=1}, 5)
	pressBtn({circle=1}, 1)
	fadv(58-2)
	pressBtn({x=1}, 1)  -- cancel job change
	fadv(47-2)
end

function TAS.learnRamzaAccumulate()
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- ability
	fadv(27)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({circle=1}, 10)  -- select squire
	pressBtn({circle=1}, 8)   -- select accumulate
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({right=1}, 6)
	pressBtn({right=1}, 6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select gained jp up
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 4)
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 5)   -- select set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 4)   -- select guts
	pressBtn({down=1}, 2)
	pressBtn({down=1}, 2)
	fadv(2)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 1)   -- select gained jp jp
	fadv(5)
	pressBtn({x=1}, 2)
	pressBtn({x=1}, 1)
	fadv(30-2)
	TAS.exitFormation()
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
	pressBtn({circle=1}, 10)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 11)  -- Yell
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(284)  -- Yell animation
	-- arrowed and shown AT
	fadv(6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
end

function TAS.ch1_random_battle_left_move_ramza()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)

	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({circle=1}, 4)   -- Accumulate
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(64+4)  -- Accumulate animation

	-- arrowed
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
end

function TAS.ch1_random_battle_left_move_bolt3_ramza()
	-- arrowed and shown AT
	fadv(7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)

	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 10)  -- magic
	pressBtn({circle=1}, 8)   -- Bolt3
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 2)   -- select target
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(19)  -- spell cast

	-- arrowed
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
end

function TAS.ch1_random_battle_Accumulate_ramza()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 10)  -- guts
	pressBtn({circle=1}, 4)   -- Accumulate
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(63+1)  -- Accumulate animation
	-- arrowed and shown AT
	fadv(6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
	fadv(8)

	-- about 110f at goblin turn.
end

function TAS.ch1_random_battle_attack_ramza()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 10)  -- action
	pressBtn({circle=1}, 9)  -- attack
	pressBtn({left=1}, 2)    -- move cursol
	pressBtn({circle=1}, 2)  -- select target
	pressBtn({circle=1}, 6)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(100)
end

function TAS.jobChangeWizardRamza_learnMagic()
	-- change wizard
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
    -- learn ability
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 1)  -- select ability
	fadv(27)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 10)  -- select learn
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- priest
	fadv(2)
	pressBtn({circle=1}, 10)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- holy
	fadv(2)
	pressBtn({circle=1}, 8)   -- select holy
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- time mage
	fadv(2)
	pressBtn({circle=1}, 10)
	pressBtn({right=1}, 6)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select switch mp
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({left=1}, 6)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- reflect
	fadv(2)
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
	pressBtn({down=1}, 4)  -- time mage
	fadv(2)
	pressBtn({circle=1}, 10)
	pressBtn({square=1, down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- quick
	fadv(2)
	pressBtn({circle=1}, 8)   -- select quick
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- demi2
	fadv(2)
	pressBtn({circle=1}, 8)   -- select demi2
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({left=1}, 6)
	pressBtn({circle=1}, 8)   -- select teleport
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)  -- calculator
	fadv(2)
	pressBtn({circle=1}, 10)
	pressBtn({right=1}, 6)
	pressBtn({circle=1}, 8)   -- select CT
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select Level
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select Hight
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select prime number
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select 5
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select 4
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 8)   -- select 3
	pressBtn({circle=1}, 10)  -- select yes
	pressBtn({x=1}, 10+1)
	pressBtn({x=1}, 4)
    -- set ability
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)   -- select set
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 4)
	pressBtn({right=1}, 4)  -- math
	fadv(2)
	pressBtn({circle=1}, 2)   -- select math
	pressBtn({down=1}, 4)
	fadv(1)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 2)   -- select mp switch
	pressBtn({down=1}, 4)
	fadv(1)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({down=1}, 4)
	fadv(2)
	pressBtn({circle=1}, 2)   -- select magic attack up
	pressBtn({down=1}, 4)
	fadv(1)
	pressBtn({circle=1}, 10)  -- select slot
	pressBtn({circle=1}, 2)   -- select teleport
	fadv(3)
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
	pressBtn({down=1}, 2)
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
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 1)  -- best equip
	fadv(4)
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
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)

	-- arrowed
	fadv(6)
	pressBtn({circle=1}, 8+1)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- time magic
	pressBtn({circle=1}, 9)   -- Quick
	pressBtn({circle=1}, 3)   -- confirm target
	pressBtn({circle=1}, 4)   -- show menu
	pressBtn({circle=1}, 1)   -- select unit
	fadv(22)

	-- arrowed
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 1)
end

function TAS.ch4_Sluice_turn2()
	-- arrowed and shown AT
	fadv(6+1)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 4)
	pressBtn({left=1}, 2)
	pressBtn({circle=1}, 1)
	--fadv(xx)
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
	--fadv(xx)

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
	pressBtn({circle=1}, 16+1)  -- confirm target
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
	pressBtn({left=1}, 6)
	pressBtn({circle=1}, 8)   -- Move+1
	pressBtn({circle=1}, 6)  -- select yes
	pressBtn({x=1}, 10)
	pressBtn({x=1}, 3)
	-- set Move+1
	pressBtn({down=1}, 1)
	pressBtn({circle=1}, 2)  -- set
	pressBtn({up=1}, 3)
	fadv(2)
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
	pressBtn({circle=1}, 8)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)
	
	-- arrowed
	fadv(6)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
	
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
	fadv(8)
	pressBtn({l2=1}, 1)
	--fadv(xx)

	-- arrowed
	fadv(1)
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
	pressBtn({circle=1}, 16+1)  -- confirm target, before 5f shown "Menu"
	pressBtn({circle=1}, 1)  -- execute attack
	--fadv(xx)
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


function TAS.math_CT5_Flare()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 8)  -- math
	pressBtn({circle=1}, 8)   -- CT
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)   -- 5
	pressBtn({up=1}, 4)
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 4)   -- Flare
	pressBtn({circle=1}, 6)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	--fadv(xx)
end

function TAS.math_Level4_Flare()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)  -- action
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

function TAS.math_CT3_Bolt3()
	-- arrowed and shown AT
	fadv(6+1)
	-- before 2f from showing up status window in the left.
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 8)  -- action
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
	pressBtn({circle=1}, 8)  -- action
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
	pressBtn({circle=1}, 8)  -- action
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
	pressBtn({circle=1}, 8)  -- action
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
	pressBtn({circle=1}, 4)   -- show "This operation is completed"
	pressBtn({circle=1}, 1)   -- skip congratulations
	fadv(21)
	pressBtn({circle=1}, 4)   -- show "bonus money"
	pressBtn({circle=1}, 4)   -- skip counting
	pressBtn({circle=1}, 1)   -- skip bonus money
	fadv(23)
	pressBtn({circle=1}, 6)   -- show "War Trophies"
	pressBtn({circle=1}, 6)   -- item1
	pressBtn({circle=1}, 6)   -- item2
end



macro_table = {
	{key = "G", func = TAS.ch1_3_turnN_ramza_Yell},
	{key = "B", func = TAS.moveMandaliaFromGariland},
	{key = "V", func = TAS.ch1_random_battle_Yell_ramza},
	{key = "C", func = TAS.ch1_random_battle_Accumulate_ramza},
	{key = "X", func = TAS.exitFormation},
	{key = "Z", func = TAS.enterFormation},
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


