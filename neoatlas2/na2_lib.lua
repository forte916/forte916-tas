-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- This is a library of neoatlas2.
--
-- Usage
--   1. require "na2_lib"
--


------------------------------------------------------------
-- General addresses
------------------------------------------------------------

city_offset       = 0x001AED48  -- 0x40 each
city_jeddah       = 0x001AED48  -- city_offset
city_alexandria   = 0x001AED88  -- city_offset + (0x40 * 1)
city_tunis        = 0x001AEDC8  -- city_offset + (0x40 * 2)
city_tripoli      = 0x001AEE08  -- city_offset + (0x40 * 3)
city_lisbon       = 0x001AEE48  -- city_offset + (0x40 * 4)
city_london       = 0x001AEE88  -- city_offset + (0x40 * 5)


Global = {}
Global.base       = { adr=0x00121E80, ofs=0      } -- xbyte, global pointer
Global.game_speed = { adr=0x00121EEE, ofs=0x006E } -- 1byte, 0,2,4 (slow, normal, fast)
Global.scale1     = { adr=0x00121F78, ofs=0x00F8 } -- 1byte, 0 - 3 (1 - 4)
Global.total_city = { adr=0x0012226C, ofs=0x03EC } -- 2byte
Global.rng        = { adr=0x001222C4, ofs=0x0444 } -- 4byte
Global.pad_input1 = { adr=0x00122324, ofs=0x04A4 } -- 4byte, pad input
Global.pad_input2 = { adr=0x00122328, ofs=0x04A8 } -- 4byte, pad input
Global.coordX     = { adr=0x001223E8, ofs=0x0568 } -- 4byte, cursor X
Global.coordY     = { adr=0x001223EC, ofs=0x056C } -- 4byte, cursor Y
Global.coordX2    = { adr=0x00122408, ofs=0x0568 } -- 4byte, cursor X
Global.coordY2    = { adr=0x0012240C, ofs=0x056C } -- 4byte, cursor Y
Global.scale2     = { adr=0x001223F0, ofs=0x0570 } -- 1byte
Global.date_param = { adr=0x00122458, ofs=0x05D8 } -- 4byte, copy of Date.param16??
Global.money      = { adr=0x00122528, ofs=0x06A8 } -- 4byte
	-- eg.) 0x05F5E0FF = 99990000 = 9999万

Date = {}
Date.elaplsed_days   = { adr=0x00132118, ofs=0    } -- 4byte, elapsed days
Date.param04         = { adr=0x0013211C, ofs=0x04 } -- 4byte
Date.resolution_time = { adr=0x00132120, ofs=0x08 } -- 4byte, resolution time (0-1024)
Date.year            = { adr=0x00132124, ofs=0x12 } -- 2byte
Date.month           = { adr=0x00132126, ofs=0x14 } -- 1byte
Date.day             = { adr=0x00132127, ofs=0x15 } -- 1byte
Date.param16         = { adr=0x00132128, ofs=0x16 } -- 4byte
Date.param1A         = { adr=0x0013212C, ofs=0x1A } -- 4byte



------------------------------------------------------------
-- City
------------------------------------------------------------
City = {}

-- offset of city structure
City.city_fp           = 0x00  -- 4byte func pointer (previous city??)
City.city_x            = 0x04  -- 2byte coord_X (longitude)
City.city_y            = 0x06  -- 2byte coord_Y  (latitude)
City.port_fp           = 0x08  -- 4byte func pointer (previous port??)
City.port_x            = 0x0C  -- 2byte coord_X (longitude)
City.port_y            = 0x0E  -- 2byte coord_Y  (latitude)
City.city_id           = 0x10  -- 2byte, city index
City.discover          = 0x12  -- 2byte, d=地図未登場??, f=地図登場&未発見, 1f=発見済
City.friend            = 0x14  -- 1byte, low 3bit friendship, hi 5bit ???
	-- low 3bit friendship
	-- 0 = 
	-- 1 = 敵対心
	-- 2 = 
	-- 3 = 非協力的
	-- 4 = 協力的
	-- 5 = 友好的
	-- 6 = 非常に友好的
	-- 7 = 歓迎
City.atmosphere        = 0x15  -- 1byte, atmosphere

City.ofs_16            = 0x16  -- 2byte
City.ofs_18            = 0x18  -- 2byte
City.city_name         = 0x1A  -- 2byte, city name??
City.population        = 0x1C  -- 2byte, 1 - 0xFFFF (100 - 6,553,500)
City.city_x_init       = 0x1E  -- ?byte
City.city_y_init       = 0x20  -- ?byte
City.port_x_init       = 0x22  -- ?byte
City.port_y_init       = 0x24  -- ?byte
City.ofs_26            = 0x26  -- ?byte
City.product1_id       = 0x28  -- 2byte,
City.product1_stock    = 0x2A  -- 2byte, 0 - 0x05DC (0 - 1500) (0% - 100%)
City.product1_fp       = 0x2C  -- 4byte, if trading, none zero as func pointer?
City.product2_id       = 0x30  -- 2byte,
City.product2_stock    = 0x32  -- 2byte, 0 - 0x05DC (0 - 1500) (0% - 100%)
City.product2_fp       = 0x34  -- 4byte, if trading, none zero as func pointer?
City.product3_id       = 0x38  -- 2byte,
City.product3_stock    = 0x3A  -- 2byte, 0 - 0x05DC (0 - 1500) (0% - 100%)
City.product3_fp       = 0x3C  -- 4byte, if trading, none zero as func pointer?


function City.readProperty(ofs_city)
	local prpt = {}
	--print(string.format("-- ofs_city = %08X", ofs_city))

	-- Read properties
	prpt.city_fp           = memory.readdword(ofs_city + City.city_fp          )
	prpt.city_x            = memory.readword( ofs_city + City.city_x           )
	prpt.city_y            = memory.readword( ofs_city + City.city_y           )
	prpt.port_fp           = memory.readdword(ofs_city + City.port_fp          )
	prpt.port_x            = memory.readword( ofs_city + City.port_x           )
	prpt.port_y            = memory.readword( ofs_city + City.port_y           )
	prpt.city_id           = memory.readword( ofs_city + City.city_id          )
	prpt.discover          = memory.readword( ofs_city + City.discover         )
	--prpt.friend            = memory.readbyte( ofs_city + City.friend           )
	prpt.ofs_14            = bit.band(memory.readbyte(ofs_city + City.friend), 0xF8)  -- hi  5bit
	prpt.friend            = bit.band(memory.readbyte(ofs_city + City.friend), 0x07)  -- low 3bit
	prpt.atmosphere        = memory.readbyte( ofs_city + City.atmosphere       )
	prpt.ofs_16            = memory.readword( ofs_city + City.ofs_16           )
	prpt.ofs_18            = memory.readword( ofs_city + City.ofs_18           )
	prpt.city_name         = memory.readword( ofs_city + City.city_name        )
	prpt.population        = memory.readword( ofs_city + City.population       )
	prpt.city_x_init       = memory.readword( ofs_city + City.city_x_init      )
	prpt.city_y_init       = memory.readword( ofs_city + City.city_y_init      )
	prpt.port_x_init       = memory.readword( ofs_city + City.port_x_init      )
	prpt.port_y_init       = memory.readword( ofs_city + City.port_y_init      )
	prpt.ofs_26            = memory.readword( ofs_city + City.ofs_26           )
	prpt.product1_id       = memory.readword( ofs_city + City.product1_id      )
	prpt.product1_stock    = memory.readword( ofs_city + City.product1_stock   )
	prpt.product1_fp       = memory.readdword(ofs_city + City.product1_fp      )
	prpt.product2_id       = memory.readword( ofs_city + City.product2_id      )
	prpt.product2_stock    = memory.readword( ofs_city + City.product2_stock   )
	prpt.product2_fp       = memory.readdword(ofs_city + City.product2_fp      )
	prpt.product3_id       = memory.readword( ofs_city + City.product3_id      )
	prpt.product3_stock    = memory.readword( ofs_city + City.product3_stock   )
	prpt.product3_fp       = memory.readdword(ofs_city + City.product3_fp      )
	--print(string.format("-- city_name  = %d, %08X", prpt.city_name , ofs_city + City.city_name         ))
	--print(string.format("-- population = %d, %08X", prpt.population, ofs_city + City.population        ))

	prpt.info1 = City.toString1(prpt)
	prpt.info2 = City.toString2(prpt)
	prpt.info3 = City.toString3(prpt)
	prpt.info4 = City.toString4(prpt)
	return prpt
end

City.info_header1 = "| id, dis | name, pop | id, stock | id, stock | id, stock |"

function City.toString1(prpt)
	local str = string.format("%3d,%2x | "
			.."%d,%d | "
			.."%02x,%d | "
			.."%02x,%d | "
			.."%02x,%d | ",
			prpt.city_id          ,
			prpt.discover         ,

			prpt.city_name        ,
			prpt.population       ,

			prpt.product1_id      ,
			prpt.product1_stock   ,

			prpt.product2_id      ,
			prpt.product2_stock   ,

			prpt.product3_id      ,
			prpt.product3_stock   )
	return str
end

City.info_header2 = ""

function City.toString2(prpt)
	local str = "no info"
	return str
end

City.info_header3 = "| id, dis, 14, fri, atm, 16 18 | name, pop | id, stock, fp | id, stock, fp | id, stock, fp | c_fp, c_x, c_y | p_fp, p_x, p_y | c_x, c_y, p_x, p_y, 26 |"

function City.toString3(prpt)
	local str = string.format("%3d,%2x,%2x,%2x,%2x,%2x,%x | "
			.."%d,%d | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | "
			.."%x,%x,%x | "
			.."%x,%x,%x | "
			.."%x,%x,%x,%x,%2x | ",
			prpt.city_id          ,
			prpt.discover         ,
			prpt.ofs_14           ,
			prpt.friend           ,
			prpt.atmosphere       ,
			prpt.ofs_16           ,
			prpt.ofs_18           ,

			prpt.city_name        ,
			prpt.population       ,

			prpt.product1_id      ,
			prpt.product1_stock   ,
			prpt.product1_fp      ,

			prpt.product2_id      ,
			prpt.product2_stock   ,
			prpt.product2_fp      ,

			prpt.product3_id      ,
			prpt.product3_stock   ,
			prpt.product3_fp      ,

			prpt.city_fp          ,
			prpt.city_x           ,
			prpt.city_y           ,

			prpt.port_fp          ,
			prpt.port_x           ,
			prpt.port_y           ,

			prpt.city_x_init      ,
			prpt.city_y_init      ,
			prpt.port_x_init      ,
			prpt.port_y_init      ,
			prpt.ofs_26           )

	return str
end

City.info_header4 = "| id, dis, 14, fri, atm, 16 18 | name, pop | id, stock | p_fp, p_x, p_y | 26 |"

function City.toString4(prpt)
	local str = string.format("%3d,%2x,%2x,%2x,%2x,%2x,%x | "
			.."%d,%d | "
			.."%02x,%d | "
			.."%x,%x,%x | "
			.."%2x | ",
			prpt.city_id          ,
			prpt.discover         ,
			prpt.ofs_14           ,
			prpt.friend           ,
			prpt.atmosphere       ,
			prpt.ofs_16           ,
			prpt.ofs_18           ,

			prpt.city_name        ,
			prpt.population       ,

			prpt.product1_id      ,
			prpt.product1_stock   ,

			prpt.port_fp          ,
			prpt.port_x           ,
			prpt.port_y           ,

			prpt.ofs_26           )

	return str
end

function City.showAll()
	local ofs_city = city_offset

	print(string.format("-- City --"))
	for i=1, 256 do
		local prpt = City.readProperty(ofs_city)
		print(string.format("%s %08X", prpt.info3, ofs_city))
		ofs_city = ofs_city + 0x40
	end
end

function City.drawAll(ofs_city, x, y)
	ofs_city = ofs_city or city_offset
	x = x or 0
	y = y or 20

	for i=1, 20 do
		local prpt = City.readProperty(ofs_city)
		ofs_city = ofs_city + 0x40
		gui.text(x, y+(8*i) , prpt.info4)
	end
end

function City.getAll()
	local cities = {}
	local ofs_city = city_offset

	for i=1, 256 do
		local prpt = City.readProperty(ofs_city)
		cities[i] = prpt
		ofs_city = ofs_city + 0x40
	end
	return cities
end

------------------------------------------------------------
-- Window
------------------------------------------------------------
Window = {}
Window.adr_loaded_bin = 0x001BD810

function Window.getState()
	local header = memory.readdword(Window.adr_loaded_bin)
	if header == 0x04 then
		return Window.STATE_REPORT
	elseif header == 0x05 then
		return Window.STATE_WINDOW
	elseif header == 0x06 then
		return Window.STATE_ENDING
	else
		return Window.STATE_OTHER
	end
end

function Window.changeScale(toScale)
	local curScale = memory.readbyte(Global.scale1.adr)
	local diffScale = curScale - toScale

	if diffScale > 0 then
		pressBtn({r2=1}, 1)  -- zoom out
		fadv(35)
	elseif diffScale < 0 then
		pressBtn({l2=1}, 1)  -- zoom in
		fadv(35)
	else
		return
	end
	Window.changeScale(toScale)
end

function Window.Zoom(toScale)
	while true do
		local curScale = memory.readbyte(Global.scale1.adr)
		local diffScale = curScale - toScale
		if diffScale > 0 then
			pressBtn({r2=1}, 1)  -- zoom out
			fadv(35)
		elseif diffScale < 0 then
			pressBtn({l2=1}, 1)  -- zoom in
			fadv(35)
		else
			return
		end
	end
end



------------------------------------------------------------
-- Cursor
------------------------------------------------------------
Cursor = {}

--Cursor.scale1_deltaX  = 0x20
--Cursor.scale2_deltaX  = 0x20
--Cursor.scale3_deltaX  = 0x20
--Cursor.scale4_deltaX  = 0x20
--
--Cursor.scale1_deltaY  = 0x20
--Cursor.scale2_deltaY  = 0x20
--Cursor.scale3_deltaY  = 0x20
--Cursor.scale4_deltaY  = 0x20
--
--Cursor.scale1_marginX = 0x20
--Cursor.scale2_marginX = 0x20
--Cursor.scale3_marginX = 0x20
--Cursor.scale4_marginX = 0x20
--
--Cursor.scale1_marginY = 0x20
--Cursor.scale2_marginY = 0x20
--Cursor.scale3_marginY = 0x20
--Cursor.scale4_marginY = 0x20

function Cursor.move(toX, toY, toScale)
	local pad = {triangle=1}
	local movedX = false
	local movedY = false

	while movedX == false or movedY == false do
		local curX = memory.readdword(Global.coordX.adr)
		local curY = memory.readdword(Global.coordY.adr)
		local diffX = curX - toX
		local diffY = curY - toY

		if diffX > 0 then
			pad.left = 1
		elseif diffX < 0 then
			pad.right = 1
		else
			movedX = true
		end

		if diffY > 0 then
			pad.down = 1
		elseif diffY < 0 then
			pad.up = 1
		else
			movedY = true
		end

		pressBtn(pad, 1)
	end
end


------------------------------------------------------------
-- Text
------------------------------------------------------------
Text = {}
Text.adr_12260E = 0x0012260E -- 2byte, text flag
	-- 0x00 : out of text event
	-- 0x01 : during text event
Text.NONE    = 0
Text.TEXTING = 1

Text.adr_1226DE = 0x001226DE -- 2byte, believe flag
	-- 0x00 : otherwise
	-- 0x01 : believe selected

Text.adr_1226E0 = 0x001226E0 -- 2byte, believe flag
	-- 0x00 : otherwise
	-- 0x01 : believe view

Text.adr_1227B8 = 0x001227B8 -- 2byte, believe flag
	-- 0x00 : otherwise
	-- 0x01 : loading movie??
	-- 0x02 : believe view
Text.OTHER_VIEW   = 0
Text.BELIEVE_VIEW = 2

Text.adr_1FFCC8 = 0x001FFCC8 -- 4byte, stack
Text.INCREASE_REWARD   = 0x800A64CC

Text.adr_00E2D4 = 0x0000E2D4 -- 2byte, text flag
	-- 0x?? : otherwise, accept pad inputs
	-- 0x5C : Not accept pad inputs


function Text.skip()
	local pre_state = memory.readword(Text.adr_12260E)

	while true do
		local cur_state  = memory.readword(Text.adr_12260E)
		local believe_flag = memory.readword(Text.adr_1227B8)
		local reward_flag = memory.readdword(Text.adr_1FFCC8)

		if believe_flag == Text.BELIEVE_VIEW then
			break
		elseif reward_flag == Text.INCREASE_REWARD then
			pressBtn({x=1}, 1)  -- skip reward
		elseif cur_state == Text.NONE and pre_state == Text.NONE then
			pre_state = cur_state
			fadv(1)
		elseif cur_state == Text.TEXTING and pre_state == Text.NONE then
			pre_state = cur_state
			-- skip text
			local txt_flag  = memory.readword(Text.adr_00E2D4)
			if txt_flag == 0x5C then
				fadv(1)
			end	
			--pressBtn({x=1}, 2)  -- skip text
			pressBtn({circle=1}, 2)  -- skip text
		elseif cur_state == Text.TEXTING and pre_state == Text.TEXTING then
			pre_state = cur_state
			local input = memory.readdword(Global.pad_input1.adr)
			if input ~= 0 then
				fadv(1)
			end
			pressBtn({x=1}, 2)  -- skip text
		elseif cur_state == Text.NONE and pre_state == Text.TEXTING then
			break
		end
	end
end

------------------------------------------------------------
-- Treasure
------------------------------------------------------------
Treasure = {}

adr_ufo_x = 0x00193090  -- 2byte
adr_ufo_y = 0x00193092  -- 2byte

coord_almagest_x         = 0x9200
coord_almagest_y         = 0x3A20
coord_arabian_nights_x   = 0x9F00
coord_arabian_nights_y   = 0x3900
coord_cannary_diamond_x  = 0x6F00
coord_cannary_diamond_y  = 0x3500

coord_almagest_balloon_x = 0x9220
coord_almagest_balloon_y = 0x3A20
adr_almagest_baloon_x    = 0x00066414  -- 2byte
adr_almagest_baloon_y    = 0x00066416  -- 2byte


adr_arabian_nights_x1    = 0x0017E870  -- 2byte
adr_arabian_nights_x2    = 0x0017FB8A  -- 2byte
--adr_arabian_nights_y2    = 0x0017FB8C  -- 2byte
adr_arabian_nights_x3    = 0x0017FB8E  -- 2byte
adr_arabian_nights_x4    = 0x001AB70C  -- 2byte
adr_arabian_nights_x5    = 0x001AB720  -- 2byte

adr_cannary_diamond_x1   = 0x0017EA64  -- 2byte
adr_cannary_diamond_x2   = 0x0017EA78  -- 2byte
adr_cannary_diamond_x3   = 0x0017EA8C  -- 2byte
adr_cannary_diamond_x4   = 0x001AD278 -- 2byte
adr_cannary_diamond_x5   = 0x001AD28C -- 2byte

coord_teneriso_x         = 0x7500
coord_teneriso_y         = 0x4300
adr_teneriso_x1          = 0x001ABE80
adr_teneriso_x2          = 0x001ABE94

coord_osujua_x           = 0x9500
coord_osujua_y           = 0x2D00
adr_osujua_x1            = 0x001ABF34
adr_osujua_x2            = 0x001ABF48


coord_sunken_ship_x      = 0x6D00
coord_sunken_ship_y      = 0x3900
adr_sunken_ship_x1       = 0x001338D4
adr_sunken_ship_x2       = 0x0017E848
adr_sunken_ship_x3       = 0x001ADEE4
adr_sunken_ship_x4       = 0x001ADEF8


coord_alchemy_x          = 0x81C0
coord_alchemy_y          = 0x2AC0
adr_alchemy_x1           = 0x0017FBA2
adr_alchemy_x2           = 0x0017FBA6
adr_alchemy_x3           = 0x001ADD04
adr_alchemy_x4           = 0x001ADD18
adr_alchemy_x5           = 0x001AE448


coord_doll_house_x       = 0x85C8
coord_doll_house_y       = 0x2900
adr_doll_house_x1        = 0x0017E938
adr_doll_house_x2        = 0x0017E94C
adr_doll_house_x3        = 0x001AE0C4
adr_doll_house_x4        = 0x001AE0D8



------------------------------------------------------------
-- Product id
------------------------------------------------------------
Product = {}

--[[
0x00 -- 塩                
0x01 -- 泥吹草          
0x02 -- 硫黄              
0x03 -- マダス貝        
0x04 -- 鉛                
0x05 -- ブドウ          
0x06 -- サトウキビ        
0x07 -- 硝石
0x08 -- イタチの皮        
0x09 -- カカオ          
0x0A -- 水銀              
0x0B -- 指輪
0x0C -- 首飾り            
0x0D -- ぞうげ          
0x0E -- キャットギター    
0x0F -- シナモン
0x10 -- オキナ灰          
0x11 -- ナツメグ        
0x12 -- 真珠              
0x13 -- コショウ
0x14 -- ルビー            
0x15 -- 金              
0x16 -- ダイヤモンド      
0x17 -- オリハルコン
0x18 -- コメ              
0x19 -- 帽子            
0x1A -- 鉄                
0x1B -- トウガラシ
0x1C -- ターメリック      
0x1D -- コーヒー        
0x1E -- ハープ            
0x1F -- ゼンマイ時計
0x20 -- 人形              
0x21 -- 硝子            
0x22 -- エメラルド        
0x23 -- サファイア
0x24 -- じゅうたん        
0x25 -- オーク樽        
0x26 -- トウモロコシ      
0x27 -- サツマイモ
0x28 -- 茶                
0x29 -- 織物            
0x2A -- 羊毛              
0x2B -- 絹糸
0x2C -- ピンクダイヤ      
0x2D -- 自律玉          
0x2E -- 羅針盤            
0x2F -- 浮遊パイナップル
0x30 -- フサフサ          
0x31 -- タバコ          
0x32 -- パナケイア        
0x33 -- 扇子
0x34 -- 月の実            
0x35 -- サンゴ          
0x36 -- 金羊毛            
0x37 -- --
0x38 -- --
0x39 -- --
0x3A -- --
0x3B -- --
0x3C -- --
0x3D -- --
0x3E -- --
0x3F -- --
0x40 -- ワイン？          
0x41 -- チョコレート    
0x42 -- 火薬              
0x43 -- フサフサの毛皮
0x44 -- 黒真珠            
0x45 -- ぞうげの扇子    
0x46 -- バンキンタン      
0x47 -- ブレンドスパイス
0x48 -- オリハルコンの扇子
0x49 -- 真珠の指輪      
0x4A -- ルビーの指輪      
0x4B -- 金指輪
0x4C -- ダイヤの指輪      
0x4D -- エメラルドの指輪
0x4E -- サファイアの指輪  
0x4F -- 真珠の首飾り
0x50 -- ルビーの首飾り    
0x51 -- 金の首飾り      
0x52 -- ダイヤの首飾り    
0x53 -- エメラルドの首飾り
0x54 -- サファイアの首飾り
0x55 -- 七色香          
0x56 -- ピンクダイヤの首飾り
0x57 -- フサフサ帽        
0x58 -- 鉄火丼          
0x59 -- カリー            
0x5A -- 折りたたみ式ハープ
0x5B -- オルゴール        
0x5C -- からくり人形    
0x5D -- 鏡                
0x5E -- 空飛ぶじゅうたん
0x5F -- クロノメーター    
0x60 -- 若毛林          
0x61 -- バーボン          
0x62 -- ジパング酒
0x63 -- 焼酎              
0x64 -- 空飛び帽        
0x65 -- 紅茶              
0x66 -- 毛織物
0x67 -- 絹織物            
0x68 -- 金羊毛の織物    
0x69 -- ブランデー        
0x6A -- ピンクダイヤの指輪
0x6B -- 鉄カブト          
0x6C -- シルクハット    
0x6D -- フサフサカーペット
0x6E -- 月仙水  
0x6F -- 黒真珠の指輪      
0x70 -- 黒真珠の首飾り  
0x71 -- 食用土            
0x72 -- メタ火薬
0x73 -- フサフサギター    
0x74 -- シナモンチョコ  
0x75 -- ルビーの金指輪    
0x76 -- ダイヤの金指輪
0x77 -- エメラルドの指輪  
0x78 -- サファイアの指輪
0x79 -- 鉄砲              
0x7A -- カリーライス
0x7B -- ホットカリー      
0x7C -- ソウルマン      
0x7D -- ピンクダイヤの金指輪
0x7E -- ポップコーン      
0x7F -- 火薬ごはん      
--]]

