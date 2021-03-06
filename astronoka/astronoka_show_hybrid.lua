-- Astronoka
-- This script shows hybrid expectation.
--
-- Emulator: psxjin v2.0.2
--
-- + Usage
--   1. Start this script
--

require "astronoka_lib"

------------------------------------------------------------
-- main
------------------------------------------------------------

-- overwrite defined param >>>
-- <<<

initial = 1

while true do

	if initial == 1 then
		Seed.showAll()
		initial = 0
	end

	if initial == 0 then
		switchDrawHybrid()
		Hybrid.drawHybrid()
		Hybrid.drawRetryCount(0)
	end

	emu.frameadvance()
end

