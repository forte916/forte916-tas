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

	fadv(706)               -- title
	fc = emu.framecount()

	print(string.format("skip title: fc = %d", fc))
	pressBtn({start=1}, 1)  -- skip title, 706f

	fadv(35)
	fc = emu.framecount()

	print(string.format("game start: fc = %d", fc))
	pressBtn({start=1}, 1)  -- game start, 742f

	fadv(192)
end

function TAS.skipArazlam()
	fc = emu.framecount()
	print(string.format("skipArazlam: fc = %d", fc))

	pressBtn({start=1}, 1)  -- skip message, 935f is fastest.
	fadv(323)
	-- determined ramza's status, 1259f
	fadv(25)
end

function TAS.skipArazlamBest()
	fc = emu.framecount()
	print(string.format("skipArazlamBest: fc = %d", fc))

	fadv(14)  -- wait for best status of ramza. SquireJP=199, ChemistJP=199

	fc = emu.framecount()
	print(string.format("skip message: fc = %d", fc))

	pressBtn({start=1}, 1)  -- skip message, 949 is best status.

	fadv(323)
	-- determined ramza's status, 1273f
	fadv(25)
end

function TAS.inputName()
	fc = emu.framecount()
	print(string.format("inputName: fc = %d", fc))

	-- 1298f
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

	-- 1356f
	fadv(5)
	pressBtn({start=1}, 1)  -- determin
	pressBtn({circle=1}, 1)  -- confirm
	fadv(34)
end

function TAS.skipOpeningMovie()
	fc = emu.framecount()
	print(string.format("skipOpeningMovie: fc = %d", fc))

	-- 1397f
	fadv(11)
	pressBtn({start=1}, 1)  -- skip opening movie
	fadv(324)
end

function TAS.skipObonne()
	fc = emu.framecount()
	print(string.format("skipObonne: fc = %d", fc))

	-- 1733f
	fadv(100)
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


