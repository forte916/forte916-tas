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


adr_formation_unit   = 0x0552F8  -- 1st unit in formation. next, add 0x100
adr_formation_unit2  = 0x0553F8  -- 2nd unit
adr_formation_unit3  = 0x0554F8  -- 3rd unit
adr_formation_unit4  = 0x0555F8  -- 4th unit
adr_formation_unit5  = 0x0556F8  -- 5th unit
adr_formation_unit6  = 0x0557F8  -- 6th unit
adr_formation_unit7  = 0x0558F8  -- 7th unit
adr_formation_unit8  = 0x0559F8  -- 8th unit
adr_formation_unit9  = 0x055AF8  -- 9th unit


adr_battle_unit   = 0x18E898 --  1st unit in battle. next, add 0x1C0
adr_battle_unit2  = 0x18EA58 --  2nd unit
adr_battle_unit3  = 0x18EC18 --  3rd unit
adr_battle_unit4  = 0x18EDD8 --  4th unit
adr_battle_unit5  = 0x18EF98 --  5th unit
adr_battle_unit6  = 0x18F158 --  6th unit
adr_battle_unit7  = 0x18F318 --  7th unit
adr_battle_unit8  = 0x18F4D8 --  8th unit
adr_battle_unit9  = 0x18F698 --  9th unit
adr_battle_unit10 = 0x18F858 -- 10th unit
adr_battle_unit17 = 0x190498 -- 17th unit. 17th and older units are our party.
adr_battle_unit18 = 0x190658 -- 18th unit
adr_battle_unit19 = 0x190818 -- 19th unit
adr_battle_unit20 = 0x1909D0 -- 20th unit




------------------------------------------------------------
-- Formation Unit in world map
------------------------------------------------------------
Funit = {}

function Funit.readProperty(ofs_unit)
	local prpt = {}

	-- property of unit
	local ofs_ch       = 0x00  -- 1byte
	local ofs_no       = 0x01  -- 1byte
	local ofs_job      = 0x02  -- 1byte
	local ofs_palette  = 0x03  -- 1byte
	local ofs_species  = 0x04  -- 1byte, 0x10:JoinAfterEvent 0x20:monster, 0x40:female, 0x80:male, 0x04:egg??
	local ofs_birthday = 0x05  -- 1byte
	local ofs_zodiac   = 0x06  -- 1byte, high bit(4-7bit)
	-- offset 0x07 to 0x0C is set abilyties
	-- offset 0x0E to 0x14 is equipment
	local ofs_exp      = 0x15  -- 1byte
	local ofs_lv       = 0x16  -- 1byte
	local ofs_brave    = 0x17  -- 1byte
	local ofs_faith    = 0x18  -- 1byte
	local ofs_hp_hi    = 0x19  -- 3byte??, high bit
	local ofs_hp       = 0x20  -- 2byte
	local ofs_mp_hi    = 0x1C  -- 3byte??, high bit
	local ofs_mp       = 0x1D  -- 2byte
	local ofs_speed_hi = 0x1F  -- 3byte??
	local ofs_speed    = 0x20  -- 2byte
	local ofs_ph_at_hi = 0x22  -- 3byte??
	local ofs_ph_at    = 0x23  -- 2byte
	local ofs_mg_at_hi = 0x25  -- 3byte??
	local ofs_mg_at    = 0x26  -- 2byte

	-- offset 0x28 to 0x63 is abilyties learned
	-- offset 0x64 to 0x6D is job level
	-- job level includes 2 jobs in 1byte. split high 4bit and low 4bit.
	local ofs_joblv_squire_chemist = 0x64

	-- offset 0x6E to 0x94 is JP in jobs
	local ofs_JP_squire     = 0x6E
	local ofs_JP_chemist    = 0x70
	local ofs_JP_knight     = 0x72
	local ofs_JP_archer     = 0x74
	local ofs_JP_monk       = 0x76
	local ofs_JP_priest     = 0x78
	local ofs_JP_wizard     = 0x7A
	local ofs_JP_time_mage  = 0x7C
	local ofs_JP_summoner   = 0x7E
	local ofs_JP_thief      = 0x80
	local ofs_JP_mediator   = 0x82
	local ofs_JP_oracle     = 0x84
	local ofs_JP_geomancer  = 0x86
	local ofs_JP_lancer     = 0x88
	local ofs_JP_samurai    = 0x8A
	local ofs_JP_ninja      = 0x8C
	local ofs_JP_calculator = 0x8E
	local ofs_JP_bard       = 0x90
	local ofs_JP_dancer     = 0x92
	local ofs_JP_mime       = 0x94

	-- offset 0x96 to 0xBC is total JP in jobs
	local ofs_total_JP_squire     = 0x96
	local ofs_total_JP_chemist    = 0x98
	local ofs_total_JP_knight     = 0x9A
	local ofs_total_JP_archer     = 0x9C
	local ofs_total_JP_monk       = 0x9E
	local ofs_total_JP_priest     = 0xA0
	local ofs_total_JP_wizard     = 0xA2
	local ofs_total_JP_time_mage  = 0xA4
	local ofs_total_JP_summoner   = 0xA6
	local ofs_total_JP_thief      = 0xA8
	local ofs_total_JP_mediator   = 0xAA
	local ofs_total_JP_oracle     = 0xAC
	local ofs_total_JP_geomancer  = 0xAE
	local ofs_total_JP_lancer     = 0xB0
	local ofs_total_JP_samurai    = 0xB2
	local ofs_total_JP_ninja      = 0xB4
	local ofs_total_JP_calculator = 0xB6
	local ofs_total_JP_bard       = 0xB8
	local ofs_total_JP_dancer     = 0xBA
	local ofs_total_JP_mime       = 0xBC

	-- offset 0xBE to 0xCD is name strings
	local ofs_dialogue = 0xCE -- 2byte
	local ofs_separate = 0xD0 -- 1byte. 0:nomal, 1:separated, 2:disappeared


	-- Read the property
	prpt.ch        = memory.readbyte(ofs_unit + ofs_ch       )
	prpt.no        = memory.readbyte(ofs_unit + ofs_no       )
	prpt.job       = memory.readbyte(ofs_unit + ofs_job      )
	prpt.palette   = memory.readbyte(ofs_unit + ofs_palette  )
	prpt.species   = memory.readbyte(ofs_unit + ofs_species  )
	prpt.birthday  = memory.readbyte(ofs_unit + ofs_birthday )
	prpt.zodiac    = memory.readbyte(ofs_unit + ofs_zodiac   )

	prpt.exp       = memory.readbyte(ofs_unit + ofs_exp      )
	prpt.lv        = memory.readbyte(ofs_unit + ofs_lv       )
	prpt.brave     = memory.readbyte(ofs_unit + ofs_brave    )
	prpt.faith     = memory.readbyte(ofs_unit + ofs_faith    )
	prpt.hp        = memory.readword(ofs_unit + ofs_hp       )
	prpt.mp        = memory.readword(ofs_unit + ofs_mp       )
	prpt.speed     = memory.readword(ofs_unit + ofs_speed    )

	prpt.JP_squire     = memory.readword(ofs_unit + ofs_JP_squire     )
	prpt.JP_chemist    = memory.readword(ofs_unit + ofs_JP_chemist    )
	prpt.JP_priest     = memory.readword(ofs_unit + ofs_JP_priest     )
	prpt.JP_wizard     = memory.readword(ofs_unit + ofs_JP_wizard     )
	prpt.JP_time_mage  = memory.readword(ofs_unit + ofs_JP_time_mage  )
	prpt.JP_oracle     = memory.readword(ofs_unit + ofs_JP_oracle     )
	prpt.JP_calculator = memory.readword(ofs_unit + ofs_JP_calculator )

	prpt.total_JP_squire     = memory.readword(ofs_unit + ofs_total_JP_squire     )
	prpt.total_JP_chemist    = memory.readword(ofs_unit + ofs_total_JP_chemist    )
	prpt.total_JP_priest     = memory.readword(ofs_unit + ofs_total_JP_priest     )
	prpt.total_JP_wizard     = memory.readword(ofs_unit + ofs_total_JP_wizard     )
	prpt.total_JP_time_mage  = memory.readword(ofs_unit + ofs_total_JP_time_mage  )
	prpt.total_JP_oracle     = memory.readword(ofs_unit + ofs_total_JP_oracle     )
	prpt.total_JP_calculator = memory.readword(ofs_unit + ofs_total_JP_calculator )

	prpt.info = Funit.toString(prpt)
	return prpt
end

function Funit.toString(prpt)
	local str = string.format("%2x %2x %2x %2x %2x %2x:" 
			.."%2d %2d %2d %2d:"
			.." %d %d:"
			.." %d:",
			prpt.ch      ,
			prpt.no      ,
			prpt.job     ,
			prpt.species ,
			prpt.birthday,
			prpt.zodiac  ,

			prpt.exp     ,
			prpt.lv      ,
			prpt.brave   ,
			prpt.faith   ,

			prpt.total_JP_squire    ,
			prpt.total_JP_chemist   ,

			prpt.JP_squire    )
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

function Bunit.readProperty(ofs_unit)
	local prpt = {}

	-- property of unit
	local ofs_ch      = 0x00  -- 1byte
	local ofs_no      = 0x01  -- 1byte, unit index in battle, 0xFF Unit doesn't exist.
	local ofs_listno  = 0x02  -- 1byte, unit index in formation
	local ofs_job     = 0x03  -- 1byte
	local ofs_palette = 0x04  -- 1byte, palette??
	local ofs_side    = 0x05  -- 1byte, friend or enemy
	local ofs_species = 0x06  -- 1byte, 0x10:JoinAfterEvent 0x20:monster, 0x40: female, 0x80:male, 0x04:egg??
	local ofs_deathct = 0x07  -- 1byte, Death counter. unit becomes crystal at 0.
	local ofs_ofs08   = 0x08  -- 1byte
	local ofs_zodiac  = 0x09  -- 1byte, high bit(4-7bit)
	-- offset 0x0A to 0x18 is set abilyties
	-- offset 0x1A to 0x20 is equipment
	local ofs_exp     = 0x21  -- 1byte
	local ofs_lv      = 0x22  -- 1byte
	local ofs_brave_org = 0x23  -- 1byte
	local ofs_brave   = 0x24  -- 1byte
	local ofs_faith_org = 0x25  -- 1byte
	local ofs_faith   = 0x26  -- 1byte
	local ofs_ofs27   = 0x27  -- 2byte
	local ofs_hp      = 0x28  -- 2byte
	local ofs_max_hp  = 0x2A  -- 2byte
	local ofs_mp      = 0x2C  -- 2byte
	local ofs_max_mp  = 0x2E  -- 2byte
	local ofs_ph_at_org  = 0x30  -- 1byte
	local ofs_mg_at_org  = 0x31  -- 1byte
	local ofs_speed_org  = 0x32  -- 1byte
	local ofs_ph_at_bonus  = 0x33  -- 1byte
	local ofs_mg_at_bonus  = 0x34  -- 1byte
	local ofs_speed_bonus  = 0x35  -- 1byte
	local ofs_ph_at   = 0x36  -- 1byte
	local ofs_mg_at   = 0x37  -- 1byte
	local ofs_speed   = 0x38  -- 1byte
	local ofs_ct      = 0x39  -- 1byte
	local ofs_move    = 0x3A  -- 1byte
	local ofs_jump    = 0x3B  -- 1byte
	-- offset 0x3C to 0x46 is Wep.Power, A-EV, S-EV, C-EV
	local ofs_X_crd   = 0x47  -- 1byte
	local ofs_Y_crd   = 0x48  -- 1byte
	local ofs_hight   = 0x49  -- 1byte, 0x80: higher elevation, 0x03: facing direction
	-- offset 0x4A to 0x5C is good/bad status flags.
	-- offset 0x5D to 0x6C is CT of each skills.
	-- offset 0x6D to 0x71 is elemental compatibility
	-- offset 0x8B to 0x95 is abilities
	-- offset 0x96 to 0xD1 is jobs and abilities
	-- offset 0xD2 to 0xDB is job level
	-- job level includes 2 jobs in 1byte. split high 4bit and low 4bit.

	-- offset 0xDC to 0x102 is JP in jobs
	local ofs_JP_squire     = 0xDC
	local ofs_JP_chemist    = 0xDE
	local ofs_JP_knight     = 0xE0
	local ofs_JP_archer     = 0xE2
	local ofs_JP_monk       = 0xE4
	local ofs_JP_priest     = 0xE6
	local ofs_JP_wizard     = 0xE8
	local ofs_JP_time_mage  = 0xEA
	local ofs_JP_summoner   = 0xEC
	local ofs_JP_thief      = 0xEE
	local ofs_JP_mediator   = 0xF0
	local ofs_JP_oracle     = 0xF2
	local ofs_JP_geomancer  = 0xF4
	local ofs_JP_lancer     = 0xF6
	local ofs_JP_samurai    = 0xF8
	local ofs_JP_ninja      = 0xFA
	local ofs_JP_calculator = 0xFC
	local ofs_JP_bard       = 0xFE
	local ofs_JP_dancer     = 0x100
	local ofs_JP_mime       = 0x102

	-- offset 0x104 to 0x12A is total JP in jobs
	local ofs_total_JP_squire     = 0x104
	local ofs_total_JP_chemist    = 0x106
	local ofs_total_JP_knight     = 0x108
	local ofs_total_JP_archer     = 0x10A
	local ofs_total_JP_monk       = 0x10C
	local ofs_total_JP_priest     = 0x10E
	local ofs_total_JP_wizard     = 0x110
	local ofs_total_JP_time_mage  = 0x112
	local ofs_total_JP_summoner   = 0x114
	local ofs_total_JP_thief      = 0x116
	local ofs_total_JP_mediator   = 0x118
	local ofs_total_JP_oracle     = 0x11A
	local ofs_total_JP_geomancer  = 0x11C
	local ofs_total_JP_lancer     = 0x11E
	local ofs_total_JP_samurai    = 0x120
	local ofs_total_JP_ninja      = 0x122
	local ofs_total_JP_calculator = 0x124
	local ofs_total_JP_bard       = 0x126
	local ofs_total_JP_dancer     = 0x128
	local ofs_total_JP_mime       = 0x12A

	-- offset 0x12C to 0x13B is name strings
	-- offset 0x13C to 0x149 is job strings
	-- offset 0x161 is Unit ID
	-- offset 0x167 is AI/Autobattle setting
	local ofs_prioritized_target  = 0x168  -- 1byte
	
	local ofs_cur_turn  = 0x186  -- 1byte
	local ofs_moved     = 0x187  -- 1byte
	local ofs_actioned  = 0x188  -- 1byte
	local ofs_ofs189    = 0x189  -- 1byte
	local ofs_ofs18A    = 0x18A  -- 1byte
	local ofs_ofs18B    = 0x18B  -- 1byte
	local ofs_hit_miss  = 0x18C  -- 1byte, 0x01:hit, 0x00:miss
	local ofs_critical  = 0x18D  -- 1byte, 0x01:critical, 0x00:regular
	local ofs_miss_type = 0x18E  -- 1byte, 0x00:hit, 0x01:guarded, 0x02:guarded, 0x05:nullified, 0x06:miss, 0x07:catch
	local ofs_item_lost = 0x18F  -- 1byte

	local ofs_attack_accuracy = 0x1B6  -- 1byte, Attack accuracy
	local ofs_main_target     = 0x1B9  -- 1byte, Main target ID??


	-- Read the property
	prpt.ch        = memory.readbyte(ofs_unit + ofs_ch      )
	prpt.no        = memory.readbyte(ofs_unit + ofs_no      )
	prpt.listno    = memory.readbyte(ofs_unit + ofs_listno  )
	prpt.job       = memory.readbyte(ofs_unit + ofs_job     )
	prpt.palette   = memory.readbyte(ofs_unit + ofs_palette )
	prpt.side      = memory.readbyte(ofs_unit + ofs_side    )
	prpt.species   = memory.readbyte(ofs_unit + ofs_species )
	prpt.deathct   = memory.readbyte(ofs_unit + ofs_deathct )
	prpt.ofs08     = memory.readbyte(ofs_unit + ofs_ofs08   )
	prpt.zodiac    = memory.readbyte(ofs_unit + ofs_zodiac  )

	prpt.exp       = memory.readbyte(ofs_unit + ofs_exp     )
	prpt.lv        = memory.readbyte(ofs_unit + ofs_lv      )
	prpt.brave     = memory.readbyte(ofs_unit + ofs_brave   )
	prpt.faith     = memory.readbyte(ofs_unit + ofs_faith   )
	prpt.ofs27     = memory.readbyte(ofs_unit + ofs_ofs27   )
	prpt.hp        = memory.readword(ofs_unit + ofs_hp      )
	prpt.max_hp    = memory.readword(ofs_unit + ofs_max_hp  )
	prpt.mp        = memory.readword(ofs_unit + ofs_mp      )
	prpt.max_mp    = memory.readword(ofs_unit + ofs_max_mp  )

	prpt.ct        = memory.readbyte(ofs_unit + ofs_ct      )
	prpt.hight     = memory.readbyte(ofs_unit + ofs_hight   )

	prpt.JP_squire     = memory.readword(ofs_unit + ofs_JP_squire     )
	prpt.JP_chemist    = memory.readword(ofs_unit + ofs_JP_chemist    )
	prpt.JP_priest     = memory.readword(ofs_unit + ofs_JP_priest     )
	prpt.JP_wizard     = memory.readword(ofs_unit + ofs_JP_wizard     )
	prpt.JP_time_mage  = memory.readword(ofs_unit + ofs_JP_time_mage  )
	prpt.JP_oracle     = memory.readword(ofs_unit + ofs_JP_oracle     )
	prpt.JP_calculator = memory.readword(ofs_unit + ofs_JP_calculator )

	prpt.total_JP_squire     = memory.readword(ofs_unit + ofs_total_JP_squire     )
	prpt.total_JP_chemist    = memory.readword(ofs_unit + ofs_total_JP_chemist    )
	prpt.total_JP_priest     = memory.readword(ofs_unit + ofs_total_JP_priest     )
	prpt.total_JP_wizard     = memory.readword(ofs_unit + ofs_total_JP_wizard     )
	prpt.total_JP_time_mage  = memory.readword(ofs_unit + ofs_total_JP_time_mage  )
	prpt.total_JP_oracle     = memory.readword(ofs_unit + ofs_total_JP_oracle     )
	prpt.total_JP_calculator = memory.readword(ofs_unit + ofs_total_JP_calculator )

	prpt.prioritized_target  = memory.readbyte(ofs_unit + ofs_prioritized_target  )

	prpt.cur_turn  = memory.readbyte(ofs_unit + ofs_cur_turn  )
	prpt.moved     = memory.readbyte(ofs_unit + ofs_moved     )
	prpt.actioned  = memory.readbyte(ofs_unit + ofs_actioned  )
	prpt.ofs189    = memory.readbyte(ofs_unit + ofs_ofs189    )
	prpt.ofs18A    = memory.readbyte(ofs_unit + ofs_ofs18A    )
	prpt.ofs18B    = memory.readbyte(ofs_unit + ofs_ofs18B    )
	prpt.hit_miss  = memory.readbyte(ofs_unit + ofs_hit_miss  )
	prpt.critical  = memory.readbyte(ofs_unit + ofs_critical  )
	prpt.miss_type = memory.readbyte(ofs_unit + ofs_miss_type )
	prpt.item_lost = memory.readbyte(ofs_unit + ofs_item_lost )

	prpt.attack_accuracy = memory.readbyte(ofs_unit + ofs_attack_accuracy )
	prpt.main_target     = memory.readbyte(ofs_unit + ofs_main_target     )


	--prpt.info = Bunit.toString(prpt)
	prpt.info = Bunit.toString2(prpt)
	return prpt
end

function Bunit.toString(prpt)
	local str = string.format("%2x %2x %2x %2x %2x:" 
			.."%2d %2d %2d %2d %d:"
			.." %d %d:"
			.." %2d %2d:"
			.." %d:",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.ofs08  ,
			prpt.zodiac ,

			prpt.exp    ,
			prpt.lv     ,
			prpt.brave  ,
			prpt.faith  ,
			prpt.ofs27  ,

			prpt.hp     ,
			prpt.mp     ,

			prpt.total_JP_squire    ,
			prpt.total_JP_chemist   ,

			prpt.JP_squire    )
	return str
end

function Bunit.toString2(prpt)
	local str = string.format("%2x %2x %2x %2x:"
			.."%3d %2d:"
			.."%2x %2x %2x:%2x %2x %2x:%2x %2x %2x:"
			.."%2d %2x %2x:",
			prpt.ch     ,
			prpt.no     ,
			prpt.job    ,
			prpt.zodiac ,

			prpt.ct     ,
			prpt.hight  ,

			prpt.cur_turn    ,
			prpt.moved       ,
			prpt.actioned    ,
			prpt.ofs189      ,
			prpt.ofs18A      ,
			prpt.ofs18B      ,
			prpt.hit_miss    ,
			prpt.critical    ,
			prpt.miss_type   ,

			prpt.attack_accuracy ,
			prpt.main_target     ,
			prpt.prioritized_target  )

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

