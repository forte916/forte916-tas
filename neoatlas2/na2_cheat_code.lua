-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- This script can apply cheat codes.
--
-- Usage
--   1. Start this script
--

require "psx_lib"
require "na2_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------

function cheatMoney()
	local money = 0x05F5E0FF -- 0x05F5E0FF = 99990000 = 9999万
	memory.writeddword(Global.money.adr, money)
end

------------------------------------------------------------
-- main
------------------------------------------------------------

emu.registerbefore(cheatMoney)
fadv(1)

print(string.format("<<< lua bot is finished <<<"))
emu.pause()

