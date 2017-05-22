-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- Interfaces of Lua BOT.
--
-- Usage
--   1. Set each interface class in Lua BOT skeleton properly.
--

require "gd"
require "psx_lib"


------------------------------------------------------------
-- SkipTitle with screen shots.
------------------------------------------------------------
SkipTitle = {}
--SkipTitle.logname = "snap/skip_artdink_%df.png"
--SkipTitle.logname = "snap/skip_flipflop_%df.png"
--SkipTitle.logname = "snap/skip_title_%df.png"
--SkipTitle.logname = "snap/new_game_%df.png"
SkipTitle.logname = "snap/skip_join_%df.png"
SkipTitle.retry = 200

function SkipTitle.pre_attempt()
	-- pass
end

function SkipTitle.attempt()
	--pressBtn({start=1}, 1)  -- skip title logo
	pressBtn({circle=1}, 1)  -- skip title logo
	fadv(200)
end

function SkipTitle.post_attempt(fc)
	-- make sure the dest directory exists
	local gdstr = gui.gdscreenshot()
	gd.createFromGdStr(gdstr):png(string.format(SkipTitle.logname, fc))
end

function SkipTitle.success()
	return "best" -- always true
end

