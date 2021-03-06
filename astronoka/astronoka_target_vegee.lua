-- Astronoka
--
-- target_vegee setting
-- [rule]
-- + If value is set, we don't care rank and bit.
-- + value == 0 and rank == 0 means we accepts any.
-- + value == 0 and rank ~= 0 means we don't care value but rank and bit.
-- + order == true  means pick max value between sd1 and sd2, mostly used for getting better
-- + order == false means pick min value between sd1 and sd2, mostly used for getting worse

require "astronoka_lib"

------------------------------------------------------------
-- vegee setting
------------------------------------------------------------
-- shimaimo
local shimaimo_plain = {
	kind1 = knd_shimaimo,
	eponym1 = knd_plain,
	weight = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

local shimaimo_mlevel2 = {
	kind1 = knd_shimaimo,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 7, value = 0, order = false},
}

local shimaimo_m100 = {
	kind1 = knd_shimaimo,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local shimaimo_m100_m100x2 = {
	kind1 = knd_shimaimo,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local shimaimo_p200 = {
	kind1 = knd_shimaimo,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- kabu
local kabu_plain = {
	kind1 = knd_kabu,
	eponym1 = knd_plain,
	size = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

local kabu_m100 = {
	kind1 = knd_kabu,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local kabu_p200 = {
	kind1 = knd_kabu,
	eponym1 = 0,
	size = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

-- renkon
local renkon_any = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
}

local renkon_bit2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xC, bit = 2, value = 0, order = false},
}

local renkon_any_m100x2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	--nutrition = {rank = 0xC, bit = 3, value = 0x0C94, order = nil}, -- TODO:: enable only year1 4/1
}

local renkon_bit2_m100x2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xC, bit = 2, value = 0, order = false},
}

local renkon_m100bit1 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
}

local renkon_m100bit1_m100 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100_m100x2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100bit3 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 3, value = 0, order = false},
}

local renkon_m100bit2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 2, value = 0, order = false},
}

local renkon_m100bit2_m100 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 2, value = 0, order = false},
}

local renkon_m100bit1_m100x2 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100_m100x3 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100_m100 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_any_m100txt = {
	kind1 = knd_renkon,
	eponym1 = 0,
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_any_m100sgr = {
	kind1 = knd_renkon,
	eponym1 = 0,
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100bit1_m100x4 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_m100_m100x5 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_bit4 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

local renkon_p200 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local renkon_any_p200 = {
	kind1 = knd_renkon,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}



-- ninjin
local ninjin_any = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0, bit = 0, value = 0, order = nil},
}

local ninjin_bit2 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xC, bit = 2, value = 0, order = false},
}

local ninjin_m100bit1 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0, order = false},
}
local ninjin_m100 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local ninjin_bit4 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xC, bit = 4, value = 0, order = true},
}

local ninjin_any_p200x2 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local ninjin_p100bit7 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xD, bit = 7, value = 0, order = true},
}

local ninjin_p200 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local ninjin_p200_p200x2 = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	nutrition = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- tamanegi
local tamanegi_any_bit4 = {
	kind1 = knd_tamanegi,
	eponym1 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

local tamanegi_p100bit7 = {
	kind1 = knd_tamanegi,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 7, value = 0, order = true},
}

local tamanegi_p200 = {
	kind1 = knd_tamanegi,
	eponym1 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- imokyu
local imokyu_any_bit4 = {
	kind1 = knd_imokyu,
	eponym1 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

-- gobou
local gobou_p100bit7_p200 = {
	kind1 = knd_gobou,
	eponym1 = 0,
	size = {rank = 0xD, bit = 7, value = 0, order = true},
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local gobou_p200_p200 = {
	kind1 = knd_gobou,
	eponym1 = 0,
	size = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- hourensou
local hourensou_plain = {
	kind1 = knd_hourensou,
	eponym1 = knd_plain,
	pattern = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

local hourensou_p100bit7 = {
	kind1 = knd_hourensou,
	eponym1 = 0,
	pattern = {rank = 0xD, bit = 7, value = 0, order = true},
}

local hourensou_p200 = {
	kind1 = knd_hourensou,
	eponym1 = 0,
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

-- knd_tomato    = 0x19
local tomato_plain = {
	kind1 = knd_tomato,
	eponym1 = knd_plain,
	nutrition = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

-- kyuri
local kyuri_any = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local kyuri_bit2 = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0xC, bit = 2, value = 0, order = false},
}
local kyuri_m100 = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local kyuri_bit4 = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0xC, bit = 4, value = 0, order = true},
}

local kyuri_p200 = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- kyabetsu
local kyabetsu_any = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0, bit = 0, value = 0, order = nil},
}
local kyabetsu_bit2 = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0xC, bit = 2, value = 0, order = false},
}
local kyabetsu_m100 = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local kyabetsu_bit4 = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0xC, bit = 4, value = 0, order = true},
}

local kyabetsu_p200 = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- meron
local meron_any = {
	kind1 = knd_meron,
	eponym1 = 0,
}
local meron_bit4 = {
	kind1 = knd_meron,
	eponym1 = 0,
	sugar = {rank = 0xC, bit = 4, value = 0, order = true},
}
local meron_plevel3 = {
	kind1 = knd_meron,
	eponym1 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
}


-- knd_remon     = 0x1D
local remon_any = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}
local remon_any_m100 = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local remon_bit2 = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0xC, bit = 2, value = 0, order = false},
}
local remon_m100 = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local remon_p100bit7 = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0xD, bit = 7, value = 0, order = true},
}
local remon_p200_m100 = {
	kind1 = knd_remon,
	eponym1 = 0,
	smell = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}


-- karifura
local karifura_any = {
	kind1 = knd_karifura,
	eponym1 = 0,
}
local karifura_plevel3 = {
	kind1 = knd_karifura,
	eponym1 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
}

-- corn
local corn_any = {
	kind1 = knd_corn,
	eponym1 = 0,
}
local corn_bit2 = {
	kind1 = knd_corn,
	eponym1 = 0,
	texture = {rank = 0xC, bit = 2, value = 0, order = false},
}
local corn_mlevel2 = {
	kind1 = knd_corn,
	eponym1 = 0,
	-- texture: -30
	texture = {rank = 0xB, bit = 7, value = 0x0BF7, order = false},
}
local corn_mlevel3 = {
	kind1 = knd_corn,
	eponym1 = 0,
	-- texture: -60 ~ -31
	texture = {rank = 0xB, bit = 6, value = 0, order = false},
}

-- kabocha
local kabocha_any = {
	kind1 = knd_kabocha,
	eponym1 = 0,
}
local kabocha_request = {
	kind1 = knd_kabocha,
	eponym1 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
	-- texture: -60 ~ -31
	texture = {rank = 0xB, bit = 6, value = 0, order = false},
}

-- knd_mame      = 0x06
local mame_any = {
	kind1 = knd_mame,
	eponym1 = 0,
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}

-- knd_peach     = 0x1F
local peach_any = {
	kind1 = knd_peach,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}

-- knd_karashi   = 0x07
local karashi_any = {
	kind1 = knd_karashi,
	eponym1 = 0,
	sugar = {rank = 0, bit = 0, value = 0, order = nil},
}

-- knd_ichigo    = 0x20
local ichigo_any = {
	kind1 = knd_ichigo,
	eponym1 = 0,
	sugar = {rank = 0, bit = 0, value = 0, order = nil},
}




-- garlic
local garlic_any = {
	kind1 = knd_garlic,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}
local garlic_p100bit6 = {
	kind1 = knd_garlic,
	eponym1 = 0,
	smell = {rank = 0xD, bit = 6, value = 0, order = true},
}
local garlic_request = {
	kind1 = knd_garlic,
	eponym1 = 0,
	-- smell: +161 ~ +199
	smell = {rank = 0xD, bit = 7, value = 0, order = true},
	-- nutrition: -99 ~ -61
	nutrition = {rank = 0xB, bit = 1, value = 0, order = false},
}
local garlic_p300 = {
	kind1 = knd_garlic,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

-- knd_wakame    = 0x08
local wakame_any = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}
local wakame_m100 = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0xA, bit = 8, value = 0x0AFF, order = false},
}
local wakame_m200 = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
}
local wakame_bit4 = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0xC, bit = 4, value = 0, order = true},
}
local wakame_p200bit7 = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0xE, bit = 7, value = 0, order = true},
}
local wakame_p200bit6 = {
	kind1 = knd_wakame,
	eponym1 = 0,
	shape = {rank = 0xE, bit = 6, value = 0, order = true},
}

-- knd_pine      = 0x21
local pine_any = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0, bit = 0, value = 0, order = nil},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}
local pine_p100bit7ton = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0, bit = 0, value = 0, order = nil},
	tone = {rank = 0xD, bit = 7, value = 0, order = true},
}
local pine_p200bit7ton = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0, bit = 0, value = 0, order = nil},
	tone = {rank = 0xE, bit = 7, value = 0, order = true},
}
local pine_p200bit1siz = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0xE, bit = 1, value = 0, order = true},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}
local pine_p200bit7siz = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0xE, bit = 7, value = 0, order = true},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}
local pine_p300_p300 = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local pine_m200bit7siz = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0xA, bit = 7, value = 0, order = false},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}
local pine_m200siz = {
	kind1 = knd_pine,
	eponym1 = 0,
	size = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}


-- knd_konbu     = 0x09
local konbu_any = {
	kind1 = knd_konbu,
	eponym1 = 0,
	flavor = {rank = 0, bit = 0, value = 0, order = nil},
}

local konbu_m200 = {
	kind1 = knd_konbu,
	eponym1 = 0,
	flavor = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
}

-- knd_suica     = 0x22
local suica_any = {
	kind1 = knd_suica,
	eponym1 = 0,
	sugar = {rank = 0, bit = 0, value = 0, order = nil},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}

local suica_p200bit1sgr = {
	kind1 = knd_suica,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 1, value = 0, order = true},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}

local suica_p300sgr = {
	kind1 = knd_suica,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}

local suica_m200bit7sgr = {
	kind1 = knd_suica,
	eponym1 = 0,
	sugar = {rank = 0xA, bit = 7, value = 0, order = false},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}
local suica_m200sgr = {
	kind1 = knd_suica,
	eponym1 = 0,
	sugar = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}

-- knd_matsutake = 0x17
local matsutake_any = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local matsutake_any_416 = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
	-- TODO:: These attributes should be suited in year1 4/16
	sugar = {rank = 0xC, bit = 4, value = 0, order = true},
}
local matsutake_m200bit7ptn = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0xA, bit = 7, value = 0, order = false},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local matsutake_m200bit1ptn = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0xA, bit = 1, value = 0, order = false},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local matsutake_p200bit1txt = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
	texture = {rank = 0xE, bit = 1, value = 0, order = true},
}
local matsutake_p200bit7txt = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
	texture = {rank = 0xE, bit = 7, value = 0, order = true},
}
local matsutake_p200bit1ptn = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0xE, bit = 1, value = 0, order = true},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local matsutake_m200ptn_p300txt = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local matsutake_p300ptn = {
	kind1 = knd_matsutake,
	eponym1 = 0,
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}


-- knd_takenoko  = 0x16
local takenoko_any = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0, bit = 0, value = 0, order = nil},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}

local takenoko_any_426 = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	-- TODO:: These attributes should be suited in year1 4/26
	weight = {rank = 0xC, bit = 5, value = 0, order = nil},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}

local takenoko_p200bit1wgt = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0xE, bit = 1, value = 0, order = true},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}

local takenoko_p200bit7wgt = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0xE, bit = 7, value = 0, order = true},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}

local takenoko_m200bit7shp = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0, bit = 0, value = 0, order = nil},
	shape = {rank = 0xA, bit = 7, value = 0, order = false},
}

local takenoko_m200bit1shp = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0, bit = 0, value = 0, order = nil},
	shape = {rank = 0xA, bit = 1, value = 0, order = false},
}
local takenoko_p300wgt_m200shp = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	shape = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
}

local takenoko_m200bit7wgt = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0xA, bit = 7, value = 0, order = false},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}
local takenoko_m200wgt = {
	kind1 = knd_takenoko,
	eponym1 = 0,
	weight = {rank = 0xA, bit = 0, value = 0x0A00, order = false},
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}



-- knd_chingen   = 0x0A
local chingen_any = {
	kind1 = knd_chingen,
	eponym1 = 0,
	shape = {rank = 0, bit = 0, value = 0, order = nil},
}

local chingen_any_p100bit7 = {
	kind1 = knd_chingen,
	eponym1 = 0,
	shape = {rank = 0, bit = 0, value = 0, order = nil},
	tone = {rank = 0xD, bit = 7, value = 0, order = true},
}

local chingen_m200bit7_p100bit7 = {
	kind1 = knd_chingen,
	eponym1 = 0,
	shape = {rank = 0xA, bit = 7, value = 0, order = false},
	tone = {rank = 0xD, bit = 7, value = 0, order = true},
}

local chingen_any_p100bit7sml = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xD, bit = 7, value = 0, order = true},
}

local chingen_any_p300x2_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x2_typeB = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x3_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x4_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x6_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x7_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x8_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300x9_typeA = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_any_p300_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local chingen_any_p300x2_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local chingen_any_p300x3_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local chingen_any_p300x4_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local chingen_any_p300x6_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}
local chingen_any_p300x7_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_p200bit7_p300x7_typeC = {
	kind1 = knd_chingen,
	eponym1 = 0,
	shape = {rank = 0xE, bit = 7, value = 0, order = true},
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local chingen_p300_p300x9 = {
	kind1 = knd_chingen,
	eponym1 = 0,
	sugar = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	texture = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	pattern = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	size = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	tone = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	smell = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	weight = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	shape = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}


-- knd_dorian    = 0x23
local dorian_any = {
	kind1 = knd_dorian,
	eponym1 = 0,
	nutrition = {rank = 0, bit = 0, value = 0, order = nil},
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}

local dorian_p200bit1 = {
	kind1 = knd_dorian,
	eponym1 = 0,
	nutrition = {rank = 0xE, bit = 1, value = 0, order = true},
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}

local dorian_p300 = {
	kind1 = knd_dorian,
	eponym1 = 0,
	nutrition = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}


-- knd_piman     = 0x0B
local piman_any = {
	kind1 = knd_piman,
	eponym1 = 0,
	tone = {rank = 0, bit = 0, value = 0, order = nil},
}

local piman_m100bit2 = {
	kind1 = knd_piman,
	eponym1 = 0,
	tone = {rank = 0xB, bit = 2, value = 0, order = false},
}

local piman_m100bit1_mlevel2 = {
	kind1 = knd_piman,
	eponym1 = 0,
	tone = {rank = 0xB, bit = 1, value = 0, order = false},
	weight = {rank = 0xB, bit = 7, value = 0, order = false},
}

-- knd_herb      = 0x0C
local herb_any = {
	kind1 = knd_herb,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
	flavor = {rank = 0, bit = 0, value = 0, order = nil},
}

local herb_p300 = {
	kind1 = knd_herb,
	eponym1 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}


-- knd_kifujin   = 0x18
local kifujin_any = {
	kind1 = knd_kifujin,
	eponym1 = 0,
	shape = {rank = 0, bit = 0, value = 0, order = nil},
	flavor = {rank = 0, bit = 0, value = 0, order = nil},
}

local kifujin_p300_p300 = {
	kind1 = knd_kifujin,
	eponym1 = 0,
	shape = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}

local kifujin_p300flv = {
	kind1 = knd_kifujin,
	eponym1 = 0,
	shape = {rank = 0, bit = 0, value = 0, order = nil},
	flavor = {rank = 0xE, bit = 8, value = 0x0EFF, order = true},
}



------------------------------------------------------------
----- otsu -----
------------------------------------------------------------
local kabu_otsu = {
	kind1 = knd_kabu,
	eponym1 = 0,
	size = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local shimaimo_otsu = {
	kind1 = knd_shimaimo,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}
local renkon_otsu = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
}
local ninjin_otsu = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
}
local kyuri_otsu = {
	kind1 = knd_kyuri,
	eponym1 = 0,
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local kyabetsu_otsu = {
	kind1 = knd_kyabetsu,
	eponym1 = 0,
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
}

local kabu_otsubit7 = {
	kind1 = knd_kabu,
	eponym1 = 0,
	size = {rank = 0xB, bit = 7, value = 0x0BFE, order = false},
}

local ninjin_otsuA = {
	kind1 = knd_ninjin,
	eponym1 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
}
local renkon_otsuA = {
	kind1 = knd_renkon,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local gobou_otsuA = {
	kind1 = knd_gobou,
	eponym1 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}

local renkon_otsuB = {
	kind1 = knd_renkon,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local tamanegi_otsuB = {
	kind1 = knd_tamanegi,
	eponym1 = 0,
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}
local gobou_otsuB = {
	kind1 = knd_gobou,
	eponym1 = 0,
	size = {rank = 0xB, bit = 6, value = 0x0BFC, order = false},
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}

local gobou_otsu = {
	kind1 = knd_gobou,
	eponym1 = 0,
	size = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}

target_otsu = {
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_bit2            , retry = 0, done = 0},
	{first = kyuri_bit2            , second = shimaimo_plain, hybrid = kyuri_otsu            , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = renkon_m100           , second = kyuri_otsu    , hybrid = renkon_otsuA          , retry = 0, done = 0},

	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_bit2         , retry = 0, done = 0},
	{first = kyabetsu_bit2         , second = shimaimo_plain, hybrid = kyabetsu_otsu         , retry = 0, done = 0},

	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = kyabetsu_otsu , hybrid = ninjin_otsuA          , retry = 0, done = 0},
	{first = ninjin_otsuA          , second = renkon_otsuA  , hybrid = gobou_otsuA           , retry = 0, done = 0},

	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_otsubit7         , retry = 0, done = 0},

	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_plain    , hybrid = renkon_otsuB          , retry = 0, done = 0},
	{first = renkon_otsuB          , second = kabu_plain    , hybrid = tamanegi_otsuB        , retry = 0, done = 0},
	{first = tamanegi_otsuB        , second = kabu_otsubit7 , hybrid = gobou_otsuB           , retry = 0, done = 0},

	{first = gobou_otsuB           , second = gobou_otsuA   , hybrid = gobou_otsu            , retry = 0, done = 0},
}




------------------------------------------------------------
-- target setting for general purpose
------------------------------------------------------------
---- renkon_m100_m100x2 typeA
target_renkon_m100_m100x2_a = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = renkon_bit2_m100x2    , second = shimaimo_plain, hybrid = renkon_m100_m100x2    , retry = 0, done = 0},
}

-- renkon_m100_m100x2 typeB
target_renkon_m100_m100x2_b = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = shimaimo_m100 , hybrid = renkon_m100bit1_m100  , retry = 0, done = 0},
	{first = renkon_m100bit1_m100  , second = kabu_m100     , hybrid = renkon_m100_m100x2    , retry = 0, done = 0},
}

-- renkon_m100_m100x2 typeC
target_renkon_m100_m100x2_c = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit1       , retry = 0, done = 0},
	{first = renkon_m100bit1       , second = renkon_any_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},
}

-- renkon_m100_m100x2 typeD for machine level1
target_renkon_m100_m100x2_d = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = renkon_m100           , second = renkon_any_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},
}


-- renkon_m100_m100x3 typeA
target_renkon_m100_m100x3_a = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit3       , retry = 0, done = 0},
	{first = renkon_m100bit3       , second = shimaimo_m100 , hybrid = renkon_m100bit2_m100  , retry = 0, done = 0},
	{first = renkon_m100bit2_m100  , second = kabu_m100     , hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
}


-- renkon_m100_m100x3 typeB
target_renkon_m100_m100x3_b = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = renkon_any_m100x2, hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
}

-- renkon_m100_m100x3 typeC for machine level1
target_renkon_m100_m100x3_c = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = renkon_m100   , hybrid = renkon_m100_m100      , retry = 0, done = 0},
	{first = renkon_m100_m100      , second = shimaimo_m100 , hybrid = shimaimo_m100_m100x2  , retry = 0, done = 0},
	{first = shimaimo_m100_m100x2  , second = kabu_m100     , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
}

-- renkon_m100_m100x3 typeD for machine level1
target_renkon_m100_m100x3_d = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = renkon_m100   , hybrid = renkon_m100_m100      , retry = 0, done = 0},
	{first = renkon_m100_m100      , second = renkon_any_m100x2, hybrid = renkon_m100_m100x3 , retry = 0, done = 0},
}


-- renkon_m100_m100x5 typeA
target_renkon_m100_m100x5_a = {
	-- renkon_m100_m100x3
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit3       , retry = 0, done = 0},
	{first = renkon_m100bit3       , second = shimaimo_m100 , hybrid = renkon_m100bit2_m100  , retry = 0, done = 0},
	{first = renkon_m100bit2_m100  , second = kabu_m100     , hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
	-- kyuri
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_bit2            , retry = 0, done = 0},
	{first = kyuri_bit2            , second = shimaimo_plain, hybrid = kyuri_m100            , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = kyuri_m100    , hybrid = renkon_any_m100txt    , retry = 0, done = 0},
	{first = renkon_any_m100txt    , second = renkon_m100_m100x3, hybrid = renkon_m100bit1_m100x4, retry = 0, done = 0},
	-- kyabetsu
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_bit2         , retry = 0, done = 0},
	{first = kyabetsu_bit2         , second = shimaimo_plain, hybrid = kyabetsu_m100         , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = kyabetsu_m100 , hybrid = renkon_any_m100sgr    , retry = 0, done = 0},
	{first = renkon_any_m100sgr    , second = renkon_m100bit1_m100x4, hybrid = renkon_m100_m100x5, retry = 0, done = 0},
}


-- tamanegi_p200 for contest
target_tamanegi_p200 = {
	{first = shimaimo_p200         , second = kabu_plain    , hybrid = renkon_any_p200       , retry = 0, done = 0},
	{first = renkon_any_p200       , second = kabu_plain    , hybrid = tamanegi_p100bit7     , retry = 0, done = 0},
	{first = tamanegi_p100bit7     , second = shimaimo_plain, hybrid = tamanegi_p200         , retry = 0, done = 0},
}

-- kabocha for request
target_kabocha_request = {
	-- karifura
	{first = hourensou_plain       , second = renkon_any_m100x2, hybrid = meron_bit4         , retry = 0, done = 0},
	{first = meron_bit4            , second = renkon_any_m100x2, hybrid = meron_plevel3      , retry = 0, done = 0},
	{first = meron_plevel3         , second = shimaimo_plain, hybrid = karifura_plevel3      , retry = 0, done = 0},
	-- corn
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_any          , retry = 0, done = 0},
	{first = kyabetsu_any          , second = kabu_plain    , hybrid = corn_bit2             , retry = 0, done = 0},
	{first = corn_bit2             , second = kabu_plain    , hybrid = corn_mlevel2          , retry = 0, done = 0},
	{first = corn_mlevel2          , second = kabu_plain    , hybrid = corn_mlevel3          , retry = 0, done = 0},
	-- kabocha
	{first = corn_mlevel3          , second = karifura_plevel3, hybrid = kabocha_request     , retry = 0, done = 0},
}

-- garlic for request
target_garlic_request = {
	-- ninjin
	{first = renkon_m100_m100x3    , second = shimaimo_plain, hybrid = ninjin_m100bit1       , retry = 0, done = 0},
	-- karifura x3
	{first = hourensou_plain       , second = renkon_any_m100x2, hybrid = meron_any          , retry = 0, done = 0},
	{first = meron_any             , second = shimaimo_plain, hybrid = karifura_any          , retry = 0, done = 0},
	{first = hourensou_plain       , second = renkon_any_m100x2, hybrid = meron_any          , retry = 0, done = 0},
	{first = meron_any             , second = shimaimo_plain, hybrid = karifura_any          , retry = 0, done = 0},
	{first = hourensou_plain       , second = renkon_any_m100x2, hybrid = meron_any          , retry = 0, done = 0},
	{first = meron_any             , second = shimaimo_plain, hybrid = karifura_any          , retry = 0, done = 0},
	-- corn x3
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_any          , retry = 0, done = 0},
	{first = kyabetsu_any          , second = kabu_plain    , hybrid = corn_any              , retry = 0, done = 0},
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_any          , retry = 0, done = 0},
	{first = kyabetsu_any          , second = kabu_plain    , hybrid = corn_any              , retry = 0, done = 0},
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_any          , retry = 0, done = 0},
	{first = kyabetsu_any          , second = kabu_plain    , hybrid = corn_any              , retry = 0, done = 0},
	-- kabocha x2
	{first = corn_any              , second = karifura_any  , hybrid = kabocha_any           , retry = 0, done = 0},
	{first = corn_any              , second = karifura_any  , hybrid = kabocha_any           , retry = 0, done = 0},
	-- mame
	{first = kabocha_any           , second = corn_any      , hybrid = mame_any              , retry = 0, done = 0},
	-- peach
	{first = kabocha_any           , second = karifura_any  , hybrid = peach_any             , retry = 0, done = 0},
	-- garlic
	{first = peach_any             , second = mame_any      , hybrid = garlic_any            , retry = 0, done = 0},
	{first = garlic_any            , second = shimaimo_plain, hybrid = garlic_p100bit6       , retry = 0, done = 0},
	{first = garlic_p100bit6       , second = ninjin_m100bit1, hybrid = garlic_request       , retry = 0, done = 0},
}




------------------------------------------------------------
-- target setting for speed run
------------------------------------------------------------
-- year1 1/15
target_vegee_1115 = {
	-- need shimaimo_plain 14, kabu_plain 15
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit4           , retry = 0, done = 0},
	{first = renkon_bit4           , second = kabu_plain    , hybrid = tamanegi_any_bit4     , retry = 0, done = 0},
	{first = tamanegi_any_bit4     , second = shimaimo_plain, hybrid = imokyu_any_bit4       , retry = 0, done = 0},
}

-- year1 1/22
target_vegee_1122 = {
	-- need shimaimo_plain 24?, kabu_plain 2?
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = renkon_any_m100x2, hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
}

-- year1 2/09
target_vegee_1209 = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_p200         , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit4           , retry = 0, done = 0},
	{first = renkon_bit4           , second = shimaimo_plain, hybrid = renkon_p200           , retry = 0, done = 0},
}

target_vegee_1305 = {
	-- kabu +200
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_p200             , retry = 0, done = 0},
	-- ninjin +600
	{first = shimaimo_p200         , second = renkon_p200   , hybrid = ninjin_any_p200x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit4           , retry = 0, done = 0},
	{first = ninjin_bit4           , second = shimaimo_plain, hybrid = ninjin_p100bit7       , retry = 0, done = 0},
	{first = ninjin_p100bit7       , second = ninjin_any_p200x2, hybrid = ninjin_p200_p200x2 , retry = 0, done = 0},
	-- tamanegi +200
	unpack(target_tamanegi_p200),
}

target_vegee_1314 = {
	{first = kabu_p200             , second = tamanegi_p200 , hybrid = gobou_p100bit7_p200   , retry = 0, done = 0},
	{first = gobou_p100bit7_p200   , second = shimaimo_plain, hybrid = gobou_p200_p200       , retry = 0, done = 0},
}

target_vegee_1401_part1 = target_kabocha_request
target_vegee_1401_part2 = target_garlic_request

target_vegee_1401_part3 = {
	{first = hourensou_plain       , second = renkon_p200   , hybrid = hourensou_p100bit7    , retry = 0, done = 0},
	{first = hourensou_p100bit7    , second = shimaimo_plain, hybrid = hourensou_p200        , retry = 0, done = 0},
}


target_vegee_test = target_renkon_m100_m100x3_a

------------------------------------------------------------
-- node setting using binary tree
------------------------------------------------------------
-- shimaimo
shimaimo_plain_leaf = {
	left = nil,
	right = nil,
	property = shimaimo_plain,
}

shimaimo_mlevel2_node = {
	left = shimaimo_plain_leaf,
	right = shimaimo_plain_leaf,
	property = shimaimo_mlevel2,
}


shimaimo_m100_node = {
	left = shimaimo_plain_leaf,
	right = shimaimo_plain_leaf,
	property = shimaimo_m100,
}

shimaimo_p200_node = {
	left = shimaimo_plain_leaf,
	right = shimaimo_plain_leaf,
	property = shimaimo_p200,
}

shimaimo_p200_leaf = {
	left = nil,
	right = nil,
	property = shimaimo_p200,
}

-- kabu
kabu_plain_leaf = {
	left = nil,
	right = nil,
	property = kabu_plain,
}

kabu_m100_node = {
	left = kabu_plain_leaf,
	right = kabu_plain_leaf,
	property = kabu_m100,
}

kabu_p200_node = {
	left = kabu_plain_leaf,
	right = kabu_plain_leaf,
	property = kabu_p200,
}

kabu_p200_leaf = {
	left = nil,
	right = nil,
	property = kabu_p200,
}

-- renkon
renkon_any_node = {
	left = shimaimo_plain_leaf,
	right = kabu_plain_leaf,
	property = renkon_any,
}

renkon_any_leaf = {
	left = nil,
	right = nil,
	property = renkon_any,
}

renkon_any_m100x2_node = {
	left = shimaimo_m100_node,
	right = kabu_m100_node,
	property = renkon_any_m100x2,
}

renkon_any_m100x2_node_2 = {
	left = kabu_m100_node,
	right = shimaimo_m100_node,
	property = renkon_any_m100x2,
}

renkon_any_m100x2_leaf = {
	left = nil,
	right = nil,
	property = renkon_any_m100x2,
}

renkon_any_p200_node = {
	left = shimaimo_p200_leaf,
	right = kabu_plain_leaf,
	property = renkon_any_p200,
}

renkon_bit2_node = {
	left = shimaimo_plain_leaf,
	right = kabu_plain_leaf,
	property = renkon_bit2,
}

renkon_m100_node = {
	left = renkon_any_node,
	right = shimaimo_plain_leaf,
	property = renkon_m100,
}

renkon_m100bit2_node = {
	left = renkon_bit2_node,
	right = shimaimo_plain_leaf,
	property = renkon_m100bit2,
}

renkon_bit4_node = {
	left = shimaimo_plain_leaf,
	right = kabu_plain_leaf,
	property = renkon_bit4,
}

renkon_p200_node = {
	left = renkon_bit4_node,
	right = shimaimo_plain_leaf,
	property = renkon_p200,
}

renkon_p200_leaf = {
	left = nil,
	right = nil,
	property = renkon_p200,
}

-- ninjin
ninjin_bit2_node = {
	left = renkon_any_node,
	--left = renkon_any_leaf,
	right = shimaimo_plain_leaf,
	property = ninjin_bit2,
}

ninjin_m100_node = {
	left = ninjin_bit2_node,
	right = shimaimo_plain_leaf,
	property = ninjin_m100,
}

ninjin_any_p200x2_node = {
	left = shimaimo_p200_leaf,
	right = renkon_p200_leaf,
	property = ninjin_any_p200x2,
}

ninjin_bit4_node = {
	--left = renkon_any_node,
	left = renkon_any_leaf,
	right = shimaimo_plain_leaf,
	property = ninjin_bit4,
}

ninjin_p100bit7_node = {
	left = ninjin_bit4_node,
	right = shimaimo_plain_leaf,
	property = ninjin_p100bit7,
}

ninjin_p200_p200x2_node = {
	left = ninjin_p100bit7_node,
	right = ninjin_any_p200x2_node,
	property = ninjin_p200_p200x2,
}

ninjin_p200_p200x2_leaf = {
	left = nil,
	right = nil,
	property = ninjin_p200_p200x2,
}


-- renkon
renkon_m100bit1_m100x2_node = {
	left = renkon_m100bit2_node,
	right = renkon_any_m100x2_leaf,
	property = renkon_m100bit1_m100x2,
}

renkon_m100_m100x3_node = {
	left = renkon_m100bit1_m100x2_node,
	right = ninjin_m100_node,
	property = renkon_m100_m100x3,
}

renkon_m100_m100x3_leaf = {
	left = nil,
	right = nil,
	property = renkon_m100_m100x3,
}


-- tamanegi
tamanegi_any_bit4_node = {
	left = renkon_bit4_node,
	right = kabu_plain_leaf,
	property = tamanegi_any_bit4,
}

tamanegi_p100bit7_node = {
	left = renkon_any_p200_node,
	right = kabu_plain_leaf,
	property = tamanegi_p100bit7,
}

tamanegi_p200_node = {
	left = tamanegi_p100bit7_node,
	right = shimaimo_plain_leaf,
	property = tamanegi_p200,
}

tamanegi_p200_leaf = {
	left = nil,
	right = nil,
	property = tamanegi_p200,
}


-- imokyu
imokyu_any_bit4_node = {
	left = tamanegi_any_bit4_node,
	right = shimaimo_plain_leaf,
	property = imokyu_any_bit4,
}

-- gobou
gobou_p100bit7_p200_node = {
	left = kabu_p200_leaf,
	right = tamanegi_p200_leaf,
	property = gobou_p100bit7_p200,
}

gobou_p200_p200_node = {
	left = gobou_p100bit7_p200_node,
	right = shimaimo_plain_leaf,
	property = gobou_p200_p200,
}

-- hourensou
hourensou_plain_leaf = {
	left = nil,
	right = nil,
	property = hourensou_plain,
}

hourensou_p100bit7_node = {
	left = hourensou_plain_leaf,
	right = renkon_p200_leaf,
	property = hourensou_p100bit7,
}

hourensou_p200_node = {
	left = hourensou_p100bit7_node,
	right = shimaimo_plain_leaf,
	property = hourensou_p200,
}

hourensou_p200_leaf = {
	left = nil,
	right = nil,
	property = hourensou_p200,
}

-- knd_tomato    = 0x19
tomato_plain_leaf = {
	left = nil,
	right = nil,
	property = tomato_plain,
}


-- kyuri
kyuri_any_node = {
	left = hourensou_plain_leaf,
	right = shimaimo_plain_leaf,
	property = kyuri_any,
}
kyuri_any_leaf = {
	left = nil,
	right = nil,
	property = kyuri_any,
}
kyuri_bit2_node = {
	left = hourensou_plain_leaf,
	right = shimaimo_plain_leaf,
	property = kyuri_bit2,
}

kyuri_m100_node = {
	left = kyuri_bit2_node,
	right = shimaimo_plain_leaf,
	property = kyuri_m100,
}

kyuri_bit4_node = {
	left = hourensou_plain_leaf,
	right = shimaimo_plain_leaf,
	property = kyuri_bit4,
}

kyuri_p200_node = {
	left = kyuri_bit4_node,
	right = shimaimo_plain_leaf,
	property = kyuri_p200,
}

kyuri_p200_leaf = {
	left = nil,
	right = nil,
	property = kyuri_p200,
}




-- kyabetsu
kyabetsu_any_node = {
	left = kyuri_any_node,
	right = shimaimo_plain_leaf,
	property = kyabetsu_any,
}

kyabetsu_bit2_node = {
	left = kyuri_any_node,
	right = shimaimo_plain_leaf,
	property = kyabetsu_bit2,
}

kyabetsu_m100_node = {
	left = kyabetsu_bit2_node,
	right = shimaimo_plain_leaf,
	property = kyabetsu_m100,
}

kyabetsu_bit4_node = {
	left = kyuri_any_node,
	right = shimaimo_plain_leaf,
	property = kyabetsu_bit4,
}

kyabetsu_p200_node = {
	left = kyabetsu_bit4_node,
	right = shimaimo_plain_leaf,
	property = kyabetsu_p200,
}

kyabetsu_p200_leaf = {
	left = nil,
	right = nil,
	property = kyabetsu_p200,
}


-- renkon
renkon_any_m100sgr_node = {
	left = kyabetsu_m100_node,
	right = renkon_m100_m100x3_leaf,
	property = renkon_any_m100sgr,
}

renkon_any_m100txt_node = {
	left = kyuri_m100_node,
	right = renkon_m100_m100x3_leaf,
	property = renkon_any_m100txt,
}

renkon_m100bit1_m100x4_node = {
	left = renkon_any_m100txt_node,
	right = renkon_m100_m100x3_leaf,
	property = renkon_m100bit1_m100x4,
}

renkon_m100_m100x5_node = {
	left = renkon_any_m100sgr_node,
	right = renkon_m100bit1_m100x4_node,
	property = renkon_m100_m100x5,
}

renkon_m100_m100x5_leaf = {
	left = nil,
	right = nil,
	property = renkon_m100_m100x5,
}



-- meron
meron_any_node = {
	left = hourensou_plain_leaf,
	right = renkon_any_m100x2_leaf,
	property = meron_any,
}

meron_bit4_node = {
	left = hourensou_plain_leaf,
	right = renkon_any_m100x2_leaf,
	property = meron_bit4,
}

meron_plevel3_node = {
	left = meron_bit4_node,
	right = renkon_any_m100x2_leaf,
	property = meron_plevel3,
}


-- knd_remon     = 0x1D
remon_any_node = {
	left = kyuri_any_node,
	right = tomato_plain_leaf,
	property = remon_any,
}

remon_any_node_half = {
	left = kyuri_any_leaf,
	right = tomato_plain_leaf,
	property = remon_any,
}

remon_any_m100_node = {
	left = remon_any_node,
	right = renkon_any_m100x2_leaf,
	property = remon_any_m100,
}
remon_any_m100_node_half = {
	left = remon_any_node_half,
	right = renkon_any_m100x2_leaf,
	property = remon_any_m100,
}

remon_bit2_node = {
	left = kyuri_any_node,
	right = tomato_plain_leaf,
	property = remon_bit2,
}

remon_m100_node = {
	left = remon_bit2_node,
	right = shimaimo_plain_leaf,
	property = remon_m100,
}


-- karifura
karifura_any_node = {
	left = meron_any_node,
	right = shimaimo_plain_leaf,
	property = karifura_any,
}

karifura_any_leaf = {
	left = nil,
	right = nil,
	property = karifura_any,
}

karifura_plevel3_node = {
	left = meron_plevel3_node,
	right = shimaimo_plain_leaf,
	property = karifura_plevel3,
}


-- corn
corn_any_node = {
	left = kyabetsu_any_node,
	right = kabu_plain_leaf,
	property = corn_any,
}

corn_any_leaf = {
	left = nil,
	right = nil,
	property = corn_any,
}

corn_bit2_node = {
	left = kyabetsu_any_node,
	right = kabu_plain_leaf,
	property = corn_bit2,
}

corn_mlevel2_node = {
	left = corn_bit2_node,
	right = kabu_plain_leaf,
	property = corn_mlevel2,
}

corn_mlevel3_node = {
	left = corn_mlevel2_node,
	right = kabu_plain_leaf,
	property = corn_mlevel3,
}




-- kabocha
kabocha_any_node = {
	left = corn_any_node,
	right = karifura_any_node,
	property = kabocha_any,
}

kabocha_any_leaf = {
	left = nil,
	right = nil,
	property = kabocha_any,
}

kabocha_request_node = {
	left = corn_mlevel3_node,
	right = karifura_plevel3_node,
	property = kabocha_request,
}


-- ninjin
ninjin_m100bit1_node = {
	left = shimaimo_plain_leaf,
	right = renkon_m100_m100x3_leaf,
	property = ninjin_m100bit1,
}

-- knd_mame      = 0x06
mame_any_node = {
	left = kabocha_any_node,
	right = corn_any_node,
	property = mame_any,
}

mame_any_node_half = {
	left = kabocha_any_leaf,
	right = corn_any_leaf,
	property = mame_any,
}


-- knd_peach     = 0x1F
peach_any_node = {
	left = kabocha_any_node,
	right = karifura_any_node,
	property = peach_any,
}

peach_any_node_half = {
	left = kabocha_any_leaf,
	right = karifura_any_leaf,
	property = peach_any,
}




-- knd_karashi   = 0x07
karashi_any_node = {
	left = mame_any_node,
	right = karifura_any_node,
	property = karashi_any,
}

karashi_any_node_half = {
	left = mame_any_node_half,
	right = karifura_any_leaf,
	property = karashi_any,
}

karashi_any_leaf = {
	left = nil,
	right = nil,
	property = karashi_any,
}

-- knd_ichigo    = 0x20
ichigo_any_node = {
	left = peach_any_node,
	right = corn_any_node,
	property = ichigo_any,
}

ichigo_any_node_half = {
	left = peach_any_node_half,
	right = corn_any_leaf,
	property = ichigo_any,
}




-- garlic
garlic_any_node = {
	left = peach_any_node,
	right = mame_any_node,
	property = garlic_any,
}

garlic_any_leaf = {
	left = nil,
	right = nil,
	property = garlic_any,
}

garlic_p100bit6_node = {
	left = garlic_any_node,
	right = shimaimo_plain_leaf,
	property = garlic_p100bit6,
}

garlic_request_node = {
	left = ninjin_m100bit1_node,
	right = garlic_p100bit6_node,

	--left = garlic_p100bit6_node,
	--right = ninjin_m100bit1_node,
	property = garlic_request,
}

garlic_request_leaf = {
	left = nil,
	right = nil,
	property = garlic_request,
}

garlic_p300_node = {
	left = garlic_request_leaf,
	right = shimaimo_plain_leaf,
	property = garlic_p300,
}
garlic_p300_leaf = {
	left = nil,
	right = nil,
	property = garlic_p300,
}

-- knd_chingen   = 0x0A
chingen_any_p100bit7sml_leaf = {
	left = nil,
	right = nil,
	property = chingen_any_p100bit7sml,
}


-- knd_remon     = 0x1D
remon_p200_m100_node = {
	left = remon_any_m100_node,
	right = garlic_request_leaf,
	property = remon_p200_m100,
}

remon_p200_m100_typeB_node = {
	left = remon_any_m100_node_half,
	right = chingen_any_p100bit7sml_leaf,
	property = remon_p200_m100,
}

remon_p100bit7_node = {
	left = remon_any_node_half,
	right = garlic_p300_leaf,
	property = remon_p100bit7,
}

remon_p200_m100_typeC_node = {
	left = remon_p100bit7_node,
	right = renkon_any_m100x2_leaf,
	property = remon_p200_m100,
}


-- knd_wakame    = 0x08
wakame_any_node_half = {
	left = ichigo_any_node_half,
	right = kabocha_any_leaf,
	property = wakame_any,
}

wakame_any_leaf = {
	left = nil,
	right = nil,
	property = wakame_any,
}

wakame_m100_node_half = {
	left = wakame_any_node_half,
	right = kabu_plain_leaf,
	property = wakame_m100,
}

wakame_m100_leaf = {
	left = nil,
	right = nil,
	property = wakame_m100,
}

wakame_m200_node = {
	left = wakame_m100_leaf,
	right = shimaimo_plain_leaf,
	property = wakame_m200,
}

wakame_m200_leaf = {
	left = nil,
	right = nil,
	property = wakame_m200,
}

wakame_bit4_node = {
	left = wakame_any_leaf,
	right = shimaimo_plain_leaf,
	property = wakame_bit4,
}

wakame_p200bit7_node = {
	left = wakame_bit4_node,
	right = shimaimo_plain_leaf,
	property = wakame_p200bit7,
}

wakame_p200bit7_leaf = {
	left = nil,
	right = nil,
	property = wakame_p200bit7,
}

wakame_p200bit6_node = {
	left = wakame_p200bit7_leaf,
	right = wakame_p200bit7_leaf,
	property = wakame_p200bit6,
}


-- knd_pine      = 0x21
pine_any_node_half = {
	left = karashi_any_node_half,
	right = kabocha_any_leaf,
	property = pine_any,
}

pine_any_node_half2 = {
	left = karashi_any_leaf,
	right = kabocha_any_leaf,
	property = pine_any,
}

pine_p100bit7ton_node_half = {
	left = pine_any_node_half,
	right = kabu_plain_leaf,
	property = pine_p100bit7ton,
}

pine_p100bit7ton_leaf = {
	left = nil,
	right = nil,
	property = pine_p100bit7ton,
}

pine_p200bit7ton_node = {
	left = pine_p100bit7ton_leaf,
	right = shimaimo_plain_leaf,
	property = pine_p200bit7ton,
}

pine_p200bit7ton_leaf = {
	left = nil,
	right = nil,
	property = pine_p200bit7ton,
}

pine_p200bit1siz_node = {
	left = pine_p100bit7ton_leaf,
	right = kabu_p200_leaf,
	property = pine_p200bit1siz,
}

pine_p200bit7siz_node = {
	left = pine_p200bit1siz_node,
	right = shimaimo_plain_leaf,
	property = pine_p200bit7siz,
}

pine_p200bit7siz_leaf = {
	left = nil,
	right = nil,
	property = pine_p200bit7siz,
}

pine_p300_p300_node = {
	--left = pine_p200bit7ton_node,
	--right = pine_p200bit7siz_node,
	left = pine_p200bit7siz_node,
	right = pine_p200bit7ton_node,
	property = pine_p300_p300,
}

pine_p300_p300_leaf = {
	left = nil,
	right = nil,
	property = pine_p300_p300,
}

pine_m200bit7siz_node = {
	left = pine_p300_p300_leaf,
	right = renkon_m100_m100x5_leaf,
	property = pine_m200bit7siz,
}

pine_m200siz_node = {
	left = pine_m200bit7siz_node,
	right = kabu_plain_leaf,
	property = pine_m200siz,
}




-- knd_konbu     = 0x09
konbu_any_node = {
	left = ichigo_any_node,
	right = garlic_any_node,
	property = konbu_any,
}

konbu_any_node_half = {
	left = ichigo_any_node_half,
	right = garlic_any_leaf,
	property = konbu_any,
}

konbu_any_node_half2 = {
	left = karashi_any_leaf,
	right = wakame_any_leaf,
	property = konbu_any,
}

konbu_any_node_half3 = {
	left = karashi_any_node_half,
	right = wakame_m100_leaf,
	property = konbu_any,
}

konbu_any_node_half4 = {
	left = karashi_any_leaf,
	right = wakame_p200bit7_leaf,
	property = konbu_any,
}

konbu_m200_node = {
	left = konbu_any_node_half4,
	right = shimaimo_plain_leaf,
	property = konbu_m200,
}

-- knd_suica     = 0x22
suica_any_node = {
	left = karashi_any_node,
	right = garlic_any_node,
	property = suica_any,
}

suica_any_node_half = {
	left = karashi_any_node_half,
	right = garlic_any_leaf,
	property = suica_any,
}

suica_any_node_half2 = {
	left = karashi_any_leaf,
	right = garlic_any_leaf,
	property = suica_any,
}
suica_p200bit1sgr_node = {
	left = suica_any_node_half2,
	right = kyabetsu_p200_leaf,
	property = suica_p200bit1sgr,
}

suica_p300sgr_node = {
	left = suica_p200bit1sgr_node,
	right = kabu_plain_leaf,
	property = suica_p300sgr,
}
suica_p300sgr_leaf = {
	left = nil,
	right = nil,
	property = suica_p300sgr,
}

suica_m200bit7sgr_node = {
	left = suica_any_node_half2,
	right = renkon_m100_m100x5_leaf,
	property = suica_m200bit7sgr,
}

suica_m200sgr_node = {
	left = suica_m200bit7sgr_node,
	right = kabu_plain_leaf,
	property = suica_m200sgr,
}



-- knd_matsutake = 0x17
matsutake_any_node = {
	-- seed: simaimo 30, kabu 10, hourensou 20, renkon any 10
	left = konbu_any_node,
	right = suica_any_node,
	property = matsutake_any,
}

matsutake_any_node_half = {
	left = konbu_any_node_half,
	right = suica_any_node_half,
	property = matsutake_any,
}

matsutake_any_leaf = {
	left = nil,
	right = nil,
	property = matsutake_any,
}

matsutake_any_leaf_416 = {
	left = nil,
	right = nil,
	property = matsutake_any_416,
}

matsutake_m200bit7ptn_node = {
	left = matsutake_any_leaf_416,
	right = renkon_m100_m100x5_leaf,
	property = matsutake_m200bit7ptn,
}

matsutake_m200bit1ptn_node = {
	left = matsutake_m200bit7ptn_node,
	right = shimaimo_plain_leaf,
	property = matsutake_m200bit1ptn,
}

matsutake_m200bit1ptn_leaf = {
	left = nil,
	right = nil,
	property = matsutake_m200bit1ptn,
}

matsutake_p200bit1txt_node = {
	left = matsutake_any_leaf_416,
	right = kyuri_p200_leaf,
	property = matsutake_p200bit1txt,
}
matsutake_p200bit7txt_node = {
	left = matsutake_p200bit1txt_node,
	right = shimaimo_plain_leaf,
	property = matsutake_p200bit7txt,
}

matsutake_p200bit7txt_leaf = {
	left = nil,
	right = nil,
	property = matsutake_p200bit7txt,
}

matsutake_m200ptn_p300txt_node = {
	left = matsutake_m200bit1ptn_leaf,
	right = matsutake_p200bit7txt_leaf,
	property = matsutake_m200ptn_p300txt
}
matsutake_m200ptn_p300txt_leaf = {
	left = nil,
	right = nil,
	property = matsutake_m200ptn_p300txt
}

matsutake_p200bit1ptn_node = {
	left = matsutake_m200bit1ptn_leaf,
	right = ninjin_p200_p200x2_leaf,
	--right = hourensou_p200_leaf,
	property = matsutake_p200bit1ptn,
}
matsutake_p300ptn_node = {
	left = matsutake_p200bit1ptn_node,
	right = shimaimo_plain_leaf,
	property = matsutake_p300ptn,
}
matsutake_p300ptn_leaf = {
	left = nil,
	right = nil,
	property = matsutake_p300ptn,
}



-- knd_takenoko  = 0x16
takenoko_any_node_half = {
	left = garlic_any_leaf,
	right = kabocha_any_leaf,
	property = takenoko_any,
}

takenoko_any_leaf = {
	left = nil,
	right = nil,
	property = takenoko_any,
}

takenoko_any_leaf_426 = {
	left = nil,
	right = nil,
	property = takenoko_any_426,
}

takenoko_p200bit1wgt_node = {
	left = takenoko_any_leaf_426,
	right = ninjin_p200_p200x2_leaf,
	--right = shimaimo_p200_leaf,
	property = takenoko_p200bit1wgt,
}
takenoko_p200bit7wgt_node = {
	left = takenoko_p200bit1wgt_node,
	right = shimaimo_plain_leaf,
	property = takenoko_p200bit7wgt,
}

takenoko_p200bit7wgt_leaf = {
	left = nil,
	right = nil,
	property = takenoko_p200bit7wgt,
}

--takenoko_m200bit7shp_node = {
--	left = takenoko_any_leaf_426,
--	right = wakame_m100_leaf,
--	property = takenoko_m200bit7shp,
--}

takenoko_m200bit1shp_node = {
	left = takenoko_any_leaf_426,
	right = wakame_m200_leaf,
	property = takenoko_m200bit1shp,
}

takenoko_m200bit1shp_leaf = {
	left = nil,
	right = nil,
	property = takenoko_m200bit1shp,
}

takenoko_p300wgt_m200shp_node = {
	left = takenoko_p200bit7wgt_node,
	right = takenoko_m200bit1shp_node,
	--left = takenoko_m200bit1shp_node,
	--right = takenoko_p200bit7wgt_node,
	property = takenoko_p300wgt_m200shp,
}

takenoko_p300wgt_m200shp_node_half = {
	left = takenoko_p200bit7wgt_leaf,
	right = takenoko_m200bit1shp_leaf,
	property = takenoko_p300wgt_m200shp,
}
takenoko_p300wgt_m200shp_leaf = {
	left = nil,
	right = nil,
	property = takenoko_p300wgt_m200shp,
}


takenoko_m200bit7wgt_node = {
	left = takenoko_any_leaf_426,
	right = renkon_m100_m100x5_leaf,
	property = takenoko_m200bit7wgt,
}

takenoko_m200wgt_node = {
	left = takenoko_m200bit7wgt_node,
	right = kabu_plain_leaf,
	property = takenoko_m200wgt,
}


-- knd_chingen   = 0x0A
chingen_any_node_half = {
	left = suica_any_node_half2,
	right = matsutake_any_leaf,
	property = chingen_any,
}

chingen_any_node_half2 = {
	left = suica_any_node_half2,
	right = matsutake_m200bit1ptn_leaf,
	property = chingen_any,
}

chingen_any_leaf = {
	left = nil,
	right = nil,
	property = chingen_any,
}

chingen_any_p100bit7_node = {
	left = chingen_any_node_half2,
	right = pine_p100bit7ton_leaf,
	property = chingen_any_p100bit7,
}

chingen_m200bit7_p100bit7_node = {
	left = chingen_any_p100bit7_node,
	right = wakame_m100_leaf,
	property = chingen_m200bit7_p100bit7,
}


-- knd_dorian    = 0x23
dorian_any_node_half = {
	left = konbu_any_node_half2,
	right = matsutake_p200bit7txt_leaf,
	property = dorian_any,
}

dorian_any_node_half2 = {
	left = konbu_any_node_half3,
	right = matsutake_p200bit7txt_leaf,
	property = dorian_any,
}

dorian_p200bit1_node = {
	left = dorian_any_node_half,
	right = ninjin_p200_p200x2_leaf,
	property = dorian_p200bit1,
}

dorian_p300_node = {
	left = dorian_p200bit1_node,
	right = kabu_plain_leaf,
	property = dorian_p300,
}
dorian_p300_leaf = {
	left = nil,
	right = nil,
	property = dorian_p300,
}



-- knd_piman     = 0x0B
piman_any_node_half = {
	left = konbu_any_node_half2,
	right = chingen_any_leaf,
	property = piman_any,
}

piman_m100bit2_node = {
	left = piman_any_node_half,
	right = kabu_plain_leaf,
	property = piman_m100bit2,
}

piman_m100bit1_mlevel2_node = {
	left = piman_m100bit2_node,
	right = shimaimo_mlevel2_node,
	property = piman_m100bit1_mlevel2,
}

-- knd_herb      = 0x0C
herb_any_node_half = {
	left = piman_any_node_half,
	right = chingen_any_leaf,
	property = herb_any,
}

herb_p300_node = {
	left = herb_any_node_half,
	right = kabu_plain_leaf,
	property = herb_p300,
}


-- knd_kifujin   = 0x18
kifujin_any_node_half = {
	left = konbu_any_node_half2,
	right = dorian_any_node_half,
	property = kifujin_any,
}

kifujin_any_node_half2 = {
	left = konbu_any_node_half3,
	right = dorian_any_node_half2,
	property = kifujin_any,
}

kifujin_p300flv_node = {
	left = kifujin_any_node_half2,
	right = kabu_plain_leaf,
	property = kifujin_p300flv,
}
kifujin_p300flv_leaf = {
	left = nil,
	right = nil,
	property = kifujin_p300flv,
}



-- knd_chingen   = 0x0A
chingen_any_p300x2_typeA_node = {  -- sugar, texture
	left = suica_p300sgr_leaf,
	right = matsutake_m200ptn_p300txt_leaf,
	property = chingen_any_p300x2_typeA,
}

chingen_any_p300x2_typeB_node = { -- sugar, pattern
	left = suica_p300sgr_leaf,
	right = matsutake_p300ptn_leaf,
	property = chingen_any_p300x2_typeB,
}

chingen_any_p300x3_typeA_node = {  -- sugar, texture, pattern
	left = chingen_any_p300x2_typeA_node,
	right = matsutake_p300ptn_leaf,
	property = chingen_any_p300x3_typeA,
}

chingen_any_p300x3_typeB_node = { -- sugar, pattern, texture
	left = chingen_any_p300x2_typeB_node,
	right = matsutake_m200ptn_p300txt_leaf,
	property = chingen_any_p300x3_typeA,
}

chingen_any_p300x4_typeA_node = {  -- sugar, texture, pattern, flavor
	left = chingen_any_p300x3_typeA_node,
	right = kifujin_p300flv_leaf,
	property = chingen_any_p300x4_typeA,
}
chingen_any_p300x4_typeB_node = {  -- sugar, texture, pattern, flavor
	left = chingen_any_p300x3_typeB_node,
	right = kifujin_p300flv_leaf,
	property = chingen_any_p300x4_typeA,
}

chingen_any_p300x6_typeA_node = {  -- sugar, texture, pattern, flavor, size, tone
	left = chingen_any_p300x4_typeA_node,
	right = pine_p300_p300_leaf,
	property = chingen_any_p300x6_typeA,
}
chingen_any_p300x6_typeB_node = {  -- sugar, texture, pattern, flavor, size, tone
	left = chingen_any_p300x4_typeB_node,
	right = pine_p300_p300_leaf,
	property = chingen_any_p300x6_typeA,
}

chingen_any_p300x7_typeA_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition
	left = chingen_any_p300x6_typeA_node,
	right = dorian_p300_leaf,
	property = chingen_any_p300x7_typeA,
}
chingen_any_p300x7_typeB_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition
	left = chingen_any_p300x6_typeB_node,
	right = dorian_p300_leaf,
	property = chingen_any_p300x7_typeA,
}

chingen_any_p300x8_typeA_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition, weight
	left = chingen_any_p300x7_typeA_node,
	right = takenoko_p300wgt_m200shp_leaf,
	property = chingen_any_p300x8_typeA,
}
chingen_any_p300x8_typeB_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition, weight
	left = chingen_any_p300x7_typeB_node,
	right = takenoko_p300wgt_m200shp_leaf,
	property = chingen_any_p300x8_typeA,
}

chingen_any_p300x9_typeA_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition, weight, smell
	left = chingen_any_p300x8_typeA_node,
	right = garlic_p300_leaf,
	property = chingen_any_p300x9_typeA,
}
chingen_any_p300x9_typeB_node = {  -- sugar, texture, pattern, flavor, size, tone, nutrition, weight, smell
	left = chingen_any_p300x8_typeB_node,
	right = garlic_p300_leaf,
	property = chingen_any_p300x9_typeA,
}

chingen_p300_p300x9_typeA_node = {
	left = chingen_any_p300x9_typeA_node,
	right = wakame_p200bit7_leaf,
	property = chingen_p300_p300x9,
}
chingen_p300_p300x9_typeB_node = {
	left = chingen_any_p300x9_typeB_node,
	right = wakame_p200bit7_leaf,
	property = chingen_p300_p300x9,
}


chingen_any_p300_typeC_node = {  -- smell
	left = chingen_any_leaf,
	right = garlic_p300_leaf,
	property = chingen_any_p300_typeC,
}

chingen_any_p300x2_typeC_node = {  -- smell, weight
	left = chingen_any_p300_typeC_node,
	right = takenoko_p300wgt_m200shp_leaf,
	property = chingen_any_p300x2_typeC,
}

chingen_any_p300x3_typeC_node = {  -- smell, weight, texture
	left = chingen_any_p300x2_typeC_node,
	right = matsutake_m200ptn_p300txt_leaf,
	property = chingen_any_p300x3_typeC,
}

chingen_any_p300x4_typeC_node = {  -- smell, weight, texture, pattern
	left = chingen_any_p300x3_typeC_node,
	right = matsutake_p300ptn_leaf,
	property = chingen_any_p300x4_typeC,
}

chingen_any_p300x6_typeC_node = {  -- smell, weight, texture, pattern, size, tone
	left = chingen_any_p300x4_typeC_node,
	right = pine_p300_p300_leaf,
	property = chingen_any_p300x6_typeC,
}

chingen_any_p300x7_typeC_node = {  -- smell, weight, texture, pattern, size, tone, nutrition
	left = chingen_any_p300x6_typeC_node,
	right = dorian_p300_leaf,
	property = chingen_any_p300x7_typeC,
}

chingen_p200bit7_p300x7_typeC_node = {  -- smell, weight, texture, pattern, size, tone, nutrition, shape
	--left = chingen_any_p300x4_typeC_node,
	--right = wakame_p200bit6_node,
	left = wakame_p200bit6_node,
	right = chingen_any_p300x7_typeC_node,
	property = chingen_p200bit7_p300x7_typeC,
}

chingen_p300_p300x9_typeC_node = {
	left = chingen_any_p300x8_typeA_node,
	right = chingen_p200bit7_p300x7_typeC_node,
	property = chingen_p300_p300x9,
}
chingen_p300_p300x9_typeD_node = {
	left = chingen_any_p300x8_typeB_node,
	right = chingen_p200bit7_p300x7_typeC_node,
	property = chingen_p300_p300x9,
}



------------------------------------------------------------
-- target setting using binary tree
------------------------------------------------------------
-- year1 1/15
target_tree_1115 = {
	-- need shimaimo_plain 14, kabu_plain 15
	renkon_any_m100x2_node,
	--renkon_any_m100x2_node_2,
	imokyu_any_bit4_node,
}

-- year1 1/22
target_tree_1122 = {
	-- need shimaimo_plain 24?, kabu_plain 2?
	renkon_m100_m100x3_node,
}

-- year1 2/09
target_tree_1209 = {
	shimaimo_p200_node,
	renkon_p200_node,
}

-- year1 3/05
target_tree_1305 = {
	kabu_p200_node,
	tamanegi_p200_node,
	ninjin_p200_p200x2_node,
}

-- year1 3/14
target_tree_1314 = {
	gobou_p200_p200_node,
}

-- year1 4/01
target_tree_1401 = {
	-- seed: simaimo 64, kabu 12, hourensou 19, renkon any 13, renkon -600 4,

	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--renkon_m100_m100x5_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--# retry 817
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--# retry 813
	karifura_any_node,
	karifura_any_node,
	renkon_m100_m100x5_node,
	garlic_request_node,
	gobou_p200_p200_node,
	hourensou_p200_node,
	kabocha_request_node,
	kabocha_any_node,
	kabocha_any_node,
	corn_any_node,
	corn_any_node,
}

-- year1 4/01
target_tree_1401_typeB = {
	-- seed: simaimo 30, kabu 10, hourensou 20, renkon any 10  -- this is matsutake node
	karifura_any_node,
	karifura_any_node,
	matsutake_any_node,
}

-- year1 4/08
target_tree_1408 = {
	-- seed: simaimo 27, kabu 22, hourensou 2, renkon any 0
	-- seed: karifra 5, corn 5, kabocha 7, garlic 2
	
	-- it is better to hybrid one more karashi.
	--karashi_any_node_half,

	-- #retry
	--kyuri_p200_node,
	--kyabetsu_p200_node,
	--matsutake_any_node_half,
	--karashi_any_node_half,
	--wakame_m100_node_half,
	--pine_p100bit7ton_node_half,

	-- #retry 506
	wakame_m100_node_half,
	kyuri_p200_node,
	matsutake_any_node_half,
	karashi_any_node_half,
	kyabetsu_p200_node,
	pine_p100bit7ton_node_half,

	-- #retry 523
	--wakame_m100_node_half,
	--kyuri_p200_node,
	--matsutake_any_node_half,
	--kyabetsu_p200_node,
	--karashi_any_node_half,
	--pine_p100bit7ton_node_half,
}

-- year1 4/16
target_tree_1416 = {
	-- seed:: simaimo plain 49, kabu plain 0
	-- seed:: renkon -600, kyuri +200, garlic p100bit7,
	
	--karashi_any_node_half,
	
	--takenoko_any_node_half,
	--chingen_any_node_half,
	--matsutake_m200bit1ptn_node,  -- TODO::Don't select matsutake_p200bit7txt_node as a first parent
	--matsutake_p200bit7txt_node,  -- TODO::Don't select matsutake_m200bit1ptn_node as a first parent
	--wakame_p200bit7_node,
	--wakame_m200_node,
	--garlic_p300_node,
	

	--# retry 244, fc = 14102
	chingen_any_node_half,
	matsutake_p200bit7txt_node,  -- TODO::Don't select matsutake_m200bit1ptn_node as a first parent
	wakame_p200bit7_node,
	wakame_m200_node,
	matsutake_m200bit1ptn_node,  -- TODO::Don't select matsutake_p200bit7txt_node as a first parent
	garlic_p300_node,
	takenoko_any_node_half,

	--# retry 238, fc = 15311
	--chingen_any_node_half,
	--wakame_m200_node,
	--matsutake_p200bit7txt_node,  -- TODO::Don't select matsutake_m200bit1ptn_node as a first parent
	--wakame_p200bit7_node,
	--matsutake_m200bit1ptn_node,  -- TODO::Don't select matsutake_p200bit7txt_node as a first parent
	--garlic_p300_node,
	--takenoko_any_node_half,
}

-- year1 4/22
target_tree_1422 = {
	-- seed:: kabu +200, simaimo plain 14, kabu plain 23
	pine_p300_p300_node,
	kifujin_p300flv_node,
}


-- year1 4/26
target_tree_1426 = {
	-- seed:: kyabetsu +200, simaimo plain 26, kabu plain 46  -- (include herb and kifujin)
	-- seed:: kyabetsu +200, simaimo plain 18, kabu plain 23
	-- and
	-- seed:: ninjin +200 x3, or (ninjin +200 x1, shimaimo +200 x1, hourensou +200 x1)

	--herb_p300_node,   -- TODO::Don't select piman_m100bit1_mlevel2_node as a first parent
	--kifujin_any_node_half,   -- TODO::Don't select dorian_p300_node as a first parent

	--piman_m100bit1_mlevel2_node,
	--chingen_m200bit7_p100bit7_node,
	--dorian_p300_node,
	--matsutake_m200ptn_p300txt_node,   -- TODO::Don't select matsutake_p300ptn_node as a first parent
	--matsutake_p300ptn_node,   -- TODO::Don't select matsutake_m200ptn_p300txt_node as a first parent
	--takenoko_p300wgt_m200shp_node,
	--suica_p300sgr_node,
	

	--# retry 310, fc = 15786
	chingen_m200bit7_p100bit7_node,
	dorian_p300_node,
	matsutake_p300ptn_node,   -- TODO::Don't select matsutake_m200ptn_p300txt_node as a first parent
	takenoko_p300wgt_m200shp_node,
	matsutake_m200ptn_p300txt_node,   -- TODO::Don't select matsutake_p300ptn_node as a first parent
	suica_p300sgr_node,
	piman_m100bit1_mlevel2_node,

	--# retry 312, fc = 15936
	--matsutake_p300ptn_node,   -- TODO::Don't select matsutake_m200ptn_p300txt_node as a first parent
	--dorian_p300_node,
	--chingen_m200bit7_p100bit7_node,
	--takenoko_p300wgt_m200shp_node,
	--matsutake_m200ptn_p300txt_node,   -- TODO::Don't select matsutake_p300ptn_node as a first parent
	--suica_p300sgr_node,
	--piman_m100bit1_mlevel2_node,
}


-- year1 5/08
target_tree_1508 = {
	--chingen_p300_p300x9_typeA_node,
	--chingen_p300_p300x9_typeB_node,
	--chingen_p300_p300x9_typeC_node,
	--chingen_p300_p300x9_typeD_node,
	
	---------- m200 ----------
	--matsutake_m200ptn_p300txt_leaf,  -- pattern
	--takenoko_p300wgt_m200shp_leaf,  -- shape  -- leave one seed for planting one more crop
	--wakame_m200_leaf,  -- shape
	
	--pine_m200siz_node,
	suica_m200sgr_node,  -- sugar
	konbu_m200_node,  -- flavor
	takenoko_m200wgt_node,  -- weight

	--piman, -- tone
	--garlic, -- smell
	--matsutake,  -- texture
	--dorian,  -- nutrition
	
	---------- for contest ----------
	--remon_p200_m100_typeC_node,
	--remon_p200_m100_typeB_node,
	
	--peach  -- smell +200 from chingen, weight +200 from shimaimo in 4/7
	--karifura  -- weight +200, size +200 from gobou
	--mame  -- texture -100, pattern +200
	
	
	
}


