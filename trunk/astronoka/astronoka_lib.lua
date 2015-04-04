-- Astronoka
-- This is a library of astronoka.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. require "astronoka_lib"
--
-- + Special Thanks
--   http://homepage3.nifty.com/game-sfccode/astronoka.html
--   http://www009.upp.so-net.ne.jp/dreamy/ps/noka.html
--   PirohikoP-san

require "bit"

------------------------------------------------------------
-- address
------------------------------------------------------------

-- RNG, 4byte
adr_rng = 0x0BE328

-- ##hybrid machine
-- first parent, pointing the address of seed in inventory
adr_seed_first = 0x1CD698
-- second parent, pointing the address of seed in inventory
adr_seed_second = 0x1CD69C
-- produced seed, lining up the properties of seed
adr_seed_hybrid = 0x1CD6A8

-- mendel cross
-- 0x1CD6D8  -- kind1 of first seed
-- 0x1CD6DC  -- mendel value of first seed
-- 0x1CD6DE  -- kind1 of second seed
-- 0x1CD6E2  -- mendel value of second seed
-- 0x1CD6E4  -- kind1 of hybrid seed
-- 0x1CD6E8  -- mendel value of hybrid seed

-- ##inventory
-- address of first seed in inventory, next +28h, max 100
adr_seed = 0x167E80
-- address of first crops in the field, next +34h, max 24
adr_fcrop = 0x168E20
-- address of first crops in inventory, next +30h, max 100
adr_icrop = 0x169300

-- If this value is 0xC000, all itmes are shown without filtering
adr_filter = 0x190288
no_filter = 0xC000
-- I don't know this value, but regard as a flag in hierarchy of seed selecting view
adr_seed_hierarchy = 0x1FFCEE
sdhr_top1 = 0x0000
sdhr_top2 = 0x8017
sdhr_second = 0x8016

-- I don't know these values, but regard as a flag in parent selecting view
adr_parent_view1 = 0x1CD784
prvw1_first = 0x0000
prvw1_second = 0x0001
prvw1_third = 0x0002
adr_parent_view2 = 0x1FFDE4
prvw2_unpicked = 0xAF9C
prvw2_first = 0x0000
prvw2_second = 0x0001
prvw2_seed_view = 0x7DFC
prvw2_third1 = 0xA61C
prvw2_third2 = 0xAB78
prvw2_kuzu = 0xD778
adr_parent_view3 = 0x1FFDFC


-- cursor of group in seed inventory, 2byte
adr_cursor_group_first = 0x0018F434
-- max group counts, 1byte
adr_max_group_count_first = 0x0018F436
-- cursor of seed inventory, 2byte
adr_cursor_seed_first = 0x0018F438
-- max raw counts in current view, 1byte
adr_max_raw_count_first = 0x0018F43A
-- first parent, pointing the address of seed in inventory
adr_seed_first2 = 0x0018F43C


-- cursor of group in seed inventory, 2byte
adr_cursor_group_second = 0x0018F44C
-- max group counts, 1byte
adr_max_group_count_second = 0x0018F44E
-- cursor of seed inventory, 2byte
adr_cursor_seed_second = 0x0018F450
-- max raw counts in current view, 1byte
adr_max_raw_count_second = 0x0018F452
-- second parent, pointing the address of seed in inventory
adr_seed_second2 = 0x0018F454


-- ##general info
-- cursor of house/main/system menu
adr_cursor_menu = 0x143230

-- days from game start. 0 origin
adr_days = 0x166EF8
-- years from game start. 0 origin
adr_years = 0x166EF9

-- amounts of money. 4byte
adr_amount_money = 0x166F00
-- total feather counts. 2byte
adr_total_feather = 0x166F04
-- total seed counts includes stock
adr_total_seed = 0x166F06
-- total vegee counts includes stock and field
adr_total_vegee = 0x166F07
-- total field counts
adr_total_field = 0x166F08
-- pete rank. 0x00 to 0x04
adr_pete_rank = 0x166F0A
-- hybrid machine rank. 0x00 to 0x05. 00 means we don't have machine.
adr_machine_rank = 0x166F0B

-- total reset counts. aka. L-R counts
adr_total_reset_cnt = 0x166F5C

-- ##baboo and trap battle
adr_baboo_today = 0x0EFCA6  -- how many baboos do they come. 0x00 to 0x03
adr_watched = 0x0EFCA7  -- watched:0x01, not watched:0x00
adr_baboo1_kind = 0x0EFCA8  -- species of first baboo
adr_baboo2_kind = 0x0EFCA9  -- species of second baboo
adr_baboo3_kind = 0x0EFCAA  -- species of third baboo

adr_trap_battle = 0x13D374
in_trap_battle = 0x0002  -- in the battle field
out_trap_bttle = 0xFFFF  -- not in the battle field
adr_reaction1 = 0x13D380  -- some reaction against a trap. I don't know.
adr_reaction2 = 0x13D384  -- some reaction against a trap. I don't know.
reaction2_end = 0xFFFF  -- trap battle is finished
adr_result_internal = 0x13D3B4  -- result of internal?? 4byte, +10h, max 18
adr_win_count = 0x166F64


-- ## Properties of vegee
-- kind1
knd_kyouka    = 0x00  -- golden kyouka-shu, other kyouka-shu
knd_kuzu      = 0x00  -- くず野菜
knd_hourensou = 0x01  -- 穴ホウレン草
knd_nira      = 0x02  -- ニラクラウン
knd_kyabetsu  = 0x03  -- 透明キャベツ
knd_paseri    = 0x04  -- ウキウキパセリ
knd_karifura  = 0x05  -- カリフラボール
knd_mame      = 0x06  -- 宇宙マメ
knd_karashi   = 0x07  -- ホタル唐辛子
knd_wakame    = 0x08  -- 真空ワカメ
knd_konbu     = 0x09  -- 月面コンブ
knd_chingen   = 0x0A  -- チンゲンツリー
knd_piman     = 0x0B  -- 妖精ピーマン
knd_herb      = 0x0C  -- 水晶ハーブ
knd_shimaimo  = 0x0D  -- シマイモ
knd_kabu      = 0x0E  -- 星カブ
knd_renkon    = 0x0F  -- 腰かけレンコン
knd_ninjin    = 0x10  -- コスモニンジン
knd_tamanegi  = 0x11  -- タマネギボム
knd_imokyu    = 0x12  -- イモ球
knd_gobou     = 0x13  -- ゴボウ玉
knd_kabocha   = 0x14  -- 火星カボチャ
knd_garlic    = 0x15  -- トゲガーリック
knd_takenoko  = 0x16  -- カブトタケノコ
knd_matsutake = 0x17  -- 冥王マツタケ
knd_kifujin   = 0x18  -- 貴婦人
knd_tomato    = 0x19  -- トマトニアン
knd_kyuri     = 0x1A  -- 電灯キューリ
knd_nasu      = 0x1B  -- 土星ナス
knd_meron     = 0x1C  -- ドームメロン
knd_remon     = 0x1D  -- ひよこレモン
knd_corn      = 0x1E  -- ロウソクコーン
knd_peach     = 0x1F  -- 砲丸ピーチ
knd_ichigo    = 0x20  -- イチゴブドウ
knd_pine      = 0x21  -- 光速パイン
knd_suica     = 0x22  -- スイカタワー
knd_dorian    = 0x23  -- 銀河ドリアン
knd_astro     = 0x24  -- アストロキング

-- eponym1
knd_any_golden = 0x00
knd_size      = 0x01
knd_weight    = 0x02
knd_pattern   = 0x03
knd_nutrition = 0x04
knd_sugar     = 0x05
knd_texture   = 0x06
knd_shape     = 0x07
knd_flavor    = 0x08
knd_smell     = 0x09
knd_tone      = 0x0A
knd_plain     = 0x63
knd_golden    = 0x64


-- eponym2
knd_final     = 0x16
knd_great     = 0x12
knd_good      = 0x0e
knd_lv3       = 0x0c
knd_lv0       = 0x0b
knd_mlv1      = 0x0a
knd_bad       = 0x09
knd_devil     = 0x05
knd_tend      = 0x01


attrb_table = {"size", "weight", "pattern", "nutrition", "sugar", "texture", "shape", "flavor", "smell", "tone"}
attrb_header = "   siz wgt ptr ntr sgr txt shp flv sml ton"


-- ## Crop Field
adr_field_no = 0x167D69  -- 1byte
field_no1 = 0x00
field_no2 = 0x01
field_no3 = 0x02
field_no4 = 0x03

-- a cursor position in the field
adr_field_position = 0x167D6A  -- 2byte
pos_bottom_left   = 0x0000
pos_bottom_center = 0x0001
pos_bottom_right  = 0x0002
pos_top_left      = 0x0100
pos_top_center    = 0x0101
pos_top_right     = 0x0102

-- pointing the address of crop on the cursor
adr_crop_adr = 0x167D6C  -- 4byte



------------------------------------------------------------
-- Hybrid
------------------------------------------------------------
Hybrid = {}
Hybrid.sd1 = {}
Hybrid.sd2 = {}
Hybrid.sd3 = {}
Hybrid.sd4 = {}
Hybrid.keepedSeed = {}

function Hybrid.readParentProperty(off_parent)
	local prop = nil
	local off_seed

	off_seed = memory.readdword(off_parent)
	off_seed = bit.band(off_seed, 0x00FFFFFF)  -- same as offseed & 0x00FFFFFF
	--print(string.format("parent seed addr = %8x", off_seed))
	if off_seed ~= 0 then
		prop = Seed.readProperty(off_seed)
	end
	return prop
end

function Hybrid.drawHybrid(sd1, sd2, sd3, tg, x, y)
	if draw_switch == 0 then
		gui.clearuncommitted()
		return
	end

	x = x or 0
	y = y or 80
	sd1 = sd1 or Hybrid.readParentProperty(adr_seed_first)
	sd2 = sd2 or Hybrid.readParentProperty(adr_seed_second)
	sd3 = sd3 or Seed.readProperty(adr_seed_hybrid)
	if sd1 == nil or sd2 == nil then return end
	tg = tg or {kind1 = 0}

	local sd1_str = string.format("%2x", sd1.kind1)
	local sd2_str = string.format("%2x", sd2.kind1)
	local sd3_str = string.format("%2x", sd3.kind1)
	local tg_str = string.format("%2x", tg.kind1)

	for k, v in pairs(attrb_table) do
		if draw_switch == 1 then
			sd1_str = sd1_str .. string.format(" %3x", sd1[v])
			sd2_str = sd2_str .. string.format(" %3x", sd2[v])
			sd3_str = sd3_str .. string.format(" %3x", sd3[v])
			if tg[v] == nil then
				tg_str = tg_str .. "    "
			elseif tg[v].value == 0 then
				tg_str = tg_str .. string.format(" %x+%d", tg[v].rank, tg[v].bit)
			else
				tg_str = tg_str .. string.format(" %3x", tg[v].value)
			end
		elseif draw_switch == 2 then
			sd1_str = sd1_str .. string.format(" %s", toBinary(sd1[v]))
			sd2_str = sd2_str .. string.format(" %s", toBinary(sd2[v]))
			sd3_str = sd3_str .. string.format(" %s", toBinary(sd3[v]))
		elseif draw_switch == 3 then
			if tg[v] ~= nil then
				sd1_str = sd1_str .. string.format(" %3x %s", sd1[v], toBinary(sd1[v]))
				sd2_str = sd2_str .. string.format(" %3x %s", sd2[v], toBinary(sd2[v]))
				sd3_str = sd3_str .. string.format(" %3x %s", sd3[v], toBinary(sd3[v]))
			end
		else
			sd1_str = sd1_str .. string.format(" %3x %s", sd1[v], toBinary(sd1[v]))
			sd2_str = sd2_str .. string.format(" %3x %s", sd2[v], toBinary(sd2[v]))
			sd3_str = sd3_str .. string.format(" %3x %s", sd3[v], toBinary(sd3[v]))
		end
	end

	gui.text(x, y, attrb_header)
	gui.text(x, y+10, sd1_str)
	gui.text(x, y+20, sd2_str)
	gui.text(x, y+30, sd3_str)
	gui.text(x, y+40, tg_str)
end

function Hybrid.drawRetryCount(cnt, x, y)
	x = x or 0
	y = y or 80
	local rng = memory.readdword(adr_rng)
	local total_reset = memory.readword(adr_total_reset_cnt)
	gui.text(x, y+50, string.format(" retry %4d/%d", cnt, total_reset))
	gui.text(x, y+60, string.format(" fail  %4d", fail_cnt))
	gui.text(x, y+70, string.format(" goal %2d/%2d", goal_cnt, target_total))
	gui.text(x, y+80, string.format(" rng   %08x", rng))
end


function Hybrid.adjustParentView(first, second, third)
	local prvw1 = memory.readword(adr_parent_view1)
	local prvw2 = memory.readword(adr_parent_view2)

	--print(string.format("prvw1 = %x, prvw2 = %x", prvw1, prvw2))
	while prvw2 == prvw2_seed_view do
		print("adjusting..... prvw2_seed_view")
		joypadSetHelper(1, {x=1}, 6)
		prvw2 = memory.readword(adr_parent_view2)
	end

	if prvw2 == prvw2_unpicked then
		--print("adjust unpicked")
	elseif prvw1 == prvw1_first then
		--print("adjust first")
		joypadSetHelper(1, first, 7)
	elseif prvw1 == prvw1_second then
		--print("adjust second")
		joypadSetHelper(1, second, 7)
	elseif prvw1 == prvw1_third then
		--print("adjust third")
		joypadSetHelper(1, third, 7)
	else
		print("adjusting..... failed")
	end
end


function Hybrid.preAdjustFirstParentView()
	return Hybrid.adjustParentView({}, {up=1}, {down=1})
end

function Hybrid.preAdjustSecondParentView()
	return Hybrid.adjustParentView({down=1}, {}, {up=1})
end

function Hybrid.postAdjustSecondParentView()
	return Hybrid.adjustParentView({up=1}, {down=1}, {})
end

function Hybrid.focusParentSeed()
	joypadSetHelper(1, {circle=1}, 7)
	local sdhr = memory.readword(adr_seed_hierarchy)
	--print(string.format("adr_seed_hierarchy = %x", sdhr))
	if sdhr == sdhr_top1 or sdhr == sdhr_top2  then
		joypadSetHelper(1, {circle=1}, 7)
	end
end

function Hybrid.clickParentSeed()
	joypadSetHelper(1, {circle=1}, 7)
end

function Hybrid.moveRow(row, pad)
	pad = pad or {down=1}
	for i = 1, row do
		joypadSetHelper(1, pad, 6)
	end
end

function Hybrid.changeGroup(pad)
	pad = pad or {r1=1}
	local group
	local prvw2 = memory.readword(adr_parent_view2)
	assertTrue(prvw2 == prvw2_seed_view)

	-- if cursor go round one lap then cahnge group
	group = memory.readword(adr_filter)
	while group ~= no_filter do
		joypadSetHelper(1, pad, 6)
		group = memory.readword(adr_filter)
	end
end

function Hybrid.matchSeed(sd1, sd2)
	local found1 = false
	local reached = 0

	--print("  >>> matchParent start >>>")

	if sd1.kind1 == sd2.kind1 then
		found1 = true
	else
		return false
	end

	for k, v in pairs(attrb_table) do
		if sd1[v] == nil then
			-- accepts any
			reached = reached + 1
		else
			-- sd1[v] ~= nil means we need to care this attribute, then refer this attribute

			if sd1[v] == sd2[v] then
				-- attribute value is matched. it means reached
				reached = reached + 1
			else
				return false
			end
		end
	end

	if reached == #attrb_table then
		return true
	else
		return false
	end
end

function Hybrid.isKeepedSeed(sd)
	--print(">>> isKeepedSeed start >>>")

	for k, v in pairs(Hybrid.keepedSeed) do
		--print("k = "..tostring(k)..", v = "..tostring(v))
		matched = Hybrid.matchSeed(v, sd)
		if matched == true then
			return true
		end
	end
	return false
end

function Hybrid.matchParent(tg, sd)
	local found1 = false
	local found2 = false
	local reached = 0

	--print("  >>> matchParent start >>>")

	if tg.kind1 == sd.kind1 then
		found1 = true
	else
		return false
	end

	if tg.eponym1 == sd.eponym1 and tg.eponym1 == knd_plain then
		found2 = true
	end

	if found1 and found2 then
		return true
	end

	-- UGLY:: I realy want to use continue!  I hate this code below!
	-- BUGGY:: I cannot already understand this logic.
	for k, v in pairs(attrb_table) do
		if tg[v] == nil then
			-- accepts any
			reached = reached + 1
			--continue
		else
			-- tg[v] ~= nil means we need to care this attribute, then refer this attribute
			local sd_rank, sd_bit = getRankAndBit(sd[v])

			if tg[v].value ~= 0 and tg[v].value == sd[v] then
				-- attribute value is matched. it means reached
				reached = reached + 1
				--continue
			elseif tg[v].value == 0 then
				-- don't care value, but need to care both of rank and bit counts


				--local sd_rank =  bit.rshift(sd[v], 8)  -- same as x >>= 2
				if tg[v].rank ~= 0 and tg[v].rank == sd_rank then
					-- rank is matched, need to refer bit counts
					

					--local sd_tmp = bit.band(sd[v], 0x00FF)  -- same as x & 0x00FF
					--local sd_bit = bitCount8(sd_tmp)
					if tg[v].bit == sd_bit then
						-- both of rank and bit counts are matched. it means reached
						reached = reached + 1
						--continue
					else
						return false
					end
					

				elseif tg[v].rank == 0 then
					-- accepts any. value == 0 and rank == 0 means accepting any.
					reached = reached + 1
					--continue
				else
					return false
				end
			else
				return false
			end
		end
	end

	if reached == #attrb_table then
		return true
	else
		return false
	end
end

function Hybrid.selectFirstSeed(tg, pad_row, pad_group)
	local cursor = 0
	local start_cursor = 0
	local row = 0
	local state_tmp

	print(">>> selectFirstSeed start >>>, "..targetChildToString(tg))

	Hybrid.preAdjustFirstParentView()
	Hybrid.focusParentSeed()

	for j=1, 2 do
		cursor = memory.readword(adr_cursor_seed_first)
		start_cursor = cursor
		row = 0
		state_tmp = savestate.create()
		savestate.save(state_tmp)

		repeat
			Hybrid.clickParentSeed()
			Hybrid.sd1 = Hybrid.readParentProperty(adr_seed_first)
			assertFalse(Hybrid.sd1 == nil)

			--if Hybrid.sd1 == nil then
			--	print("press again readParentProperty")
			--	joypadSetHelper(1, {circle=1}, 7)
			--	Hybrid.sd1 = Hybrid.readParentProperty(adr_seed_first)
			--end
			--print("sd1::"..Hybrid.sd1.info)

			local matched = Hybrid.matchParent(tg, Hybrid.sd1)
			if matched then
				-- check whether a slected seed is a keeped seed
				local keeped = Hybrid.isKeepedSeed(Hybrid.sd1)
				if keeped == true then
					print("sd1:: keeped seed ********** ********** **********")
				else
					return true
				end
			else
				--print("sd1:: not found")
			end

			--Hybrid.preAdjustFirstParentView()
			--Hybrid.focusParentSeed()
			savestate.load(state_tmp)

			row = row + 1
			Hybrid.moveRow(row, pad_row)
			cursor = memory.readword(adr_cursor_seed_first)
		until cursor == start_cursor

		savestate.load(state_tmp)
		print("sd1:: not found in this group. changing group")
		Hybrid.changeGroup(pad_group)
	end

	return false
end

function Hybrid.selectSecondSeed(tg, pad_row, pad_group)
	local cursor = 0
	local start_cursor = 0
	local row = 0
	local state_tmp

	print(">>> selectSecondSeed start >>>, "..targetChildToString(tg))

	Hybrid.preAdjustSecondParentView()
	Hybrid.focusParentSeed()

	for j=1, 2 do
		cursor = memory.readword(adr_cursor_seed_second)
		start_cursor = cursor
		row = 0
		state_tmp = savestate.create()
		savestate.save(state_tmp)

		repeat
			Hybrid.clickParentSeed()
			Hybrid.sd2 = Hybrid.readParentProperty(adr_seed_second)
			assertFalse(Hybrid.sd2 == nil)

			--if Hybrid.sd2 == nil then
			--	print("press again readParentProperty")
			--	Hybrid.clickParentSeed()
			--	Hybrid.sd2 = Hybrid.readParentProperty(adr_seed_second)
			--end
			--print("sd2::"..Hybrid.sd2.info)

			local matched = Hybrid.matchParent(tg, Hybrid.sd2)
			if matched then
				-- check whether a slected seed is a keeped seed
				local keeped = Hybrid.isKeepedSeed(Hybrid.sd2)
				if keeped == true then
					print("sd2:: keeped seed ********** ********** **********")
				else
					return true
				end
			else
				--print("sd2:: not found")
			end

			--Hybrid.preAdjustSecondParentView()
			--Hybrid.focusParentSeed()
			savestate.load(state_tmp)

			row = row + 1
			Hybrid.moveRow(row, pad_row)
			cursor = memory.readword(adr_cursor_seed_second)
		until cursor == start_cursor

		savestate.load(state_tmp)
		print("sd2:: not found in this group. changing group")
		Hybrid.changeGroup(pad_group)
	end

	return false
end

function Hybrid.retry(cnt)
	if cnt % 2 == 0 then
		joypadSetHelper(1, {l1=1}, 8)
	else
		joypadSetHelper(1, {r1=1}, 8)
	end
end

function Hybrid.isEvolved(tg, sd, v)
	local evolved = false
	local sd1_rank, sd1_bit = getRankAndBit(Hybrid.sd1[v])
	local sd2_rank, sd2_bit = getRankAndBit(Hybrid.sd2[v])
	local sd3_rank, sd3_bit = getRankAndBit(sd[v])
	local sd1_value, sd2_value
	if Hybrid.sd1[v] == 0x494 then
		sd1_value = 0xC94
	else
		sd1_value = Hybrid.sd1[v]
	end
	if Hybrid.sd2[v] == 0x494 then
		sd2_value = 0xC94
	else
		sd2_value = Hybrid.sd2[v]
	end

	if tg[v].order == nil then evolved = true end
	if tg[v].order == true then
		--if sd3_rank > math.max(sd1_rank, sd2_rank) then
		--	evolved = true
		--end
		if sd1_rank == sd2_rank and sd3_bit > math.max(sd1_bit, sd2_bit) then
			evolved = true
		elseif sd[v] > math.max(sd1_value, sd2_value) then
			evolved = true
		--elseif sd1_rank > sd2_rank and (sd3_rank == sd1_rank and sd3_bit > sd1_bit) then
		--	evolved = true
		--elseif sd1_rank < sd2_rank and (sd3_rank == sd2_rank and sd3_bit > sd2_bit) then
		--	evolved = true
		end
	end

	if tg[v].order == false then
		--if sd3_rank < math.min(sd1_rank, sd2_rank) then
		--	evolved = true
		--end
		if sd1_rank == sd2_rank and sd3_bit < math.min(sd1_bit, sd2_bit) then
			evolved = true
		elseif sd[v] < math.min(sd1_value, sd2_value) then
			evolved = true
		--elseif sd1_rank < sd2_rank and (sd3_rank == sd1_rank and sd3_bit < sd1_bit) then
		--	evolved = true
		--elseif sd1_rank > sd2_rank and (sd3_rank == sd2_rank and sd3_bit < sd2_bit) then
		--	evolved = true
		end
	end
	return evolved
end

function Hybrid.isExceeded(tg, sd, v)
	local exceeded = false
	if tg[v].order == true and tg[v].value ~= bit.bor(tg[v].value, sd[v]) then
		exceeded  = true
	end
	if tg[v].order == false and tg[v].value ~= bit.band(tg[v].value, sd[v]) then
		exceeded  = true
	end
	return exceeded
end

function Hybrid.matchExpect(tg, sd)
	local found1 = false
	local evolved = false
	local reached = 0
	local levelup = 0
	local str = ""

	--print("  >>> matchExpect start >>>")

	if tg.kind1 == sd.kind1 then
		found1 = true
	else
		return false
	end

	-- UGLY:: I realy want to use continue!  I hate this code below!
	-- BUGGY:: I cannot already understand this logic.
	

	for k, v in pairs(attrb_table) do
		evolved = false
		--print(k, v)
		if tg[v] == nil then
			-- accepts any
			reached = reached + 1
			--str = string.format("reached = %d, levelup = %d", reached, levelup)
			--print(str..", attrb is nil, accepts any")
			--continue
		else
			-- tg[v] ~= nil means we need to care this attribute, then refer this attribute
			
			--if tg[v].order == true and sd[v] > math.max(Hybrid.sd1[v], Hybrid.sd2[v]) then
			--	evolved = true
			--end
			--if tg[v].order == false and sd[v] < math.min(Hybrid.sd1[v], Hybrid.sd2[v]) then
			--	evolved = true
			--end
			
			evolved = Hybrid.isEvolved(tg, sd, v)
			--print(string.format("value = %s, evolved = %s ", v, tostring(evolved)))
			local sd_rank, sd_bit = getRankAndBit(sd[v])

			if tg[v].value ~= 0 and tg[v].value == sd[v] then
				-- attribute value is matched. it means reached goal
				reached = reached + 1
				--str = string.format("reached = %d, levelup = %d", reached, levelup)
				--print(str..", attrb value is matched")
				--continue
			elseif tg[v].value ~= 0 and evolved then
				-- attribute is eveloved. it means level up
				
				--local sd_rank = bit.rshift(sd[v], 8)  -- same as x >>= 8
				-- # if a wrong bit is set then return false
				if tg[v].rank ~= 0 and tg[v].rank == sd_rank then
					-- rank is matched
					if Hybrid.isExceeded(tg, sd, v) then
						--print("attrb value is exceeded")
						return false
					end
				end
				levelup = levelup + 1
				--str = string.format("reached = %d, levelup = %d", reached, levelup)
				--print(str..", attrb value is evolved. value is not 0")
				--continue

			elseif tg[v].value == 0 then
				-- don't care value, but need to care both of rank and bit counts


				--local sd_rank = bit.rshift(sd[v], 8)  -- same as x >>= 8
				--print(string.format("tg[v].rank = %x, sd_rank = %x", tg[v].rank, sd_rank))
				if tg[v].rank ~= 0 and tg[v].rank == sd_rank then
					-- rank is matched, need to refer bit counts


					--local sd_tmp = bit.band(sd[v], 0x00FF)  -- same as x & 0x00FF
					--local sd_bit = bitCount8(sd_tmp)
					--print(string.format("tg[v].bit = %d, sd_bit = %d", tg[v].bit ,sd_bit))
					if tg[v].bit == sd_bit then
						-- both of rank and bit counts are matched. it means reached goal
						reached = reached + 1
						--str = string.format("reached = %d, levelup = %d", reached, levelup)
						--print(str..", rank and bit counts are matched")
						--continue
					elseif evolved then
						-- attribute is eveloved. it means level up
						levelup = levelup + 1
						--str = string.format("reached = %d, levelup = %d", reached, levelup)
						--print(str..", attrb value is evolved. rank is not 0 and same rank")
						--continue
					else
						return false
					end


				elseif tg[v].rank ~= 0 and evolved then
					-- attribute is eveloved. it means level up
					levelup = levelup + 1
					--str = string.format("reached = %d, levelup = %d", reached, levelup)
					--print(str..", attrb value is evolved. rank is not 0 and different rank")
					--continue
				elseif tg[v].rank == 0 then
					-- accepts any. value == 0 and rank == 0 means accepting any.
					reached = reached + 1
					--str = string.format("reached = %d, levelup = %d", reached, levelup)
					--print(str..", attrb is 0 and rank is 0, accepts any")
					--continue
				else
					return false
				end
			else
				return false
			end
		end
	end

	if reached == #attrb_table then
		goal_flag = true
		print("goal_flag is true")
		return true
	elseif reached + levelup == #attrb_table then
		print("level up")
		return true
	else
		return false
	end
end

function Hybrid.expectPete1(tg, sd)
	Hybrid.sd3 = Seed.readProperty(adr_seed_hybrid)
	Hybrid.drawHybrid(Hybrid.sd1, Hybrid.sd2, Hybrid.sd3, tg)
	print("sd3::"..Hybrid.sd3.info)
	print("sd3:: accepts any expectation for PETE1")
	return true
end

function Hybrid.expect(tg)
	local ret = false

	Hybrid.sd3 = Seed.readProperty(adr_seed_hybrid)
	Hybrid.drawHybrid(Hybrid.sd1, Hybrid.sd2, Hybrid.sd3, tg)

	local matched = Hybrid.matchExpect(tg, Hybrid.sd3)
	if matched then
		print("sd3::"..Hybrid.sd3.info)
		print("sd3:: matched expectation")
		ret = true
	else
		--print("sd3:: not matched expectation")
	end

	return ret
end

function Hybrid.check(tg)

	Hybrid.sd4 = Seed.readProperty(adr_seed_hybrid)
	print("sd4::"..Hybrid.sd4.info)

	local matched = Hybrid.matchExpect(tg, Hybrid.sd4)
	if matched then
		print("sd4:: hybrid is succeeded")
		success_flag = true
		Hybrid.postConfirm(true)
	elseif Hybrid.sd4.kind1 == 0 then
		print("***** failed to produce. kuzu-vegee *****".." <-------------------")
		fail_cnt = fail_cnt + 1
		--Hybrid.postConfirm(false)
	else
		print("***** failed to produce. miss expectation *****".." <-------------------")
		fail_cnt = fail_cnt + 1
		--Hybrid.postConfirm(true)
	end

	return success_flag
end


function Hybrid.confirm()
	joypadSetHelper(1, {circle=1}, 7)
end

function Hybrid.postConfirm(produced)
	fadv(150)
	joypadSetHelper(1, {x=1}, 6)
	if produced then
		joypadSetHelper(1, {x=1}, 6)
	end
end

-- @deprecated use hybridizeReload()
function Hybrid.hybridizeSimple(target)
	Hybrid.confirm(target)
	Hybrid.check(target)
end

function Hybrid.hybridizeReload(tg)
	-- create save state for repeat
	local state_before = savestate.create()
	savestate.save(state_before)

	Hybrid.confirm()

	-- check whether the seed is produced successfully
	if Hybrid.check(tg) then
		--pass, like python
	else
		-- reload save state for retry
		savestate.load(state_before)
		print("***** reload savestate *****".." <--------------------")
		fadv(2)
	end
end

function Hybrid.hybridize(tg)
	--Hybrid.hybridizeSimple(target)
	Hybrid.hybridizeReload(tg)
end

function Hybrid.autoHybrid(target)
	local ret = false
	local i = 0
	print(">>> start to autoHybrid >>>, "..targetChildToString(target.hybrid))

	goal_flag = false
	for j=1, try_cnt2 do
		success_flag = false
		-- select first seed
		local ret1 = Hybrid.selectFirstSeed(target.first)
		if ret1 then
			print("sd1:: target is found")
		else
			print("sd1:: target is not found")
			break
		end

		-- select second seed
		local ret2 = Hybrid.selectSecondSeed(target.second)
		if ret2 then
			print("sd2:: target is found")
		else
			print("sd2:: target is not found")
			break
		end
		Hybrid.postAdjustSecondParentView()

		-- repeat to press l1 or r1 until expected value
		for i=0, try_cnt1 do
			switchDrawHybrid()
			Hybrid.drawRetryCount(i)
			-- if status is better/worse then press circle
			if Hybrid.expect(target.hybrid) then
				local fc = emu.framecount()
				print(string.format("j=%d, i=%d, fc=%d", j, i, fc))
				Hybrid.hybridize(target.hybrid)
				if success_flag then
					target.first = convertTargetFirst(target.first, Hybrid.sd4)
					break
				end
			end

			Hybrid.retry(i)
			target.retry = target.retry + 1
		end

		-- if status reached goal then exit
		if goal_flag and success_flag then
			print("goal_flag is true, success_flag is true")
			target.done = 1
			goal_cnt = goal_cnt + 1
			ret = true
			break
		end
	end

	Hybrid.drawRetryCount(i)
	print("<<< autoHybrid is finished <<<")
	return ret
end

------------------------------------------------------------
-- Target
------------------------------------------------------------
function targetChildToString(tg)
	-- TODO:: implement here
	return tostring(tg)
end

function targetToSummaryString(target)
	local str = string.format(" %2x, %d, %d, ", target.hybrid.kind1, target.retry, target.done)
	str = str .. targetChildToString(target.hybrid)
	return str
end

function convertTargetFirst(tg, sd)
	local fst = {}

	fst.kind1 = sd.kind1
	for k, v in pairs(attrb_table) do
		if tg[v] == nil then
			--pass, like python
		else
			fst[v] = {value = sd[v]}
			--fst[v].value = sd[v]  -- error with this style.
		end
	end
	return fst
end

------------------------------------------------------------
-- Seed
------------------------------------------------------------
Seed = {}
--Seed.total = memory.readbyte(adr_total_seed)

function Seed.readProperty(off_seed)
	local prop = {}

	-- property of seed (+28h)
	local off_kind1     = off_seed         -- 0x167E80
	local off_eponym1   = off_seed + 0x01  -- 0x167E81  -- syoki, golden or each attributes
	local off_eponym2   = off_seed + 0x02  -- 0x167E82  -- level of eponym1 ex) micro, tyo-keiryo
	local off_postnum   = off_seed + 0x03  -- 0x167E83  -- postnum ex) yaya-omo shimaimo3
	local off_count     = off_seed + 0x04  -- 0x167E84
	local off_stock     = off_seed + 0x05  -- 0x167E85
	local off_price     = off_seed + 0x06  -- 0x167E86
	local off_size      = off_seed + 0x08  -- 0x167E88
	local off_weight    = off_seed + 0x0A  -- 0x167E8A
	local off_pattern   = off_seed + 0x0C  -- 0x167E8C
	local off_nutrition = off_seed + 0x0E  -- 0x167E8E
	local off_sugar     = off_seed + 0x10  -- 0x167E90
	local off_texture   = off_seed + 0x12  -- 0x167E92
	local off_shape     = off_seed + 0x14  -- 0x167E94
	local off_flavor    = off_seed + 0x16  -- 0x167E96
	local off_smell     = off_seed + 0x18  -- 0x167E98
	local off_tone      = off_seed + 0x1A  -- 0x167E9A
	local off_name      = off_seed + 0x1C  -- 0x167E9C 12byte, big endian

	-- Read the property
	prop.kind1     = memory.readbyte(off_kind1    )
	prop.eponym1   = memory.readbyte(off_eponym1  )
	prop.eponym2   = memory.readbyte(off_eponym2  )
	prop.postnum   = memory.readbyte(off_postnum  )
	prop.count     = memory.readbyte(off_count    )
	prop.stock     = memory.readbyte(off_stock    )
	prop.price     = memory.readword(off_price    )
	prop.size      = memory.readword(off_size     )
	prop.weight    = memory.readword(off_weight   )
	prop.pattern   = memory.readword(off_pattern  )
	prop.nutrition = memory.readword(off_nutrition)
	prop.sugar     = memory.readword(off_sugar    )
	prop.texture   = memory.readword(off_texture  )
	prop.shape     = memory.readword(off_shape    )
	prop.flavor    = memory.readword(off_flavor   )
	prop.smell     = memory.readword(off_smell    )
	prop.tone      = memory.readword(off_tone     )
	prop.adr       = off_seed

	prop.info = Seed.toString(prop)
	--print(prop.info)
	return prop
end

function Seed.toString(prop)
	local str = string.format("seed:: %2x %2x %2x %2d %2d, "
			.."%5d %3x %3x %3x %3x %3x %3x %3x %3x %3x %3x, ",
			prop.kind1, prop.eponym1, prop.postnum, prop.count, prop.stock,
			prop.price, prop.size, prop.weight, prop.pattern, prop.nutrition,
			prop.sugar, prop.texture, prop.shape, prop.flavor, prop.smell, prop.tone)
	str = str .. string.format(" %08x", prop.adr)
	return str
end

function Seed.showAll()
	local prop = {}
	local off_seed = adr_seed

	for i=1, 100 do
		print(string.format("-- seed%d --", i))
		prop = Seed.readProperty(off_seed)
		off_seed = off_seed + 0x28

		if prop.kind1 == 0 then
			break
		end
		print(prop.info)
	end
end

------------------------------------------------------------
-- Crop in the field
------------------------------------------------------------
FCrop = {}

function FCrop.readProperty(off_crop)
	local prop = {}

	-- property of crop in the field (+34h)
	local off_kind1     = off_crop         -- 0x168E20
	local off_eponym1   = off_crop + 0x01  -- 0x168E21
	local off_eponym2   = off_seed + 0x02  -- 0x167E82
	local off_postnum   = off_crop + 0x03  -- 0x168E23
	local off_price     = off_crop + 0x06  -- 0x168E26
	local off_size      = off_crop + 0x08  -- 0x168E28
	local off_weight    = off_crop + 0x0A  -- 0x168E2A
	local off_pattern   = off_crop + 0x0C  -- 0x168E2C
	local off_nutrition = off_crop + 0x0E  -- 0x168E2E
	local off_sugar     = off_crop + 0x10  -- 0x168E30
	local off_texture   = off_crop + 0x12  -- 0x168E32
	local off_shape     = off_crop + 0x14  -- 0x168E34
	local off_flavor    = off_crop + 0x16  -- 0x168E36
	local off_smell     = off_crop + 0x18  -- 0x168E38
	local off_tone      = off_crop + 0x1A  -- 0x168E3A
	local off_stage     = off_crop + 0x28  -- 0x168E48
	local off_days      = off_crop + 0x29  -- 0x168E49
	local off_baboo     = off_crop + 0x2A  -- 0x168E4A
	local off_condition = off_crop + 0x2B  -- 0x168E4B

	prop.kind1     = memory.readbyte(off_kind1    )
	prop.eponym1   = memory.readbyte(off_eponym1  )
	prop.eponym2   = memory.readbyte(off_eponym2  )
	prop.postnum   = memory.readbyte(off_postnum  )
	prop.price     = memory.readword(off_price    )
	prop.size      = memory.readword(off_size     )
	prop.weight    = memory.readword(off_weight   )
	prop.pattern   = memory.readword(off_pattern  )
	prop.nutrition = memory.readword(off_nutrition)
	prop.sugar     = memory.readword(off_sugar    )
	prop.texture   = memory.readword(off_texture  )
	prop.shape     = memory.readword(off_shape    )
	prop.flavor    = memory.readword(off_flavor   )
	prop.smell     = memory.readword(off_smell    )
	prop.tone      = memory.readword(off_tone     )
	prop.stage     = memory.readbyte(off_stage    )
	prop.days      = memory.readbyte(off_days     )
	prop.baboo     = memory.readbyte(off_baboo    )
	prop.condition = memory.readbyte(off_condition)

	prop.info = FCrop.toString(prop)
	--print(prop.info)
	return prop
end

function FCrop.toString(prop)
	local str = string.format("fcrop:: %2x %2x %2x, "
			.."%5d %3x %3x %3x %3x %3x %3x %3x %3x %3x %3x, "
			.."%2x %2d %2x %2x",
			prop.kind1, prop.eponym1, prop.postnum,
			prop.price, prop.size, prop.weight, prop.pattern, prop.nutrition,
			prop.sugar, prop.texture, prop.shape, prop.flavor, prop.smell, prop.tone,
			prop.stage, prop.days, prop.baboo, prop.condition)
	return str
end

function FCrop.drawProperty(prop, x, y)
	if prop.kind1 == nil then return end
	x = x or 0
	y = y or 80

	-- Render image
	gui.text(x, y, "")
	gui.text(x, y+ 10, "prc")
	gui.text(x, y+ 20, "siz")
	gui.text(x, y+ 30, "wgt")
	gui.text(x, y+ 40, "ptr")
	gui.text(x, y+ 50, "ntr")
	gui.text(x, y+ 60, "sgr")
	gui.text(x, y+ 70, "txt")
	gui.text(x, y+ 80, "shp")
	gui.text(x, y+ 90, "flv")
	gui.text(x, y+100, "sml")
	gui.text(x, y+110, "ton")

	gui.text(x+14, y, prop.kind1)
	gui.text(x+14, y+ 10, prop.price    )
	gui.text(x+14, y+ 20, prop.size     )
	gui.text(x+14, y+ 30, prop.weight   )
	gui.text(x+14, y+ 40, prop.pattern  )
	gui.text(x+14, y+ 50, prop.nutrition)
	gui.text(x+14, y+ 60, prop.sugar    )
	gui.text(x+14, y+ 70, prop.texture  )
	gui.text(x+14, y+ 80, prop.shape    )
	gui.text(x+14, y+ 90, prop.flavor   )
	gui.text(x+14, y+100, prop.smell    )
	gui.text(x+14, y+110, prop.tone     )
end


------------------------------------------------------------
-- Baboo
------------------------------------------------------------
Baboo = {}

function Baboo.drawInfo(x, y)
	x = x or 0
	y = y or 60
	local rng = memory.readdword(adr_rng)
	local feather = memory.readword(adr_total_feather)
	local seeds = memory.readbyte(adr_total_seed)
	local days = memory.readbyte(adr_days)
	local lr = memory.readword(adr_total_reset_cnt)
	local win = memory.readword(adr_win_count)

	gui.text(x, y   , string.format(" rng   %08x", rng))
	gui.text(x, y+10, string.format(" feather %d", feather))
	gui.text(x, y+20, string.format(" seeds   %d", seeds))
	gui.text(x, y+30, string.format(" days    %d", days))
	gui.text(x, y+40, string.format(" lr  %d", lr))
	gui.text(x, y+50, string.format(" win %d", win))
end

function Baboo.showStatus()
	-- TODO:: imprement here
end

------------------------------------------------------------
-- utility functions
------------------------------------------------------------
function fadv(n)
	n = n or 1
	for i=1, n do
		emu.frameadvance()
	end
end

function joypadSetHelper(port, buttons, wait_frame)
	-- input buttons through two frames in case.
	joypad.set(port, buttons)
	fadv(1)
	joypad.set(port, buttons)
	fadv(wait_frame - 1)
end

function toBinary2(decimal)
	if decimal == 0 then return '0' end
	local bin_str = ""
	while decimal > 0 do
		bin_str = bin_str .. tostring(decimal % 2)
		decimal = bit.rshift(decimal, 1)  -- same as decimal >>= 1
	end
	return string.reverse(bin_str)
end

function toBinary(decimal)
	local value = bit.lshift(1 ,(8-1))  -- same as 1 << 7
	local bin_str = ""

	while value ~= 0 do
		if bit.band(decimal, value) > 0 then
			bin_str = bin_str .. "1"
		else
			bin_str = bin_str .. "0"
		end
		value = bit.rshift(value, 1)  -- same as value >>= 1
	end

	return bin_str
end

function bitCount8(b8)
	--print(string.format("bit counting in %x, %s", b8, toBinary(b8)))
	
	--b8 = ((b8 & 0xAA) >> 1) + (b8 & 0x55)
	--b8 = ((b8 & 0xCC) >> 2) + (b8 & 0x33)
	--b8 = ((b8 & 0xF0) >> 4) + (b8 & 0x0F)
	-- count bits set in the number. 8bit limited. same algorithm above
	b8 = bit.rshift(bit.band(b8, 0xAA), 1) + bit.band(b8, 0x55)
	b8 = bit.rshift(bit.band(b8, 0xCC), 2) + bit.band(b8, 0x33)
	b8 = bit.rshift(bit.band(b8, 0xF0), 4) + bit.band(b8, 0x0F)

	--print(string.format("bit counts are %d", b8))
	return b8
end


function getRankAndBit(value)
	local sd_rank
	local sd_bit
	local bit_tmp

	sd_rank = bit.rshift(value, 8)  -- same as x >>= 8
	bit_tmp = bit.band(value, 0x00FF)  -- same as x & 0x00FF
	sd_bit = bitCount8(bit_tmp)
	return sd_rank, sd_bit
end

function assertTrue(value, message)
	message = message or ""
	message = "assertion failed! "..message
	if value then
		return true
	else
		print(message)
		return false
	end
end

function assertFalse(value, message)
	message = message or ""
	message = "assertion failed! "..message
	if value then
		print(message)
		return false
	else
		return true
	end
end

function switchDrawHybrid()
	local kbd = input.get()
	if kbd.B then
		if draw_key == 0 then
			--draw_switch = bit.bnot(draw_switch)  -- same as draw_switch = ~draw_switch
			draw_switch = draw_switch + 1
			if draw_switch > 4 then draw_switch = 0 end
		end
		draw_key = draw_key + 1
	else
		draw_key = 0
	end
end

------------------------------------------------------------
-- define
------------------------------------------------------------
target_total = 0
try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 24    -- max level up count
draw_key = 0
draw_switch = 1
goal_flag = false
success_flag = false
fail_cnt = 0
goal_cnt = 0




--[[
-- astronoka memo
--
-- + It affects hybrid expectation to change the order of hybrid.
--
-- + It affects baboo species coming up today that moving cursor in the filed.
--   But it doesn't do hybrid expectation.
--   ex.) After moving cursor in the filed, sometimes baboo species are changed.
--
-- + It affects baboo feather that which time you go to field on the same day.
--
--
--]]
