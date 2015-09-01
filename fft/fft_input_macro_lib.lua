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

	fadv(705)               -- title
	fc = emu.framecount()

	print(string.format("skip title: fc = %d", fc))
	pressBtn({start=1}, 1)  -- skip title, 706f

	fadv(36)
	fc = emu.framecount()

	print(string.format("game start: fc = %d", fc))
	pressBtn({start=1}, 1)  -- game start, 743f

	fadv(192)
end

function TAS.skipArazlam()
	--fc = emu.framecount()
	--print(string.format("skipArazlam: fc = %d", fc))

	pressBtn({start=1}, 1)  -- skip message, 935f is fastest.
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

	-- gafgalion, 7120f
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

	-- gafgalion, 7284f
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
	-- gafgalion, 8239f
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
	
	-- gafgalion, 8559f
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
	pressBtn({down=1}, 4)
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
	pressBtn({right=1}, 4)
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
	pressBtn({circle=1}, 10)  -- execute attack, 14896f
	fadv(106)
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
	pressBtn({circle=1}, 10)  -- execute attack, 18709f
	fadv(94)
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

	-- dilita, 19835f
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

	-- dilita, 19965f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- aglias, 20468f
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)
	pressBtn({circle=1}, 2)

	-- dilita, 20537f
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
	-- squire, 26643f

end

--macro_table = {
--	{key = "G", func = TAS.enterField},
--	{key = "B", func = TAS.reapVegee6},
--	{key = "V", func = TAS.reapVegee},
--	{key = "C", func = TAS.reapPlantVegee5},
--	{key = "X", func = TAS.plantVegee},
--	{key = "Z", func = TAS.exitField},
--	{key = "T", func = TAS.exitDayNoBaboo},
--	{key = "Y", func = TAS.exitDayBaboo},
--	{key = "U", func = TAS.enterTrapField},
--	{key = "I", func = TAS.exitTrapField},
--	{key = "O", func = TAS.enterPedro},
--	{key = "P", func = TAS.exitPedro},
--	{key = "leftbracket", func = TAS.skipMsg},
--
--	{key = "left", func = TAS.leftField},
--	{key = "right", func = TAS.rightField},
--	{key = "up", func = TAS.plantVegee5},
--	{key = "down", func = nil},
--	{key = "home", func = TAS.enterBinocular},
--	{key = "end", func = TAS.exitBinocular},
--
--	{key = "1", func = TAS.enterHouse},
--	{key = "2", func = TAS.exitHouse},
--	{key = "3", func = TAS.enterHybridMachineRoom},
--	{key = "4", func = TAS.exitHybridMachineRoom},
--	{key = "5", func = TAS.enterBusStop},
--	{key = "6", func = TAS.gotoTown},
--	{key = "7", func = TAS.leaveTown},
--	{key = "8", func = TAS.returnHome},
--	{key = "9", func = TAS.enterLabo},
--	{key = "0", func = nil},
--}
--
--function doInputMacro()
--	local kbd = input.get()
--
--	for k, v in pairs(macro_table) do
--		if kbd[v.key] then
--			if macro_key == 0 then
--				v.func()
--				emu.pause()
--			end
--			macro_key = macro_key + 1
--		else
--			macro_key = 0
--		end
--	end
--end


