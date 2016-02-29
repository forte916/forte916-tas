-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script wirtes cheat code.
--
-- Usage
--   1. Start this script
--

require "psx_lib"
require "fft_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------


function cheatAlly2Party()
	local ofs_unit = adr_battle_unit3
	memory.writedword(ofs_unit + Bunit.entd_flag, 0x08)  -- 0x08 is controlable
	memory.writedword(ofs_unit + Bunit.gender,    0x90)  -- 0x90 is male, join after event
	--memory.writedword(ofs_unit + Bunit.gender,    0x50)  -- 0x90 is female, join after event
end

function learnAccumulateYell()
	local ofs_unit = adr_battle_unit17
	memory.writebyte(ofs_unit + Bunit.base_action_learned1, 0x8C)  -- 0x8C is Accumulate, Yell, Wish
	--memory.writebyte(ofs_unit + Bunit.base_r_s_m_learned3, 0x08)  -- 0x08 is Gained JP-UP
end

function learnAllBaseAction()
	local ofs_unit = adr_battle_unit17
	memory.writebyte(ofs_unit + Bunit.base_action_learned1, 0xFF)  -- 0xFF is all
end

------------------------------------------------------------
-- main
------------------------------------------------------------


--emu.registerbefore(learnAccumulateYell)
emu.registerbefore(learnAllBaseAction)
while true do
	emu.frameadvance()
end


print(string.format("<<< lua bot is finished <<<"))
emu.pause()
f:close()

