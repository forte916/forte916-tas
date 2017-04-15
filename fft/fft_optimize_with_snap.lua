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
-- SkipPv
------------------------------------------------------------
SkipPv = {}
--SkipPv.logname = "snap/opening_skip_pv3_%df.png"
SkipPv.logname = "snap/opening_skip_pv5_%df.png"
--SkipPv.logname = "snap/ending_movie_%df.png"

function SkipPv.pre_attempt()
	-- pass
end

function SkipPv.attempt()
	pressBtn({start=1}, 1)  -- skip opening
	--fadv(500)
	--fadv(360)
	fadv(200)
end

function SkipPv.post_attempt()
	-- pass
end

function SkipPv.success()
	return true -- always true
end

------------------------------------------------------------
-- SkipOpeningMovie
------------------------------------------------------------
SkipOpeningMovie = {}
SkipOpeningMovie.logname = "snap/opening_skip_pv4_%df.png"

function SkipOpeningMovie.pre_attempt()
	-- pass
end

function SkipOpeningMovie.attempt()
	pressBtn({start=1}, 1)  -- skip opening
	fadv(500)
end

function SkipOpeningMovie.post_attempt()
	-- pass
end

function SkipOpeningMovie.success()
	return true -- always true
end

------------------------------------------------------------
-- KeyDown
------------------------------------------------------------
KeyDown = {}
KeyDown.logname = "snap/opening_keydown_%df.png"

function KeyDown.pre_attempt()
	-- pass
end

function KeyDown.attempt()
	pressBtn({down=1}, 1)  -- skip opening
	fadv(200)
end

function KeyDown.post_attempt()
	-- pass
end

function KeyDown.success()
	return true -- always true
end

------------------------------------------------------------
-- KeyCancel
------------------------------------------------------------
KeyCancel = {}
KeyCancel.logname = "snap/opening_keycancel2_%df.png"

function KeyCancel.pre_attempt()
	-- pass
end

function KeyCancel.attempt()
	pressBtn({x=1}, 1)  -- cancel message
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(200)
end

function KeyCancel.post_attempt()
	-- pass
end

function KeyCancel.success()
	return true -- always true
end

------------------------------------------------------------
-- Crystal1
------------------------------------------------------------
Crystal1 = {}
Crystal1.logname = "snap/crystal_ability1_%df.png"

function Crystal1.pre_attempt()
	fadv(7)
end

function Crystal1.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Crystal1.post_attempt()
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

function Crystal1.success()
	return true -- always true
end


------------------------------------------------------------
-- Crystal2
------------------------------------------------------------
Crystal2 = {}
Crystal2.logname = "snap/crystal_ability2_%df.png"

function Crystal2.pre_attempt()
	fadv(7)
end

function Crystal2.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Crystal2.post_attempt()
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

function Crystal2.success()
	return true -- always true
end

------------------------------------------------------------
-- Crystal3
------------------------------------------------------------
Crystal3 = {}
Crystal3.logname = "snap/crystal_ability3_%df.png"

function Crystal3.pre_attempt()
	fadv(7)
end

function Crystal3.attempt()
	pressBtn({circle=1}, 1)  -- stand by
	fadv(10)
end

function Crystal3.post_attempt()
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

function Crystal3.success()
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

--local interface = Crystal3
local interface = SkipPv
--local interface = SkipOpeningMovie


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
		gd.createFromGdStr(gdstr):png(string.format(interface.logname, fc))
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

