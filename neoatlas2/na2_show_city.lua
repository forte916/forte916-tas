-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- This script shows city info.
--
-- Usage
--   1. Start this script
--
require "na2_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------


------------------------------------------------------------
-- main
------------------------------------------------------------

initial = 1

while true do
	if initial == 1 then
		City.showAll()
		initial = 0
	end

	City.drawAll(city_offset + (0x40 * 0))
	--City.drawAll(city_offset + (0x40 * 170))
	emu.frameadvance()
end

print(string.format("<<< lua bot is finished <<<"))
emu.pause()


