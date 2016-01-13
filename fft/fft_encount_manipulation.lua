-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script manipulates encounts and enemy status.
--
-- Usage
--   1. Set interface as proper clsss.
--   1. Start this script properlly.
--

require "psx_lib"
require "fft_lib"
require "fft_input_macro_lib"

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

------------------------------------------------------------
-- Mandalia
------------------------------------------------------------
Mandalia = {}
Mandalia.logname = "ch1_random_encount10.log"

function Mandalia.pre_attempt()
	-- move Gariland From Formation
--	fadv(4)
--	pressBtn({up=1}, 1)

--	pressBtn({circle=1}, 3)
--	pressBtn({up=1}, 1)
--	pressBtn({circle=1}, 1)
--	fadv(50+1)
end

function Mandalia.pre_attempt2()
	-- move Gariland From Mandalia
	--pressBtn({triangle=1}, 5)
	--pressBtn({circle=1}, 3)
	--pressBtn({up=1}, 1)
	--pressBtn({circle=1}, 1)
	--fadv(50+1)

	pressBtn({circle=1}, 1)
	fadv(21)
	pressBtn({down=1}, 7)
	pressBtn({circle=1}, 1)  -- shop
	fadv(67)
	pressBtn({circle=1}, 1)  -- cancel message
	fadv(47)
	pressBtn({x=1}, 1)  -- exit city
	fadv(4)

	local fc = emu.framecount()
	fadv(81105 - fc)
end

function Mandalia.attempt()
	-- move Mandalia From Gariland
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)  -- select Mandalia
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Mandalia.post_attempt()
	-- pass
end

function Mandalia.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 10
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.no ~= 0xFF then
			enemy = enemy + 1
			str = str.." , exists"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy < 3 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- GainedJpUP
------------------------------------------------------------
GainedJpUP = {}
GainedJpUP.logname = "ch1_gained_jp_up.log"

function GainedJpUP.pre_attempt()
	fadv(3)
end

function GainedJpUP.attempt()
	-- move Mandalia From Gariland
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)  -- select Mandalia
	pressBtn({circle=1}, 1)
	fadv(900)
end

function GainedJpUP.post_attempt()
	-- pass
end

function GainedJpUP.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local skill = 0
	local str

	prpt = Bunit.readProperty(ofs_unit)
	str = prpt.info

	skill = bit.band(prpt.base_r_s_m_learned3, 0x08)  -- 0x08 means Gained Jp UP
	if skill ~= 0 then
		print(string.format("-- skill = %x", skill))
		str = str.." , Gained Jp UP"
		ret = true
	else
		ret = false
	end

	debugPrint(str)
	return ret
end


------------------------------------------------------------
-- Speed9
------------------------------------------------------------
Speed9 = {}
Speed9.logname = "ch4_Finath_speed9.log"

function Speed9.pre_attempt()
	fadv(1)
end

function Speed9.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Speed9.post_attempt()
	-- pass
end

function Speed9.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 12
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.no ~= 0xFF and prpt.speed > 8 then
			enemy = enemy + 1
			str = str.." , speed 9"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy < 1 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- RouteEncount
------------------------------------------------------------
RouteEncount = {}
RouteEncount.logname = "encount_limberry_igros.log"

function RouteEncount.logHeader()
	debugPrint(string.format("Route: Limberry to Igros. How many often are there encounts."))
end

function RouteEncount.pre_attempt()
	fadv(5)
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 3)
end

function RouteEncount.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function RouteEncount.post_attempt()
	-- pass
end

function RouteEncount.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 12
	local enemy = 0
	local entd_flag = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		entd_flag = bit.band(prpt.entd_flag, 0x50)  -- 0x50 Random enemy
		if entd_flag ~= 0 then
			enemy = enemy + 1
			str = str.." , random enemy"
		end
		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy > 1 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- CheckBadZodiac
------------------------------------------------------------
CheckBadZodiac = {}
CheckBadZodiac.logname = "ch4_check_zodiac_ubs_4th_floor1.log"

function CheckBadZodiac.logHeader()
	debugPrint(string.format("bad : 0x00, 0x60, very bad : 0x30"))
	debugPrint(string.format("good: 0x10, 0x50, very good: 0x30"))
end

function CheckBadZodiac.pre_attempt()
	fadv(3)
end

function CheckBadZodiac.attempt()
	pressBtn({circle=1}, 1)
	--fadv(900)
	fadv(600)
end

function CheckBadZodiac.post_attempt()
	-- pass
end

function CheckBadZodiac.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 7
	local enemy = 0
	local compatibility = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		compatibility = Zodiac.isBadWithCapricorn(prpt.zodiac, prpt.gender)
		if compatibility then
			enemy = enemy + 1
			str = str.." , bad"
		elseif prpt.faith < 55 then
			enemy = enemy + 1
			str = str.." , unfaith"
		end

		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy == 0 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- Orlandu
------------------------------------------------------------
Orlandu = {}
Orlandu.logname = "ch4_orlandu_join.log"

function Orlandu.pre_attempt()
	fadv(2)
end

function Orlandu.attempt()
	pressBtn({circle=1}, 1)   -- skip bonus money
	fadv(740)
end

function Orlandu.post_attempt()
	-- pass
end

function Orlandu.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local skill = 0
	local lv = 0
	local str

	prpt = Bunit.readProperty(ofs_unit)
	str = prpt.info

	-- TODO: Move+1 or rest of JP is higher than 200JP
	skill = bit.band(prpt.base_action_learned1, 0x10)  -- 0x10 means Lightning Stab
	if skill ~= 0 and prpt.lv > 26 then
		print(string.format("-- skill = %x, lv = %2d", skill, prpt.lv))
		str = str.." , Lightning Stab"
		ret = true
	else
		ret = false
	end

	debugPrint(str)
	return ret
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

local interface = CheckBadZodiac

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end


retry = 500

for i=100, retry do
	if initial == 1 then
		initial = 0
	end

	interface.pre_attempt()
	fadv(i)
	if interface.pre_attempt2 ~= nil then interface.pre_attempt2() end
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	local cur_session = memory.readdword(adr_cur_session)
	local milsecs = memory.readdword(adr_milsecs)

	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X, cur_session = %d, milsecs = %d -----", i, fc, rng, cur_session, milsecs))

	interface.attempt()

	-- check status
	if interface.success() then
		debugPrint(string.format("***** best state. fc = %d, rng = %08X *****", fc, rng))
		print(string.format("***** best state. retry = %d, rng = %08X *****", i, rng))

		interface.post_attempt()
	end

	f:flush()
	savestate.load(state)
end


fc = emu.framecount()
debugPrint(string.format("<<< lua bot is finished <<<"))
debugPrint(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
debugPrint(string.format("    end:: %s,  fc = %d", os.date(), fc))
debugPrint(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()
f:close()

