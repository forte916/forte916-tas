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
require "na2_lib"


------------------------------------------------------------
-- SkipTitle with screen shots.
------------------------------------------------------------
SkipTitle = {}
--SkipTitle.picname = "snap/skip_artdink_%df.png"
--SkipTitle.picname = "snap/skip_flipflop_%df.png"
--SkipTitle.picname = "snap/skip_title_%df.png"
--SkipTitle.picname = "snap/new_game_%df.png"
SkipTitle.picname = "snap/skip_join_%df.png"
SkipTitle.retry = 200

function SkipTitle.pre_attempt()
	-- pass
end

function SkipTitle.attempt()
	--pressBtn({start=1}, 1)  -- skip title logo
	pressBtn({circle=1}, 1)  -- skip title logo
	fadv(200)
end

function SkipTitle.post_attempt(retry, fc)
	-- make sure the dest directory exists
	local gdstr = gui.gdscreenshot()
	gd.createFromGdStr(gdstr):png(string.format(SkipTitle.picname, fc))
end

function SkipTitle.success()
	return "best" -- always true
end


------------------------------------------------------------
-- VoyageBot
------------------------------------------------------------
VoyageBot = {}
VoyageBot.logname  = "voyage_result2.log"
VoyageBot.picname1 = "snap/voyage_result2_land_%df.png"
VoyageBot.picname2 = "snap/voyage_result2_city_%df_retry_%d.png"
VoyageBot.retry = 200

VoyageBot.pre_cities  = {}
VoyageBot.pre_total   = {}
VoyageBot.post_cities = {}
VoyageBot.post_total  = {}

function VoyageBot.logHeader()
	debugPrint(string.format("-- Product ID Legend --"))
	debugPrint(string.format("   00=salt, 09=cacao, 0a=Hg, 0d=ivory, 1d=coffee"))
	debugPrint(string.format(""))
end

function VoyageBot.pre_attempt()
	fadv(2)
end

function VoyageBot.attempt()
	VoyageBot.pre_cities = City.getAll()
	VoyageBot.pre_total  = memory.readword(Global.total_city.adr)

	pressBtn({l2=1}, 3)  -- zoom in
	pressBtn({l2=1}, 1)  -- zoom in

	-- text skip until the end of report
	while true do
		local believe_flag = memory.readword(Text.adr_1227B8)
		if believe_flag == Text.BELIEVE_VIEW then
			break
		end
		Text.skip()
	end

	fadv(100)
	pressBtn({circle=1}, 3)  -- believe
	pressBtn({circle=1}, 1)  -- believe
	fadv(90)
end

function VoyageBot.post_attempt(retry, fc)
	-- make sure the dest directory exists
	local gdstr = gui.gdscreenshot()
	gd.createFromGdStr(gdstr):png(string.format(VoyageBot.picname1, fc))

	--Window.changeScale(1)  -- 1 means scale 2
	fadv(170)

	fc = emu.framecount()
	gdstr = gui.gdscreenshot()
	gd.createFromGdStr(gdstr):png(string.format(VoyageBot.picname2, fc, retry))
end


function VoyageBot.findNewCity()
	local cities = {}

	for i = 1, #VoyageBot.pre_cities do
		if VoyageBot.pre_cities[i].discover ~= VoyageBot.post_cities[i].discover then
			cities[#cities + 1] = VoyageBot.post_cities[i]
		end
	end

	for i = 1, #cities do
		debugPrint(cities[i].info3)
	end

	return cities
end

function VoyageBot.success()
	local ret = nil
	VoyageBot.post_cities = City.getAll()
	VoyageBot.post_total  = memory.readword(Global.total_city.adr)

	--if pre_total < post_total then
	--	debugPrint(string.format("  pre_total=%d, post_total=%d, New City", VoyageBot.pre_total, VoyageBot.post_total))
	--end
	debugPrint(string.format("  pre_total=%d, post_total=%d", VoyageBot.pre_total, VoyageBot.post_total))

	local new_cities = VoyageBot.findNewCity()
	if #new_cities > 0 then
		return "good"
	end

	-- TODO: If discover a land with no cities, define as "good"

	return ret
end

VoyageBot.best_retry = 133
VoyageBot.best_rng = 0x97264179

----- retry = 128, fc = 9764, rng = AB9F2E27 -----
----- retry = 131, fc = 9767, rng = ED7F6D72 -----
----- retry = 133, fc = 9769, rng = 97264179 -----


