-- Fire Emblem 4 seisen no keifu
-- show character status and rng
-- show love status and clear turn at the begining

------------------------------------------------------------
-- job class
------------------------------------------------------------
local st_max_job_tbl = {
	{job=0x2c, mhp=80, str=20, mgc=15, skl=20, spd=20, luk=30, def=20, mdf=15}, -- ジュニアロード
	{job=0x06, mhp=80, str=25, mgc=15, skl=22, spd=22, luk=30, def=22, mdf=18}, -- ロードナイト
	{job=0x00, mhp=80, str=22, mgc=15, skl=21, spd=21, luk=30, def=21, mdf=15}, -- ソシアルナイト
	{job=0x09, mhp=80, str=24, mgc=20, skl=24, spd=24, luk=30, def=24, mdf=20}, -- パラディン
	{job=0x25, mhp=80, str=24, mgc=15, skl=20, spd=18, luk=30, def=25, mdf=15}, -- ソードアーマー
	{job=0x1a, mhp=80, str=25, mgc=15, skl=21, spd=20, luk=30, def=27, mdf=18}, -- ジェネラル
	{job=0x34, mhp=80, str=15, mgc=22, skl=21, spd=21, luk=30, def=16, mdf=20}, -- マージ
	{job=0x0d, mhp=80, str=20, mgc=25, skl=22, spd=22, luk=30, def=20, mdf=22}, -- マージナイト
	{job=0x03, mhp=80, str=22, mgc=15, skl=21, spd=21, luk=30, def=21, mdf=15}, -- アクスナイト
	{job=0x0e, mhp=80, str=27, mgc=15, skl=22, spd=22, luk=30, def=25, mdf=18}, -- グレートナイト
	{job=0x01, mhp=80, str=22, mgc=15, skl=21, spd=21, luk=30, def=21, mdf=15}, -- ランスナイト
	{job=0x07, mhp=80, str=27, mgc=15, skl=22, spd=22, luk=30, def=23, mdf=18}, -- デュークナイト
	{job=0x05, mhp=80, str=18, mgc=18, skl=21, spd=21, luk=30, def=18, mdf=18}, -- トルバドール
	{job=0x0a, mhp=80, str=24, mgc=20, skl=24, spd=24, luk=30, def=24, mdf=20}, -- パラディン
	{job=0x02, mhp=80, str=22, mgc=15, skl=21, spd=21, luk=30, def=21, mdf=15}, -- アーチナイト
	{job=0x0b, mhp=80, str=25, mgc=15, skl=23, spd=23, luk=30, def=23, mdf=18}, -- ボウナイト
	{job=0x16, mhp=80, str=22, mgc=15, skl=25, spd=25, luk=30, def=20, mdf=15}, -- ソードファイター
	{job=0x17, mhp=80, str=27, mgc=15, skl=30, spd=30, luk=30, def=22, mdf=18}, -- ソードマスター
	{job=0x19, mhp=80, str=27, mgc=18, skl=27, spd=27, luk=30, def=22, mdf=18}, -- フォーレスト
	{job=0x33, mhp=80, str=15, mgc=22, skl=21, spd=21, luk=30, def=16, mdf=22}, -- プリースト
	{job=0x38, mhp=80, str=15, mgc=27, skl=24, spd=23, luk=30, def=18, mdf=23}, -- ハイプリースト
	{job=0x3f, mhp=80, str=18, mgc=15, skl=18, spd=22, luk=30, def=16, mdf=15}, -- シーフ
	{job=0x40, mhp=80, str=22, mgc=18, skl=22, spd=27, luk=30, def=20, mdf=18}, -- シーフファイター
	{job=0x15, mhp=80, str=22, mgc=15, skl=25, spd=25, luk=30, def=20, mdf=15}, -- ボウファイター
	{job=0x18, mhp=80, str=27, mgc=15, skl=27, spd=27, luk=30, def=22, mdf=18}, -- スナイパー
	{job=0x3c, mhp=80, str=15, mgc=23, skl=22, spd=22, luk=30, def=18, mdf=25}, -- シャーマン
	{job=0x2e, mhp=80, str=23, mgc=18, skl=22, spd=21, luk=30, def=22, mdf=18}, -- プリンス
	{job=0x2f, mhp=80, str=20, mgc=22, skl=20, spd=23, luk=30, def=20, mdf=22}, -- プリンセス
	{job=0x08, mhp=80, str=27, mgc=22, skl=27, spd=27, luk=30, def=27, mdf=22}, -- マスターナイト
	{job=0x04, mhp=80, str=22, mgc=15, skl=21, spd=21, luk=30, def=21, mdf=15}, -- フリーナイト
	{job=0x0c, mhp=80, str=23, mgc=15, skl=30, spd=27, luk=30, def=23, mdf=18}, -- フォレストナイト
	{job=0x3b, mhp=80, str=15, mgc=22, skl=22, spd=25, luk=30, def=18, mdf=22}, -- バード
	{job=0x3a, mhp=80, str=15, mgc=30, skl=27, spd=30, luk=30, def=18, mdf=27}, -- セイジ
	{job=0x32, mhp=80, str=18, mgc=15, skl=16, spd=22, luk=30, def=16, mdf=18}, -- ダンサー
	{job=0x10, mhp=80, str=22, mgc=15, skl=22, spd=27, luk=30, def=20, mdf=22}, -- ペガサスナイト
	{job=0x11, mhp=80, str=22, mgc=22, skl=25, spd=30, luk=30, def=21, mdf=27}, -- ファルコンナイト
	{job=0x36, mhp=80, str=15, mgc=22, skl=24, spd=21, luk=30, def=16, mdf=20}, -- サンダーマージ
	{job=0x30, mhp=80, str=18, mgc=27, skl=24, spd=27, luk=30, def=20, mdf=25}, -- マージファイター
	{job=0x13, mhp=80, str=25, mgc=15, skl=22, spd=21, luk=30, def=26, mdf=15}, -- ドラゴンナイト
	{job=0x14, mhp=80, str=27, mgc=15, skl=24, spd=22, luk=30, def=29, mdf=15}, -- ドラゴンマスター
	{job=0x27, mhp=80, str=23, mgc=15, skl=18, spd=25, luk=30, def=23, mdf=15}, -- アクスファイター
	{job=0x29, mhp=80, str=26, mgc=15, skl=20, spd=27, luk=30, def=25, mdf=18} -- ウォーリア
}


local st_add_job_tbl = {
	{job=0x2c, mhp=0, str= 5, mgc= 0, skl= 5, spd= 5, luk=0, def= 5, mdf= 0}, -- ジュニアロード
	{job=0x06, mhp=0, str=10, mgc= 0, skl= 7, spd= 7, luk=0, def= 7, mdf= 3}, -- ロードナイト
	{job=0x00, mhp=0, str= 7, mgc= 0, skl= 6, spd= 6, luk=0, def= 6, mdf= 0}, -- ソシアルナイト
	{job=0x09, mhp=0, str= 9, mgc= 5, skl= 9, spd= 9, luk=0, def= 9, mdf= 5}, -- パラディン
	{job=0x25, mhp=0, str= 9, mgc= 0, skl= 5, spd= 3, luk=0, def=10, mdf= 0}, -- ソードアーマー
	{job=0x1a, mhp=0, str=10, mgc= 0, skl= 6, spd= 5, luk=0, def=12, mdf= 3}, -- ジェネラル
	{job=0x34, mhp=0, str= 0, mgc= 7, skl= 6, spd= 6, luk=0, def= 1, mdf= 5}, -- マージ
	{job=0x0d, mhp=0, str= 5, mgc=10, skl= 7, spd= 7, luk=0, def= 5, mdf= 7}, -- マージナイト
	{job=0x03, mhp=0, str= 7, mgc= 0, skl= 6, spd= 6, luk=0, def= 6, mdf= 0}, -- アクスナイト
	{job=0x0e, mhp=0, str=12, mgc= 0, skl= 7, spd= 7, luk=0, def=10, mdf= 3}, -- グレートナイト
	{job=0x01, mhp=0, str= 7, mgc= 0, skl= 6, spd= 6, luk=0, def= 6, mdf= 0}, -- ランスナイト
	{job=0x07, mhp=0, str=12, mgc= 0, skl= 7, spd= 7, luk=0, def= 8, mdf= 3}, -- デュークナイト
	{job=0x05, mhp=0, str= 3, mgc= 3, skl= 6, spd= 6, luk=0, def= 3, mdf= 3}, -- トルバドール
	{job=0x0a, mhp=0, str= 9, mgc= 5, skl= 9, spd= 9, luk=0, def= 9, mdf= 5}, -- パラディン
	{job=0x02, mhp=0, str= 7, mgc= 0, skl= 6, spd= 6, luk=0, def= 6, mdf= 0}, -- アーチナイト
	{job=0x0b, mhp=0, str=10, mgc= 0, skl= 8, spd= 8, luk=0, def= 8, mdf= 3}, -- ボウナイト
	{job=0x16, mhp=0, str= 7, mgc= 0, skl=10, spd=10, luk=0, def= 5, mdf= 0}, -- ソードファイター
	{job=0x17, mhp=0, str=12, mgc= 0, skl=15, spd=15, luk=0, def= 7, mdf= 3}, -- ソードマスター
	{job=0x19, mhp=0, str=12, mgc= 3, skl=12, spd=12, luk=0, def= 7, mdf= 3}, -- フォーレスト
	{job=0x33, mhp=0, str= 0, mgc= 7, skl= 6, spd= 6, luk=0, def= 1, mdf= 7}, -- プリースト
	{job=0x38, mhp=0, str= 0, mgc=12, skl= 9, spd= 8, luk=0, def= 3, mdf= 8}, -- ハイプリースト
	{job=0x3f, mhp=0, str= 3, mgc= 0, skl= 3, spd= 7, luk=0, def= 1, mdf= 0}, -- シーフ
	{job=0x40, mhp=0, str= 7, mgc= 3, skl= 7, spd=12, luk=0, def= 5, mdf= 3}, -- シーフファイター
	{job=0x15, mhp=0, str= 7, mgc= 0, skl=10, spd=10, luk=0, def= 5, mdf= 0}, -- ボウファイター
	{job=0x18, mhp=0, str=12, mgc= 0, skl=12, spd=12, luk=0, def= 7, mdf= 3}, -- スナイパー
	{job=0x3c, mhp=0, str= 0, mgc= 8, skl= 7, spd= 7, luk=0, def= 3, mdf=10}, -- シャーマン
	{job=0x2e, mhp=0, str= 8, mgc= 3, skl= 7, spd= 6, luk=0, def= 7, mdf= 3}, -- プリンス
	{job=0x2f, mhp=0, str= 5, mgc= 7, skl= 5, spd= 8, luk=0, def= 5, mdf= 7}, -- プリンセス
	{job=0x08, mhp=0, str=12, mgc= 7, skl=12, spd=12, luk=0, def=12, mdf= 7}, -- マスターナイト
	{job=0x04, mhp=0, str= 7, mgc= 0, skl= 6, spd= 6, luk=0, def= 6, mdf= 0}, -- フリーナイト
	{job=0x0c, mhp=0, str= 8, mgc= 0, skl=15, spd=12, luk=0, def= 8, mdf= 3}, -- フォレストナイト
	{job=0x3b, mhp=0, str= 0, mgc= 7, skl= 7, spd=10, luk=0, def= 3, mdf= 7}, -- バード
	{job=0x3a, mhp=0, str= 0, mgc=15, skl=12, spd=15, luk=0, def= 3, mdf=12}, -- セイジ
	{job=0x32, mhp=0, str= 3, mgc= 0, skl= 1, spd= 7, luk=0, def= 1, mdf= 3}, -- ダンサー
	{job=0x10, mhp=0, str= 7, mgc= 0, skl= 7, spd=12, luk=0, def= 5, mdf= 7}, -- ペガサスナイト
	{job=0x11, mhp=0, str= 7, mgc= 7, skl=10, spd=15, luk=0, def= 6, mdf=12}, -- ファルコンナイト
	{job=0x36, mhp=0, str= 0, mgc= 7, skl= 9, spd= 6, luk=0, def= 1, mdf= 5}, -- サンダーマージ
	{job=0x30, mhp=0, str= 3, mgc=12, skl= 9, spd=12, luk=0, def= 5, mdf=10}, -- マージファイター
	{job=0x13, mhp=0, str=10, mgc= 0, skl= 7, spd= 6, luk=0, def=11, mdf= 0}, -- ドラゴンナイト
	{job=0x14, mhp=0, str=12, mgc= 0, skl= 9, spd= 7, luk=0, def=14, mdf= 0}, -- ドラゴンマスター
	{job=0x27, mhp=0, str= 8, mgc= 0, skl= 3, spd=10, luk=0, def= 8, mdf= 0}, -- アクスファイター
	{job=0x29, mhp=0, str=11, mgc= 0, skl= 5, spd=12, luk=0, def=10, mdf= 3} -- ウォーリア
}


------------------------------------------------------------
-- 親世代
------------------------------------------------------------
--[[
local st_max_sigurd   = {job1=0x06, job2=0x06}
local st_max_noish    = {job1=0x00, job2=0x09}
local st_max_alec     = {job1=0x00, job2=0x09}
local st_max_ardan    = {job1=0x25, job2=0x1a}
local st_max_azel     = {job1=0x34, job2=0x0d}
local st_max_rex      = {job1=0x03, job2=0x0e}
local st_max_cuan     = {job1=0x07, job2=0x07}
local st_max_fin      = {job1=0x01, job2=0x07}
local st_max_esslin   = {job1=0x05, job2=0x0a}
local st_max_midir    = {job1=0x02, job2=0x0b}
local st_max_aira     = {job1=0x16, job2=0x17}
local st_max_aideen   = {job1=0x33, job2=0x38}
local st_max_dewe     = {job1=0x3f, job2=0x40}
local st_max_jamuqa   = {job1=0x15, job2=0x18}
local st_max_deirdre  = {job1=0x3c, job2=0x3c}
local st_max_lachesis = {job1=0x2f, job2=0x08}
local st_max_holin    = {job1=0x16, job2=0x19}
local st_max_beowulf  = {job1=0x04, job2=0x0c}
local st_max_levin    = {job1=0x3b, job2=0x3a}
local st_max_silvia   = {job1=0x32, job2=0x32}
local st_max_fury     = {job1=0x10, job2=0x11}
local st_max_brigid   = {job1=0x18, job2=0x18}
local st_max_tiltue   = {job1=0x36, job2=0x30}
local st_max_claude   = {job1=0x38, job2=0x38}
--]]

local st_care_sigurd   = "spd"
local st_care_noish    = "skl"
local st_care_alec     = "mhp, str"
local st_care_ardan    = "skl, spd"
local st_care_azel     = "mhp, luk"
local st_care_rex      = "skl"
local st_care_cuan     = "skl, spd"
local st_care_fin      = "mhp, mdf"
local st_care_esslin   = "mhp, str, def"
local st_care_midir    = "mhp, str, skl"
local st_care_aira     = "mhp, spd, def"
local st_care_aideen   = "mhp, def"
local st_care_dewe     = "mhp, str, def"
local st_care_jamuqa   = "skl"
local st_care_deirdre  = ""
local st_care_lachesis = "mhp, skl, spd, def"
local st_care_holin    = "str, spd, def"
local st_care_beowulf  = "skl, spd"
local st_care_levin    = "mhp, mgc, def"
local st_care_silvia   = "mhp, luk"
local st_care_fury     = "mhp, str, def"
local st_care_brigid   = "mhp, str, spd, luk"
local st_care_tiltue   = "mhp, def"
local st_care_claude   = ""


local a_off_sigurd   = 0x007E2D31
local a_off_noish    = a_off_sigurd - (0x00000024 * 1)
local a_off_alec     = a_off_sigurd - (0x00000024 * 2)
local a_off_ardan    = a_off_sigurd - (0x00000024 * 3)
local a_off_azel     = a_off_sigurd - (0x00000024 * 4)
local a_off_rex      = a_off_sigurd - (0x00000024 * 5)
local a_off_cuan     = a_off_sigurd - (0x00000024 * 6)
local a_off_fin      = a_off_sigurd - (0x00000024 * 7)
local a_off_esslin   = a_off_sigurd - (0x00000024 * 8)
local a_off_midir    = a_off_sigurd - (0x00000024 * 9)
local a_off_aira     = a_off_sigurd - (0x00000024 * 10)
local a_off_aideen   = a_off_sigurd - (0x00000024 * 11)
local a_off_dewe     = a_off_sigurd - (0x00000024 * 12)
local a_off_jamuqa   = a_off_sigurd - (0x00000024 * 13)
local a_off_deirdre  = a_off_sigurd - (0x00000024 * 14)
local a_off_lachesis = a_off_sigurd - (0x00000024 * 15)
local a_off_holin    = a_off_sigurd - (0x00000024 * 16)
local a_off_beowulf  = a_off_sigurd - (0x00000024 * 17)
local a_off_levin    = a_off_sigurd - (0x00000024 * 18)
local a_off_silvia   = a_off_sigurd - (0x00000024 * 19)
local a_off_fury     = a_off_sigurd - (0x00000024 * 20)
local a_off_brigid   = a_off_sigurd - (0x00000024 * 21)
local a_off_tiltue   = a_off_sigurd - (0x00000024 * 22)
local a_off_claude   = a_off_sigurd - (0x00000024 * 23)

print("a_off_alec is must be 0x007E2CE9 --> ".. string.format("%x", a_off_alec))

local ch_tbl1 = {}
ch_tbl1["sigurd"]   = { name = "sigurd"  , offset = a_off_sigurd  , care = st_care_sigurd   };
ch_tbl1["noish"]    = { name = "noish"   , offset = a_off_noish   , care = st_care_noish    };
ch_tbl1["alec"]     = { name = "alec"    , offset = a_off_alec    , care = st_care_alec     };
ch_tbl1["ardan"]    = { name = "ardan"   , offset = a_off_ardan   , care = st_care_ardan    };
ch_tbl1["azel"]     = { name = "azel"    , offset = a_off_azel    , care = st_care_azel     };
ch_tbl1["rex"]      = { name = "rex"     , offset = a_off_rex     , care = st_care_rex      };
ch_tbl1["cuan"]     = { name = "cuan"    , offset = a_off_cuan    , care = st_care_cuan     };
ch_tbl1["fin"]      = { name = "fin"     , offset = a_off_fin     , care = st_care_fin      };
ch_tbl1["esslin"]   = { name = "esslin"  , offset = a_off_esslin  , care = st_care_esslin   };
ch_tbl1["midir"]    = { name = "midir"   , offset = a_off_midir   , care = st_care_midir    };
ch_tbl1["aira"]     = { name = "aira"    , offset = a_off_aira    , care = st_care_aira     };
ch_tbl1["aideen"]   = { name = "aideen"  , offset = a_off_aideen  , care = st_care_aideen   };
ch_tbl1["dewe"]     = { name = "dewe"    , offset = a_off_dewe    , care = st_care_dewe     };
ch_tbl1["jamuqa"]   = { name = "jamuqa"  , offset = a_off_jamuqa  , care = st_care_jamuqa   };
ch_tbl1["deirdre"]  = { name = "deirdre" , offset = a_off_deirdre , care = st_care_deirdre  };
ch_tbl1["lachesis"] = { name = "lachesis", offset = a_off_lachesis, care = st_care_lachesis };
ch_tbl1["holin"]    = { name = "holin"   , offset = a_off_holin   , care = st_care_holin    };
ch_tbl1["beowulf"]  = { name = "beowulf" , offset = a_off_beowulf , care = st_care_beowulf  };
ch_tbl1["levin"]    = { name = "levin"   , offset = a_off_levin   , care = st_care_levin    };
ch_tbl1["silvia"]   = { name = "silvia"  , offset = a_off_silvia  , care = st_care_silvia   };
ch_tbl1["fury"]     = { name = "fury"    , offset = a_off_fury    , care = st_care_fury     };
ch_tbl1["brigid"]   = { name = "brigid"  , offset = a_off_brigid  , care = st_care_brigid   };
ch_tbl1["tiltue"]   = { name = "tiltue"  , offset = a_off_tiltue  , care = st_care_tiltue   };
ch_tbl1["claude"]   = { name = "claude"  , offset = a_off_claude  , care = st_care_claude   };

-- 恋愛値 (word)
local a_love_tiltue = 0x007E3BE5

local love_woman_tbl1 = {
	{ name = "tiltue"   , offset = a_love_tiltue },
	{ name = "brigid"   , offset = a_love_tiltue + (0x00000024 * 1) },
	{ name = "fury"     , offset = a_love_tiltue + (0x00000024 * 2) },
	{ name = "silvia"   , offset = a_love_tiltue + (0x00000024 * 3) },
	{ name = "lachesis" , offset = a_love_tiltue + (0x00000024 * 4) },
	{ name = "deirdre"  , offset = a_love_tiltue + (0x00000024 * 5) },
	{ name = "aideen"   , offset = a_love_tiltue + (0x00000024 * 6) },
	{ name = "aira"     , offset = a_love_tiltue + (0x00000024 * 7) },
	{ name = "esslin"   , offset = a_love_tiltue + (0x00000024 * 8) }
}

local love_man_tbl1 = {
	{ name = "sigurd"   , offset = 0x0000      },
	{ name = "noish"    , offset = 0x0002 * 1  },
	{ name = "alec"     , offset = 0x0002 * 2  },
	{ name = "ardan"    , offset = 0x0002 * 3  },
	{ name = "fin"      , offset = 0x0002 * 4  },
	{ name = "cuan"     , offset = 0x0002 * 5  },
	{ name = "midir"    , offset = 0x0002 * 6  },
	{ name = "levin"    , offset = 0x0002 * 7  },
	{ name = "holin"    , offset = 0x0002 * 8  },
	{ name = "azel"     , offset = 0x0002 * 9  },
	{ name = "jamuqa"   , offset = 0x0002 * 10 },
	{ name = "claude"   , offset = 0x0002 * 11 },
	{ name = "beowulf"  , offset = 0x0002 * 12 },
	{ name = "rex"      , offset = 0x0002 * 13 },
	{ name = "dewe"     , offset = 0x0002 * 14 }
}


------------------------------------------------------------
-- 子世代
------------------------------------------------------------
local st_care_celis    = "mhp2, spd, mdf"
local st_care_leaf     = "mhp2, mgc, spd, mdf"
local st_care_altena   = "mhp2"
local st_care_fabal    = "mhp2"
local st_care_patty    = "mgc"
local st_care_lester   = "str, skl, def"
local st_care_lana     = "mgc, def"
local st_care_corpul   = "mhp2, mgc, mdf"
local st_care_lean     = "luk, mdf"
local st_care_arthur   = "def, mdf"
local st_care_tinie    = "mgc, mdf"
local st_care_sety     = "mgc, def, mdf"
local st_care_fee      = "str, mgc, skl, def"
local st_care_scasaha  = "mhp2, spd"
local st_care_lachche  = "mhp2, spd, def"
local st_care_delmud   = "mhp2, spd, def"
local st_care_nanna    = "mgc, skl, spd, def"
local st_care_fin      = "spd, def"
local st_care_johalva  = "skl, spd"
local st_care_oiphe    = "spd, def"
local st_care_julia    = "skl, spd, luk"
local st_care_shanan   = "mhp2, str, spd, def"
local st_care_ares     = "skl, spd, mdf"
local st_care_hannibal = "mhp, def"


local a_off_celis    = 0x007E30FD
local a_off_leaf     = a_off_celis - (0x0000003a * 1)
local a_off_altena   = a_off_celis - (0x0000003a * 2)
local a_off_fabal    = a_off_celis - (0x0000003a * 3)
local a_off_patty    = a_off_celis - (0x0000003a * 4)
local a_off_lester   = a_off_celis - (0x0000003a * 5)
local a_off_lana     = a_off_celis - (0x0000003a * 6)
local a_off_corpul   = a_off_celis - (0x0000003a * 7)
local a_off_lean     = a_off_celis - (0x0000003a * 8)
local a_off_arthur   = a_off_celis - (0x0000003a * 9)
local a_off_tinie    = a_off_celis - (0x0000003a * 10)
local a_off_sety     = a_off_celis - (0x0000003a * 11)
local a_off_fee      = a_off_celis - (0x0000003a * 12)
local a_off_scasaha  = a_off_celis - (0x0000003a * 13)
local a_off_lachche  = a_off_celis - (0x0000003a * 14)
local a_off_delmud   = a_off_celis - (0x0000003a * 15)
local a_off_nanna    = a_off_celis - (0x0000003a * 16)
local a_off_fin      = 0x007E2D31
--local a_off_johan    = a_off_fin - (0x00000024 * 1)
local a_off_johalva  = a_off_fin - (0x00000024 * 1)
local a_off_oiphe    = a_off_fin - (0x00000024 * 2)
local a_off_julia    = a_off_fin - (0x00000024 * 3)
local a_off_shanan   = a_off_fin - (0x00000024 * 4)
local a_off_ares     = a_off_fin - (0x00000024 * 5)
local a_off_hannibal = a_off_fin - (0x00000024 * 6)


local ch_tbl2 = {}
ch_tbl2["celis"]    = { name = "celis"   , offset = a_off_celis   , care = st_care_celis    };
ch_tbl2["leaf"]     = { name = "leaf"    , offset = a_off_leaf    , care = st_care_leaf     };
ch_tbl2["altena"]   = { name = "altena"  , offset = a_off_altena  , care = st_care_altena   };
ch_tbl2["fabal"]    = { name = "fabal"   , offset = a_off_fabal   , care = st_care_fabal    };
ch_tbl2["patty"]    = { name = "patty"   , offset = a_off_patty   , care = st_care_patty    };
ch_tbl2["lester"]   = { name = "lester"  , offset = a_off_lester  , care = st_care_lester   };
ch_tbl2["lana"]     = { name = "lana"    , offset = a_off_lana    , care = st_care_lana     };
ch_tbl2["corpul"]   = { name = "corpul"  , offset = a_off_corpul  , care = st_care_corpul   };
ch_tbl2["lean"]     = { name = "lean"    , offset = a_off_lean    , care = st_care_lean     };
ch_tbl2["arthur"]   = { name = "arthur"  , offset = a_off_arthur  , care = st_care_arthur   };
ch_tbl2["tinie"]    = { name = "tinie"   , offset = a_off_tinie   , care = st_care_tinie    };
ch_tbl2["sety"]     = { name = "sety"    , offset = a_off_sety    , care = st_care_sety     };
ch_tbl2["fee"]      = { name = "fee"     , offset = a_off_fee     , care = st_care_fee      };
ch_tbl2["scasaha"]  = { name = "scasaha" , offset = a_off_scasaha , care = st_care_scasaha  };
ch_tbl2["lachche"]  = { name = "lachche" , offset = a_off_lachche , care = st_care_lachche  };
ch_tbl2["delmud"]   = { name = "delmud"  , offset = a_off_delmud  , care = st_care_delmud   };
ch_tbl2["nanna"]    = { name = "nanna"   , offset = a_off_nanna   , care = st_care_nanna    };
ch_tbl2["fin"]      = { name = "fin"     , offset = a_off_fin     , care = st_care_fin      };
ch_tbl2["johalva"]  = { name = "johalva" , offset = a_off_johalva , care = st_care_johalva  };
ch_tbl2["oiphe"]    = { name = "oiphe"   , offset = a_off_oiphe   , care = st_care_oiphe    };
ch_tbl2["julia"]    = { name = "julia"   , offset = a_off_julia   , care = st_care_julia    };
ch_tbl2["shanan"]   = { name = "shanan"  , offset = a_off_shanan  , care = st_care_shanan   };
ch_tbl2["ares"]     = { name = "ares"    , offset = a_off_ares    , care = st_care_ares     };
ch_tbl2["hannibal"] = { name = "hannibal", offset = a_off_hannibal, care = st_care_hannibal };


-- 恋愛値 (word)
local a_love_julia = 0x007E3BE5

local love_woman_tbl2 = {
	{ name = "julia"    , offset = a_love_julia },
	{ name = "nanna"    , offset = a_love_julia + (0x00000024 * 1) },
	{ name = "lachche"  , offset = a_love_julia + (0x00000024 * 2) },
	{ name = "fee"      , offset = a_love_julia + (0x00000024 * 3) },
	{ name = "tinie"    , offset = a_love_julia + (0x00000024 * 4) },
	{ name = "lean"     , offset = a_love_julia + (0x00000024 * 5) },
	{ name = "lana"     , offset = a_love_julia + (0x00000024 * 6) },
	{ name = "patty"    , offset = a_love_julia + (0x00000024 * 7) },
	{ name = "altena"   , offset = a_love_julia + (0x00000024 * 8) }
}

local love_man_tbl2 = {
	{ name = "celis"    , offset = 0x0000      },
	{ name = "shanan"   , offset = 0x0002 * 1  },
	{ name = "scasaha"  , offset = 0x0002 * 2  },
	{ name = "fabal"    , offset = 0x0002 * 3  },
	{ name = "leaf"     , offset = 0x0002 * 4  },
	{ name = "johalva"  , offset = 0x0002 * 5  },
	{ name = "corpul"   , offset = 0x0002 * 6  },
	{ name = "sety"     , offset = 0x0002 * 7  },
	{ name = "delmud"   , offset = 0x0002 * 8  },
	{ name = "fin"      , offset = 0x0002 * 9  },
	{ name = "lester"   , offset = 0x0002 * 10 },
	{ name = "hannibal" , offset = 0x0002 * 11 },
	{ name = "ares"     , offset = 0x0002 * 12 },
	{ name = "arthur"   , offset = 0x0002 * 13 },
	{ name = "oiphe"    , offset = 0x0002 * 14 }
}


------------------------------------------------------------
-- 親世代、子世代、切り替え
------------------------------------------------------------
local ch_tbl = ch_tbl1
local love_woman_tbl = love_woman_tbl1
local love_man_tbl = love_man_tbl1

--local ch_tbl = ch_tbl2
--local love_woman_tbl = love_woman_tbl2
--local love_man_tbl = love_man_tbl2



------------------------------------------------------------
-- status
------------------------------------------------------------

--local st_desc = "%s:: lv     hp   mhp    "..
--			"str    mgc    skl    spd    luk    def    mdf    gld     tlv   "
local st_desc = "%s:: lv  hp  mhp str mgc skl spd luk def mdf gld   tlv"

Chara = {}
-- @deprecated
function Chara.new(name, offset)
	local ch = {}
	ch.name = name
	ch.offset = offset
	ch.toString = function(self) return "name = "..self.name..", offset = "..self.offset end
	return ch
end

function Chara.readStatus(ch)
	-- print(ch.toString)
	-- print("ch.name   = "..ch.name)
	-- print("ch.offset = "..ch.offset)

	local a_tlv = ch.offset
	local a_lov = ch.offset + 0x00000003  -- 恋人
	local a_blg = ch.offset + 0x00000005  -- 所属(自軍or同盟or中立or敵軍)
	local a_brc = ch.offset + 0x0000000A  -- うでわ装備
	local a_wpn = ch.offset + 0x0000000B  -- 伝説の武器装備
	local a_bad = ch.offset + 0x0000000C  -- 状態(正常orサイレスorバサーク)
	local a_hp  = ch.offset + 0x0000000D
	local a_mhp = ch.offset + 0x0000000F
	local a_str = ch.offset + 0x00000010
	local a_mgc = ch.offset + 0x00000011
	local a_skl = ch.offset + 0x00000012
	local a_spd = ch.offset + 0x00000013
	local a_def = ch.offset + 0x00000014
	local a_mdf = ch.offset + 0x00000015
	local a_luk = ch.offset + 0x00000016
	local a_job = ch.offset + 0x00000017
	local a_lv  = ch.offset + 0x00000018
	local a_cmd = ch.offset + 0x00000019  -- ☆指揮官レベル
	local a_gd1 = ch.offset + 0x0000001A
	local a_gd2 = ch.offset + 0x0000001B
	local a_ex  = ch.offset + 0x0000001C
	local a_cnv = ch.offset + 0x0000001D  -- 会話

	-- Read the status
	local add = {}
	local st = {}
	st.name = ch.name
	st.job = memory.readbyte(a_job)

	for key, value in pairs(st_add_job_tbl) do
		if value.job == st.job then
			--print(string.format("%s:: job=%x", st.name, st.job))
			add = value
			break
		end
	end

	st.tlv = memory.readbyte(a_tlv) + 1
	st.hp  = memory.readbyte(a_hp)
	st.mhp = memory.readbyte(a_mhp)
	st.str = memory.readbyte(a_str) + add.str
	st.mgc = memory.readbyte(a_mgc) + add.mgc
	st.skl = memory.readbyte(a_skl) + add.skl
	st.spd = memory.readbyte(a_spd) + add.spd
	st.def = memory.readbyte(a_def) + add.def
	st.mdf = memory.readbyte(a_mdf) + add.mdf
	st.luk = memory.readbyte(a_luk)
	st.lv  = memory.readbyte(a_lv)
	--st.gd1 = memory.readbyte(a_gd1)
	--st.gd2 = memory.readbyte(a_gd2) * 2^8
	--st.gld = st.gd1 + st.gd2
	st.gld = memory.readword(a_gd1)
	st.ex  = memory.readbyte(a_ex)

	st.info = string.format("%s:: %3d %3d %3d %3d %3d %3d %3d %3d %3d %3d %5d %3d",
			st.name, st.lv, st.hp, st.mhp,
			st.str, st.mgc, st.skl, st.spd, st.luk, st.def, st.mdf, st.gld, st.tlv)

	st.info2 = string.format("%s:: lv=%d hp=%d mhp=%d "..
			"str=%d mgc=%d skl=%d spd=%d luk=%d def=%d mdf=%d gld=%d tlv=%d",
			st.name, st.lv, st.hp, st.mhp,
			st.str, st.mgc, st.skl, st.spd, st.luk, st.def, st.mdf, st.gld, st.tlv)

	st.toString = function(self) return self.info end
	return st
end

function Chara.printStatus(st)
	print(string.format(st_desc, st.name))
	print(st.info)
end


function Chara.readLevel(ch)
	local lv
	local a_lv  = ch.offset + 0x00000018
	lv  = memory.readbyte(a_lv)
	return lv
end


function Chara.drawStatus(st, x, y)
	if st.name == nil then return end
	if x == nil then x = 0 end   -- same as x = x or 0
	if y == nil then y = 80 end  -- same as y = y or 80

	-- Render image
	gui.text(x, y, "")
	gui.text(x, y+10, "lv")
	gui.text(x, y+20, "hp")
	gui.text(x, y+30, "str")
	gui.text(x, y+40, "mgc")
	gui.text(x, y+50, "skl")
	gui.text(x, y+60, "spd")
	gui.text(x, y+70, "luk")
	gui.text(x, y+80, "def")
	gui.text(x, y+90, "mdf")
	gui.text(x, y+100, "gld")
	gui.text(x, y+110, "tlv")
	
	gui.text(x+14, y, st.name)
	gui.text(x+14, y+10, st.lv.."+"..st.ex)
	gui.text(x+14, y+20, st.hp.."/"..st.mhp)
	gui.text(x+14, y+30, st.str)
	gui.text(x+14, y+40, st.mgc)
	gui.text(x+14, y+50, st.skl)
	gui.text(x+14, y+60, st.spd)
	gui.text(x+14, y+70, st.luk)
	gui.text(x+14, y+80, st.def)
	gui.text(x+14, y+90, st.mdf)
	gui.text(x+14, y+100, st.gld)
	gui.text(x+14, y+110, st.tlv)
end

function Chara.drawStatusUp(st, old_st, x, y)
	if st.name == nil then return end
	if x == nil then x = 0 end   -- same as x = x or 0
	if y == nil then y = 80 end  -- same as y = y or 80

	-- Render image
	gui.text(x+36, y+10, st.lv  - old_st.lv)
	gui.text(x+36, y+20, st.mhp - old_st.mhp)
	gui.text(x+36, y+30, st.str - old_st.str)
	gui.text(x+36, y+40, st.mgc - old_st.mgc)
	gui.text(x+36, y+50, st.skl - old_st.skl)
	gui.text(x+36, y+60, st.spd - old_st.spd)
	gui.text(x+36, y+70, st.luk - old_st.luk)
	gui.text(x+36, y+80, st.def - old_st.def)
	gui.text(x+36, y+90, st.mdf - old_st.mdf)
	gui.text(x+36, y+100, st.gld - old_st.gld)
	gui.text(x+36, y+110, st.tlv - old_st.tlv)
end

function Chara.printStatusUp(st, old_st)
	--st_up   = string.format("%s::                 %4d    "..
	--		"%4d    %4d    %4d    %4d    %4d    %4d    %4d    %4d    %4d",
	st_up = string.format("%s::         %3d %3d %3d %3d %3d %3d %3d %3d %5d %3d",
			st.name,
			st.mhp - old_st.mhp,
			st.str - old_st.str,
			st.mgc - old_st.mgc,
			st.skl - old_st.skl,
			st.spd - old_st.spd,
			st.luk - old_st.luk,
			st.def - old_st.def,
			st.mdf - old_st.mdf,
			st.gld - old_st.gld,
			st.tlv - old_st.tlv)
	--print(old_st.info)
	print(st.info)
	print(string.format(st_desc, st.name))
	print(st_up)
	print()
	--print(string.format("%s::", st.name))
end

function Chara.printMaxStatus(st)
	if st.name == nil then return end
	local name
	local max = {}

	for key, value in pairs(st_max_job_tbl) do
		if value.job == st.job then
			--print(string.format("%s:: job=%x", st.name, st.job))
			name = st.name
			max = value
			break
		end
	end

	--local info = string.format("%s::                 %3d    "..
	--		"%3d    %3d    %3d    %3d    %3d    %3d    %3d",
	local info = string.format("%s::         %3d %3d %3d %3d %3d %3d %3d %3d",
			name, max.mhp,
			max.str, max.mgc, max.skl, max.spd, max.luk, max.def, max.mdf)
	print(string.format(st_desc, st.name))
	print(info)

	local info2 = string.format("%s::             mhp=%d "..
			"str=%d mgc=%d skl=%d spd=%d luk=%d def=%d mdf=%d",
			name, max.mhp,
			max.str, max.mgc, max.skl, max.spd, max.luk, max.def, max.mdf)
	--print(info2)
	return max
end


------------------------------------------------------------
-- ターン数 (word)
------------------------------------------------------------
local a_trn_ch0  = 0x7E0D93
local a_trn_ch1  = 0x7E0D95
local a_trn_ch2  = 0x7E0D97
local a_trn_ch3  = 0x7E0D99
local a_trn_ch4  = 0x7E0D9B
local a_trn_ch5  = 0x7E0D9D
local a_trn_ch6  = 0x7E0D9F
local a_trn_ch7  = 0x7E0DA1
local a_trn_ch8  = 0x7E0DA3
local a_trn_ch9  = 0x7E0DA5
local a_trn_ch10 = 0x7E0DA7
local a_trn_ch11 = 0x7E0DA9
local a_trn_crr  = 0x7E0D8F
local a_clear_cnt = 0x7E0CC2

function readTurnCount()
	local trn = {}
	local trn_offset = a_trn_ch0
	local trn_sum = 0

	for i=0, 11 do
		trn_offset = a_trn_ch0 + (0x02 * i)
		trn[i] = memory.readword(trn_offset)
		trn_sum = trn_sum + trn[i]
		print(string.format("ch%d = %d,  0x=%x", i, trn[i], trn[i]))
	end
	print(string.format("turn total = %d ", trn_sum))

	local trn_crr = memory.readword(a_trn_crr)
	print(string.format("turn crrnt = %d ", trn_crr))
	local clear_cnt = memory.readword(a_clear_cnt)
	print(string.format("clear count = %d ", clear_cnt))
	return trn
end

function printTurnCount(trn)
	if trn == nil then return end
	local trn_sum = 0

	for i=0, 11 do
		print(string.format("ch%d = %d ", i, trn[i]))
		trn_sum = trn_sum + trn[i]
	end
	print(string.format("turn total = %d ", trn_sum))
end


------------------------------------------------------------
-- 恋愛値 (word)
------------------------------------------------------------
function readLovePoint(woman, man)
	if woman == nil then return end
	if man == nil then return end

	return memory.readword(woman + man)
end

function readLovePointPerWoman(woman)
	print(">>> "..woman.name.." >>>")
	for i = 1, #love_man_tbl, 1 do
		love_pnt = readLovePoint(woman.offset, love_man_tbl[i].offset)
		print(string.format("%s x %s = %d ", woman.name, love_man_tbl[i].name, love_pnt))
	end
end

function readLovePointAll()
	for i = 1, #love_woman_tbl, 1 do
		readLovePointPerWoman(love_woman_tbl[i])
	end
end


------------------------------------------------------------
-- 乱数
------------------------------------------------------------
--[[ * 判定は、表示確率 >= 乱数値 のとき可決される (補正前)
--   * 乱数値 0 は 100% を表す (補正前)
--   * 0x7E046B - 0x7E04A1 までの55個
--   * FE乱数ツールとの兼ね合い上、乱数値 -1 の値を表示する
--     言い換えると、表示確率 > 乱数値 のとき可決される (補正後)
--   * 0x7E04A2 は (1) 0 origin (2) 消費済み乱数値の場所を指していると思われる
--     以上の2点より、次に使われる乱数値は、乱数テーブルを 1 origin で数えて
--     0x7E04A2の値を+ 2した位置となる
-- ]]
local a_rnd_offset = 0x7E046B
local a_rnd_cursor = 0x7E04A2
local max_rnd = 55

function readRandomTable()
	local rnd_tbl = {}
	local rnd = 0

	for i=1, max_rnd do
		rnd = memory.readbyte(a_rnd_offset + i - 1)
		if rnd == 0 then
			rnd = 99
		else
			rnd = rnd -1
		end
		rnd_tbl[i] = rnd
	end
	--print(rnd_tbl)
	return rnd_tbl
end

function printRandomTable(rnd_tbl)
	local rnd_str = ""

	for i=1, max_rnd do
		rnd_str = rnd_str..string.format("%2d ", rnd_tbl[i])
		if i % 24 == 0 then
			rnd_str = rnd_str.."\n"
		end
	end
	print(">>> random table >>>")
	print(rnd_str)
	print("<<< random table <<<")
end

function readFirstRandomValue()
	local rnd = memory.readbyte(a_rnd_offset)
	if rnd == 0 then
		rnd = 99
	else
		rnd = rnd -1
	end
	return rnd
end

function readRandomCursor()
	return memory.readbyte(a_rnd_cursor) + 2
end

function drawRandomNum(rnd_tbl, rnd_crs, x, y)
	x = x or 0
	y = y or 210
	local i = rnd_crs
	local rnd_str = ""

	while i <= max_rnd do
		rnd_str = rnd_str.." "..rnd_tbl[i]
		i = i + 1
	end
	gui.text(x, y, rnd_crs)
	gui.text(x, y+10, rnd_str)
end

function drawRandomTable(rnd_tbl, rnd_crs, x, y)
	x = x or 0
	y = y or 0
	local yy = 0
	local rnd_str = ""

	gui.text(x, y + 20, rnd_crs)
	for i = 1, #rnd_tbl, 1 do
		rnd_str = rnd_str..string.format("%2d", rnd_tbl[i]).." "
		if i % 21 == 0 or i == 55 then
			gui.text(x, y+yy, rnd_str)
			yy = yy + 6
			rnd_str = ""
		end
	end
	drawRandomCursolBox(rnd_crs, "#ff00ff")
end

function drawRandomCursolBox(rnd_crs, color, x, y)
	x = x or 0
	y = y or 0

	local bx = x + (12 * ((rnd_crs - 1) % 21))
	local by = y + (6 * math.floor((rnd_crs - 1) / 21))
	gui.drawbox(bx-1, by, bx+8, by+7, nil, color)
end


------------------------------------------------------------
-- utility functions
------------------------------------------------------------
local function fadv(n)
	local n = n or 1
	for i=1, n do
		snes9x.frameadvance()
	end
end


------------------------------------------------------------
-- main
------------------------------------------------------------
local crr_ch = {}
local crr_st = {}
local ini_st_list = {}
local prv_st_list = {}
local prv_rnd_tbl = {}
local prv_rnd_crs_list = {}
local flag = 0
local fc = snes9x.framecount()

while true do
	if flag == 0 then
		readTurnCount()
		readLovePointAll()
		prv_rnd_tbl = readRandomTable()
		printRandomTable(prv_rnd_tbl)

		for key, value in pairs(ch_tbl) do
			--print("name   = "..value.name)
			--print("offset = "..value.offset)
			--local ch = Chara.new(value.name, value.offset)
			--prv_st_list[key] = Chara.readStatus(ch)

			ini_st_list[key] = Chara.readStatus(value)
			prv_st_list[key] = Chara.readStatus(value)
			print(prv_st_list[key].info)
		end
		flag = 1
	end

	if flag ~= 0 then
		for key, value in pairs(ch_tbl) do
			local crr_lv = Chara.readLevel(value)
			--print("name="..prv_st_list[key].name..", lv="..prv_st_list[key].lv)

			if crr_lv ~= prv_st_list[key].lv then
				print(">>> Level up >>>")
				crr_ch = value
				fadv(2)
				crr_st = Chara.readStatus(crr_ch)
				Chara.printMaxStatus(crr_st)
				Chara.printStatusUp(crr_st, prv_st_list[crr_ch.name])
				print(crr_ch.name..":: "..ch_tbl[crr_ch.name].care)
				prv_st_list[crr_ch.name] = crr_st
			end
		end

		local fst_rnd = readFirstRandomValue()
		if fst_rnd ~= prv_rnd_tbl[1] then
			fadv(2)
			prv_rnd_tbl = readRandomTable()
			printRandomTable(prv_rnd_tbl)
			prv_rnd_crs_list = {}
		end

		local rnd_crs = readRandomCursor()
		drawRandomTable(prv_rnd_tbl, rnd_crs)

		--print(prv_rnd_crs_list)
		if #prv_rnd_crs_list < 1 or prv_rnd_crs_list[#prv_rnd_crs_list] < rnd_crs then
			table.insert(prv_rnd_crs_list, rnd_crs)
		elseif prv_rnd_crs_list[#prv_rnd_crs_list] > rnd_crs then
			prv_rnd_crs_list = {}
		end
		for i = 1, #prv_rnd_crs_list - 1, 1 do
			drawRandomCursolBox(prv_rnd_crs_list[i], "#00ffff")
		end
	end

	--Chara.drawStatus(crr_st)
	--Chara.drawStatusUp(crr_st, ini_st_list[crr_ch.name])

	--snes9x.message(crr_st.info)
	snes9x.frameadvance()
end

