-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulater: psxjin v2.0.2
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
city_jedda        = 0x001AED48  -- city_offset
city_alecsandria  = 0x001AED88  -- city_offset + (0x40 * 1)
city_chunis       = 0x001AEDC8  -- city_offset + (0x40 * 2)
city_toripoli     = 0x001AEE08  -- city_offset + (0x40 * 3)
city_lisbon       = 0x001AEE48  -- city_offset + (0x40 * 4)
city_london       = 0x001AEE88  -- city_offset + (0x40 * 5)


adr_gp            = 0x00121E80  -- global pointer
adr_total_city    = 0x0012226C  -- adr_gp + 0x03EC -- 2byte total city count??
adr_rng           = adr_gp + 0x0444  -- rng


adr_money         = 0x00122528  -- 4byte
	-- eg.) 0x05F5E0FF = 99990000 = 9999万



------------------------------------------------------------
-- City
------------------------------------------------------------
City = {}

-- offset of city structure
City.off_00            = 0x00  -- ?byte
City.off_02            = 0x02  -- ?byte
City.off_04            = 0x04  -- ?byte
City.off_06            = 0x06  -- ?byte
City.off_08            = 0x08  -- ?byte
City.off_0A            = 0x0A  -- ?byte
City.off_0C            = 0x0C  -- ?byte
City.off_0E            = 0x0E  -- ?byte
City.city_no           = 0x10  -- ?byte, city id??
City.off_12            = 0x12  -- ?byte
City.off_14            = 0x14  -- ?byte
City.off_16            = 0x16  -- ?byte
City.off_18            = 0x18  -- 2byte
City.city_id           = 0x1A  -- 2byte
City.population        = 0x1C  -- 2byte, 1 - 0xFFFF (100 - 6,553,500)
City.off_1E            = 0x1E  -- ?byte
City.off_20            = 0x20  -- ?byte
City.off_22            = 0x22  -- ?byte
City.off_24            = 0x24  -- ?byte
City.off_26            = 0x26  -- ?byte
City.product1_id       = 0x28  -- 2byte,
City.product1_stock    = 0x2A  -- 2byte, 0 - 0x05DC(1500) (0% - 100%)
City.off_2C            = 0x2C  -- ?byte, if trading, not zero, func pointer?
City.off_2E            = 0x2E  -- ?byte, if trading, not zero, func pointer?
City.product2_id       = 0x30  -- 2byte,
City.product2_stock    = 0x32  -- 2byte, 0(0%) - 0x05DC(100%)
City.off_34            = 0x34  -- ?byte, if trading, not zero, func pointer?
City.off_36            = 0x36  -- ?byte, if trading, not zero, func pointer?
City.product3_id       = 0x38  -- 2byte,
City.product3_stock    = 0x3A  -- 2byte, 0(0%) - 0x05DC(100%)
City.off_3C            = 0x3C  -- ?byte, if trading, not zero, func pointer?
City.off_3E            = 0x3E  -- ?byte, if trading, not zero, func pointer?


function City.readProperty(ofs_city)
	local prpt = {}
	--print(string.format("-- ofs_city = %08X", ofs_city))

	-- Read properties
	prpt.off_00            = memory.readword(ofs_city + City.off_00            )
	prpt.off_02            = memory.readword(ofs_city + City.off_02            )
	prpt.off_04            = memory.readword(ofs_city + City.off_04            )
	prpt.off_06            = memory.readword(ofs_city + City.off_06            )
	prpt.off_08            = memory.readword(ofs_city + City.off_08            )
	prpt.off_0A            = memory.readword(ofs_city + City.off_0A            )
	prpt.off_0C            = memory.readword(ofs_city + City.off_0C            )
	prpt.off_0E            = memory.readword(ofs_city + City.off_0E            )
	prpt.city_no           = memory.readword(ofs_city + City.city_no           )
	prpt.off_12            = memory.readword(ofs_city + City.off_12            )
	prpt.off_14            = memory.readword(ofs_city + City.off_14            )
	prpt.off_16            = memory.readword(ofs_city + City.off_16            )
	prpt.off_18            = memory.readword(ofs_city + City.off_18            )
	prpt.city_id           = memory.readword(ofs_city + City.city_id           )
	prpt.population        = memory.readword(ofs_city + City.population        )
	prpt.off_1E            = memory.readword(ofs_city + City.off_1E            )
	prpt.off_20            = memory.readword(ofs_city + City.off_20            )
	prpt.off_22            = memory.readword(ofs_city + City.off_22            )
	prpt.off_24            = memory.readword(ofs_city + City.off_24            )
	prpt.off_26            = memory.readword(ofs_city + City.off_26            )
	prpt.product1_id       = memory.readword(ofs_city + City.product1_id       )
	prpt.product1_stock    = memory.readword(ofs_city + City.product1_stock    )
	prpt.off_2C            = memory.readword(ofs_city + City.off_2C            )
	prpt.off_2E            = memory.readword(ofs_city + City.off_2E            )
	prpt.product2_id       = memory.readword(ofs_city + City.product2_id       )
	prpt.product2_stock    = memory.readword(ofs_city + City.product2_stock    )
	prpt.off_34            = memory.readword(ofs_city + City.off_34            )
	prpt.off_36            = memory.readword(ofs_city + City.off_36            )
	prpt.product3_id       = memory.readword(ofs_city + City.product3_id       )
	prpt.product3_stock    = memory.readword(ofs_city + City.product3_stock    )
	prpt.off_3C            = memory.readword(ofs_city + City.off_3C            )
	prpt.off_3E            = memory.readword(ofs_city + City.off_3E            )
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
			prpt.off_18            ,
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
			.."%02x,%d,%2x,%2x | "
			.."%02x,%d,%2x,%2x | "
			.."%02x,%d,%2x,%2x | ",
			prpt.off_18            ,
			prpt.city_id           ,
			prpt.population        ,
			prpt.off_1E            ,
			prpt.off_20            ,
			prpt.off_22            ,
			prpt.off_24            ,
			prpt.off_26            ,

			prpt.product1_id       ,
			prpt.product1_stock    ,
			prpt.off_2C            ,
			prpt.off_2E            ,

			prpt.product2_id       ,
			prpt.product2_stock    ,
			prpt.off_34            ,
			prpt.off_36            ,

			prpt.product3_id       ,
			prpt.product3_stock    ,
			prpt.off_3C            ,
			prpt.off_3E            )
	return str
end

City.info_header3 = "| 18, id, pop, 1E, 20, 22, 24, 26 | id, stock, 2C, 2E | id, stock, 34, 36 | id, stock, 3C, 3E | 00, 02, 04, 06 | 08, 0A, 0C, 0E | no, 12, 14, 16 |"

function City.toString3(prpt)
	local str = string.format("%2x,%2x,%d,%2x,%2x,%2x,%2x,%2x | "
			.."%02x,%d,%2x,%2x | "
			.."%02x,%d,%2x,%2x | "
			.."%02x,%d,%2x,%2x | "
			.."%2x,%2x,%2x,%2x | "
			.."%2x,%2x,%2x,%2x | "
			.."%2x,%2x,%2x,%2x | ",
			prpt.off_18            ,
			prpt.city_id           ,
			prpt.population        ,
			prpt.off_1E            ,
			prpt.off_20            ,
			prpt.off_22            ,
			prpt.off_24            ,
			prpt.off_26            ,

			prpt.product1_id       ,
			prpt.product1_stock    ,
			prpt.off_2C            ,
			prpt.off_2E            ,

			prpt.product2_id       ,
			prpt.product2_stock    ,
			prpt.off_34            ,
			prpt.off_36            ,

			prpt.product3_id       ,
			prpt.product3_stock    ,
			prpt.off_3C            ,
			prpt.off_3E            ,

			prpt.off_00            ,
			prpt.off_02            ,
			prpt.off_04            ,
			prpt.off_06            ,

			prpt.off_08            ,
			prpt.off_0A            ,
			prpt.off_0C            ,
			prpt.off_0E            ,

			prpt.city_no           ,
			prpt.off_12            ,
			prpt.off_14            ,
			prpt.off_16            )
	return str
end

City.info_header4 = ""

function City.toString4(prpt)
	local str = string.format("%2x,%2x,%d,%2x,%2x,%2x,%2x,%2x | "
			.."%02x | "
			.."%2x,%2x | "
			.."%2x,%2x | "
			.."%2x,%2x,%2x,%2x | ",
			prpt.off_18            ,
			prpt.city_id           ,
			prpt.population        ,
			prpt.off_1E            ,
			prpt.off_20            ,
			prpt.off_22            ,
			prpt.off_24            ,
			prpt.off_26            ,

			prpt.product1_id       ,

			prpt.off_00            ,
			prpt.off_02            ,

			prpt.off_08            ,
			prpt.off_0A            ,

			prpt.city_no           ,
			prpt.off_12            ,
			prpt.off_14            ,
			prpt.off_16            )
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

