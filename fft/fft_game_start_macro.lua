-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulator: psxjin v2.0.2
--
-- This is a key inputs for speed run.
--
-- Usage
--   1. Start this script from power-on
--

require "fft_input_macro_lib"

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
-- functions
------------------------------------------------------------
function game_start()
	TAS.start()
	TAS.skipArazlamBest()
	TAS.inputName()
	TAS.inputBirthday()
	TAS.skipOpeningMovie()
end

------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()

game_start()

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

