-- target_vegee setting
-- rule
-- + If value is set, we don't care rank and bit.
-- + value == 0 and rank == 0 means we accepts any.
-- + value == 0 and rank ~= 0 means we don't care value but rank and bit.
-- + order == true means getting better
-- + order == false means getting worse

require "astronoka_lib"

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
-- kyabetsu
local kyabetsu_bit2 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xC, bit = 2, value = 0, order = false},
}




------------------------------------------------------------
----- otsu -----
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

local kyuri_otsubit8 = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xB, bit = 8, value = 0x0BFF, order = false},
}
local kyuri_otsubit7 = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xB, bit = 7, value = 0x0BFE, order = false},
}
local kyuri_otsubit6 = {
	kind1 = knd_kyuri,
	kind2 = 0,
	texture = {rank = 0xB, bit = 6, value = 0x0BFC, order = false},
}
local kyabetsu_otsubit8 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 8, value = 0x0BFF, order = false},
}
local kyabetsu_otsubit7 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 7, value = 0x0BFE, order = false},
}
local kyabetsu_otsubit6 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 6, value = 0x0BFC, order = false},
}
local kyabetsu_otsubit5 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 5, value = 0x0BF4, order = false},
}
local kyabetsu_otsubit4 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 4, value = 0x0BE4, order = false},
}
local kyabetsu_otsubit3 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 3, value = 0x0BC4, order = false},
}
local kyabetsu_otsubit2 = {
	kind1 = knd_kyabetsu,
	kind2 = 0,
	sugar = {rank = 0xB, bit = 2, value = 0x0B44, order = false},
}

local kabu_otsubit8 = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xB, bit = 8, value = 0x0BFF, order = false},
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

	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_otsubit8        , retry = 0, done = 0},
	{first = kyuri_otsubit8        , second = shimaimo_plain, hybrid = kyuri_otsubit7        , retry = 0, done = 0},
	{first = kyuri_otsubit7        , second = shimaimo_plain, hybrid = kyuri_otsubit6        , retry = 0, done = 0},
	{first = kyuri_otsubit6        , second = shimaimo_plain, hybrid = kyuri_otsu            , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = renkon_m100           , second = kyuri_otsu    , hybrid = renkon_otsuA          , retry = 0, done = 0},

	{first = hourensou_plain       , second = shimaimo_plain, hybrid = kyuri_any             , retry = 0, done = 0},
	{first = kyuri_any             , second = shimaimo_plain, hybrid = kyabetsu_bit2         , retry = 0, done = 0},
	{first = kyabetsu_bit2         , second = shimaimo_plain, hybrid = kyabetsu_otsubit8     , retry = 0, done = 0},
	{first = kyabetsu_otsubit8     , second = shimaimo_plain, hybrid = kyabetsu_otsubit7     , retry = 0, done = 0},
	{first = kyabetsu_otsubit7     , second = shimaimo_plain, hybrid = kyabetsu_otsubit6     , retry = 0, done = 0},
	{first = kyabetsu_otsubit6     , second = shimaimo_plain, hybrid = kyabetsu_otsubit5     , retry = 0, done = 0},
	{first = kyabetsu_otsubit5     , second = shimaimo_plain, hybrid = kyabetsu_otsubit4     , retry = 0, done = 0},
	{first = kyabetsu_otsubit4     , second = shimaimo_plain, hybrid = kyabetsu_otsubit3     , retry = 0, done = 0},
	{first = kyabetsu_otsubit3     , second = shimaimo_plain, hybrid = kyabetsu_otsu         , retry = 0, done = 0},

	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = kyabetsu_otsu , hybrid = ninjin_otsuA          , retry = 0, done = 0} ,
	{first = ninjin_otsuA          , second = renkon_otsuA  , hybrid = gobou_otsuA           , retry = 0, done = 0},

	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_otsubit8         , retry = 0, done = 0},
	{first = kabu_otsubit8         , second = kabu_plain    , hybrid = kabu_otsubit7         , retry = 0, done = 0},

	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_plain    , hybrid = renkon_otsuB          , retry = 0, done = 0},
	{first = renkon_otsuB          , second = kabu_plain    , hybrid = tamanegi_otsuB        , retry = 0, done = 0},
	{first = tamanegi_otsuB        , second = kabu_otsubit7 , hybrid = gobou_otsuB           , retry = 0, done = 0},

	{first = gobou_otsuB           , second = gobou_otsuA   , hybrid = gobou_otsu            , retry = 0, done = 0},

}




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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit1       , retry = 0, done = 0},
	{first = renkon_m100bit1       , second = renkon_bit2_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},
}

-- renkon_m100_m100x2 typeD for machine level1
target_renkon_m100_m100x2_d = {
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = renkon_m100           , second = renkon_bit2_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = renkon_bit2_m100x2, hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
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
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = renkon_m100   , hybrid = renkon_m100_m100      , retry = 0, done = 0},
	{first = renkon_m100_m100      , second = renkon_bit2_m100x2, hybrid = renkon_m100_m100x3 , retry = 0, done = 0},
}

-- tamanegi_p200 for contest
target_tamanegi_p200 = {
	{first = shimaimo_p200         , second = kabu_plain    , hybrid = renkon_any_p200       , retry = 0, done = 0},
	{first = renkon_any_p200       , second = kabu_plain    , hybrid = tamanegi_p100bit7     , retry = 0, done = 0},
	{first = tamanegi_p100bit7     , second = shimaimo_plain, hybrid = tamanegi_p200         , retry = 0, done = 0},
}


---------- speed run ----------
-- year1 1/15
target_vegee_1115 = {
-- need shimaimo_plain 14, kabu_plain 15
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = kabu_m100             , second = shimaimo_m100 , hybrid = renkon_bit2_m100x2    , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit4           , retry = 0, done = 0},
	{first = renkon_bit4           , second = kabu_plain    , hybrid = tamanegi_any_bit4     , retry = 0, done = 0},
	{first = tamanegi_any_bit4     , second = shimaimo_plain, hybrid = imodama_any_bit4      , retry = 0, done = 0},
}

-- year1 1/22
target_vegee_1122 = {
-- need shimaimo_plain 24??, kabu_plain 2??
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_bit2           , retry = 0, done = 0},
	{first = ninjin_bit2           , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_bit2           , retry = 0, done = 0},
	{first = renkon_bit2           , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = renkon_bit2_m100x2, hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},
}

target_vegee_1209 = {
-- need shimaimo_plain 14, kabu_plain 15
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

target_vegee_test = target_renkon_m100_m100x3_a


