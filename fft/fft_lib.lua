-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This is a library of fft.
--
-- Usage
--   1. require "fft_lib"
--


------------------------------------------------------------
-- address
------------------------------------------------------------

-- RNG, 4byte
adr_rng = 0x9010

--adr_formation_unit   = 0x054FE4  --  1st unit in JP v1.0,  -314h,    +0h
adr_formation_unit   = 0x0552F8  --  1st unit in JP v1.1,    +0h,  +314h
--adr_formation_unit   = 0x057F74  --  1st unit in US     , +2C7Ch, +2F90h

adr_formation_unit1  = adr_formation_unit                -- 1st unit 0x0552F8
adr_formation_unit2  = adr_formation_unit + (0x100 * 1)  -- 2nd unit 0x0553F8
adr_formation_unit3  = adr_formation_unit + (0x100 * 2)  -- 3rd unit 0x0554F8
adr_formation_unit4  = adr_formation_unit + (0x100 * 3)  -- 4th unit 0x0555F8
adr_formation_unit5  = adr_formation_unit + (0x100 * 4)  -- 5th unit 0x0556F8
adr_formation_unit6  = adr_formation_unit + (0x100 * 5)  -- 6th unit 0x0557F8
adr_formation_unit7  = adr_formation_unit + (0x100 * 6)  -- 7th unit 0x0558F8
adr_formation_unit8  = adr_formation_unit + (0x100 * 7)  -- 8th unit 0x0559F8
adr_formation_unit9  = adr_formation_unit + (0x100 * 8)  -- 9th unit 0x055AF8



--adr_battle_unit   = 0x18E898  --  1st unit in JP v1.0 ,    +0h??
adr_battle_unit   = 0x18E898  --  1st unit in JP v1.1 ,    +0h
--adr_battle_unit   = 0x1908CC  --  1st unit in US      , +2034h

adr_battle_unit1  = adr_battle_unit                 --  1st unit 0x18E898
adr_battle_unit2  = adr_battle_unit + (0x1C0 * 1)   --  2nd unit 0x18EA58
adr_battle_unit3  = adr_battle_unit + (0x1C0 * 2)   --  3rd unit 0x18EC18
adr_battle_unit4  = adr_battle_unit + (0x1C0 * 3)   --  4th unit 0x18EDD8
adr_battle_unit5  = adr_battle_unit + (0x1C0 * 4)   --  5th unit 0x18EF98
adr_battle_unit6  = adr_battle_unit + (0x1C0 * 5)   --  6th unit 0x18F158
adr_battle_unit7  = adr_battle_unit + (0x1C0 * 6)   --  7th unit 0x18F318
adr_battle_unit8  = adr_battle_unit + (0x1C0 * 7)   --  8th unit 0x18F4D8
adr_battle_unit9  = adr_battle_unit + (0x1C0 * 8)   --  9th unit 0x18F698
adr_battle_unit10 = adr_battle_unit + (0x1C0 * 9)   -- 10th unit 0x18F858
-- 17th and older units are our party.
adr_battle_unit17 = adr_battle_unit + (0x1C0 * 16)  -- 17th unit 0x190498
adr_battle_unit18 = adr_battle_unit + (0x1C0 * 17)  -- 18th unit 0x190658
adr_battle_unit19 = adr_battle_unit + (0x1C0 * 18)  -- 19th unit 0x190818
adr_battle_unit20 = adr_battle_unit + (0x1C0 * 19)  -- 20th unit 0x1909D8
adr_battle_unit21 = adr_battle_unit + (0x1C0 * 20)  -- 21th unit 0x190B98



adr_pad_input_battle = 0x044778 -- US:0x045944, JP1.0:0x03258C, 4byte, controller input in battle/event
adr_pad_input_world  = 0xFFFFFF -- US:0x19A204, JP1.0:0x19087C, 4byte, controller input in world map/formation

adr_game_fc        = 0x0315E8 -- US:0x0317B8, JP1.0:0xFFFFFF, 4byte, game frame counter

adr_milsecs        = 0x0447EC -- US:0x0459B8, JP1.0:0x0444D8, 4byte
adr_seconds        = 0x0447F0 -- US:0x0459BC, JP1.0:0x0444DC, 4byte
adr_minutes        = 0x0447F4 -- US:0x0459C0, JP1.0:0x0444E0, 4byte
adr_hours          = 0x0447F8 -- US:0x0459C4, JP1.0:0x0444E4, 4byte

adr_session_param  = 0x04BE78 -- US:0x04EAF4, JP1.0:0x04BB64, 4byte, ???
adr_cur_session    = 0x054A9C -- US:0x057718, JP1.0:0x054788, 4byte, session frame counter

adr_wheather       = 0x054B2C -- US:0x0577A8, JP1.0:0x544818, ?byte, Wheather
adr_event_id       = 0x054B3C -- US:0xFFFFFF, JP1.0:0xFFFFFF, 1byte, EventID
adr_locks_input    = 0x054B44 -- US:0x0577C0, JP1.0:0x054830, ?byte, locks controller input
	--0x0001 - L2
	--0x0002 - R2
	--0x0004 - L1
	--0x0008 - L2
	--0x0080 - Square
	--0x0040 - X
	--0x0020 - circle
	--0x0010 - triangle
	--0x0100 - Select
	--0x0200 -
	--0x0400 -
	--0x0800 -
	--0x1000 - Up
	--0x2000 - Right
	--0x4000 - Down
	--0x8000 - Left

adr_gil_lo         = 0x054B50 -- US:0x0577CC, JP1.0:0x05483C, 2byte, Gil
adr_gil_hi         = 0x054B52 -- US:0x0577CE, JP1.0:0x05483E, 2byte, Gil
adr_month          = 0x054B58 -- US:0x0577D4, JP1.0:0x054844, 4byte, Month
adr_day            = 0x054B5C -- US:0x0577D8, JP1.0:0x054848, 4byte, Day
adr_cur_location   = 0x054B64 -- US:0x0577E0, JP1.0:0x054850, ?byte, Current Location
adr_entd_data_id   = 0x054B68 -- US:0x0577E4, JP1.0:0x054854, 4byte, enemy set to be loaded
adr_map_id         = 0x054B6C -- US:0x0577E8, JP1.0:0x054858, 4byte, battle map ID
adr_event_bytes    = 0x054BFC -- US:0x057878, JP1.0:0xFFFFFF, 4byte, Event Byte Counter? (maybe just text?)

adr_furshop_inventory = 0x056818 -- US:0x059494, JP1.0:0xFFFFFF, byte[256]
adr_item_inventory    = 0x056A44 -- US:0x0596E0, JP1.0:0x056730, byte[256]

-- BATTLE.bin
adr_current_entd   = 0x06358C -- US:0x066238, JP1.0:0x063278, 4byte, Current ENTD Pointer
adr_highest_lv     = 0x06365C -- US:0x066308, JP1.0:0x063348, 1byte, Highest Party Level

adr_world_debug_menu  = 0x18E708 -- US:0x198090, JP1.0:0x18E3F4, debug mode
	-- set 5, 6, 7, 8, then open menu in world map. debug mode??
adr_battle_debug_menu = 0xFFFFFF -- US:0x16BC1C, JP1.0:0xFFFFFF, debug mode
	-- set 3??
adr_debug_menu        = 0x04A9C4 -- US:0xFFFFFF, JP1.0:0xFFFFFF, debug mode


-- WLDCORE.bin
adr_encount_param1 = 0x097F80 -- US:0x096A40, JP1.0:0x097F80, 4byte, ???
adr_encount_param2 = 0x0A076C -- US:0x09F248, JP1.0:0x0A076C, 4byte, ???
adr_encount_param3 = 0x0D105C -- US:0x0D0B38, JP1.0:0x0D105C, 4byte, ???
adr_on_location    = 0x0D10A0 -- US:0x0D0B7C, JP1.0:0x0D10A0, 4byte, 1:on the location 0:on may way
adr_src_loc        = 0x0D10B0 -- US:0x0D0B8C, JP1.0:0x0D10B0, 4byte, src location
adr_dest_loc       = 0x0D10B4 -- US:0x0D0B90, JP1.0:0x0D10B4, 4byte, dest location



------------------------------------------------------------
-- Formation Unit in world map
------------------------------------------------------------
Funit = {}

-- property of unit
Funit.ch       = 0x00  -- 1byte
Funit.no       = 0x01  -- 1byte
Funit.job      = 0x02  -- 1byte
Funit.palette  = 0x03  -- 1byte
Funit.gender   = 0x04  -- 1byte
	-- 0x80:male, 0x40:female, 0x20:monster, 0x10:JoinAfterEvent, 0x04:egg??
Funit.birthday = 0x05  -- 1byte
Funit.zodiac   = 0x06  -- 1byte, high bit(4-7bit)
-- offset 0x07 to 0x0C is set abilyties
-- offset 0x0E to 0x14 is equipment
Funit.exp      = 0x15  -- 1byte
Funit.lv       = 0x16  -- 1byte
Funit.brave    = 0x17  -- 1byte
Funit.faith    = 0x18  -- 1byte
Funit.hpp1     = 0x19  -- 1byte, hp point1
Funit.hpp2     = 0x1A  -- 1byte, hp point2
Funit.hpp3     = 0x1B  -- 1byte, hp point3
Funit.mpp1     = 0x1C  -- 1byte, mp point1
Funit.mpp2     = 0x1D  -- 1byte, mp point2
Funit.mpp3     = 0x1E  -- 1byte, mp point3
Funit.spp1     = 0x1F  -- 1byte, speed point1
Funit.spp2     = 0x20  -- 1byte, speed point2
Funit.spp3     = 0x21  -- 1byte, speed point3
Funit.ph_atp1  = 0x22  -- 1byte, ph_at point1
Funit.ph_atp2  = 0x23  -- 1byte, ph_at point2
Funit.ph_atp3  = 0x24  -- 1byte, ph_at point3
Funit.mg_atp1  = 0x25  -- 1byte, mg_at point1
Funit.mg_atp2  = 0x26  -- 1byte, mg_at point2
Funit.mg_atp3  = 0x27  -- 1byte, mg_at point3

-- offset 0x28 to 0x63 is abilyties learned
-- offset 0x64 to 0x6D is job level
-- job level includes 2 jobs in 1byte. split high 4bit and low 4bit.
Funit.joblv_squire_chemist = 0x64

-- offset 0x6E to 0x94 is JP in jobs
Funit.JP_squire     = 0x6E
Funit.JP_chemist    = 0x70
Funit.JP_knight     = 0x72
Funit.JP_archer     = 0x74
Funit.JP_monk       = 0x76
Funit.JP_priest     = 0x78
Funit.JP_wizard     = 0x7A
Funit.JP_time_mage  = 0x7C
Funit.JP_summoner   = 0x7E
Funit.JP_thief      = 0x80
Funit.JP_mediator   = 0x82
Funit.JP_oracle     = 0x84
Funit.JP_geomancer  = 0x86
Funit.JP_lancer     = 0x88
Funit.JP_samurai    = 0x8A
Funit.JP_ninja      = 0x8C
Funit.JP_calculator = 0x8E
Funit.JP_bard       = 0x90
Funit.JP_dancer     = 0x92
Funit.JP_mime       = 0x94

-- offset 0x96 to 0xBC is total JP in jobs
Funit.total_JP_squire     = 0x96
Funit.total_JP_chemist    = 0x98
Funit.total_JP_knight     = 0x9A
Funit.total_JP_archer     = 0x9C
Funit.total_JP_monk       = 0x9E
Funit.total_JP_priest     = 0xA0
Funit.total_JP_wizard     = 0xA2
Funit.total_JP_time_mage  = 0xA4
Funit.total_JP_summoner   = 0xA6
Funit.total_JP_thief      = 0xA8
Funit.total_JP_mediator   = 0xAA
Funit.total_JP_oracle     = 0xAC
Funit.total_JP_geomancer  = 0xAE
Funit.total_JP_lancer     = 0xB0
Funit.total_JP_samurai    = 0xB2
Funit.total_JP_ninja      = 0xB4
Funit.total_JP_calculator = 0xB6
Funit.total_JP_bard       = 0xB8
Funit.total_JP_dancer     = 0xBA
Funit.total_JP_mime       = 0xBC

-- offset 0xBE to 0xCD is name strings
Funit.dialogue = 0xCE -- 2byte
Funit.separate = 0xD0 -- 1byte. 0:nomal, 1:separated, 2:disappeared


function Funit.readProperty(ofs_unit)
	local prpt = {}

	-- Read the property
	prpt.ch        = memory.readbyte(ofs_unit + Funit.ch       )
	prpt.no        = memory.readbyte(ofs_unit + Funit.no       )
	prpt.job       = memory.readbyte(ofs_unit + Funit.job      )
	prpt.palette   = memory.readbyte(ofs_unit + Funit.palette  )
	prpt.gender    = memory.readbyte(ofs_unit + Funit.gender   )
	prpt.birthday  = memory.readbyte(ofs_unit + Funit.birthday )
	prpt.zodiac    = memory.readbyte(ofs_unit + Funit.zodiac   )

	prpt.exp       = memory.readbyte(ofs_unit + Funit.exp      )
	prpt.lv        = memory.readbyte(ofs_unit + Funit.lv       )
	prpt.brave     = memory.readbyte(ofs_unit + Funit.brave    )
	prpt.faith     = memory.readbyte(ofs_unit + Funit.faith    )

	prpt.hpp1      = bit.band(memory.readdword(ofs_unit + Funit.hpp1), 0xFFFFFF)  -- use 3byte
	prpt.mpp1      = bit.band(memory.readdword(ofs_unit + Funit.mpp1), 0xFFFFFF)  -- use 3byte
	prpt.spp1      = bit.band(memory.readdword(ofs_unit + Funit.spp1), 0xFFFFFF)  -- use 3byte

	prpt.JP_squire     = memory.readword(ofs_unit + Funit.JP_squire     )
	prpt.JP_chemist    = memory.readword(ofs_unit + Funit.JP_chemist    )
	prpt.JP_priest     = memory.readword(ofs_unit + Funit.JP_priest     )
	prpt.JP_wizard     = memory.readword(ofs_unit + Funit.JP_wizard     )
	prpt.JP_time_mage  = memory.readword(ofs_unit + Funit.JP_time_mage  )
	prpt.JP_oracle     = memory.readword(ofs_unit + Funit.JP_oracle     )
	prpt.JP_calculator = memory.readword(ofs_unit + Funit.JP_calculator )

	prpt.total_JP_squire     = memory.readword(ofs_unit + Funit.total_JP_squire     )
	prpt.total_JP_chemist    = memory.readword(ofs_unit + Funit.total_JP_chemist    )
	prpt.total_JP_priest     = memory.readword(ofs_unit + Funit.total_JP_priest     )
	prpt.total_JP_wizard     = memory.readword(ofs_unit + Funit.total_JP_wizard     )
	prpt.total_JP_time_mage  = memory.readword(ofs_unit + Funit.total_JP_time_mage  )
	prpt.total_JP_oracle     = memory.readword(ofs_unit + Funit.total_JP_oracle     )
	prpt.total_JP_calculator = memory.readword(ofs_unit + Funit.total_JP_calculator )

	prpt.info = Funit.toString(prpt)
	return prpt
end

Funit.info_header = "| ch, no, job, zodiac | lv, exp, brave, faith | squire, chemist, priest, wizard, time, oracle, calc | mpp1 |"

function Funit.toString(prpt)
	local str = string.format("%2x,%2x,%2x,%2x," 
			.." %2d,%2d,%2d,%2d,"
			.." %d,%d,%d,%d,%d,%d,%d,"
			.." %d",
			prpt.ch      ,
			prpt.no      ,
			prpt.job     ,
			prpt.zodiac  ,

			prpt.lv      ,
			prpt.exp     ,
			prpt.brave   ,
			prpt.faith   ,

			prpt.total_JP_squire     ,
			prpt.total_JP_chemist    ,
			prpt.total_JP_priest     ,
			prpt.total_JP_wizard     ,
			prpt.total_JP_time_mage  ,
			prpt.total_JP_oracle     ,
			prpt.total_JP_calculator ,

			prpt.mpp1    )
	return str
end

function Funit.showAll()
	local prpt = {}
	local ofs_unit = adr_formation_unit

	print(string.format("-- Funit --"))
	for i=1, 20 do
		prpt = Funit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x100

		print(prpt.info)
	end
end

function Funit.drawAll(x, y)
	x = x or 0
	y = y or 20

	local prpt = {}
	local ofs_unit = adr_formation_unit

	for i=1, 20 do
		prpt = Funit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x100

		gui.text(x, y+(8*i) , prpt.info)
	end
end


------------------------------------------------------------
-- Battle Unit
------------------------------------------------------------
Bunit = {}

-- property of unit
Bunit.ch        = 0x00  -- 1byte
Bunit.no        = 0x01  -- 1byte, unit id in battle, 0xFF Unit doesn't exist.
Bunit.party     = 0x02  -- 1byte, party id in formation
Bunit.job       = 0x03  -- 1byte
Bunit.palette   = 0x04  -- 1byte, palette??
Bunit.entd_flag = 0x05  -- 1byte, ENTD Flags, friend or enemy
	-- 0x80 - Always Present
	-- 0x40 - Randomly Present
	-- 0x3X - Green Team
	-- 0x2X - Light Blue Team
	-- 0x1X - Red Team
	-- 0x0X - Blue Team
	-- 0x08 - Control
	-- 0x04 - Immortal (also immune to knockback, poach, malboro, etc.)
	-- 0x02 - (both set by Ramza when initialized)
	-- 0x01 -
Bunit.gender    = 0x06  -- 1byte
	-- 0x80:male, 0x40:female, 0x20:monster, 0x10:JoinAfterEvent
	-- 0x08:load formation, 0x04:hide status, 0x02: , 0x01:save formation
Bunit.deathct   = 0x07  -- 1byte, Death counter. unit becomes crystal at 0.
Bunit.birthday  = 0x08  -- 1byte
Bunit.zodiac    = 0x09  -- 1byte, high bit(4-7bit)

Bunit.innate_ability1   = 0x0A  -- 2byte, Innate Ability 1
Bunit.innate_ability2   = 0x0C  -- 2byte, Innate Ability 2
Bunit.innate_ability3   = 0x0E  -- 2byte, Innate Ability 3
Bunit.innate_ability4   = 0x10  -- 2byte, Innate Ability 4
Bunit.primary_skill     = 0x12  -- 1byte, Primary Skillset
Bunit.secondary_skill   = 0x13  -- 1byte, Secondary Skillset
Bunit.reaction_ability  = 0x14  -- 2byte, Reaction Ability
Bunit.support_ability   = 0x16  -- 2byte, Support Ability
Bunit.movement_ability  = 0x18  -- 2byte, Movement Ability
Bunit.head              = 0x1A  -- 1byte, Head
Bunit.body              = 0x1B  -- 1byte, Body
Bunit.accessory         = 0x1C  -- 1byte, Accessory
Bunit.right_hand_weapon = 0x1D  -- 1byte, Right Hand Weapon
Bunit.right_hand_shield = 0x1E  -- 1byte, Right Hand Shield
Bunit.left_hand_weapon  = 0x1F  -- 1byte, Left Hand Weapon
Bunit.left_hand_shield  = 0x20  -- 1byte, Left Hand Shield

Bunit.exp         = 0x21  -- 1byte
Bunit.lv          = 0x22  -- 1byte
Bunit.brave_org   = 0x23  -- 1byte
Bunit.brave       = 0x24  -- 1byte
Bunit.faith_org   = 0x25  -- 1byte
Bunit.faith       = 0x26  -- 1byte
Bunit.ofs27       = 0x27  -- 1byte
Bunit.hp          = 0x28  -- 2byte
Bunit.max_hp      = 0x2A  -- 2byte
Bunit.mp          = 0x2C  -- 2byte
Bunit.max_mp      = 0x2E  -- 2byte
Bunit.ph_at_org   = 0x30  -- 1byte
Bunit.mg_at_org   = 0x31  -- 1byte
Bunit.speed_org   = 0x32  -- 1byte
Bunit.ph_at_bonus = 0x33  -- 1byte
Bunit.mg_at_bonus = 0x34  -- 1byte
Bunit.speed_bonus = 0x35  -- 1byte
Bunit.ph_at       = 0x36  -- 1byte
Bunit.mg_at       = 0x37  -- 1byte
Bunit.speed       = 0x38  -- 1byte
Bunit.ct          = 0x39  -- 1byte
Bunit.move        = 0x3A  -- 1byte
Bunit.jump        = 0x3B  -- 1byte
-- offset 0x3C to 0x46 is Wep.Power, A-EV, S-EV, C-EV
Bunit.X_crd       = 0x47  -- 1byte
Bunit.Y_crd       = 0x48  -- 1byte
Bunit.direct      = 0x49  -- 1byte, 0x80: higher elevation, 0x03: facing direction

-- offset 0x4A to 0x4D is equip bytes.

-- offset 0x4E to 0x52 is auto status flags.
Bunit.status_auto1   = 0x4E  -- 1byte
Bunit.status_auto2   = 0x4F  -- 1byte
Bunit.status_auto3   = 0x50  -- 1byte
Bunit.status_auto4   = 0x51  -- 1byte
Bunit.status_auto5   = 0x52  -- 1byte

-- offset 0x53 to 0x57 is immune status flags.
Bunit.status_immune1 = 0x53  -- 1byte
Bunit.status_immune2 = 0x54  -- 1byte
Bunit.status_immune3 = 0x55  -- 1byte
Bunit.status_immune4 = 0x56  -- 1byte
Bunit.status_immune5 = 0x57  -- 1byte

-- offset 0x58 to 0x5C is current?? good/bad status flags.
Bunit.status_cur1    = 0x58  -- 1byte
	-- 0x80
	-- 0x40 Crystal
	-- 0x20 Dead
	-- 0x10 Undead
	-- 0x08 Charging
	-- 0x04 Jump
	-- 0x02 Defending
	-- 0x01 Performing
Bunit.status_cur2    = 0x59  -- 1byte
	-- 0x80 Petrify
	-- 0x40 Invite
	-- 0x20 Darkness
	-- 0x10 Confusion
	-- 0x08 Silence
	-- 0x04 Blood Suck
	-- 0x02 Cursed
	-- 0x01 Treasure
Bunit.status_cur3    = 0x5A  -- 1byte
	-- 0x80 Oil
	-- 0x40 Float
	-- 0x20 Reraise
	-- 0x10 Transparent
	-- 0x08 Berserk
	-- 0x04 Chicken
	-- 0x02 Frog
	-- 0x01 Critical
Bunit.status_cur4    = 0x5B  -- 1byte
	-- 0x80 Poison
	-- 0x40 Regen
	-- 0x20 Protect
	-- 0x10 Shell
	-- 0x08 Haste
	-- 0x04 Slow
	-- 0x02 Stop
	-- 0x01 Wall
Bunit.status_cur5    = 0x5C  -- 1byte
	-- 0x80 Faith
	-- 0x40 Innocent
	-- 0x20 Charm
	-- 0x10 Sleep
	-- 0x08 Don't Move
	-- 0x04 Don't Act
	-- 0x02 Reflect
	-- 0x01 Death Sentence

-- offset 0x5D to 0x6C is CT of each skills.
-- offset 0x6D to 0x71 is elemental compatibility
-- offset 0x72 to 0x8A is raw stat and stat multiplier

-- offset 0x8B to 0x8E is reaction abilities
Bunit.reaction_active1   = 0x8B  -- 1byte
Bunit.reaction_active2   = 0x8C  -- 1byte
Bunit.reaction_active3   = 0x8D  -- 1byte
Bunit.reaction_active4   = 0x8E  -- 1byte

-- offset 0x8F to 0x92 is support  abilities
Bunit.support_active1    = 0x8F  -- 1byte
Bunit.support_active2    = 0x90  -- 1byte
	-- 0x40:Gained JP-UP
Bunit.support_active3    = 0x91  -- 1byte
Bunit.support_active4    = 0x92  -- 1byte

-- offset 0x93 to 0x95 is movement abilities
Bunit.movement_active1   = 0x93  -- 1byte
Bunit.movement_active2   = 0x94  -- 1byte
Bunit.movement_active3   = 0x95  -- 1byte

-- offset 0x96 to 0x98 is movement abilities
Bunit.unlocked_jobs1_8   = 0x96  -- 1byte
Bunit.unlocked_jobs9_16  = 0x97  -- 1byte
Bunit.unlocked_jobs17_20 = 0x98  -- 1byte

-- offset 0x99 to 0xD1 is action   abilities
Bunit.base_action_learned1 = 0x99  -- 1byte
	-- 0x80:Accumulate / Stasis Sword
	-- 0x40:Dash / Split Punch
	-- 0x20:Throw Stone / Crus Punch
	-- 0x10:Heal / Lightning Stab
	-- 0x08:Yell / Holy Explosion
	-- 0x04:Wish
	-- 0x02:Cheer Up
	-- 0x01:Scream
Bunit.base_action_learned2 = 0x9A  -- 1byte
Bunit.base_r_s_m_learned3  = 0x9B  -- 1byte
	-- 0x80:Counter Tackle, 0x40:Equip Axe, 0x20:Monster Skill, 0x10:Defend
	-- 0x08:Gained JP-UP, 0x04:Move+1

Bunit.chemist_action_learned1   = 0x9C  -- 1byte
Bunit.chemist_action_learned2   = 0x9D  -- 1byte
Bunit.chemist_r_s_m_learned3    = 0x9E  -- 1byte
Bunit.knight_action_learned1    = 0x9F  -- 1byte
Bunit.knight_action_learned2    = 0xA0  -- 1byte
Bunit.knight_r_s_m_learned3     = 0xA1  -- 1byte
Bunit.archer_action_learned1    = 0xA2  -- 1byte
Bunit.archer_action_learned2    = 0xA3  -- 1byte
Bunit.archer_r_s_m_learned3     = 0xA4  -- 1byte
Bunit.monk_action_learned1      = 0xA5  -- 1byte
Bunit.monk_action_learned2      = 0xA6  -- 1byte
Bunit.monk_r_s_m_learned3       = 0xA7  -- 1byte
Bunit.priest_action_learned1    = 0xA8  -- 1byte
Bunit.priest_action_learned2    = 0xA9  -- 1byte
Bunit.priest_r_s_m_learned3     = 0xAA  -- 1byte
Bunit.wizard_action_learned1    = 0xAB  -- 1byte
Bunit.wizard_action_learned2    = 0xAC  -- 1byte
Bunit.wizard_r_s_m_learned3     = 0xAD  -- 1byte
Bunit.time_mage_action_learned1 = 0xAE  -- 1byte
Bunit.time_mage_action_learned2 = 0xAF  -- 1byte
Bunit.time_mage_r_s_m_learned3  = 0xB0  -- 1byte
Bunit.summoner_action_learned1  = 0xB1  -- 1byte
Bunit.summoner_action_learned2  = 0xB2  -- 1byte
Bunit.summoner_r_s_m_learned3   = 0xB3  -- 1byte
Bunit.thief_action_learned1     = 0xB4  -- 1byte
Bunit.thief_action_learned2     = 0xB5  -- 1byte
Bunit.thief_r_s_m_learned3      = 0xB6  -- 1byte




-- offset 0xD2 to 0xDB is job level
-- job level includes 2 jobs in 1byte. split high 4bit and low 4bit.

-- offset 0xDC to 0x102 is JP in jobs
Bunit.JP_squire     = 0xDC
Bunit.JP_chemist    = 0xDE
Bunit.JP_knight     = 0xE0
Bunit.JP_archer     = 0xE2
Bunit.JP_monk       = 0xE4
Bunit.JP_priest     = 0xE6
Bunit.JP_wizard     = 0xE8
Bunit.JP_time_mage  = 0xEA
Bunit.JP_summoner   = 0xEC
Bunit.JP_thief      = 0xEE
Bunit.JP_mediator   = 0xF0
Bunit.JP_oracle     = 0xF2
Bunit.JP_geomancer  = 0xF4
Bunit.JP_lancer     = 0xF6
Bunit.JP_samurai    = 0xF8
Bunit.JP_ninja      = 0xFA
Bunit.JP_calculator = 0xFC
Bunit.JP_bard       = 0xFE
Bunit.JP_dancer     = 0x100
Bunit.JP_mime       = 0x102

-- offset 0x104 to 0x12A is total JP in jobs
Bunit.total_JP_squire     = 0x104
Bunit.total_JP_chemist    = 0x106
Bunit.total_JP_knight     = 0x108
Bunit.total_JP_archer     = 0x10A
Bunit.total_JP_monk       = 0x10C
Bunit.total_JP_priest     = 0x10E
Bunit.total_JP_wizard     = 0x110
Bunit.total_JP_time_mage  = 0x112
Bunit.total_JP_summoner   = 0x114
Bunit.total_JP_thief      = 0x116
Bunit.total_JP_mediator   = 0x118
Bunit.total_JP_oracle     = 0x11A
Bunit.total_JP_geomancer  = 0x11C
Bunit.total_JP_lancer     = 0x11E
Bunit.total_JP_samurai    = 0x120
Bunit.total_JP_ninja      = 0x122
Bunit.total_JP_calculator = 0x124
Bunit.total_JP_bard       = 0x126
Bunit.total_JP_dancer     = 0x128
Bunit.total_JP_mime       = 0x12A

-- offset 0x012C - 0x013B Unit Name
-- offset 0x013C - 0x0149 Job Name
-- offset 0x014C - 0x0153 Primary Skillset Name (first 8 bytes)
-- offset 0x0154 - 0x015B Secondary Skillset Name (First 8 bytes)
-- offset 0x015c - 01 if dead
-- offset 0x015d - Current Ability CT
-- offset 0x015e - Graphic
-- offset 0x015f - Portrait
-- offset 0x0160 - Palette
Bunit.entd_id       = 0x161 -- 1byte, ENTD ID
-- offset 0x0162 - Special Skillset? (Specials set their skillset here)
-- offset 0x0163 - War Trophy
-- offset 0x0164 - Bonus Money Mod (* 100 = Gil)
-- offset 0x0165 - X Location? (For where AI tends to stay near)
-- offset 0x0166 - Y Location?
-- offset 0x0167 - AI/Autobattle setting
	-- 0x40 - Focus on target?
	-- 0x20 - Stay near X/Y? (+0x08 = never move once there)
	-- 0x10 - more aggressive?
	-- 0x08 - Coward-like?
	-- 0x04 -
	-- 0x02 -
	-- 0x01 -
Bunit.prioritized_target  = 0x168  -- 1byte, Prioritized Target
-- offset 0x016C - Unit Quote/Name ID


-- offset 0x016E - 0x018B, Target Data for action
-- offset 0x016F - Skillset of last attack used
-- offset 0x0170 - Currently Charging/Performing Action
-- offset 0x017A
	-- 0x10 = Stepping Stone
	-- 0x01 = Walkable
-- offset 0x0182 - Mount Info
	--	0x80 - Unit ID of ridden Unit
	--	0x40 - Being Ridden
	--	0x20 -
	--	0x1f - ID of unit Riding/Being ridden by this unit
Bunit.unit_exist = 0x183  -- 1byte
-- offset 0x0183 - Dealing with unit's ability to appear in battle?
	-- (FF if unit can't exist?)
	-- (01 if unit exists, 00 if not (but later can?)?)
	-- 0x80 - Was active, but is now disabled?
	-- 0x02 - Unit will be removed from party? (no longer exists, treas/cryst?)
-- offset 0x0184 Equipped Booleans
	-- 0x08 - Sword Equipped
	-- 0x04 - Materia Blade Equipped

Bunit.cur_turn   = 0x186  -- 1byte
Bunit.moved      = 0x187  -- 1byte
Bunit.actioned   = 0x188  -- 1byte
Bunit.turn_ended = 0x189  -- 1byte
	-- 0x04: target learning ability?
	-- 0x02: Target hit by ability?
	-- 0x01: Turn ended (set to 01 when reacting)
Bunit.unit_id_ff = 0x18A  -- 1byte, Unit ID (without "Unit Exists" check), see Bunit.no
Bunit.ability_ct = 0x18B  -- 1byte, Ability CT

-- offst 0x018C - 0x01BF , Current Action DATA
Bunit.hit_miss   = 0x18C  -- 1byte, 0x01:hit, 0x00:miss
Bunit.critical   = 0x18D  -- 1byte, 0x01:critical, 0x00:regular
Bunit.miss_type  = 0x18E  -- 1byte, 0x00:hit, 0x01:guarded, 0x02:guarded, 0x05:nullified, 0x06:miss, 0x07:catch
Bunit.item_lost  = 0x18F  -- 1byte, Item to break/use
-- offset 0x0190/0x04 - HP Damage
-- offset 0x0192/0x06 - HP Recovery
-- offset 0x0194/0x08 - MP Damage
-- offset 0x0196/0x0a - MP Recovery
-- offset 0x0198/0x0c - Gil Stolen/Lost
-- offset 0x019a/0x0e - Reaction ID
Bunit.effect_flag1  = 0x19C  -- 1byte, Special Flags 1
-- offset 0x019c/0x10 - Special Flags 1
	-- 0x80 - +1 Level
	-- 0x40 - Switch Team
	-- 0x20 - Poached
	-- 0x10 - Steal Item
	-- 0x08 - Stole targets item?
	-- 0x04 - Break Item
	-- 0x02 - Malboro (moldball virus)
	-- 0x01 - Golem
Bunit.effect_flag2  = 0x19D  -- 1byte, Special Flags 2
-- offset 0x019d/0x11 - Special Flags 2
	-- 0x80 - Reducing Golem Amount?
	-- 0x40 - Knockback
	-- 0x20 - 
	-- 0x10 - 
	-- 0x08 - Weakness?
	-- 0x04 - Absorption?
	-- 0x02 - Nullification? (Disabled by nullification)
	-- 0x01 - -1 Level
-- offset 0x019e/0x12 - SP Change
	-- 0x80 - Bonus Flag
-- offset 0x019f/0x13 - CT Change
	-- 0xFF = "Quick"
	-- 0x7F = "CT0"
	-- 0x80 - Bonus Flag

Bunit.attack_accuracy = 0x1B6  -- 1byte, Attack accuracy
Bunit.main_target     = 0x1B9  -- 1byte, Main target ID??
Bunit.entd_flag_cur   = 0x1BA  -- Modified ENTD Flags


function Bunit.readProperty(ofs_unit)
	local prpt = {}

	-- Read the property
	prpt.ch        = memory.readbyte(ofs_unit + Bunit.ch        )
	prpt.no        = memory.readbyte(ofs_unit + Bunit.no        )
	prpt.party     = memory.readbyte(ofs_unit + Bunit.party     )
	prpt.job       = memory.readbyte(ofs_unit + Bunit.job       )
	prpt.palette   = memory.readbyte(ofs_unit + Bunit.palette   )
	prpt.entd_flag = memory.readbyte(ofs_unit + Bunit.entd_flag )
	prpt.gender    = memory.readbyte(ofs_unit + Bunit.gender    )
	prpt.deathct   = memory.readbyte(ofs_unit + Bunit.deathct   )
	prpt.birthday  = memory.readbyte(ofs_unit + Bunit.birthday  )
	prpt.zodiac    = memory.readbyte(ofs_unit + Bunit.zodiac    )

	prpt.innate_ability1   = memory.readword(ofs_unit + Bunit.innate_ability1   )
	prpt.innate_ability2   = memory.readword(ofs_unit + Bunit.innate_ability2   )
	prpt.innate_ability3   = memory.readword(ofs_unit + Bunit.innate_ability3   )
	prpt.innate_ability4   = memory.readword(ofs_unit + Bunit.innate_ability4   )

	prpt.exp       = memory.readbyte(ofs_unit + Bunit.exp       )
	prpt.lv        = memory.readbyte(ofs_unit + Bunit.lv        )
	prpt.brave     = memory.readbyte(ofs_unit + Bunit.brave     )
	prpt.faith     = memory.readbyte(ofs_unit + Bunit.faith     )
	prpt.ofs27     = memory.readbyte(ofs_unit + Bunit.ofs27     )
	prpt.hp        = memory.readword(ofs_unit + Bunit.hp        )
	prpt.max_hp    = memory.readword(ofs_unit + Bunit.max_hp    )
	prpt.mp        = memory.readword(ofs_unit + Bunit.mp        )
	prpt.max_mp    = memory.readword(ofs_unit + Bunit.max_mp    )

	prpt.ph_at     = memory.readbyte(ofs_unit + Bunit.ph_at     )
	prpt.mg_at     = memory.readbyte(ofs_unit + Bunit.mg_at     )
	prpt.speed     = memory.readbyte(ofs_unit + Bunit.speed     )

	prpt.ct        = memory.readbyte(ofs_unit + Bunit.ct        )
	prpt.direct    = memory.readbyte(ofs_unit + Bunit.direct    )

	prpt.status_auto1   = memory.readbyte(ofs_unit + Bunit.status_auto1   )
	prpt.status_auto2   = memory.readbyte(ofs_unit + Bunit.status_auto2   )
	prpt.status_auto3   = memory.readbyte(ofs_unit + Bunit.status_auto3   )
	prpt.status_auto4   = memory.readbyte(ofs_unit + Bunit.status_auto4   )
	prpt.status_auto5   = memory.readbyte(ofs_unit + Bunit.status_auto5   )
	prpt.status_immune1 = memory.readbyte(ofs_unit + Bunit.status_immune1 )
	prpt.status_immune2 = memory.readbyte(ofs_unit + Bunit.status_immune2 )
	prpt.status_immune3 = memory.readbyte(ofs_unit + Bunit.status_immune3 )
	prpt.status_immune4 = memory.readbyte(ofs_unit + Bunit.status_immune4 )
	prpt.status_immune5 = memory.readbyte(ofs_unit + Bunit.status_immune5 )
	prpt.status_cur1    = memory.readbyte(ofs_unit + Bunit.status_auto1   )
	prpt.status_cur2    = memory.readbyte(ofs_unit + Bunit.status_auto2   )
	prpt.status_cur3    = memory.readbyte(ofs_unit + Bunit.status_auto3   )
	prpt.status_cur4    = memory.readbyte(ofs_unit + Bunit.status_auto4   )
	prpt.status_cur5    = memory.readbyte(ofs_unit + Bunit.status_auto5   )


	prpt.reaction_active1   = memory.readbyte(ofs_unit + Bunit.reaction_active1   )
	prpt.reaction_active2   = memory.readbyte(ofs_unit + Bunit.reaction_active2   )
	prpt.reaction_active3   = memory.readbyte(ofs_unit + Bunit.reaction_active3   )
	prpt.reaction_active4   = memory.readbyte(ofs_unit + Bunit.reaction_active4   )
	prpt.support_active1    = memory.readbyte(ofs_unit + Bunit.support_active1    )
	prpt.support_active2    = memory.readbyte(ofs_unit + Bunit.support_active2    )
	prpt.support_active3    = memory.readbyte(ofs_unit + Bunit.support_active3    )
	prpt.support_active4    = memory.readbyte(ofs_unit + Bunit.support_active4    )
	prpt.movement_active1   = memory.readbyte(ofs_unit + Bunit.movement_active1   )
	prpt.movement_active2   = memory.readbyte(ofs_unit + Bunit.movement_active2   )
	prpt.movement_active3   = memory.readbyte(ofs_unit + Bunit.movement_active3   )
	prpt.unlocked_jobs1_8   = memory.readbyte(ofs_unit + Bunit.unlocked_jobs1_8   )
	prpt.unlocked_jobs9_16  = memory.readbyte(ofs_unit + Bunit.unlocked_jobs9_16  )
	prpt.unlocked_jobs17_20 = memory.readbyte(ofs_unit + Bunit.unlocked_jobs17_20 )

	prpt.base_action_learned1      = memory.readbyte(ofs_unit + Bunit.base_action_learned1      )
	prpt.base_action_learned2      = memory.readbyte(ofs_unit + Bunit.base_action_learned2      )
	prpt.base_r_s_m_learned3       = memory.readbyte(ofs_unit + Bunit.base_r_s_m_learned3       )
	prpt.chemist_action_learned1   = memory.readbyte(ofs_unit + Bunit.chemist_action_learned1   )
	prpt.chemist_action_learned2   = memory.readbyte(ofs_unit + Bunit.chemist_action_learned2   )
	prpt.chemist_r_s_m_learned3    = memory.readbyte(ofs_unit + Bunit.chemist_r_s_m_learned3    )
	prpt.knight_action_learned1    = memory.readbyte(ofs_unit + Bunit.knight_action_learned1    )
	prpt.knight_action_learned2    = memory.readbyte(ofs_unit + Bunit.knight_action_learned2    )
	prpt.knight_r_s_m_learned3     = memory.readbyte(ofs_unit + Bunit.knight_r_s_m_learned3     )
	prpt.archer_action_learned1    = memory.readbyte(ofs_unit + Bunit.archer_action_learned1    )
	prpt.archer_action_learned2    = memory.readbyte(ofs_unit + Bunit.archer_action_learned2    )
	prpt.archer_r_s_m_learned3     = memory.readbyte(ofs_unit + Bunit.archer_r_s_m_learned3     )
	prpt.monk_action_learned1      = memory.readbyte(ofs_unit + Bunit.monk_action_learned1      )
	prpt.monk_action_learned2      = memory.readbyte(ofs_unit + Bunit.monk_action_learned2      )
	prpt.monk_r_s_m_learned3       = memory.readbyte(ofs_unit + Bunit.monk_r_s_m_learned3       )
	prpt.priest_action_learned1    = memory.readbyte(ofs_unit + Bunit.priest_action_learned1    )
	prpt.priest_action_learned2    = memory.readbyte(ofs_unit + Bunit.priest_action_learned2    )
	prpt.priest_r_s_m_learned3     = memory.readbyte(ofs_unit + Bunit.priest_r_s_m_learned3     )
	prpt.wizard_action_learned1    = memory.readbyte(ofs_unit + Bunit.wizard_action_learned1    )
	prpt.wizard_action_learned2    = memory.readbyte(ofs_unit + Bunit.wizard_action_learned2    )
	prpt.wizard_r_s_m_learned3     = memory.readbyte(ofs_unit + Bunit.wizard_r_s_m_learned3     )
	prpt.time_mage_action_learned1 = memory.readbyte(ofs_unit + Bunit.time_mage_action_learned1 )
	prpt.time_mage_action_learned2 = memory.readbyte(ofs_unit + Bunit.time_mage_action_learned2 )
	prpt.time_mage_r_s_m_learned3  = memory.readbyte(ofs_unit + Bunit.time_mage_r_s_m_learned3  )
	prpt.summoner_action_learned1  = memory.readbyte(ofs_unit + Bunit.summoner_action_learned1  )
	prpt.summoner_action_learned2  = memory.readbyte(ofs_unit + Bunit.summoner_action_learned2  )
	prpt.summoner_r_s_m_learned3   = memory.readbyte(ofs_unit + Bunit.summoner_r_s_m_learned3   )
	prpt.thief_action_learned1     = memory.readbyte(ofs_unit + Bunit.thief_action_learned1     )
	prpt.thief_action_learned2     = memory.readbyte(ofs_unit + Bunit.thief_action_learned2     )
	prpt.thief_r_s_m_learned3      = memory.readbyte(ofs_unit + Bunit.thief_r_s_m_learned3      )

	prpt.JP_squire     = memory.readword(ofs_unit + Bunit.JP_squire     )
	prpt.JP_chemist    = memory.readword(ofs_unit + Bunit.JP_chemist    )
	prpt.JP_knight     = memory.readword(ofs_unit + Bunit.JP_knight     )
	prpt.JP_archer     = memory.readword(ofs_unit + Bunit.JP_archer     )
	prpt.JP_monk       = memory.readword(ofs_unit + Bunit.JP_monk       )
	prpt.JP_priest     = memory.readword(ofs_unit + Bunit.JP_priest     )
	prpt.JP_wizard     = memory.readword(ofs_unit + Bunit.JP_wizard     )
	prpt.JP_time_mage  = memory.readword(ofs_unit + Bunit.JP_time_mage  )
	prpt.JP_summoner   = memory.readword(ofs_unit + Bunit.JP_summoner   )
	prpt.JP_thief      = memory.readword(ofs_unit + Bunit.JP_thief      )
	prpt.JP_oracle     = memory.readword(ofs_unit + Bunit.JP_oracle     )
	prpt.JP_calculator = memory.readword(ofs_unit + Bunit.JP_calculator )

	prpt.total_JP_squire     = memory.readword(ofs_unit + Bunit.total_JP_squire     )
	prpt.total_JP_chemist    = memory.readword(ofs_unit + Bunit.total_JP_chemist    )
	prpt.total_JP_knight     = memory.readword(ofs_unit + Bunit.total_JP_knight     )
	prpt.total_JP_archer     = memory.readword(ofs_unit + Bunit.total_JP_archer     )
	prpt.total_JP_monk       = memory.readword(ofs_unit + Bunit.total_JP_monk       )
	prpt.total_JP_priest     = memory.readword(ofs_unit + Bunit.total_JP_priest     )
	prpt.total_JP_wizard     = memory.readword(ofs_unit + Bunit.total_JP_wizard     )
	prpt.total_JP_time_mage  = memory.readword(ofs_unit + Bunit.total_JP_time_mage  )
	prpt.total_JP_summoner   = memory.readword(ofs_unit + Bunit.total_JP_summoner   )
	prpt.total_JP_thief      = memory.readword(ofs_unit + Bunit.total_JP_thief      )
	prpt.total_JP_oracle     = memory.readword(ofs_unit + Bunit.total_JP_oracle     )
	prpt.total_JP_calculator = memory.readword(ofs_unit + Bunit.total_JP_calculator )

	prpt.entd_id             = memory.readbyte(ofs_unit + Bunit.entd_id             )
	prpt.prioritized_target  = memory.readbyte(ofs_unit + Bunit.prioritized_target  )

	prpt.unit_exist = memory.readbyte(ofs_unit + Bunit.unit_exist )
	prpt.cur_turn   = memory.readbyte(ofs_unit + Bunit.cur_turn   )
	prpt.moved      = memory.readbyte(ofs_unit + Bunit.moved      )
	prpt.actioned   = memory.readbyte(ofs_unit + Bunit.actioned   )
	prpt.turn_ended = memory.readbyte(ofs_unit + Bunit.turn_ended )
	prpt.unit_id_ff = memory.readbyte(ofs_unit + Bunit.unit_id_ff )
	prpt.ability_ct = memory.readbyte(ofs_unit + Bunit.ability_ct )
	prpt.hit_miss   = memory.readbyte(ofs_unit + Bunit.hit_miss   )
	prpt.critical   = memory.readbyte(ofs_unit + Bunit.critical   )
	prpt.miss_type  = memory.readbyte(ofs_unit + Bunit.miss_type  )
	prpt.item_lost  = memory.readbyte(ofs_unit + Bunit.item_lost  )

	prpt.effect_flag1  = memory.readbyte(ofs_unit + Bunit.effect_flag1  )
	prpt.effect_flag2  = memory.readbyte(ofs_unit + Bunit.effect_flag2  )

	prpt.attack_accuracy = memory.readbyte(ofs_unit + Bunit.attack_accuracy )
	prpt.main_target     = memory.readbyte(ofs_unit + Bunit.main_target     )

	--prpt.info = Bunit.toString(prpt)
	prpt.info = Bunit.toString2(prpt)
	--prpt.info = Bunit.toString3(prpt)
	--prpt.info = Bunit.toString4(prpt)
	--prpt.info = Bunit.toString5(prpt)
	return prpt
end

function Bunit.toString(prpt)
	local str = string.format("%2x,%2x,%2x,%2x,%2x,%2x,%2x,%2x/"
			.."%2x,%2x,%2x/"
			.."%2d,%2d,%2d/"
			.."%2d,%2d/"
			.."%3d,%2d/"
			.."%3d-%3d,%3d/",
			prpt.ch     ,
			prpt.no     ,
			prpt.party  ,
			prpt.job    ,
			prpt.palette,
			prpt.entd_flag   ,
			prpt.gender ,
			prpt.zodiac ,

			prpt.entd_id     ,
			prpt.unit_exist  ,
			prpt.unit_id_ff  ,

			prpt.lv     ,
			prpt.exp    ,
			prpt.speed  ,

			prpt.brave  ,
			prpt.faith  ,

			prpt.hp     ,
			prpt.mp     ,

			prpt.total_JP_squire    ,
			prpt.JP_squire          ,
			prpt.total_JP_chemist   )

	return str
end

function Bunit.toString2(prpt)
	local str = string.format("%2x,%2x,%2x,%2x/"
			.."%2d,%2d/"
			.."%2x,%2x,%2x/%2x,%2x,%2x/"
			.."%2x,%2x,%2x/"
			.."%2x,%2x/"
			.."%2d,%2x,%2x/",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.zodiac ,

			prpt.speed  ,
			prpt.ct     ,

			prpt.cur_turn    ,
			prpt.moved       ,
			prpt.actioned    ,
			prpt.turn_ended  ,
			prpt.unit_id_ff  ,
			prpt.ability_ct  ,

			prpt.hit_miss    ,
			prpt.critical    ,
			prpt.miss_type   ,

			prpt.effect_flag1   ,
			prpt.effect_flag2   ,

			prpt.attack_accuracy ,
			prpt.main_target     ,
			prpt.prioritized_target  )

	return str
end

function Bunit.toString3(prpt)
	local str = string.format("%2x,%2x,%2x,%2x/"
			.."%2d,%2d,%2d/"
			.."%2d,%2d/"
			.."%3d,%2d/"
			.."squire-%3d-%3d/%2x,%2x,%2x/"
			.."chemist-%3d-%3d,%2x,%2x,%2x/"
			.."archer-%3d-%3d,%2x,%2x,%2x/"
			.."thief-%3d-%3d,%2x,%2x,%2x/"
			.."%2x,%2x,%2x,%2x/"
			.."%2x,%2x,%2x,%2x/"
			.."%2x,%2x,%2x/"
			.."%3x,%3x,%3x,%3x/",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.zodiac ,

			prpt.lv     ,
			prpt.exp    ,
			prpt.speed  ,

			prpt.brave  ,
			prpt.faith  ,

			prpt.hp     ,
			prpt.mp     ,

			prpt.total_JP_squire    ,
			prpt.JP_squire    ,
			prpt.base_action_learned1 ,
			prpt.base_action_learned2 ,
			prpt.base_r_s_m_learned3  ,

			prpt.total_JP_chemist    ,
			prpt.JP_chemist    ,
			prpt.chemist_action_learned1 ,
			prpt.chemist_action_learned2 ,
			prpt.chemist_r_s_m_learned3  ,

			prpt.total_JP_archer    ,
			prpt.JP_archer    ,
			prpt.archer_action_learned1 ,
			prpt.archer_action_learned2 ,
			prpt.archer_r_s_m_learned3  ,

			prpt.total_JP_thief    ,
			prpt.JP_thief    ,
			prpt.thief_action_learned1 ,
			prpt.thief_action_learned2 ,
			prpt.thief_r_s_m_learned3  ,

			prpt.reaction_active1 ,
			prpt.reaction_active2 ,
			prpt.reaction_active3 ,
			prpt.reaction_active4 ,
			prpt.support_active1  ,
			prpt.support_active2  ,
			prpt.support_active3  ,
			prpt.support_active4  ,
			prpt.movement_active1 ,
			prpt.movement_active2 ,
			prpt.movement_active3 ,
			prpt.innate_ability1  ,
			prpt.innate_ability2  ,
			prpt.innate_ability3  ,
			prpt.innate_ability4  )

	return str
end

function Bunit.toString4(prpt)
	local str = string.format("%2x,%2x,%2x,%2x/"
			.."%2d,%2d,%2d/"
			.."%2d,%2d/"
			.."%3d,%2d/"
			.."%3d-%3d,%3d/"
			.."%3d,%3d/",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.zodiac ,

			prpt.lv     ,
			prpt.exp    ,
			prpt.speed  ,

			prpt.brave  ,
			prpt.faith  ,

			prpt.hp     ,
			prpt.mp     ,

			prpt.total_JP_squire    ,
			prpt.JP_squire          ,
			prpt.total_JP_chemist   ,
			prpt.total_JP_wizard    ,
			prpt.total_JP_knight    )

	return str
end

function Bunit.toString5(prpt)
	local str = string.format("%2x,%2x,%2x,%2x/"
			.."%2d,%2d,%2d/"
			.."%2d,%2d/"
			.."%3d,%2d/"
			.."%2x,%2x,%2x,%2x,%2x/"
			.."%2x,%2x,%2x,%2x,%2x/"
			.."%2x,%2x,%2x,%2x,%2x/",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.zodiac ,

			prpt.lv     ,
			prpt.exp    ,
			prpt.speed  ,

			prpt.brave  ,
			prpt.faith  ,

			prpt.hp     ,
			prpt.mp     ,

			prpt.status_auto1   ,
			prpt.status_auto2   ,
			prpt.status_auto3   ,
			prpt.status_auto4   ,
			prpt.status_auto5   ,
			prpt.status_immune1 ,
			prpt.status_immune2 ,
			prpt.status_immune3 ,
			prpt.status_immune4 ,
			prpt.status_immune5 ,
			prpt.status_cur1    ,
			prpt.status_cur2    ,
			prpt.status_cur3    ,
			prpt.status_cur4    ,
			prpt.status_cur5    )

	return str
end

function Bunit.showAll()
	local prpt = {}
	local ofs_unit = adr_battle_unit

	print(string.format("-- Bunit --"))
	for i=1, 21 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0

		print(prpt.info)
	end
end

function Bunit.drawAll(x, y)
	x = x or 0
	y = y or 20

	local prpt = {}
	local ofs_unit = adr_battle_unit

	for i=1, 21 do
		prpt = Bunit.readProperty(ofs_unit)
		ofs_unit = ofs_unit + 0x1C0

		gui.text(x, y+(8*i) , prpt.info)
	end
end


function Bunit.isRandomExists(prpt)
	local entd_flag = bit.band(prpt.entd_flag, 0x50)  -- 0x50 Random exists
	return entd_flag
end

function Bunit.isKnockback(prpt)
	local kockbacked = bit.band(prpt.effect_flag2, 0x40)  -- 0x40 - Knockback
	return kockbacked
end

function Bunit.isInjured(prpt)
	local injured = bit.band(prpt.status_cur3, 0x01)  -- 0x01 Critical injured
	return injured
end

function Bunit.isLearnedThrowStone(prpt)
	local learned = bit.band(prpt.base_action_learned1, 0x20)  -- 0x08 means Throw Stone
	return learned
end

function Bunit.isLearnedStealHeart(prpt)
	local learned = bit.band(prpt.thief_action_learned1, 0x40)  -- 0x40 means Steal Heart
	return learned
end

function Bunit.isLearnedGainedJpUp(prpt)
	local learned = bit.band(prpt.base_r_s_m_learned3, 0x08)  -- 0x08 means Gained Jp UP
	return learned
end

function Bunit.isLearnedLightningStab(prpt)
	local learned = bit.band(prpt.base_action_learned1, 0x10)  -- 0x10 means Lightning Stab
	return learned
end

function Bunit.isLearnedMove1(prpt)
	local learned = bit.band(prpt.base_r_s_m_learned3, 0x04)  -- 0x04 means Move+1
	return learned
end

function Bunit.isJobSquire(prpt)
	return bit.band(prpt.job, 0x4A)  -- 0x4A means Squire
end

function Bunit.isJobChemist(prpt)
	return bit.band(prpt.job, 0x4B)  -- 0x4B means Chemist
end



------------------------------------------------------------
-- GameTime
------------------------------------------------------------
GameTime = {base_msec=0, base_sec=0, base_min=0, base_hour=0}

--- Iincrement game clock.
--  @see similar in dissassemble code below.
--       sub_800425C4 in JPv1.1
--       sub_800434DC in US
function GameTime.increment()
	base_msec = base_msec + 1
	if base_msec > 59 then
		base_msec = 0
		base_sec = base_sec + 1
		if base_sec > 59 then
			base_sec = 0
			base_min = base_min + 1
			if base_min > 59 then
				base_min = 0
				base_hour = base_hour + 1
				if base_hour > 999 then
					base_hour = 999
				end
			end
		end
	end

	memory.writedword(adr_milsecs, base_msec)
	memory.writedword(adr_seconds, base_sec )
	memory.writedword(adr_minutes, base_min )
	memory.writedword(adr_hours  , base_hour)
end

function GameTime.init(hour, min, sec, msec)
	base_msec = msec or memory.readdword(adr_milsecs)
	base_sec  = sec  or memory.readdword(adr_seconds)
	base_min  = min  or memory.readdword(adr_minutes)
	base_hour = hour or memory.readdword(adr_hours  )
end

function GameTime.read()
	local gt = {}
	gt.msec = memory.readdword(adr_milsecs)
	gt.sec  = memory.readdword(adr_seconds)
	gt.min  = memory.readdword(adr_minutes)
	gt.hour = memory.readdword(adr_hours  )
	return gt
end

function GameTime.format(gt)
	if gt == nil then
		return string.format("%02d:%02d:%02d.%02d", base_hour, base_min, base_sec, base_msec)
	else
		return string.format("%02d:%02d:%02d.%02d", gt.hour, gt.min, gt.sec, gt.msec)
	end
end

function GameTime.encountFormula(gt)
	local sum = (gt.msec * 101) + (gt.sec * 10) + gt.min + gt.hour
	return sum
end

function GameTime.getSeed(gt)
	local sum
	if gt == nil then
		sum = (base_msec * 101) + (base_sec * 10) + base_min + base_hour
	else
		sum = (gt.msec * 101) + (gt.sec * 10) + gt.min + gt.hour
	end
	return sum
end


------------------------------------------------------------
-- Zodiac sign
------------------------------------------------------------
Zodiac = {}

Zodiac.Aries         = 0x00 -- 白羊 = Aries
Zodiac.Taurus        = 0x10 -- 金牛 = Taurus
Zodiac.Gemini        = 0x20 -- 双子 = Gemini
Zodiac.Cancer        = 0x30 -- 巨蟹 = Cancer
Zodiac.Leo           = 0x40 -- 獅子 = Leo
Zodiac.Virgo         = 0x50 -- 処女 = Virgo
Zodiac.Libra         = 0x60 -- 天秤 = Libra
Zodiac.Scorpio       = 0x70 -- 天蝎 = Scorpio
Zodiac.Sagittarius   = 0x80 -- 人馬 = Sagittarius
Zodiac.Capricorn     = 0x90 -- 磨羯 = Capricorn
Zodiac.Aquarius      = 0xA0 -- 宝瓶 = Aquarius
Zodiac.Pisces        = 0xB0 -- 双魚 = Pisces
Zodiac.Serpentarius  = 0xC0 -- 蛇遣 = Serpentarius (neutral to all signs)

Zodiac.notation = {"worst", "bad", "normal", "good", "best"}


--- Check zodiac sign compatibility with Ramza as Capricorn.
--        "bad : 0x00, 0x60, very bad : 0x30"
--        "good: 0x10, 0x50, very good: 0x30"
--  @return 1:worst, 2:bad, 3:normal, 4:good, 5:best
function Zodiac.checkCompatibilityRamza(sign, gender)
	local opposit = 0
	local masked_sign

	masked_sign = bit.band(sign, 0xF0)
	opposit = bit.band(gender, 0x80)  -- 0x80 is male, 0x40 is female

	if masked_sign == Zodiac.Aries then
		return 2
	elseif masked_sign == Zodiac.Libra then
		return 2
	elseif masked_sign == Zodiac.Cancer and opposit ~= 0 then
		return 1
	elseif masked_sign == Zodiac.Cancer and opposit == 0 then
		-- FIXME:: monster is regarded as best, unfortunately
		return 5
	elseif masked_sign == Zodiac.Taurus then
		return 4
	elseif masked_sign == Zodiac.Virgo then
		return 4
	end

	return 3
end

--- Check zodiac sign compatibility with Virgo.
--        Virgo = Algus, Miluda, Wiegraf, Gafgarion
--        "bad : 0x20, 0x80, very bad : 0xB0"
--        "good: 0x10, 0x90, very good: 0xB0"
--  @return 1:worst, 2:bad, 3:normal, 4:good, 5:best
function Zodiac.checkCompatibilityVirgo(sign, gender)
	local opposit = 0
	local masked_sign

	masked_sign = bit.band(sign, 0xF0)
	opposit = bit.band(gender, 0x80)  -- 0x80 is male, 0x40 is female

	if masked_sign == Zodiac.Gemini then
		return 2
	elseif masked_sign == Zodiac.Sagittarius then
		return 2
	elseif masked_sign == Zodiac.Pisces and opposit ~= 0 then
		return 1
	elseif masked_sign == Zodiac.Pisces and opposit == 0 then
		-- FIXME:: monster is regarded as best, unfortunately
		return 5
	elseif masked_sign == Zodiac.Taurus then
		return 4
	elseif masked_sign == Zodiac.Capricorn then
		return 4
	end

	return 3
end


