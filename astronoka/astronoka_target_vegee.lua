-- target_vegee setting
-- rule
-- + value == 0 and rank == 0 means we accepts any.
-- + value == 0 and rank ~= 0 means we don't care value but rank and bit.

require "astronoka_lib"

-- shimaimo
local shimaimo_plain = {
	kind1 = knd_shimaimo,
	kind2 = knd_plain,
	weight = {rank = 0xC, bit = 3, value = 0x0C94}
}

local shimaimo_m100 = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
}

local shimaimo_m100_m100x2 = {
	kind1 = knd_shimaimo,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 0, value = 0xB00},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00},
}

-- kabu
local kabu_plain = {
	kind1 = knd_kabu,
	kind2 = knd_plain,
	size = {rank = 0xC, bit = 3, value = 0x0C94},
}

local kabu_m100 = {
	kind1 = knd_kabu,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00},
}

-- renkon
local renkon_any = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0, bit = 0, value = 0},
}

local renkon_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0xB00},
}

local renkon_any_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00},
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
}

local renkon_m100bit1 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 1, value = 0},
}

local renkon_m100bit2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 2, value = 0},
}

local renkon_m100bit1_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 1, value = 0},
}


local renkon_m100_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00},
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00},
}

local renkon_m100bit3 = {
	kind1 = knd_renkon,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 3, value = 0},
}

local renkon_m100bit2_m100 = {
	kind1 = knd_renkon,
	kind2 = 0,
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 2, value = 0},
}

local renkon_m100bit1_m100x2 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00},
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 1, value = 0},
}

local renkon_m100_m100x3 = {
	kind1 = knd_renkon,
	kind2 = 0,
	size = {rank = 0xB, bit = 0, value = 0x0B00},
	weight = {rank = 0xB, bit = 0, value = 0x0B00},
	pattern = {rank = 0xB, bit = 0, value = 0x0B00},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00},
}

local renkon_m100_m100 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	pattern = {rank = 0xB, bit = 0, value = 0x0B00},
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00},
}




-- ninjin
local ninjin_any = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0, bit = 0, value = 0},
}

local ninjin_m100 = {
	kind1 = knd_ninjin,
	kind2 = 0,
	nutrition = {rank = 0xB, bit = 0, value = 0x0B00},
}


target_vegee_1115 = {
-- renkon_m100_m100x2
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_m100     , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
}


-- year1 1/24
target_vegee_1124 = {
-- renkon_m100_m100x2
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_m100     , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = renkon_any_m100x2     , second = shimaimo_plain, hybrid = renkon_m100_m100x2    , retry = 0, done = 0},

-- renkon_m100_m100x2
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100bit2       , retry = 0, done = 0},
	{first = renkon_m100bit2       , second = shimaimo_m100 , hybrid = renkon_m100bit1_m100  , retry = 0, done = 0},
	{first = renkon_m100bit1_m100  , second = kabu_m100     , hybrid = renkon_m100_m100x2    , retry = 0, done = 0},

-- renkon_m100_m100x2
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_m100     , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100bit1       , retry = 0, done = 0},
	{first = renkon_m100bit1       , second = renkon_any_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},

-- renkon_m100_m100x2
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_m100     , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = renkon_m100           , second = renkon_any_m100x2, hybrid = renkon_m100_m100x2 , retry = 0, done = 0},







-- renkon_m100_m100x3
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_any            , retry = 0, done = 0},
	{first = ninjin_any            , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100bit3       , retry = 0, done = 0},
	{first = renkon_m100bit3       , second = shimaimo_m100 , hybrid = renkon_m100bit2_m100  , retry = 0, done = 0},
	{first = renkon_m100bit2_m100  , second = kabu_m100     , hybrid = renkon_m100bit1_m100x2, retry = 0, done = 0},
	{first = renkon_m100bit1_m100x2, second = ninjin_m100   , hybrid = renkon_m100_m100x3    , retry = 0, done = 0},


-- renkon_m100_m100x3
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_any            , retry = 0, done = 0},
	{first = ninjin_any            , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = renkon_m100   , hybrid = renkon_m100_m100      , retry = 0, done = 0},
	{first = renkon_m100_m100      , second = shimaimo_m100 , hybrid = shimaimo_m100_m100x2  , retry = 0, done = 0},
	{first = shimaimo_m100_m100x2  , second = kabu_m100     , hybrid = renkon_m100_m100x3  , retry = 0, done = 0},


-- renkon_m100_m100x3
	{first = shimaimo_plain        , second = shimaimo_plain, hybrid = shimaimo_m100         , retry = 0, done = 0},
	{first = kabu_plain            , second = kabu_plain    , hybrid = kabu_m100             , retry = 0, done = 0},
	{first = shimaimo_m100         , second = kabu_m100     , hybrid = renkon_any_m100x2     , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = renkon_m100           , retry = 0, done = 0},
	{first = shimaimo_plain        , second = kabu_plain    , hybrid = renkon_any            , retry = 0, done = 0},
	{first = renkon_any            , second = shimaimo_plain, hybrid = ninjin_any            , retry = 0, done = 0},
	{first = ninjin_any            , second = shimaimo_plain, hybrid = ninjin_m100           , retry = 0, done = 0},
	{first = ninjin_m100           , second = renkon_m100   , hybrid = renkon_m100_m100      , retry = 0, done = 0},
	{first = renkon_m100_m100      , second = renkon_any_m100x2, hybrid = renkon_m100_m100x3 , retry = 0, done = 0},



}

