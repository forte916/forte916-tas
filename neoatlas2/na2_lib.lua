-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulater: psxjin v2.0.2
--
-- This is a library of neoatlas2.
--
-- Usage
--   1. require "na2_lib"
--


city_offset       = 0x801AED60  -- 0x40 each
city_jedda        = 0x801AED60  -- city_offset
city_alecsandria  = 0x801AEDA0  -- city_offset + (0x40 * 1)
city_chunis       = 0x801AEDE0  -- city_offset + (0x40 * 2)
city_toripoli     = 0x801AEE20  -- city_offset + (0x40 * 3)
city_lisbon       = 0x801AEE60  -- city_offset + (0x40 * 4)
city_london       = 0x801AEEA0  -- city_offset + (0x40 * 5)


------------------------------------------------------------
-- Formation Unit in world map
------------------------------------------------------------
City = {}

-- offset of city structure
City.off_00            = 0x00  -- 2byte
City.city_id           = 0x02  -- 2byte
City.population        = 0x04  -- 2byte, x 100
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

