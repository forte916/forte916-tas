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
	kind2 = knd_plain,
	weight = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

local shimaimo_m100 = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local shimaimo_m100_m100x2 = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local shimaimo_p200 = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- kabu
local kabu_plain = {
	kind1 = knd_kabu,
	kind2 = knd_plain,
	size = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

local kabu_m100 = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local kabu_p200 = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

-- renkon
local renkon_any = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
}

local renkon_bit2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xC, bit = 2, value = 0, order = false},
}

local renkon_any_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_bit2_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xC, bit = 2, value = 0, order = false},
}

local renkon_m100bit1 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
}

local renkon_m100bit1_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100bit3 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 3, value = 0, order = false},
}

local renkon_m100bit2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 2, value = 0, order = false},
}

local renkon_m100bit2_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 2, value = 0, order = false},
}

local renkon_m100bit1_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
}

local renkon_m100_m100x3 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_any_m100txt = {
	kind1 = knd_renkon,
	kind2 = 0,
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_any_m100sgr = {
	kind1 = knd_renkon,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_m100bit1_m100x4 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 1, value = 0, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local renkon_m100_m100x5 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	pattern = {rank = 0xB, bit = 0, value = 0xB00, order = false},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local renkon_bit4 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

local renkon_p200 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local renkon_any_p200 = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}



-- ninjin
local ninjin_any = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0, bit = 0, value = 0, order = nil},
}

local ninjin_bit2 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xC, bit = 2, value = 0, order = false},
}

local ninjin_m100bit1 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0, order = false},
}
local ninjin_m100 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

local ninjin_bit4 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xC, bit = 4, value = 0, order = true},
}

local ninjin_any_p200x2 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local ninjin_p100bit7 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xD, bit = 7, value = 0, order = true},
}

local ninjin_p200 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local ninjin_p200_p200x2 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	nutrition = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- tamanegi
local tamanegi_any_bit4 = {
	kind1 = knd_tamanegi,
	kind2 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

local tamanegi_p100bit7 = {
	kind1 = knd_tamanegi,
	kind2 = 0,
	weight = {rank = 0xD, bit = 7, value = 0, order = true},
}

local tamanegi_p200 = {
	kind1 = knd_tamanegi,
	kind2 = 0,
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- imodama
local imodama_any_bit4 = {
	kind1 = knd_imodama,
	kind2 = 0,
	pattern = {rank = 0xC, bit = 4, value = 0, order = true},
}

-- gobou
local gobou_p100bit7_p200 = {
	kind1 = knd_gobou,
	kind2 = 0,
	size = {rank = 0xD, bit = 7, value = 0, order = true},
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}

local gobou_p200_p200 = {
	kind1 = knd_gobou,
	kind2 = 0,
	size = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
	weight = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
}


-- hourensou
local hourensou_plain = {
	kind1 = knd_hourensou,
	kind2 = knd_plain,
	pattern = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
}

-- kyuri
local kyuri_any = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0, bit = 0, value = 0, order = nil},
}
local kyuri_bit2 = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xC, bit = 2, value = 0, order = false},
}
local kyuri_m100 = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
-- kyabetsu
local kyabetsu_any = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0, bit = 0, value = 0, order = nil},
}
local kyabetsu_bit2 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xC, bit = 2, value = 0, order = false},
}
local kyabetsu_m100 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}

-- meron
local meron_any = {
	kind1 = knd_meron,
	kind2 = 0,
}
local meron_bit4 = {
	kind1 = knd_meron,
	kind2 = 0,
	sugar = {rank = 0xC, bit = 4, value = 0, order = true},
}
local meron_levelp3 = {
	kind1 = knd_meron,
	kind2 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
}

-- karifura
local karifura_any = {
	kind1 = knd_karifura,
	kind2 = 0,
}
local karifura_levelp3 = {
	kind1 = knd_karifura,
	kind2 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
}

-- corn
local corn_any = {
	kind1 = knd_corn,
	kind2 = 0,
}
local corn_bit2 = {
	kind1 = knd_corn,
	kind2 = 0,
	texture = {rank = 0xC, bit = 2, value = 0, order = false},
}
local corn_levelm2 = {
	kind1 = knd_corn,
	kind2 = 0,
	-- texture: -30
	texture = {rank = 0xB, bit = 7, value = 0x0BF7, order = false},
}
local corn_levelm3 = {
	kind1 = knd_corn,
	kind2 = 0,
	-- texture: -60 ~ -31
	texture = {rank = 0xB, bit = 6, value = 0, order = false},
}

-- kabocha
local kabocha_any = {
	kind1 = knd_kabocha,
	kind2 = 0,
}
local kabocha_request = {
	kind1 = knd_kabocha,
	kind2 = 0,
	-- sugar: +101 ~ +130
	sugar = {rank = 0xD, bit = 1, value = 0, order = true},
	-- texture: -60 ~ -31
	texture = {rank = 0xB, bit = 6, value = 0, order = false},
}

-- mame
local mame_any = {
	kind1 = knd_mame,
	kind2 = 0,
}

--knd_peach     = 0x1F  -- ñCä€ÉsÅ[É`
-- peach
local peach_any = {
	kind1 = knd_peach,
	kind2 = 0,
}



-- garlic
local garlic_any = {
	kind1 = knd_garlic,
	kind2 = 0,
	smell = {rank = 0, bit = 0, value = 0, order = nil},
}
local garlic_p100bit6 = {
	kind1 = knd_garlic,
	kind2 = 0,
	smell = {rank = 0xD, bit = 6, value = 0, order = true},
}
local garlic_request = {
	kind1 = knd_garlic,
	kind2 = 0,
	-- smell: +161 ~ +199
	smell = {rank = 0xD, bit = 7, value = 0, order = true},
	-- nutrition: -99 ~ -61
	nutrition = {rank = 0xB, bit = 1, value = 0, order = false},
}







------------------------------------------------------------
----- otsu -----
------------------------------------------------------------
local kabu_otsu = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local shimaimo_otsu = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}
local renkon_otsu = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
}
local ninjin_otsu = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
}
local kyuri_otsu = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local kyabetsu_otsu = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
}

local kabu_otsubit7 = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xB, bit = 7, value = 0x0BFE, order = false},
}

local ninjin_otsuA = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
}
local renkon_otsuA = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}
local gobou_otsuA = {
	kind1 = knd_gobou,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0x0B10, order = false},
	nutrition = {rank = 0xB, bit = 1, value = 0x0B20, order = false},
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
	texture = {rank = 0xB, bit = 5, value = 0x0B7C, order = false},
}

local renkon_otsuB = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00, order = false},
}
local tamanegi_otsuB = {
	kind1 = knd_tamanegi,
	kind2 = 0,
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}
local gobou_otsuB = {
	kind1 = knd_gobou,
	kind2 = 0,
	size = {rank = 0xB, bit = 6, value = 0x0BFC, order = false},
	weight = {rank = 0xB, bit = 1, value = 0x0B08, order = false},
}

local gobou_otsu = {
	kind1 = knd_gobou,
	kind2 = 0,
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
	{first = ninjin_m100           , second = kyabetsu_otsu , hybrid = ninjin_otsuA          , retry = 0, done = 0} ,
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2    , retry = 0, done = 0},
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2    , retry = 0, done = 0},
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
	{first = shimaimo_m100_m100x2  , second = kabu_m100     , hybrid = renkon_m100_m100x3  , retry = 0, done = 0},
}

-- renkon_m100_m100x3 typeD for machine level1
target_renkon_m100_m100x3_d = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2    , retry = 0, done = 0},
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
	{first = meron_bit4            , second = renkon_any_m100x2, hybrid = meron_levelp3      , retry = 0, done = 0},
	{first = meron_levelp3         , second = shimaimo_plain, hybrid = karifura_levelp3      , retry = 0, done = 0},
	-- corn
	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_any          , retry = 0, done = 0},
	{first = kyabetsu_any          , second = kabu_plain    , hybrid = corn_bit2             , retry = 0, done = 0},
	{first = corn_bit2             , second = kabu_plain    , hybrid = corn_levelm2          , retry = 0, done = 0},
	{first = corn_levelm2          , second = kabu_plain    , hybrid = corn_levelm3          , retry = 0, done = 0},
	-- kabocha
	{first = corn_levelm3          , second = karifura_levelp3, hybrid = kabocha_request     , retry = 0, done = 0},
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit4           , retry = 0, done = 0},
	{first = renkon_bit4           , second = kabu_plain    , hybrid = tamanegi_any_bit4     , retry = 0, done = 0},
	{first = tamanegi_any_bit4     , second = shimaimo_plain, hybrid = imodama_any_bit4      , retry = 0, done = 0},
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


target_vegee_test = target_renkon_m100_m100x3_a


