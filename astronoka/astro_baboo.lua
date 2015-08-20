-- @author pirohiko
--psxCounters.cpp内 psxUpdateVSyncRate()をリフレッシュレート59.94、走査線数262.5本に変更してビルドすると超ラグが減る。
-- バブーのGA仕様話 http://www.1101.com/morikawa/1999-04-10.html
-- マッチ箱の能 http://www.1101.com/morikawa/index_AI.html

--	チート代わり
--	memory.writedword(0x00EFCA7,0x0001) --バブーが出ない
--	memory.writedword(0x0166F02,0x3000) --ゼニー
--	memory.writedword(0x00BE328,0x00000000)
--	memory.writebyte(0x00F18FA,0x63) -- ワンダフルな塀
--	memory.writebyte(0x00F16D2,0x63) -- ただの塀
--	memory.writebyte(0x00F2DD2,0x63) -- 怪光線マシン
--	memory.writebyte(0x00F2812,0x63) -- ピートのカカシ
--	memory.writebyte(0x00F2252,0x63) -- 冷水ぶっかけ
--	memory.writebyte(0x00F23C2,0x63) -- パンチング
--	memory.writebyte(0x00F2532,0x63) -- ビリビリマシン
--	memory.writebyte(0x00F1112,0x63) -- 2マス扇風機
--	memory.writebyte(0x00F11CA,0x63) -- 高級2マス扇風機
--	memory.writebyte(0x00F13F2,0x63) -- 基本餌
--	memory.writebyte(0x00F14AA,0x63) -- 良質餌
--	memory.writebyte(0x00F0D7A,0x63) -- 浅底落とし穴
--	memory.writebyte(0x00F0FA2,0x63) -- フタ付き落とし穴
--	memory.writebyte(0x00F219A,0x63) -- おめでとう装置
--	memory.writebyte(0x00F2C62,0x63) -- とりもち
--	memory.writebyte(0x00F19B2,0x63) -- ジャンプ台
--	memory.writebyte(0x00F26A2,0x63) -- 風船サービス装置
--	memory.writebyte(0x00F2AF2,0x63) -- 大型オリ


-- pure 32-bit multiplier
function mul32(a, b)
        -- separate the value into two 8-bit values to prevent type casting
        local x, y, z = {}, {}, {}
        x[1] = bit.band(a, 0xff)
        x[2] = bit.band(bit.rshift(a, 8), 0xff)
        x[3] = bit.band(bit.rshift(a, 16), 0xff)
        x[4] = bit.band(bit.rshift(a, 24), 0xff)
        y[1] = bit.band(b, 0xff)
        y[2] = bit.band(bit.rshift(b, 8), 0xff)
        y[3] = bit.band(bit.rshift(b, 16), 0xff)
        y[4] = bit.band(bit.rshift(b, 24), 0xff)
        -- calculate for each bytes
        local v, c
        v = x[1] * y[1]
        z[1], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[2] * y[1] + x[1] * y[2]
        z[2], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[3] * y[1] + x[2] * y[2] + x[1] * y[3]
        z[3], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[1] + x[3] * y[2] + x[2] * y[3] + x[1] * y[4]
        z[4], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[2] + x[3] * y[3] + x[2] * y[4]
        z[5], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[3] + x[3] * y[4]
        z[6], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[4]
        z[7], z[8] = bit.band(v, 0xff), bit.rshift(v, 8)
        -- compose them and return it
        return bit.bor(z[1], bit.lshift(z[2], 8), bit.lshift(z[3], 16), bit.lshift(z[4], 24)),
               bit.bor(z[5], bit.lshift(z[6], 8), bit.lshift(z[7], 16), bit.lshift(z[8], 24))
end

function BabooStatus(x,y)
	-- 20個体66要素を表示
	-- 表示範囲が足りないので、2x以上のフィルタが必要。

	for j=0,65 do
		text = string.format("%02d %8s :",j+1,DNA[j+1])
		for i=0,19 do
			text = text..string.format("%3d", math.max(-1,(memory.readdword(0x1508D8+j*4+66*4*i)-0x40000000)/0x03000000*100))  
		end
		gui.text( 0+x, j*7+y, text)
	end
end


--gui.register( function()
--	local RNG = memory.readdword(0x00BE328) --乱数
--	local text = string.format("%08X",RNG )
--
--
----	先の乱数予測
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
----	RNG = mul32(RNG,1103515245)+12345
----	text = text..string.format("\n%08X",RNG )
--
--
--	gui.text(40,40, memory.readword(0x166F5C)) --LR回数
--	gui.text(40,48, text) --乱数
--
--
--	BabooStatus(100,8)
--
--end)

DNA ={	
	-- ゲーム内データにJISで書かれていたネーム。
	-- 優Ａ等の項目の意味は把握していません。
	"YuuA" ,	--1508D8 優Ａ		01 -- greater value, greater baboo.
	"YuuB" ,	--1508DC 優Ｂ		02
	"Weight" ,	--1508E0 体重		03
	"High" ,	--1508E4 身長		04
	"Ude" , 	--1508E8 腕力		05
	"Ashi" , 	--1508EC 脚力		06
	"Ago" , 	--1508F0 アゴ		07
	"Wing" ,	--1508F4 羽値		08
	"Pit" , 	--1508F8 耐穴		09
	"Fan" , 	--1508FC 耐扇風機	10
	"Jump" ,	--150900 耐ジャンプ	11
	"Guru" ,	--150904 耐グルグル	12
	"Water" ,	--150908 耐冷水		13
	"Punch" ,	--15090C 耐パンチ	14
	"Biri" ,	--150910 耐ビリビリ	15
	"Balloon" ,	--150914 耐風船		16
	"Tawara" ,	--150918 耐米		17
	"Omedeto" ,	--15091C 耐おめでとう	18
	"NiseEsa" ,	--150920 耐エサ		19
	"Kakashi" ,	--150924 耐カカシ	20
	"Mochi" ,	--150928 耐とりもち	21
	"Kousen" ,	--15092C 耐怪光線	22
	"Like" ,	--150930 快		23
	"DisLike" ,	--150934 不快		24
	"HP" ,		--150938 スタミナ（HP）	25
	"Seikaku" ,	--15093C 性Ｃ		26
	"Kuufuku" ,	--150940 空腹		27
	"Shokuryo" ,	--150944 食量		28
	"Shokusen" ,	--150948 作選		29
	"Tabekata" ,	--15094C 食方		30
	"YarukiP" ,	--150950 やる気(滞在)	31
	"Movement" ,	--150954 移量		32
	"Favo A" ,	--150958 好Ａ		33
	"Favo B" ,	--15095C 好Ｂ		34
	"Favo C" ,	--150960 好Ｃ		35
	"Favo S" ,	--150964 好Ｓ		36
	"Pit-D" ,	--150968 落直		37
	"Pit-U" ,	--15096C 落迂		38
	"Pit-J" ,	--150970 落飛		39
	"Jump-D" ,	--150974 ジ直		40
	"Jump-U" ,	--150978 ジ迂		41
	"Jump-J" ,	--15097C ジ飛		42
	"Guru-D" ,	--150980 回直		43
	"Guru-U" ,	--150984 回迂		44
	"Guru-J" ,	--150988 回飛		45
	"Mochi-D" ,	--15098C も直		46
	"Mochi-U" ,	--150990 も迂		47
	"Mochi-J" ,	--150994 も飛		48
	"Ray-D" ,	--150998 光直		49
	"Ray-U" ,	--15099C 光迂		50
	"Ray-J" ,	--1509A0 光飛		51
	"Punch-D" ,	--1509A4 殴直		52
	"Punch-U" ,	--1509A8 殴迂		53
	"Punch-J" ,	--1509AC 殴飛		54
	"Punch-A" ,	--1509B0 殴壊		55
	"Punch-P" ,	--1509B4 殴押		56
	"Biri-D" ,	--1509B8 ビ直		57
	"Biri-U" ,	--1509BC ビ迂		58
	"Biri-J" ,	--1509C0 ビ飛		59
	"Biri-A" ,	--1509C4 ビ壊		60
	"Biri-P" ,	--1509C8 ビ押		61
	"Obj-U" ,	--1509CC 他迂		62
	"Obj-J" ,	--1509D0 他飛		63
	"Obj-A" ,	--1509D4 他壊		64
	"Obj-P" ,	--1509D8 他押		65
	"Drop"  	--1509DC 落物		66
}

-- >>> forte916 customize >>>
------------------------------------------------------------
-- functions
------------------------------------------------------------

function outputBabooStatus(f)
	-- 20個体66要素を出力

	for j=0,65 do
		text = string.format("%02d,%8s",j+1,DNA[j+1])
		for i=0,19 do
			text = text..","..string.format("%3d", math.max(0,(memory.readdword(0x1508D8+j*4+66*4*i)-0x40000000)/0x03000000*100))  
		end
		f:write(text.."\n")
	end
end

function readBabooStatus()
	-- 20個体66要素を取得
	local value
	local st = {}
	local line = {}

	for j=0,65 do
		line = {}
		line[1] = DNA[j+1]
		for i=0,19 do
			value = math.max(0,(memory.readdword(0x1508D8+j*4+66*4*i)-0x40000000)/0x03000000*100)
			line[i+2] = math.floor(value)
		end
		st[j+1] = line
	end
	return st
end

function drawBabooStatus(st, x, y, color)
	-- 20個体66要素を描画
	x = x or 50
	y = y or 10
	if st == nil or #st < 65 then return end

	--print(st)
	for j=0,65 do
		for i=0,19 do
			-- Draws a line from (x1,y1) to (x2,y2) with the given color.
			gui.line(x+st[j+1][i+2], y+(j*4), x+st[j+1][i+2]+5, y+(j*4), color)
		end
	end
end


function drawRNG(x, y)
	x = x or 0
	y = y or 60

	local lr = memory.readword(0x166F5C) -- total reset counts. aka. L-R counts
	local win = memory.readword(0x166F64) -- win count
	local rng = memory.readdword(0x00BE328) -- RNG
	gui.text(x, y   , string.format(" lr :%d", lr))
	gui.text(x, y+8 , string.format(" win:%d", win))
	gui.text(x, y+16, string.format(" rng:%08X", rng))
end

------------------------------------------------------------
-- main
------------------------------------------------------------
adr_days = 0x166EF8
adr_years = 0x166EF9

local initial = 1
pre_days = 0
ini_st = {}
pre_st = {}
crr_st = {}

f = io.open("baboo_status.log", "a")
if f == nil then print("error: Could not open file") end

while true do
	local crr_days
	local yy, mm, dd, fc
	local st = {}

	if initial == 1 then
		ini_st = readBabooStatus()
		initial = 0
	end

	if initial == 0 then

		crr_days = memory.readbyte(adr_days)
		if crr_days ~= pre_days then
			yy = memory.readbyte(adr_years) + 1
			mm = crr_days / 28 + 1
			dd = crr_days % 28 + 1
			fc = emu.framecount()

			f:write(string.format("----- year%d %d/%d , fc = %d -----".."\n", yy, mm, dd, fc))
			outputBabooStatus(f)

			pre_st = crr_st
			crr_st = readBabooStatus()

			pre_days = crr_days
			f:flush()
		end

		drawRNG()
		--drawBabooStatus(ini_st, 50, 10, "green")
		--drawBabooStatus(pre_st, 50, 11, "blue")
		--drawBabooStatus(crr_st, 50, 12, "orange")
	end

	emu.frameadvance()
end

f:close()
-- <<< forte916 customize <<<
