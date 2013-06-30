-- Astronoka
-- This is auto hybrid script, also shows hybrid expectation.
-- You can uncomment target_vegee table, if needed.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Prepare seeds below
--     ++ plain simaimo = a lot
--     ++ plain kabu    = 30 or more
--     ++ other vegees  = 2 or more
--   2. Go to hybrid machine room
--   3. Put cursol the first seed
--   4. Start this script
--
-- + This script can
--     ++ evelove only one attribute each vegees
--
-- + This script can not
--     ++ refer multiple attribute each vegees
--     ++ use to optimize for speed run
--
-- + Special Thanks
--   http://homepage3.nifty.com/game-sfccode/astronoka.html
--   http://www009.upp.so-net.ne.jp/dreamy/ps/noka.html

require "bit"

------------------------------------------------------------
-- address
------------------------------------------------------------

-- ##hybrid machine
-- first parent, pointing the address of seed in inventory
local adr_seed_first = 0x1CD698
-- second parent, pointing the address of seed in inventory
local adr_seed_second = 0x1CD69C
-- produced seed, listing the property of hybrid seed
local adr_seed_hybrid = 0x1CD6A8

-- mendel cross
-- 0x1CD6D8  -- kind1 of first seed
-- 0x1CD6DC  -- mendel value of first seed
-- 0x1CD6DE  -- kind1 of second seed
-- 0x1CD6E2  -- mendel value of second seed
-- 0x1CD6E4  -- kind1 of hybrid seed
-- 0x1CD6E8  -- mendel value of hybrid seed

-- ##inventory
-- address of first seed in inventory, next +28h, max 100
local adr_seed = 0x167E80
-- address of first crops in the field, next +34h, max 24
local adr_fcrop = 0x168E20
-- address of first crops in inventory, next +30h, max 100
local adr_icrop = 0x169300

-- If this value is 0xC000, all itmes are shown without filtering
local adr_filter = 0x190288
local no_filter = 0xC000
-- I don't know this value, but regard as a flag in hierarchy of seed selecting view
local adr_seed_hierarchy = 0x1FFCEE
local sdhr_top = 0x0000
local sdhr_second = 0x8016

-- I don't know these values, but regard as a flag in parent selecting view
local adr_parent_view1 = 0x1CD784
local prvw1_first = 0x0000
local prvw1_second = 0x0001
local prvw1_third = 0x0002
local adr_parent_view2 = 0x1FFDE4
local prvw2_unpicked = 0xAF9C
local prvw2_first = 0x0000
local prvw2_second = 0x0001
local prvw2_seed_view = 0x7DFC
local prvw2_third1 = 0xA61C
local prvw2_third2 = 0xAB78
local prvw2_kuzu = 0xD778
local adr_parent_view3 = 0x1FFDFC

-- ## Properties of vegee
-- kind1
local knd_kuzu      = 0x00  -- くず野菜
local knd_hourensou = 0x01  -- 穴ホウレン草
local knd_nira      = 0x02  -- ニラクラウン
local knd_kyabetsu  = 0x03  -- 透明キャベツ
local knd_paseri    = 0x04  -- ウキウキパセリ
local knd_karifura  = 0x05  -- カリフラボール
local knd_mame      = 0x06  -- 宇宙マメ
local knd_karashi   = 0x07  -- ホタル唐辛子
local knd_wakame    = 0x08  -- 真空ワカメ
local knd_konbu     = 0x09  -- 月面コンブ
local knd_chingen   = 0x0A  -- チンゲンツリー
local knd_piman     = 0x0B  -- 妖精ピーマン
local knd_herb      = 0x0C  -- 水晶ハーブ
local knd_shimaimo  = 0x0D  -- シマイモ
local knd_kabu      = 0x0E  -- 星カブ
local knd_renkon    = 0x0F  -- 腰かけレンコン
local knd_ninjin    = 0x10  -- コスモニンジン
local knd_tamanegi  = 0x11  -- タマネギボム
local knd_imodama   = 0x12  -- イモ球
local knd_gobou     = 0x13  -- ゴボウ玉
local knd_kabocha   = 0x14  -- 火星カボチャ
local knd_garlic    = 0x15  -- トゲガーリック
local knd_takenoko  = 0x16  -- カブトタケノコ
local knd_matsutake = 0x17  -- 冥王マツタケ
local knd_kifujin   = 0x18  -- 貴婦人
local knd_tomato    = 0x19  -- トマトニアン
local knd_kyuri     = 0x1A  -- 電灯キューリ
local knd_nasu      = 0x1B  -- 土星ナス
local knd_meron     = 0x1C  -- ドームメロン
local knd_remon     = 0x1D  -- ひよこレモン
local knd_corn      = 0x1E  -- ロウソクコーン
local knd_peach     = 0x1F  -- 砲丸ピーチ
local knd_ichigo    = 0x20  -- イチゴブドウ
local knd_pine      = 0x21  -- 光速パイン
local knd_suica     = 0x22  -- スイカタワー
local knd_dorian    = 0x23  -- 銀河ドリアン
local knd_astro     = 0x24  -- アストロキング

-- kind2
local knd_plain     = 0x63


------------------------------------------------------------
-- Hybrid
------------------------------------------------------------
Hybrid = {}
Hybrid.sd1 = {}
Hybrid.sd2 = {}
Hybrid.sd3 = {}
Hybrid.sd4 = {}

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

function Hybrid.drawHybrid(sd1, sd2, sd3, attrb, x, y)
	x = x or 0
	y = y or 80

	sd1 = sd1 or Hybrid.readParentProperty(adr_seed_first)
	sd2 = sd2 or Hybrid.readParentProperty(adr_seed_second)
	sd3 = sd3 or Seed.readProperty(adr_seed_hybrid)
	attrb = attrb or "weight"
	if sd1 == nil or sd2 == nil then return end

	local sd1_str = string.format("%2x %3x %s", sd1.kind1, sd1[attrb], toBinary(sd1[attrb]))
	local sd2_str = string.format("%2x %3x %s", sd2.kind1, sd2[attrb], toBinary(sd2[attrb]))
	local sd3_str = string.format("%2x %3x %s", sd3.kind1, sd3[attrb], toBinary(sd3[attrb]))

	gui.text(x, y,    sd1_str)
	gui.text(x, y+10, sd2_str)
	gui.text(x, y+20, sd3_str)
end

function Hybrid.drawRetryCount(cnt, x, y)
	x = x or 0
	y = y or 80
	gui.text(x, y+30, string.format(" retry %4d", cnt))
	gui.text(x, y+40, string.format(" fail  %4d", fail_cnt))
	gui.text(x, y+50, string.format(" goal  %4d", goal_cnt))
end


function adjustParentView(first, second, third)
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


function preAdjustFirstParentView()
	return adjustParentView({}, {up=1}, {down=1})
end

function preAdjustSecondParentView()
	return adjustParentView({down=1}, {}, {up=1})
end

function postAdjustSecondParentView()
	return adjustParentView({up=1}, {down=1}, {})
end

function Hybrid.selectFirstSeed(target)
	local ret = false
	local found1 = false
	local found2 = false
	local found3 = false
	local not_found = 0
	local group
	local row = math.min(10, Seed.total)
	local row_max = math.min(100, Seed.total)

	print(">>> selectFirstSeed start >>>, "..targetToString(target))

	for j=1, 5 do
		for i=1, row do
			found1 = false
			found2 = false
			found3 = false
			preAdjustFirstParentView()
			joypadSetHelper(1, {circle=1}, 7)
			local sdhr = memory.readword(adr_seed_hierarchy)
			if sdhr == sdhr_top then
				joypadSetHelper(1, {circle=1}, 7)
			end
			if i > 1 then
				joypadSetHelper(1, {down=1}, 6)
			end
			if j > 1 and i == 1 then
				--local prvw1 = memory.readword(adr_parent_view1)
				--local prvw2 = memory.readword(adr_parent_view2)
				--print(string.format("prvw1 = %x, prvw2 = %x", prvw1, prvw2))

				group = memory.readword(adr_filter)
				--print(string.format("group1 = %4x", group))
				while group ~= no_filter do
					joypadSetHelper(1, {r1=1}, 6)
					group = memory.readword(adr_filter)
					--print(string.format("group2 = %4x", group))
				end
			end
			joypadSetHelper(1, {circle=1}, 7)

			Hybrid.sd1 = Hybrid.readParentProperty(adr_seed_first)
			if Hybrid.sd1 == nil then
				print("press again readParentProperty")
				joypadSetHelper(1, {circle=1}, 7)
				Hybrid.sd1 = Hybrid.readParentProperty(adr_seed_first)
			end
			--print("sd1::"..Hybrid.sd1.info)
			
			if 0x0C00 < target.goal and target.start <= Hybrid.sd1[target.attrb] and Hybrid.sd1[target.attrb] < target.goal then
				found1 = true
				--print("sd1:: found1 is true")
			end
			if 0x0C00 > target.goal and target.start >= Hybrid.sd1[target.attrb] and Hybrid.sd1[target.attrb] > target.goal then
				found2 = true
				--print("sd1:: found2 is true")
			end
			if Hybrid.sd1.kind1 == target.kind1  then
				found3 = true
			end

			if found3 and (found1 or found2) then
				print("sd1:: found!! then break")
				ret = true
				break
			else
				--print("sd1:: not found")
			end
		end
		if ret == true then break end
		--print(string.format("sd1:: row=%d, row_max=%d, not_found=%d", row, row_max, not_found))
		if row < row_max then
			row = math.min(row + 20, row_max)
		else
			if not_found > 0 then break end
		end
		not_found = not_found + 1
	end

	if ret == false then
		print("sd1::target is not found")
	end
	return ret
end

function Hybrid.selectSecondSeed(target)
	local ret = false
	local found1 = false
	local found2 = false
	local found3 = false
	local not_found = 0
	local group
	local row = math.min(10, Seed.total)
	local row_max = math.min(100, Seed.total)

	print(">>> selectSecondSeed start >>>, "..targetToString(target))
	
	for j=1, 5 do
		for i=1, row do
			found1 = false
			found2 = false
			found3 = false
			preAdjustSecondParentView()
			joypadSetHelper(1, {circle=1}, 7)
			local sdhr = memory.readword(adr_seed_hierarchy)
			if sdhr == sdhr_top then
				joypadSetHelper(1, {circle=1}, 7)
			end
			if i > 1 then
				joypadSetHelper(1, {down=1}, 6)
			end
			if j > 1 and i == 1 then
				--local prvw1 = memory.readword(adr_parent_view1)
				--local prvw2 = memory.readword(adr_parent_view2)
				--print(string.format("prvw1 = %x, prvw2 = %x", prvw1, prvw2))

				group = memory.readword(adr_filter)
				--print(string.format("group3 = %4x", group))
				while group ~= no_filter do
					joypadSetHelper(1, {r1=1}, 6)
					group = memory.readword(adr_filter)
					--print(string.format("group4 = %4x", group))
				end
			end
			joypadSetHelper(1, {circle=1}, 7)

			Hybrid.sd2 = Hybrid.readParentProperty(adr_seed_second)
			if Hybrid.sd2 == nil then
				print("press again readParentProperty")
				joypadSetHelper(1, {circle=1}, 7)
				Hybrid.sd2 = Hybrid.readParentProperty(adr_seed_second)
			end
			--print("sd2::"..Hybrid.sd2.info)

			if Hybrid.sd1.kind1 == knd_kabu and Hybrid.sd2.kind1 == knd_kabu and Hybrid.sd2.kind2 == knd_plain then
				found1 = true
				--print("sd2:: found1 is true")
			end
			if Hybrid.sd1.kind1 ~= knd_kabu and Hybrid.sd2.kind1 == knd_shimaimo and  Hybrid.sd2.kind2 == knd_plain then
				found2 = true
				--print("sd2:: found2 is true")
			end
			--if Hybrid.sd2.kind1 == target.kind1 and 0x0C00 < Hybrid.sd2[target.attrb] and Hybrid.sd2[target.attrb] < 0x0CFF then
			--	found3 = true
			--	print("sd2:: found3 is true")
			--end

			if found1 or found2 then
				print("sd2:: found!! then break")
				ret = true
				break
			else
				--print("sd2:: not found")
			end
		end
		if ret == true then break end
		--print(string.format("sd2:: row=%d, row_max=%d, not_found=%d", row, row_max, not_found))
		if row < row_max then
			row = math.min(row + 20, row_max)
		else
			if not_found > 0 then break end
		end
		not_found = not_found + 1
	end

	postAdjustSecondParentView()
	if ret == false then
		print("sd2::target is not found")
	end
	return ret
end

function Hybrid.retry(cnt)
	if cnt % 2 == 0 then
		joypadSetHelper(1, {l1=1}, 8)
	else
		joypadSetHelper(1, {r1=1}, 8)
	end
	Hybrid.drawRetryCount(cnt)
end

function Hybrid.expect(target)
	local ret = false
	local found1 = false
	local found2 = false

	Hybrid.sd3 = Seed.readProperty(adr_seed_hybrid)
	Hybrid.drawHybrid(Hybrid.sd1, Hybrid.sd2, Hybrid.sd3, target.attrb)

	if target.goal > 0x0C00 and Hybrid.sd3[target.attrb] > Hybrid.sd1[target.attrb] then
		found1 = true
	end
	if target.goal < 0x0C00 and Hybrid.sd3[target.attrb] < Hybrid.sd1[target.attrb] then
		found2 = true
	end
	if Hybrid.sd3.kind1 == Hybrid.sd1.kind1 and (found1 or found2) then
		print("sd3::"..Hybrid.sd3.info)
		ret = true
		if Hybrid.sd3[target.attrb] == target.goal then
			goal_flag = true
			print("goal_flag is true")
		end
	end

	return ret
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

function Hybrid.hybridizeSimple(target)
	Hybrid.confirm(target)
	Hybrid.check(target)
end

function Hybrid.hybridizeReload(target)
	-- create save state for repeat
	local state_before = savestate.create()
	savestate.save(state_before)

	Hybrid.confirm()

	-- check whether hybrid seed is produced successfully
	if Hybrid.check(target) then
		-- nothing to do
	else
		-- reload save state for retry
		savestate.load(state_before)
		print("***** reload savestate *****".." <--------------------")
		fadv(2)
	end
end

function Hybrid.hybridize(target)
	--Hybrid.hybridizeSimple(target)
	Hybrid.hybridizeReload(target)
end

function Hybrid.check(target)
	local success1 = false
	local success2 = false
	Hybrid.sd4 = Seed.readProperty(adr_seed_hybrid)

	if target.start < target.goal and target.start < Hybrid.sd4[target.attrb]  then
		success1 = true
		--print("sd4:: success1 is true")
	end
	if target.start > target.goal and target.start > Hybrid.sd4[target.attrb]  then
		success2 = true
		--print("sd4:: success2 is true")
	end

	print("sd4::"..Hybrid.sd4.info)
	if Hybrid.sd4.kind1 == target.kind1 and (success1 or success2) then
		success_flag = true
		target.start = Hybrid.sd4[target.attrb]
		Hybrid.postConfirm(true)
	elseif Hybrid.sd4.kind1 == 0 then
		print("***** failed to produce. kuzu-vegee *****".." <-------------------")
		fail_cnt = fail_cnt + 1
		--if target.start < target.goal then  -- for hybridizeSimple()
		--	target.start = 0x0B00
		--else
		--	target.start = 0x0D00
		--end
		Hybrid.postConfirm(false)
	else
		print("***** failed to produce. miss expectation *****".." <-------------------")
		fail_cnt = fail_cnt + 1
		Hybrid.postConfirm(true)
	end

	return success_flag
end


function Hybrid.autoHybrid(target)
	local ret = false
	print(">>> start to autoHybrid >>>, "..targetToString(target))

	for j=1, try_cnt2 do
		success_flag = false
		-- select first seed
		local ret1 = Hybrid.selectFirstSeed(target)
		if ret1 == false then break end
		-- select second seed
		local ret2 = Hybrid.selectSecondSeed(target)
		if ret2 == false then break end
		
		-- repeat to press l1 or r1 until expected value
		for i=1, try_cnt1 do
			Hybrid.retry(i)
			target.retry = target.retry + 1

			-- if status is better/worse then press circle
			if Hybrid.expect(target) then
				local fc = emu.framecount()
				print(string.format("j=%d, i=%d, fc=%d", j, i, fc))
				Hybrid.hybridize(target)
				--break  -- for hybridizeSimple()
				if success_flag then break end  -- for hybridizeReload()
			end
		end

		-- if status reached goal then exit
		if goal_flag and success_flag then
			print("goal_flag is true, success_flag is true")
			goal_cnt = goal_cnt + 1
			Seed.total = Seed.total + 1 -- regard this seed as having nothing before start this script
			ret = true
			break
		end
	end

	print("<<< autoHybrid is finished <<<")
	return ret
end

function targetToString(target)
	local str = string.format(" %2x, %s, %3x, %d", 
			target.kind1, target.attrb, target.goal, target.retry)
	return str
end

------------------------------------------------------------
-- Seed
------------------------------------------------------------
Seed = {}
Seed.total = 0

function Seed.readProperty(off_seed)
	local prop = {}

	-- property of seed (+28h)
	local off_kind1     = off_seed         -- 0x167E80
	local off_kind2     = off_seed + 0x01  -- 0x167E81
	local off_boost     = off_seed + 0x03  -- 0x167E83
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
	prop.kind2     = memory.readbyte(off_kind2    )
	prop.boost     = memory.readbyte(off_boost    )
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

	prop.info = Seed.toString(prop)
	--print(prop.info)
	return prop
end

function Seed.toString(prop)
	local str = string.format("seed:: %2x %2x %2x %2d %2d, "
			.."%5d %3x %3x %3x %3x %3x %3x %3x %3x %3x %3x, ",
			prop.kind1, prop.kind2, prop.boost, prop.count, prop.stock,
			prop.price, prop.size, prop.weight, prop.pattern, prop.nutrition,
			prop.sugar, prop.texture, prop.shape, prop.flavor, prop.smell, prop.tone)
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
			Seed.total = i - 1
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
	local off_kind2     = off_crop + 0x01  -- 0x168E21
	local off_boost     = off_crop + 0x03  -- 0x168E23
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
	prop.kind2     = memory.readbyte(off_kind2    )
	prop.boost     = memory.readbyte(off_boost    )
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
			prop.kind1, prop.kind2, prop.boost,
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
	gui.text(x, y+ 30, "wgh")
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
	fadv(wait_frame)
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

function switchDrawSeedProperty()
	local kbd = input.get()
	if kbd.B then
		if kflag == 0 then
			dflag = bit.bnot(dflag)  -- same as dflag = ~dflag
		end
		kflag = kflag + 1
	else kflag = 0
	end

	if dflag == 0 then
		Hybrid.drawHybrid()
	else
		gui.clearuncommitted()
	end
end

------------------------------------------------------------
-- main
------------------------------------------------------------
target_vegee = {
	-- A family worst
	{kind1 = knd_hourensou, attrb = "pattern"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_nira     , attrb = "nutrition", start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_kyabetsu , attrb = "sugar"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_paseri   , attrb = "pattern"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_karifura , attrb = "weight"   , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_mame     , attrb = "texture"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_karashi  , attrb = "sugar"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_wakame   , attrb = "shape"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_konbu    , attrb = "flavor"   , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_chingen  , attrb = "shape"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_piman    , attrb = "tone"     , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_herb     , attrb = "flavor"   , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_herb     , attrb = "smell"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	-- B family worst
	{kind1 = knd_shimaimo , attrb = "weight"   , start = 0x0C94, goal = 0x0B00, retry = 0},
	{kind1 = knd_kabu     , attrb = "size"     , start = 0x0C94, goal = 0x0B00, retry = 0},
	{kind1 = knd_renkon   , attrb = "pattern"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	{kind1 = knd_ninjin   , attrb = "nutrition", start = 0x0D00, goal = 0x0B00, retry = 0},
	{kind1 = knd_tamanegi , attrb = "weight"   , start = 0x0D00, goal = 0x0B00, retry = 0},
	{kind1 = knd_imodama  , attrb = "size"     , start = 0x0D00, goal = 0x0B00, retry = 0},
	{kind1 = knd_gobou    , attrb = "size"     , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_kabocha  , attrb = "pattern"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_garlic   , attrb = "smell"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_takenoko , attrb = "pattern"  , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_takenoko , attrb = "weight"   , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_matsutake, attrb = "pattern"  , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_matsutake, attrb = "texture"  , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_kifujin  , attrb = "shape"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_kifujin  , attrb = "flavor"   , start = 0x0D00, goal = 0x0A00, retry = 0},
	-- C family worst
	{kind1 = knd_tomato   , attrb = "nutrition", start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_kyuri    , attrb = "texture"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_nasu     , attrb = "nutrition", start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_meron    , attrb = "sugar"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_remon    , attrb = "smell"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_corn     , attrb = "texture"  , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_peach    , attrb = "smell"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_ichigo   , attrb = "sugar"    , start = 0x0D00, goal = 0x0B00, retry = 0},
	--{kind1 = knd_pine     , attrb = "tone"     , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_pine     , attrb = "size"     , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_suica    , attrb = "sugar"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_suica    , attrb = "tone"     , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_dorian   , attrb = "nutrition", start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_dorian   , attrb = "smell"    , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_astro    , attrb = "flavor"   , start = 0x0D00, goal = 0x0A00, retry = 0},
	--{kind1 = knd_astro    , attrb = "tone"     , start = 0x0D00, goal = 0x0A00, retry = 0},
	-- A family best
	{kind1 = knd_hourensou, attrb = "pattern"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_nira     , attrb = "nutrition", start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_kyabetsu , attrb = "sugar"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_paseri   , attrb = "pattern"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_karifura , attrb = "weight"   , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_mame     , attrb = "texture"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_karashi  , attrb = "sugar"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_wakame   , attrb = "shape"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_konbu    , attrb = "flavor"   , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_chingen  , attrb = "shape"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_piman    , attrb = "tone"     , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_herb     , attrb = "flavor"   , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_herb     , attrb = "smell"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	-- B family best
	{kind1 = knd_shimaimo , attrb = "weight"   , start = 0x0C94, goal = 0x0DFF, retry = 0},
	{kind1 = knd_kabu     , attrb = "size"     , start = 0x0C94, goal = 0x0DFF, retry = 0},
	{kind1 = knd_renkon   , attrb = "pattern"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	{kind1 = knd_ninjin   , attrb = "nutrition", start = 0x0C00, goal = 0x0DFF, retry = 0},
	{kind1 = knd_tamanegi , attrb = "weight"   , start = 0x0C00, goal = 0x0DFF, retry = 0},
	{kind1 = knd_imodama  , attrb = "size"     , start = 0x0C00, goal = 0x0DFF, retry = 0},
	{kind1 = knd_gobou    , attrb = "size"     , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_kabocha  , attrb = "pattern"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_garlic   , attrb = "smell"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_takenoko , attrb = "pattern"  , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_takenoko , attrb = "weight"   , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_matsutake, attrb = "pattern"  , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_matsutake, attrb = "texture"  , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_kifujin  , attrb = "shape"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_kifujin  , attrb = "flavor"   , start = 0x0C00, goal = 0x0EFF, retry = 0},
	-- C family best
	{kind1 = knd_tomato   , attrb = "nutrition", start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_kyuri    , attrb = "texture"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_nasu     , attrb = "nutrition", start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_meron    , attrb = "sugar"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_remon    , attrb = "smell"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_corn     , attrb = "texture"  , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_peach    , attrb = "smell"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_ichigo   , attrb = "sugar"    , start = 0x0C00, goal = 0x0DFF, retry = 0},
	--{kind1 = knd_pine     , attrb = "tone"     , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_pine     , attrb = "size"     , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_suica    , attrb = "sugar"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_suica    , attrb = "tone"     , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_dorian   , attrb = "nutrition", start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_dorian   , attrb = "smell"    , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_astro    , attrb = "flavor"   , start = 0x0C00, goal = 0x0EFF, retry = 0},
	--{kind1 = knd_astro    , attrb = "tone"     , start = 0x0C00, goal = 0x0EFF, retry = 0},
}

initial = 1
try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 30    -- max level up count
kflag = 0
dflag = 0
goal_flag = false
success_flag = false
fail_cnt = 0
goal_cnt = 0

begin_date = os.date()
while true do

	if initial == 1 then
		Seed.showAll()
		initial = 0
	end

	if initial == 0 then
		--switchDrawSeedProperty()
		for i=1, #target_vegee, 1 do
			goal_flag = false
			Hybrid.autoHybrid(target_vegee[i])
		end
		for i=1, #target_vegee, 1 do
			print("summary::"..targetToString(target_vegee[i]))
		end
		break
	end

	emu.frameadvance()
end

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<< fc=%d", fc))
print("start::"..begin_date)
print("  end::"..os.date())
emu.speedmode("normal")
emu.pause()


--[[
-- astronoka memo
-- + Moving cursor in the filed affects baboo species coming up today.
--   But it doesn't do hybrid expectation.
--   ex.) After moving cursor in the filed, sometimes baboo species are changed.
--
-- + It affects hybrid expectation to change the order of target_vegee tables.
--]]
