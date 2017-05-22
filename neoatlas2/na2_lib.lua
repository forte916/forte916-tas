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


adr_gp            = 0x00121E80  -- global pointer
adr_game_speed    = 0x00121EEE  -- adr_gp + 0x006E -- 1byte
adr_scale1        = 0x00121F78  -- adr_gp + 0x00F8 -- 1byte
adr_total_city    = 0x0012226C  -- adr_gp + 0x03EC -- 2byte total city count??
adr_rng           = 0x001222C4  -- adr_gp + 0x0444 -- 4byte
adr_scale2        = 0x001223F0  -- adr_gp + 0x0570 -- 1byte

adr_money         = 0x00122528  -- adr_gp + 0x06A8 -- 4byte
	-- eg.) 0x05F5E0FF = 99990000 = 9999万



Global = {}
Global.base       = { adr=0x00121E80, ofs=0        } -- xbyte
Global.game_speed = { adr=0x00121EEE, ofs=0x006E   } -- 1byte
Global.scale1     = { adr=0x00121F78, ofs=0x00F8   } -- 1byte
Global.total_city = { adr=0x0012226C, ofs=0x03EC   } -- 2byte
Global.rng        = { adr=0x001222C4, ofs=0x0444   } -- 4byte
Global.scale2     = { adr=0x001223F0, ofs=0x0570   } -- 1byte
Global.date_param = { adr=0x00122458, ofs=0x05D8   } -- 4byte -- copy of Date.date_param16??
Global.money      = { adr=0x00122528, ofs=0x06A8   } -- 4byte

Date = {}
Date.base         = { adr=0x00132118, ofs=0        } -- 4byte
Date.date_param04 = { adr=0x0013211C, ofs=0x04     } -- 4byte
Date.date_param08 = { adr=0x00132120, ofs=0x08     } -- 4byte
Date.year         = { adr=0x00132124, ofs=0x12     } -- 2byte
Date.month        = { adr=0x00132126, ofs=0x14     } -- 1byte
Date.day          = { adr=0x00132127, ofs=0x15     } -- 1byte
Date.date_param16 = { adr=0x00132128, ofs=0x16     } -- 4byte
Date.date_param1A = { adr=0x0013212C, ofs=0x1A     } -- 4byte


adr_coor_x        = 0x001223E8  -- cursor x
adr_coor_y        = 0x001223EC  -- cursor y



------------------------------------------------------------
-- City
------------------------------------------------------------
City = {}

-- offset of city structure
City.city_fp           = 0x00  -- 4byte func pointer (previous city??)
City.city_x            = 0x04  -- 2byte longitude (coord_X)
City.city_y            = 0x06  -- 2byte latitude  (coord_Y)
City.port_fp           = 0x08  -- 4byte func pointer (previous port??)
City.port_x            = 0x0C  -- 2byte longitude (coord_X)
City.port_y            = 0x0E  -- 2byte latitude  (coord_Y)
City.city_no           = 0x10  -- 2byte, city index
City.ofs_12            = 0x12  -- ?byte, d=地図未登場??, f=地図登場&未発見, 1f=発見済
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

City.ofs_16            = 0x16  -- ?byte
City.ofs_18            = 0x18  -- 2byte
City.city_id           = 0x1A  -- 2byte, city id??
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
	prpt.city_no           = memory.readword( ofs_city + City.city_no          )
	prpt.ofs_12            = memory.readword( ofs_city + City.ofs_12           )
	--prpt.friend            = memory.readbyte( ofs_city + City.friend           )
	prpt.ofs_14            = bit.band(memory.readbyte(ofs_city + City.friend), 0xF8)  -- hi  5bit
	prpt.friend            = bit.band(memory.readbyte(ofs_city + City.friend), 0x07)  -- low 3bit
	prpt.atmosphere        = memory.readbyte( ofs_city + City.atmosphere       )
	prpt.ofs_16            = memory.readword( ofs_city + City.ofs_16           )
	prpt.ofs_18            = memory.readword( ofs_city + City.ofs_18           )
	prpt.city_id           = memory.readword( ofs_city + City.city_id          )
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
	--print(string.format("-- city_id    = %d, %08X", prpt.city_id   , ofs_city + City.city_id           ))
	--print(string.format("-- population = %d, %08X", prpt.population, ofs_city + City.population        ))

	prpt.info1 = City.toString1(prpt)
	prpt.info2 = City.toString2(prpt)
	prpt.info3 = City.toString3(prpt)
	prpt.info4 = City.toString4(prpt)
	return prpt
end

City.info_header1 = "| 18, id, pop | id, stock | id, stock | id, stock |"

function City.toString1(prpt)
	local str = string.format("%2x,%2x,%d | "
			.."%02x,%d | "
			.."%02x,%d | "
			.."%02x,%d | ",
			prpt.ofs_18            ,
			prpt.city_id           ,
			prpt.population        ,

			prpt.product1_id       ,
			prpt.product1_stock    ,

			prpt.product2_id       ,
			prpt.product2_stock    ,

			prpt.product3_id       ,
			prpt.product3_stock    )
	return str
end

City.info_header2 = "| 18, id, pop, 1E, 20, 22, 24, 26 | id, stock, 2C, 2E | id, stock, 34, 36 | id, stock, 3C, 3E |"

function City.toString2(prpt)
	local str = string.format("%2x,%2x,%d,%2x,%2x,%2x,%2x,%2x | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | ",
			prpt.ofs_18            ,
			prpt.city_id           ,
			prpt.population        ,
			prpt.city_x_init       ,
			prpt.city_y_init       ,
			prpt.port_x_init       ,
			prpt.port_y_init       ,
			prpt.ofs_26            ,

			prpt.product1_id       ,
			prpt.product1_stock    ,
			prpt.product1_fp       ,

			prpt.product2_id       ,
			prpt.product2_stock    ,
			prpt.product2_fp       ,

			prpt.product3_id       ,
			prpt.product3_stock    ,
			prpt.product3_fp       )
	return str
end

City.info_header3 = "| 18, id, pop, 1E, 20, 22, 24, 26 | id, stock, 2C, 2E | id, stock, 34, 36 | id, stock, 3C, 3E | 00, 02, 04, 06 | 08, 0A, 0C, 0E | no, 12, 14, 16 |"

function City.toString3(prpt)
	local str = string.format("%x,%3d %d | "
			.."%x,%x,%x,%x,%2x | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | "
			.."%02x,%d,%x | "
			.."%x,%x,%x | "
			.."%x,%x,%x | "
			.."%3d,%2x,%2x,%2x,%2x,%2x | ",
			prpt.ofs_18            ,
			prpt.city_id           ,
			prpt.population        ,

			prpt.city_x_init       ,
			prpt.city_y_init       ,
			prpt.port_x_init       ,
			prpt.port_y_init       ,
			prpt.ofs_26            ,

			prpt.product1_id       ,
			prpt.product1_stock    ,
			prpt.product1_fp       ,

			prpt.product2_id       ,
			prpt.product2_stock    ,
			prpt.product2_fp       ,

			prpt.product3_id       ,
			prpt.product3_stock    ,
			prpt.product3_fp       ,

			prpt.city_fp           ,
			prpt.city_x            ,
			prpt.city_y            ,

			prpt.port_fp           ,
			prpt.port_x            ,
			prpt.port_y            ,

			prpt.city_no           ,
			prpt.ofs_12            ,
			prpt.ofs_14            ,
			prpt.friend            ,
			prpt.atmosphere        ,
			prpt.ofs_16            )
	return str
end

City.info_header4 = ""

function City.toString4(prpt)
	local str = string.format("%x,%3d %d | "
			.."%x,%x,%x,%x,%2x | "
			.."%02x | "
			.."%x | "
			.."%x | "
			.."%3d,%2x,%2x,%2x,%2x,%2x | ",
			prpt.ofs_18            ,
			prpt.city_id           ,
			prpt.population        ,

			prpt.city_x_init       ,
			prpt.city_y_init       ,
			prpt.port_x_init       ,
			prpt.port_y_init       ,
			prpt.ofs_26            ,

			prpt.product1_id       ,

			prpt.city_fp           ,

			prpt.port_fp           ,

			prpt.city_no           ,
			prpt.ofs_12            ,
			prpt.ofs_14            ,
			prpt.friend            ,
			prpt.atmosphere        ,
			prpt.ofs_16            )
	return str
end

function City.showAll()
	local prpt = {}
	local ofs_city = city_offset

	print(string.format("-- City --"))
	for i=1, 256 do
		prpt = City.readProperty(ofs_city)
		--print(prpt.info2)
		print(string.format("%s %08X", prpt.info3, ofs_city))
		ofs_city = ofs_city + 0x40
	end
end

function City.drawAll(ofs_city, x, y)
	ofs_city = ofs_city or city_offset
	x = x or 0
	y = y or 20

	local prpt = {}

	for i=1, 20 do
		prpt = City.readProperty(ofs_city)
		ofs_city = ofs_city + 0x40
		gui.text(x, y+(8*i) , prpt.info4)
	end
end


------------------------------------------------------------
-- Voyage
------------------------------------------------------------
Voyage = {}

function Voyage.getState()
	local header = memory.readdword(0x001BD810)
	if header == 0x00000004 then
		return Voyage.STATE_REPORT
	elseif header == 0x00000005 then
		return Voyage.STATE_WINDOW
	elseif header == 0x00000006 then
		return Voyage.STATE_ENDING
	else
		return Voyage.STATE_OTHER
	end
end



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

