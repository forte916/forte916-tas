-- Astronoka
-- This is a key inputs for speed run
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Start this script whenever you want to input key macros.

require "astronoka_input_macro_lib"

------------------------------------------------------------
-- initialize
------------------------------------------------------------
-- If set to true, no rerecords done by Lua are counted in the rerecord total.
-- If set to false, rerecords done by Lua count. By default, rerecords count.
movie.rerecordcounting(false)

-- maximum is fastest, if you need not render
--emu.speedmode("maximum")     -- screen rendering is disabled
--emu.speedmode("turbo")       -- drops some frames
--emu.speedmode("nothrottle")  -- max spped without frameskip
emu.speedmode("normal")      -- normal speed (test use)


------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
macro_key = 0

while true do

	if initial == 1 then
		initial = 0
	end

	if initial == 0 then
		-- This input macro starts at next frame which you press the button at,
		-- not starts at current frame.
		doInputMacro()
		Baboo.drawInfo()
	end

	emu.frameadvance()
end

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

