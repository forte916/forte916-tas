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

city_offset       = 0x801AED60  -- 0x40 each
city_jedda        = 0x801AED60  -- city_offset
city_alecsandria  = 0x801AEDA0  -- city_offset + (0x40 * 1)
city_chunis       = 0x801AEDE0  -- city_offset + (0x40 * 2)
city_toripoli     = 0x801AEE20  -- city_offset + (0x40 * 3)
city_lisbon       = 0x801AEE60  -- city_offset + (0x40 * 4)
city_london       = 0x801AEEA0  -- city_offset + (0x40 * 5)


adr_money         = 0x80122528  -- 4byte
	-- eg.) 0x05F5E0FF = 99990000 = 9999万



------------------------------------------------------------
-- City
------------------------------------------------------------
City = {}

-- offset of city structure
City.off_00            = 0x00  -- 2byte
City.city_id           = 0x02  -- 2byte
City.population        = 0x04  -- 2byte, 1 - 0xFFFF (100 - 6,553,500)
City.off_06            = 0x06  -- ?byte
City.off_08            = 0x08  -- ?byte
City.off_0A            = 0x0A  -- ?byte
City.off_0C            = 0x0C  -- ?byte
City.off_0E            = 0x0E  -- ?byte
City.1st_product_id    = 0x10  -- 2byte,
City.1st_product_stock = 0x12  -- 2byte, 0(0%) - 0x05DC(100%)
City.off_14            = 0x14  -- ?byte
City.off_16            = 0x16  -- ?byte
City.2nd_product_id    = 0x18  -- 2byte,
City.2nd_product_stock = 0x1A  -- 2byte, 0(0%) - 0x05DC(100%)
City.off_1C            = 0x1C  -- ?byte
City.off_1E            = 0x1E  -- ?byte
City.3rd_product_id    = 0x20  -- 2byte,
City.3rd_product_stock = 0x22  -- 2byte, 0(0%) - 0x05DC(100%)
City.off_24            = 0x24  -- ?byte
City.off_26            = 0x26  -- ?byte
City.off_28            = 0x28  -- ?byte
City.off_2A            = 0x2A  -- ?byte
City.off_2C            = 0x2C  -- ?byte
City.off_2E            = 0x2E  -- ?byte



function City.readProperty(ofs_city)
	local prpt = {}

	-- Read properties
	prpt.off_00            = memory.readword(ofs_city + City.off_00            )
	prpt.city_id           = memory.readword(ofs_city + City.city_id           )
	prpt.population        = memory.readword(ofs_city + City.population        )
	prpt.off_06            = memory.readword(ofs_city + City.off_06            )
	prpt.off_08            = memory.readword(ofs_city + City.off_08            )
	prpt.off_0A            = memory.readword(ofs_city + City.off_0A            )
	prpt.off_0C            = memory.readword(ofs_city + City.off_0C            )
	prpt.off_0E            = memory.readword(ofs_city + City.off_0E            )
	prpt.1st_product_id    = memory.readword(ofs_city + City.1st_product_id    )
	prpt.1st_product_stock = memory.readword(ofs_city + City.1st_product_stock )
	prpt.off_14            = memory.readword(ofs_city + City.off_14            )
	prpt.off_16            = memory.readword(ofs_city + City.off_16            )
	prpt.2nd_product_id    = memory.readword(ofs_city + City.2nd_product_id    )
	prpt.2nd_product_stock = memory.readword(ofs_city + City.2nd_product_stock )
	prpt.off_1C            = memory.readword(ofs_city + City.off_1C            )
	prpt.off_1E            = memory.readword(ofs_city + City.off_1E            )
	prpt.3rd_product_id    = memory.readword(ofs_city + City.3rd_product_id    )
	prpt.3rd_product_stock = memory.readword(ofs_city + City.3rd_product_stock )
	prpt.off_24            = memory.readword(ofs_city + City.off_24            )
	prpt.off_26            = memory.readword(ofs_city + City.off_26            )

	prpt.info1 = City.toString1(prpt)
	prpt.info2 = City.toString2(prpt)
	return prpt
end

City.info_header1 = "| 00, id, pop | id, stock | id, stock | id, stock |"

function City.toString1(prpt)
	local str = string.format("%2x,%2x,%d | "
			.."%2x,%d | "
			.."%2x,%d | "
			.."%2x,%d | ",
			prpt.off_00            ,
			prpt.city_id           ,
			prpt.population        ,

			prpt.1st_product_id    ,
			prpt.1st_product_stock ,

			prpt.2nd_product_id    ,
			prpt.2nd_product_stock ,

			prpt.3rd_product_id    ,
			prpt.3rd_product_stock )
	return str
end

City.info_header2 = "| 00, id, pop, 06, 08, 0A, 0C, 0E | id, stock, 14, 16 | id, stock, 1C, 1E | id, stock, 24, 26 |"

function City.toString2(prpt)
	local str = string.format("%2x,%2x,%d,%2x,%2x,%2x,%2x,%2x | "
			.."%2x,%d,%2x,%2x | "
			.."%2x,%d,%2x,%2x | "
			.."%2x,%d,%2x,%2x | ",
			prpt.off_00            ,
			prpt.city_id           ,
			prpt.population        ,
			prpt.off_06            ,
			prpt.off_08            ,
			prpt.off_0A            ,
			prpt.off_0C            ,
			prpt.off_0E            ,

			prpt.1st_product_id    ,
			prpt.1st_product_stock ,
			prpt.off_14            ,
			prpt.off_16            ,

			prpt.2nd_product_id    ,
			prpt.2nd_product_stock ,
			prpt.off_1C            ,
			prpt.off_1E            ,

			prpt.3rd_product_id    ,
			prpt.3rd_product_stock ,
			prpt.off_24            ,
			prpt.off_26            )
	return str
end

function City.showAll()
	local prpt = {}
	local ofs_city = city_offset

	print(string.format("-- City --"))
	for i=1, 20 do
		prpt = City.readProperty(ofs_city)
		ofs_city = ofs_city + 0x40

		print(prpt.info1)
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

