-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script can grind automatically.
--
-- Usage
--   1. Start this script properly.
--

require "psx_lib"
require "fft_lib"
require "fft_battle_lib"

------------------------------------------------------------
-- initialize
------------------------------------------------------------
-- If set to true, no rerecords done by Lua are counted in the rerecord total.
-- If set to false, rerecords done by Lua count. By default, rerecords count.
movie.rerecordcounting(false)

-- maximum is fastest, if you need not render
--emu.speedmode("maximum")     -- screen rendering is disabled
emu.speedmode("turbo")       -- drops some frames
--emu.speedmode("nothrottle")  -- max spped without frameskip
--emu.speedmode("normal")      -- normal speed (test use)


------------------------------------------------------------
-- Grind for Ramza
------------------------------------------------------------
Grind = {}


Grind.Ramza = {}
Grind.Ramza.adr_unit = adr_battle_unit17

function Grind.Ramza.checkTurn()
	return  Battle.checkTurn(Grind.Ramza.adr_unit)
end

function Grind.Ramza.accumulate()
	Battle.waitForTurn(Grind.Ramza.adr_unit)

	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({circle=1}, 4)   -- Accumulate
	pressBtn({circle=1}, 4)   -- confirm target
	pressBtn({circle=1}, 1)   -- execute attack
	fadv(1)

	Battle.waitForEffect(Grind.Ramza.adr_unit)

	Battle.fullWait()
end

function Grind.Ramza.yell()
	Battle.waitForTurn(Grind.Ramza.adr_unit)

	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	pressBtn({up=1}, 2)
	pressBtn({circle=1}, 6)  -- guts
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- Yell
	pressBtn({circle=1}, 3)  -- select target
	pressBtn({circle=1}, 4)  -- confirm target
	pressBtn({circle=1}, 1)  -- execute attack
	fadv(1)

	Battle.waitForEffect(Grind.Ramza.adr_unit)

	Battle.fullWait()
end

function Grind.Ramza.checkGoal()
	local total_JP_squire     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_squire    )
	local total_JP_chemist    = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_chemist   )
	local total_JP_priest     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_priest    )
	local total_JP_wizard     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_wizard    )
	local total_JP_time_mage  = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_time_mage )
	local total_JP_oracle     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_oracle    )
	local total_JP_calculator = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_calculator)

	--if total_JP_wizard > 1100 then
	--	return true
	--end
	--if total_JP_time_mage > 700 then
	--	return true
	--end
	--if total_JP_priest > 1100 then
	--	return true
	--end
	--if total_JP_oracle > 700 then
	--	return true
	--end
	if total_JP_calculator > 1950 then
		return true
	end

	return false
end

function Grind.Ramza.drawFlags(x, y)
	x = x or 10
	y = y or 90

	local total_JP_squire     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_squire    )
	local total_JP_chemist    = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_chemist   )
	local total_JP_priest     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_priest    )
	local total_JP_wizard     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_wizard    )
	local total_JP_time_mage  = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_time_mage )
	local total_JP_oracle     = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_oracle    )
	local total_JP_calculator = memory.readword(Grind.Ramza.adr_unit + Bunit.total_JP_calculator)

	gui.text(x, y   , string.format(" total_JP_squire     = %d", total_JP_squire    ))
	gui.text(x, y+8 , string.format(" total_JP_chemist    = %d", total_JP_chemist   ))
	gui.text(x, y+16, string.format(" total_JP_priest     = %d", total_JP_priest    ))
	gui.text(x, y+24, string.format(" total_JP_wizard     = %d", total_JP_wizard    ))
	gui.text(x, y+32, string.format(" total_JP_time_mage  = %d", total_JP_time_mage ))
	gui.text(x, y+40, string.format(" total_JP_oracle     = %d", total_JP_oracle    ))
	gui.text(x, y+48, string.format(" total_JP_calculator = %d", total_JP_calculator))
end


------------------------------------------------------------
-- Grind for full wait
------------------------------------------------------------
Grind.General = {}
Grind.General.adr_unit = adr_battle_unit18

function Grind.General.checkTurn()
	return  Battle.checkTurn(Grind.General.adr_unit)
end

function Grind.General.fullWait()
	Battle.waitForTurn(Grind.General.adr_unit)
	Battle.fullWait()
end



------------------------------------------------------------
-- main
------------------------------------------------------------

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
local fc = emu.framecount()
local rng = memory.readdword(adr_rng)

emu.registerbefore(Grind.Ramza.drawFlags)

while true do
	if initial == 1 then
		initial = 0
	end

	-- check Ramza turn
	if Grind.Ramza.checkTurn() == 1 then
		Grind.Ramza.accumulate()

		if Grind.Ramza.checkGoal() then
			break
		end
	end
	
	-- check General turn
	--if Grind.General.checkTurn() == 1 then
	--	Grind.General.fullWait()
	--end
	

	emu.frameadvance()
end


fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()


