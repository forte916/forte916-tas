-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script outputs screen shots for optimization.
--
-- Usage
--   1. Set interface class properly.
--   2. Start this script properly.
--

require "gd"
require "psx_lib"
require "fft_lib"

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
-- functions
------------------------------------------------------------
function drawRetry(count, x, y)
	x = x or 0
	y = y or 30

	gui.text(x, y   , string.format(" retry:%d", count))
end


------------------------------------------------------------
-- Optimize
------------------------------------------------------------
Optimize = {}

function Optimize.pre_attempt()
	-- pass
end

function Optimize.attempt()
	pressBtn({start=1}, 1)  -- skip opening
	fadv(500)
	--fadv(360)
end

function Optimize.post_attempt()
	-- pass
end

function Optimize.success()
	return true -- always true
end

------------------------------------------------------------
-- Cristal1
------------------------------------------------------------
Cristal1 = {}

function Cristal1.pre_attempt()
	fadv(7)
end

function Cristal1.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Cristal1.post_attempt()
	local male_turn = memory.readword(adr_battle_unit17 + Bunit.cur_turn)

	while male_turn ~= 0x01 do
		fadv(1)
		male_turn = memory.readword(adr_battle_unit17 + Bunit.cur_turn)
	end
	fadv(7+7)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
	fadv(15)

	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
	fadv(16)

	pressBtn({circle=1}, 10)  -- move
	pressBtn({up=1}, 1)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(39+7)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(70)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(30)
end

function Cristal1.success()
	return true -- always true
end


------------------------------------------------------------
-- Cristal2
------------------------------------------------------------
Cristal2 = {}

function Cristal2.pre_attempt()
	fadv(7)
end

function Cristal2.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Cristal2.post_attempt()
	local ofs_unit = adr_battle_unit20
	local wiz_turn = memory.readword(ofs_unit + Bunit.cur_turn)

	while wiz_turn ~= 0x01 do
		fadv(1)
		wiz_turn = memory.readword(ofs_unit + Bunit.cur_turn)
	end
	fadv(7+7)
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- stand by
	pressBtn({circle=1}, 1)
	fadv(8+7)

	pressBtn({circle=1}, 10)  -- move
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(39+7)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(70)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(30)
end

function Cristal2.success()
	return true -- always true
end

------------------------------------------------------------
-- Cristal3
------------------------------------------------------------
Cristal3 = {}

function Cristal3.pre_attempt()
	fadv(7)
end

function Cristal3.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Cristal3.post_attempt()
	local ofs_unit = adr_battle_unit20
	local wiz_turn = memory.readword(ofs_unit + Bunit.cur_turn)

	while wiz_turn ~= 0x01 do
		fadv(1)
		wiz_turn = memory.readword(ofs_unit + Bunit.cur_turn)
	end
	fadv(7+7)
	pressBtn({circle=1}, 10)  -- move
	pressBtn({down=1}, 1)
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)
	fadv(41)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(70)
	pressBtn({circle=1}, 3)
	pressBtn({circle=1}, 3)
	fadv(30)
end

function Cristal3.success()
	return true -- always true
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
--local rng = memory.readdword(adr_rng)

local interface = Cristal3


retry = 200

for i=0, retry do
	if initial == 1 then
		initial = 0
	end

	drawRetry(i, x, y)
	interface.pre_attempt()
	fadv(i)
	fc = emu.framecount()
	--rng = memory.readdword(adr_rng)
	--print(string.format("----- retry = %d, fc = %d, rng = %08X -----", i, fc, rng))

	interface.attempt()

	if interface.success() then
		--print(string.format("  ***** best state. fc = %d, rng = %08X *****", fc, rng))
		interface.post_attempt()

		-- make dest directory in advance
		local gdstr = gui.gdscreenshot()
		gd.createFromGdStr(gdstr):png(string.format("snap/cristal_ability3_%df.png", fc))
	end

	savestate.load(state)
end


fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

