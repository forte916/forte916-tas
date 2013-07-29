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
	nutrition = {rank = 0xC, bit = 3, value = 0x0C94, order = nil},
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


-- imokyu
local imokyu_any_bit4 = {
	kind1 = knd_imokyu,
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

local hourensou_p100bit7 = {
	kind1 = knd_hourensou,
	kind2 = 0,
	pattern = {rank = 0xD, bit = 7, value = 0, order = true},
}

local hourensou_p200 = {
	kind1 = knd_hourensou,
	kind2 = 0,
	pattern = {rank = 0xD, bit = 8, value = 0x0DFF, order = true},
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
local meron_plevel3 = {
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
local karifura_plevel3 = {
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
local corn_mlevel2 = {
	kind1 = knd_corn,
	kind2 = 0,
	-- texture: -30
	texture = {rank = 0xB, bit = 7, value = 0x0BF7, order = false},
}
local corn_mlevel3 = {
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


-- matsutake
local matsutake_any = {
	kind1 = knd_matsutake,
	kind2 = 0,
	pattern = {rank = 0, bit = 0, value = 0, order = nil},
	texture = {rank = 0, bit = 0, value = 0, order = nil},
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_any_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit4           , retry = 0, done = 0},
	{first = renkon_bit4           , second = kabu_plain    , hybrid = tamanegi_any_bit4     , retry = 0, done = 0},
	{first = tamanegi_any_bit4     , second = shimaimo_plain, hybrid = imokyu_any_bit4      , retry = 0, done = 0},
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


-- kyuri
kyuri_any_node = {
	left = hourensou_plain_leaf,
	right = shimaimo_plain_leaf,
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

-- mame
mame_any_node = {
	left = kabocha_any_node,
	right = corn_any_node,
	property = mame_any,
}


-- peach
peach_any_node = {
	left = kabocha_any_node,
	right = karifura_any_node,
	property = peach_any,
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

-- knd_mame      = 0x06


-- knd_karashi   = 0x07
karashi_any_node = {
	left = mame_any_node,
	right = karifura_any_leaf,
	property = karashi_any,
}



-- knd_ichigo    = 0x20


-- knd_konbu     = 0x09
konbu_any_node = {
	left = ichigo_any_node,
	right = garlic_any_leaf,
	property = konbu_any,
}

-- knd_suica     = 0x22
suica_any_node = {
	left = karashi_any_node,
	right = garlic_any_leaf,
	property = suica_any,
}


-- knd_matsutake = 0x17
matsutake_any_node = {
	left = konbu_any_node,
	right = suica_any_node,
	property = matsutake_any,
}





------------------------------------------------------------
-- target setting using binary tree
------------------------------------------------------------
-- year1 1/15
target_tree_1115 = {
	-- need shimaimo_plain 14, kabu_plain 15
	renkon_any_m100x2_node,
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
	--kabu_p200_node,
	--ninjin_p200_p200x2_node,
	--tamanegi_p200_node,

	kabu_p200_node,
	tamanegi_p200_node,
	ninjin_p200_p200x2_node,
	
	--ninjin_p200_p200x2_node,
	--kabu_p200_node,
	--tamanegi_p200_node,
	
	--ninjin_p200_p200x2_node,
	--tamanegi_p200_node,
	--kabu_p200_node,
	
	--tamanegi_p200_node,
	--kabu_p200_node,
	--ninjin_p200_p200x2_node,
	
	--tamanegi_p200_node,
	--ninjin_p200_p200x2_node,
	--kabu_p200_node,
}

-- year1 3/14
target_tree_1314 = {
	gobou_p200_p200_node,
}

-- year1 4/01
target_tree_1401 = {
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

	--renkon_m100_m100x5_node,
	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--garlic_request_node,
	--renkon_m100_m100x5_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--renkon_m100_m100x5_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--hourensou_p200_node,
	--garlic_request_node,
	--kabocha_request_node,
	--gobou_p200_p200_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--renkon_m100_m100x5_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--# retry 
	--garlic_request_node,
	--renkon_m100_m100x5_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--gobou_p200_p200_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
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

	--corn_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--corn_any_node,
	--corn_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--kabocha_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,

	--kabocha_any_node,
	--kabocha_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--karifura_any_node,
	--karifura_any_node,
	--corn_any_node,
	--corn_any_node,

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--kabocha_request_node,
	--hourensou_p200_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--corn_any_node,
	--kabocha_request_node,
	--hourensou_p200_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--kabocha_any_node,
	--kabocha_request_node,
	--hourensou_p200_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--kabocha_any_node,
	--kabocha_any_node,
	--kabocha_request_node,
	--hourensou_p200_node,
	--corn_any_node,
	--corn_any_node,

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--corn_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--kabocha_any_node,
	--kabocha_request_node,

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

	--# retry 
	--karifura_any_node,
	--karifura_any_node,
	--renkon_m100_m100x5_node,
	--garlic_request_node,
	--gobou_p200_p200_node,
	--hourensou_p200_node,
	--kabocha_request_node,
	--kabocha_any_node,
	--corn_any_node,
	--kabocha_any_node,
	--corn_any_node,

}

-- year1 4/08
target_tree_1408 = {

}

