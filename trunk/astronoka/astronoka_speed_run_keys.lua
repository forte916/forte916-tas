-- Astronoka
-- This is a key inputs for speed run
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Start this script from power-on

require "astronoka_lib"

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
TAS = {}

function TAS.enterField()
	joypadSetHelper(1, {circle=1}, 6)  -- press field
	fadv(66)
end

function TAS.plantVegee()
	joypadSetHelper(1, {circle=1}, 6)  -- plant seed
	fadv(16+9)
	joypadSetHelper(1, {circle=1}, 9+1)  -- confirm yes
end

function TAS.reapVegee()
	joypadSetHelper(1, {circle=1}, 6)  -- reap vegee
	fadv(9)
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
	fadv(30)
end

function TAS.exitField()
	joypadSetHelper(1, {x=1}, 6)  -- exit field
	fadv(8)
	joypadSetHelper(1, {x=1}, 10)  -- confirm no
	fadv(26)
end

function TAS.enterTrapField()
	joypadSetHelper(1, {circle=1}, 6)  -- press trap field
	fadv(54)  -- press trap field
end

function TAS.removeTrap()
	joypadSetHelper(1, {x=1}, 8)  -- remove trap
	fadv(8)
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
end

function TAS.exitTrapField()
	joypadSetHelper(1, {x=1}, 8)  -- exit trap field
	fadv(8)
	joypadSetHelper(1, {x=1}, 10)  -- confirm no
	fadv(50)
end

function TAS.exitDay()
	joypadSetHelper(1, {circle=1}, 6)  -- press exit day
	fadv(4+9)
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
	fadv(8)
	joypadSetHelper(1, {x=1}, 10)  -- cancel turning off the light
end

function TAS.exitDayBaboo()
	joypadSetHelper(1, {circle=1}, 6)  -- press exit day
	fadv(4+9)
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
	fadv(100)
end

function TAS.skipBattle()
	joypadSetHelper(1, {select=1}, 16)  -- skip battle
	fadv(18)
	joypadSetHelper(1, {x=1}, 6)  -- skip sukkari-
	fadv(26)
	joypadSetHelper(1, {x=1}, 6)  -- skip art score
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip feather, if it was dropped
	fadv(13)
end

function TAS.enterHouse()
	-- TODO:: implrement here
end

function TAS.enterHybridMachineRoom()
	-- TODO:: implrement here
end


function TAS.start()
	fadv(767)  -- opening
	-- 0x0406D8 == 0x025E
	fadv(12)
	joypadSetHelper(1, {start=1}, 75)  -- skip movie

	joypadSetHelper(1, {start=1}, 44)  -- game start
	joypadSetHelper(1, {circle=1}, 10)  -- confirm

	-- input user name, "TAS"
	joypadSetHelper(1, {left=1}, 8)
	joypadSetHelper(1, {circle=1}, 6)
	joypadSetHelper(1, {circle=1}, 6)
	joypadSetHelper(1, {down=1}, 8)
	joypadSetHelper(1, {down=1}, 8)
	joypadSetHelper(1, {left=1}, 8)
	joypadSetHelper(1, {circle=1}, 6)  -- press T
	joypadSetHelper(1, {up=1}, 8)
	joypadSetHelper(1, {right=1}, 8)
	joypadSetHelper(1, {right=1}, 8)
	joypadSetHelper(1, {circle=1}, 6)  -- press A
	joypadSetHelper(1, {down=1}, 8)
	joypadSetHelper(1, {left=1}, 8)
	joypadSetHelper(1, {left=1}, 8)
	joypadSetHelper(1, {left=1}, 8)
	joypadSetHelper(1, {circle=1}, 6)  -- press S

	joypadSetHelper(1, {start=1}, 12)  -- determin
	joypadSetHelper(1, {circle=1}, 10)  -- confirm

	-- immigration
	joypadSetHelper(1, {circle=1}, 10)  -- skip
	joypadSetHelper(1, {circle=1}, 6)  -- skip
	fadv(20)
	joypadSetHelper(1, {circle=1}, 26)  -- skip
	fadv(68)
end

function TAS.d1101()
	-- main menu
	joypadSetHelper(1, {x=1}, 6)  -- skip
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip

	-- field
	fadv(80)
	joypadSetHelper(1, {x=1}, 26)  -- skip kokoha-
	joypadSetHelper(1, {x=1}, 26)  -- skip kiita-
	joypadSetHelper(1, {x=1}, 26)  -- skip soreha-
	joypadSetHelper(1, {x=1}, 6)  -- skip
	joypadSetHelper(1, {up=1}, 6)  --  move cusor at the bottom
	joypadSetHelper(1, {circle=1}, 6)  -- skip
	fadv(18)
	joypadSetHelper(1, {x=1}, 6)  -- skip wakari-
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip deha-
	joypadSetHelper(1, {x=1}, 6)  -- exit field
	fadv(8)
	joypadSetHelper(1, {x=1}, 10)  -- confirm no

	-- main menu
	fadv(6)
	joypadSetHelper(1, {down=1}, 6)  --  move cusor to pedro
	joypadSetHelper(1, {circle=1}, 6)  -- press pedro

	-- pedro
	fadv(202)
	joypadSetHelper(1, {x=1}, 6)  -- skip
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip ya-ya-
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip oyobi-
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip makoto-

	joypadSetHelper(1, {circle=1}, 10)  -- press buy
	joypadSetHelper(1, {circle=1}, 6)  -- press seed category
	joypadSetHelper(1, {circle=1}, 6)  -- press all seed
	joypadSetHelper(1, {circle=1}, 6)  -- press shimaimo
	joypadSetHelper(1, {up=1}, 6)  -- raise 2 seeds
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
	joypadSetHelper(1, {down=1}, 6)  -- move to hoshikabu
	joypadSetHelper(1, {circle=1}, 6)  -- press hoshikabu
	joypadSetHelper(1, {circle=1}, 10)  -- confirm yes
	joypadSetHelper(1, {x=1}, 6)  -- exit seed
	joypadSetHelper(1, {x=1}, 6)  -- exit seed
	joypadSetHelper(1, {x=1}, 6)  -- exit seed

	joypadSetHelper(1, {up=1}, 6)  -- move cursor to back
	joypadSetHelper(1, {circle=1}, 6)  -- press back
	fadv(30)

	-- main menu
	joypadSetHelper(1, {up=1}, 6)  -- move cursor to field
	joypadSetHelper(1, {circle=1}, 6)  -- press field

	-- field
	fadv(54)

	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	joypadSetHelper(1, {circle=1}, 6)  -- press all seeds
	TAS.plantVegee()

	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()
	
	TAS.exitField()

	-- main menu
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.exitDay()
	fadv(46)

end


function TAS.d1102()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip danna-
	joypadSetHelper(1, {x=1}, 26)  -- skip kokoha-
	joypadSetHelper(1, {x=1}, 26)  -- skip triangle-
	joypadSetHelper(1, {x=1}, 26)  -- skip tokuni-
	joypadSetHelper(1, {x=1}, 5)  -- skip yasai-

	TAS.exitDay()
	fadv(46)
end

function TAS.d1103()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip astro-
	joypadSetHelper(1, {x=1}, 26)  -- skip saiko-
	joypadSetHelper(1, {x=1}, 5)  -- skip tohaie-

	TAS.exitDay()
	fadv(50)
end

function TAS.d1104()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip danna-
	joypadSetHelper(1, {x=1}, 5)  -- skip sonotame-

	-- main menu
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press field

	-- field
	fadv(66)
	TAS.reapVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.reapVegee()

	fadv(1)
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	TAS.exitField()

	-- main menu
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.exitDay()
	fadv(51)
end

function TAS.d1105()
	TAS.exitDay()
	fadv(49)
end

function TAS.d1106()
	TAS.exitDay()
	fadv(49)
end

function TAS.d1107()
	-- main menu
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press field

	-- field
	fadv(66)
	TAS.reapVegee()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.plantVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	TAS.plantVegee()

	TAS.exitField()

	-- main menu
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.exitDay()
	fadv(47)
end

function TAS.d1108()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip dannna-
	joypadSetHelper(1, {x=1}, 6)  -- skip mazuha-

	-- binocular
	fadv(56)
	joypadSetHelper(1, {x=1}, 6)  -- exit binocular
	fadv(8)
	joypadSetHelper(1, {x=1}, 10)  -- confirm no

	-- main menu
	fadv(26)
	joypadSetHelper(1, {x=1}, 26)  -- skip goran-
	joypadSetHelper(1, {x=1}, 26)  -- skip nanika-
	joypadSetHelper(1, {x=1}, 26)  -- skip a,souda-
	joypadSetHelper(1, {x=1}, 26)  -- skip arima-
	joypadSetHelper(1, {x=1}, 26)  -- skip guruguru-
	joypadSetHelper(1, {x=1}, 26)  -- skip deha-
	joypadSetHelper(1, {x=1}, 6)  -- skip saiwai-

	-- trap field
	fadv(92+10)
	joypadSetHelper(1, {x=1}, 26)  -- skip kono-
	joypadSetHelper(1, {x=1}, 26)  -- skip baboo-
	joypadSetHelper(1, {x=1}, 6)  -- skip kitagawa-
	
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip yoroshii-
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press
	fadv(20)
	joypadSetHelper(1, {x=1}, 6)  -- skip deha-
	fadv(207)
	fadv(20)
	joypadSetHelper(1, {x=1}, 26)  -- skip kono-
	joypadSetHelper(1, {x=1}, 26)  -- skip bokuno-
	joypadSetHelper(1, {x=1}, 6)  -- skip danna-
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press
	fadv(20)
	joypadSetHelper(1, {x=1}, 26)  -- skip soudesuka-
	joypadSetHelper(1, {x=1}, 26)  -- skip nanishiro-
	joypadSetHelper(1, {x=1}, 26)  -- skip souda-
	joypadSetHelper(1, {x=1}, 6)  -- skip nanishiro-

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.removeTrap()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.removeTrap()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.removeTrap()

	TAS.exitTrapField()

	-- main menu
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.exitDayBaboo()

	-- trap battle
	fadv(262)
	TAS.skipBattle()
	fadv(167)
	joypadSetHelper(1, {x=1}, 10)  -- cancel turning off the light
	fadv(72)
end

function TAS.d1109()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip dannna-
	joypadSetHelper(1, {x=1}, 6)  -- skip souieba-
	-- trap battle
end

function TAS.d1110()
	joypadSetHelper(1, {x=1}, 26)  -- enter
	joypadSetHelper(1, {x=1}, 26)  -- skip dannna-
	joypadSetHelper(1, {x=1}, 26)  -- skip asazoko-
	joypadSetHelper(1, {x=1}, 26)  -- skip asazoko-
	joypadSetHelper(1, {x=1}, 26)  -- skip kidou-
	joypadSetHelper(1, {x=1}, 26)  -- skip sarani-
	joypadSetHelper(1, {x=1}, 6)  -- skip astro net-

	-- main menu
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {up=1}, 6)  -- move cursor
	joypadSetHelper(1, {circle=1}, 6)  -- press field
	
	-- field
	fadv(66)
	TAS.reapVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {right=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {left=1}, 6)  -- move cursor
	TAS.reapVegee()

	joypadSetHelper(1, {circle=1}, 6)  -- show inventory
	joypadSetHelper(1, {down=1}, 6)  -- move cursor
	TAS.plantVegee()

	-- plant vegee
	-- exit day
end
	
	
------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()

while true do

	if initial == 1 then
		initial = 0
	end

	if initial == 0 then
		TAS.start()
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
