-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulator: psxjin v2.0.2
--
-- This is a library for encount manipulation.
--
-- Usage
--   1. require "fft_encount_lib"
--

require "psx_lib"
require "fft_lib"


------------------------------------------------------------
-- Orbonne
------------------------------------------------------------
Orbonne = {}
Orbonne.logname = "ch1_1_orbonne_party6.log"
Orbonne.retry = 100

Orbonne.name = {"ramza", "agrias", "gaf", "alicia", "lavian", "knight", "archer", "archer", "archer", "chemist", "rad"}

function Orbonne.logHeader()
	debugPrint(string.format("Ramza = 0x90 = Capricorn"))
	debugPrint(string.format(" * good: 0x10, 0x50, very good: 0x30"))
	debugPrint(string.format(" * bad : 0x00, 0x60, very bad : 0x30"))
	debugPrint(string.format(""))
	debugPrint(string.format("Agrias = 0x30 = Cancer"))
	debugPrint(string.format(" * good: 0x70, 0xB0, very good: 0x90"))
	debugPrint(string.format(" * bad : 0x00, 0x60, very bad : 0x90"))
	debugPrint(string.format(""))
	debugPrint(string.format("Gafgar = 0x50 = Virgo"))
	debugPrint(string.format(" * good: 0x10, 0x90, very good: 0xB0"))
	debugPrint(string.format(" * bad : 0x20, 0x80, very bad : 0xB0"))
	debugPrint(string.format(""))
	debugPrint(string.format("Alicia = 0xB0 = Pisces"))
	debugPrint(string.format(" * good: 0x30, 0x70, very good: 0x50"))
	debugPrint(string.format(" * bad : 0x20, 0x80, very bad : 0x50"))
	debugPrint(string.format(""))
	debugPrint(string.format("-- Bunit Legend --"))
	debugPrint(string.format("%s", Bunit.info_header4))
	debugPrint(string.format(" 2,ff, 2,90 |  9,81, 6 | 64,51 | 152,24 | 465-145,194 | 127,114 | ramza  "))
	debugPrint(string.format("34, 1,34,30 | 10,79, 6 | 71,63 | 204,26 | 162- 62,247 | 126,117 | agrias "))
	debugPrint(string.format("17,ff,17,50 | 10,89, 7 | 61,67 | 210,25 | 149- 49,283 | 232,148 | gaf    "))
	debugPrint(string.format("81, 3,4c,b0 |  8,50, 6 | 61,62 | 108,17 | 276-106,153 | 136,401 | alicia "))
	debugPrint(string.format("81, 4,4c, 0 |  8,39, 6 | 62,61 | 105,18 | 266- 96,126 | 185,400 | lavian "))
	debugPrint(string.format("80, 5,4c,90 |  9,73, 6 | 50,47 | 135,17 | 293- 13,183 | 154,789 | knight , �^���3"))
	debugPrint(string.format("80, 6,4d,51 |  7, 2, 6 | 67,67 |  65,13 | 244- 74,192 | 142,106 | archer , �^���4, beaten by gaf"))
	debugPrint(string.format("80, 7,4d,40 |  7,92, 6 | 64,63 |  56,12 | 287-117,128 | 180,192 | archer , �^���2, beaten by agrias"))
	debugPrint(string.format("80, 8,4d,30 |  6,81, 6 | 73,56 |  63,11 | 209- 39,120 | 198,166 | archer , �^���5"))
	debugPrint(string.format("80, 9,4b, 0 |  6,78, 6 | 70,63 |  55,19 | 188-108,176 | 140,146 | chemist, �^���1"))
	debugPrint(string.format("80,ff,4a,91 |  8,13, 6 | 63,60 |  96,23 | 156- 76,253 | 148,116 | rad    "))
	debugPrint(string.format(""))
end

function Orbonne.pre_attempt()
	pressBtn({circle=1}, 1)
end

function Orbonne.attempt()
	pressBtn({x=1}, 1)
	fadv(360)
end

function Orbonne.post_attempt()
	-- pass
end

function Orbonne.success()
	local ret = nil
	local prpt = {}  -- property
	local ofs_unit = adr_battle_unit
	local total_enemy = 11
	local ramza_comp = 0  -- compatibility
	local agrias_comp = 0
	local gaf_comp = 0
	local alicia_comp = 0
	local match_knight = 0
	local match_archer = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		str = string.format("%s %s", str, Orbonne.name[i])

		-- knight:
		if prpt.no == 5 then
			ramza_comp = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-ramza", str, Zodiac.notation[ramza_comp])

			agrias_comp = Zodiac.checkCompatibilityAgrias(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-agrias", str, Zodiac.notation[agrias_comp])

			alicia_comp = Zodiac.checkCompatibilityAlicia(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-alicia", str, Zodiac.notation[alicia_comp])

			if (ramza_comp > 3 and alicia_comp > 3) then
				str = string.format("%s, matched", str)
				match_knight = match_knight + 1
			end
		end

		-- archer: should be beaten by gaf
		if prpt.no == 6 then
			gaf_comp = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-gaf", str, Zodiac.notation[gaf_comp])

			agrias_comp = Zodiac.checkCompatibilityAgrias(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-agrias", str, Zodiac.notation[agrias_comp])

			if (gaf_comp > 3) then
				str = string.format("%s, matched", str)
				match_archer = match_archer + 1
			end
		end

		-- archer: should be beaten by agrias
		if prpt.no == 7 then
			gaf_comp = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-gaf", str, Zodiac.notation[gaf_comp])

			agrias_comp = Zodiac.checkCompatibilityAgrias(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-agrias", str, Zodiac.notation[agrias_comp])

			if (gaf_comp < 3) then
				str = string.format("%s, matched", str)
				match_archer = match_archer + 1
			end
		end

		-- archer:
		if prpt.no == 8 then
			ramza_comp = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-ramza", str, Zodiac.notation[ramza_comp])

			gaf_comp = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-gaf", str, Zodiac.notation[gaf_comp])

			agrias_comp = Zodiac.checkCompatibilityAgrias(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-agrias", str, Zodiac.notation[agrias_comp])

			if ramza_comp > 3 or gaf_comp > 3 then
				str = string.format("%s, matched", str)
			end
		end

		-- chemist:
		if prpt.no == 9 then
			ramza_comp = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-ramza", str, Zodiac.notation[ramza_comp])

			gaf_comp = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-gaf", str, Zodiac.notation[gaf_comp])

			agrias_comp = Zodiac.checkCompatibilityAgrias(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-agrias", str, Zodiac.notation[agrias_comp])

			if ramza_comp > 3 or gaf_comp > 3 then
				str = string.format("%s, matched", str)
			end
		end

		-- lavian:
		if prpt.no == 4 then
			if Bunit.isLearnedThrowStone(prpt) ~= 0 then
				str = str..", throw stone"

				if Bunit.isSetBasicSkill(prpt) then
					str = str.." set"
				else
					str = str.." NOT set"
				end
			end
		end

		
		if Bunit.isSetBlackSkill(prpt) then
			str = str..", Black-Magic set"
		end

		debugPrint(str)
	end

	if match_archer > 0 and match_knight > 0 then
		ret = "best"
	elseif match_archer > 0 then
		ret = "good"
	end
	return ret
end


------------------------------------------------------------
-- Gariland
------------------------------------------------------------
Gariland = {}
Gariland.logname = "ch1_2_gariland_enemy4.log"

Gariland.name = {"delita", "broad", "dagger", "dagger", "item", "female"}

function Gariland.logHeader()
	debugPrint(string.format("Ramza = 0x90 = Capricorn"))
	debugPrint(string.format(" * good: 0x10, 0x50, very good: 0x30"))
	debugPrint(string.format(" * bad : 0x00, 0x60, very bad : 0x30"))
	debugPrint(string.format(""))
	debugPrint(string.format("-- Bunit Legend --"))
	debugPrint(string.format(" 4  0  4 81: 1 94  6:71 55: 50  14:104- 24 142:130 137:, delita"))
	debugPrint(string.format("80  1 4a 10: 1 90  6:51 58: 44  10:159- 29 197:131 142:, broad , �^���4"))
	debugPrint(string.format("80  2 4a 20: 1 19  6:47 68: 43  10:180- 90 117:131 139:, dagger, �^���1, beaten by ramza"))
	debugPrint(string.format("80  3 4a 81: 1 66  6:69 60: 36  10:101- 21 107:166 131:, dagger, �^���3"))
	debugPrint(string.format("80  4 4b 51: 1 21  6:38 66: 38  10:147- 17 146:197 155:, item  , �^���5"))
	debugPrint(string.format("81  5 4a 20: 1 26  6:70 51: 33  11:135- 55 148:197 148:, female, �^���2"))
	debugPrint(string.format(""))

end

function Gariland.pre_attempt()
	fadv(2)
end

function Gariland.attempt()
	pressBtn({x=1}, 1)
	fadv(400)
end

function Gariland.post_attempt()
	-- pass
end

function Gariland.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit2
	local total_enemy = 5
	local compatibility = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		str = string.format("%s %s", str, Orbonne.Gariland[i])

		compatibility = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
		str = string.format("%s, %s-ramza", str, Zodiac.notation[compatibility])

		if prpt.no == 2 and compatibility > 3 then
			str = str.." , matched"
			ret = true
		end

		debugPrint(str)
	end

	return ret
end


------------------------------------------------------------
-- Mandalia
------------------------------------------------------------
Mandalia = {}
Mandalia.logname = "ch1_3_mandalia_enemy3.log"


function Mandalia.logHeader()
	debugPrint(string.format("Ramza = 0x90 = Capricorn"))
	debugPrint(string.format(" * good: 0x10, 0x50, very good: 0x30"))
	debugPrint(string.format(" * bad : 0x00, 0x60, very bad : 0x30"))
	debugPrint(string.format(""))
	debugPrint(string.format("-- Bunit Legend --"))
	debugPrint(string.format(" 4, 0,4b,81/ 2, 0, 6/81,55/ 32,11/125- 45,144/130,137/ , Delita"))
	debugPrint(string.format(" 7, 1, 7,50/ 3, 0, 6/83,59/ 38,15/125- 45,179/104,103/ , Algus"))
	debugPrint(string.format("80, 2,53,61/ 2,31, 6/53,53/ 42, 7/289- 69,110/157,142/ , �^���5, thief"))
	debugPrint(string.format("80, 3,4a,50/ 1,91, 6/61,68/ 10,10/127- 47,116/153,199/ , �^���6, algus"))
	debugPrint(string.format("80, 4,4a,40/ 1,96, 6/67,68/ 36,10/172- 42,156/106,154/ , �^���2"))
	debugPrint(string.format("80, 5,4a,81/ 2, 0, 6/70,70/ 35,10/193- 23,117/131,151/ , �^���3, throw stone recommended, defeat at first, "))
	debugPrint(string.format("80, 6,4a,20/ 1,23, 6/67,72/ 36,11/144- 14,112/191,148/ , �^���4"))
	debugPrint(string.format("82, 7,67,a0/ 1, 8, 5/40,50/ 42, 4/  0-  0,  0/  0,  0/ , �^���1, redpanther"))
	debugPrint(string.format(""))
end

function Mandalia.pre_attempt()
	fadv(3)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)  -- enemy status is changed whether down or up
	--pressBtn({up=1}, 1)  -- enemy status is changed whether down or up

	-- relevant address??
	-- 0x007562
	-- 0x0328A0
end

function Mandalia.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Mandalia.post_attempt()
	-- pass
end

function Mandalia.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit3
	local total_enemy = 6
	local compatibility = 0
	local matched = 0
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if prpt.no == 2 then
			compatibility = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-algus", str, Zodiac.notation[compatibility])

			if Bunit.isLearnedStealHeart(prpt) ~= 0 then
				str = str..", charm"
			end
		end

		if prpt.no == 3 then
			compatibility = Zodiac.checkCompatibilityVirgo(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-algus", str, Zodiac.notation[compatibility])
		end

		if prpt.no >= 4 and prpt.no <= 6 then
			compatibility = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
			str = string.format("%s, %s-ramza", str, Zodiac.notation[compatibility])

			if (compatibility > 3 and prpt.faith > 46)
				or (compatibility == 3 and prpt.faith > 57) 
				or (compatibility == 2 and prpt.faith > 63) then
				str = string.format("%s, bolt2", str)
				enemy = enemy + 1
				matched = matched + 1
			end

			if Bunit.isLearnedThrowStone(prpt) ~= 0 then
				str = str..", throw stone"
				matched = matched + 1
			end

			--if matched > 1 then
			--	ret = true
			--end
		end

		if prpt.faith < 50 then
			str = string.format("%s, low faith", str)
		end

		debugPrint(str)
	end

	if enemy > 2 then
		ret = true
	end
	return ret
end


------------------------------------------------------------
-- GainedJpUP
------------------------------------------------------------
GainedJpUP = {}
GainedJpUP.logname = "ch1_3_mandalia_gained_jp_up_cheat3.log"
function GainedJpUP.logHeader()
	debugPrint(string.format("the most right culumn is base_r_s_m_learned3"))
	debugPrint(string.format("    0x80:Counter Tackle"))
	debugPrint(string.format("    0x40:Equip Axe"))
	debugPrint(string.format("    0x20:Monster Skill"))
	debugPrint(string.format("    0x10:Defend"))
	debugPrint(string.format("    0x08:Gained JP-UP"))
	debugPrint(string.format("    0x04:Move+1"))
	debugPrint("")
end


function GainedJpUP.pre_attempt()
	--fadv(4)
	--fadv(3)
end

function GainedJpUP.pre_attempt2()
	-- move Mandalia From Gariland
	--pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)  -- select Mandalia
end

function GainedJpUP.attempt()
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
	local str

	prpt = Bunit.readProperty(ofs_unit)
	str = prpt.info

	if Bunit.isLearnedGainedJpUp(prpt) ~= 0 then
		print(string.format("-- base_r_s_m_learned3 = %x, Gained Jp UP", prpt.base_r_s_m_learned3))
		str = str.." , Gained Jp UP"
		ret = true
	end

	debugPrint(str)
	return ret
end


------------------------------------------------------------
-- MandaliaRandom
------------------------------------------------------------
MandaliaRandom = {}
MandaliaRandom.logname = "ch1_random_encount21.log"

function MandaliaRandom.logHeader()
	debugPrint(string.format("### down (select Mandalia)"))
	--debugPrint(string.format("### up   (select Igros)"))
	debugPrint(string.format("    job id: 0x5e=chocobo, 0x61=goblin, 0x67=redpanther"))
	--debugPrint(string.format("    1 formation, 0 soldier office, cheat"))
	--debugPrint(string.format("    0 formation, 0 soldier office, cheat"))
	--debugPrint(string.format("    0 formation, 1 soldier office (jumped 28 rng)"))
	debugPrint(string.format(""))
end

--function MandaliaRandom.pre_attempt()
--	-- move Mandalia From Formation
--	--fadv(2)
--	pressBtn({up=1}, 1)
--	pressBtn({circle=1}, 3)
--	pressBtn({down=1}, 1)  -- enemy status is changed whether down or up
--	pressBtn({up=1}, 1)  -- enemy status is changed whether down or up
--end


function MandaliaRandom.pre_attempt()
	-- move Mandalia From Gariland
	fadv(2)
	pressBtn({triangle=1}, 5)
	pressBtn({circle=1}, 3)
	pressBtn({down=1}, 1)  -- enemy status is changed whether down or up
	--pressBtn({up=1}, 1)  -- enemy status is changed whether down or up
end


--function MandaliaRandom.pre_attempt()
--	fadv(4)
--end

--function MandaliaRandom.pre_attempt2()
--	--exitFormation()
--	pressBtn({x=1}, 5)
--	pressBtn({x=1}, 1)
--	fadv(44)
--	-- move Gariland From Formation
--	pressBtn({up=1}, 1)
--	pressBtn({circle=1}, 3)
--	pressBtn({up=1}, 1)
--	pressBtn({circle=1}, 1)
--	fadv(6)
--	-- wait until arrive
--	local arrived = memory.readword(adr_on_location)
--	while arrived ~= 0x01 do
--		fadv(1)
--		arrived = memory.readword(adr_on_location)
--	end
--	-- moveMandaliaFromGariland
--	pressBtn({triangle=1}, 5)
--	pressBtn({circle=1}, 3)
--	pressBtn({down=1}, 1)
--	local fc = emu.framecount()
--	fadv(68691 - fc)
--end

function MandaliaRandom.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function MandaliaRandom.post_attempt()
	-- pass
end

function MandaliaRandom.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 10
	local enemy = 0
	local str
	local lagcount = emu.lagcount()

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

	debugPrint(string.format("-- enemy = %2d, lagcount = %d", enemy, lagcount))
	if enemy < 3 then
		print(string.format("-- enemy = %2d, lagcount = %d", enemy, lagcount))
		ret = true
	else
		ret = false
	end

	return ret
end


------------------------------------------------------------
-- Mathable
------------------------------------------------------------
Mathable = {}
Mathable.logname = "chX-mathable.log"
Mathable.prime = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97}

function Mathable.logHeader()
	-- pass
end

function Mathable.pre_attempt()
	fadv(3)
end

function Mathable.attempt()
	pressBtn({circle=1}, 1)
	fadv(900)
end

function Mathable.post_attempt()
	-- pass
end

function Mathable.success()
	local ret = false
	local prpt = {}
	local ofs_unit = adr_battle_unit
	local total_enemy = 6
	local enemy = 0
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if math.fmod(prpt.exp, 3) == 0 then
			str = str.." , 3"
		elseif math.fmod(prpt.exp, 4) == 0 then
			str = str.." , 4"
		elseif math.fmod(prpt.exp, 5) == 0 then
			str = str.." , 5"
		else
			for i, v in ipairs(Mathable.prime) do
				if prpt.exp == v then
					str = str.." , prime"
					break
				end
			end
		end

		debugPrint(str)
	end

	debugPrint(string.format("-- enemy = %2d", enemy))
	if enemy > 0 then
		print(string.format("-- enemy = %2d", enemy))
		ret = true
	else
		ret = false
	end

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
	local str

	for i=1, total_enemy do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		if Bunit.isRandomExists(prpt) ~= 0 then
			enemy = enemy + 1
			str = str.." , random exists"
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
	debugPrint(string.format("Ramza = 0x90 = Capricorn"))
	debugPrint(string.format(" * good: 0x10, 0x50, very good: 0x30"))
	debugPrint(string.format(" * bad : 0x00, 0x60, very bad : 0x30"))
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
		local bad = 0
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0
		str = prpt.info

		compatibility = Zodiac.checkCompatibilityRamza(prpt.zodiac, prpt.gender)
		str = string.format("%s, %s", str, Zodiac.notation[compatibility])
		if compatibility < 3 then
			bad = bad + 1
			str = str.." , bad"
		end
		if prpt.faith < 55 then
			bad = bad + 1
			str = str.." , unfaith"
		end
		if bad > 0 then
			enemy = enemy + 1
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
	local matched =  0
	local str

	prpt = Bunit.readProperty(ofs_unit)
	str = prpt.info

	if Bunit.isLearnedLightningStab(prpt) ~= 0 and prpt.lv > 26 then
		print(string.format("-- skill = %x, lv = %2d", prpt.base_action_learned1, prpt.lv))
		str = str.." , Lightning Stab"
		matched = matched + 1
	end

	if Bunit.isLearnedMove1(prpt) ~= 0 then
		print(string.format("-- base_r_s_m_learned3 = %x, Move+1", prpt.base_r_s_m_learned3))
		str = str.." , Move+1"
		matched = matched + 1
	end

	if matched > 1 then
		ret = true
	end

	debugPrint(str)
	return ret
end

