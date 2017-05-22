-- Astronoka
-- This script .
--
-- Emulator: psxjin v2.0.2
--
-- + Usage
--   1. Start this script in a field.
--
-- + This script can
--     ++ .

require "astronoka_lib"

------------------------------------------------------------
-- initialize
------------------------------------------------------------
-- If set to true, no rerecords done by Lua are counted in the rerecord total.
-- If set to false, rerecords done by Lua count. By default, rerecords count.
movie.rerecordcounting(false)

-- maximum is fastest, if you need not render
--emu.speedmode("maximum")     -- screen rendering is disabled
emu.speedmode("turbo")       -- drops some frames
--emu.speedmode("nothrottle")  -- max spped without frameskip
--emu.speedmode("normal")      -- normal speed (test use)



------------------------------------------------------------
-- functions
------------------------------------------------------------


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
	"YarukiP" ,	--150950 やる気(滞在)	31 -- lesser value, give up earlier
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
	"Drop"  	--1509DC 落物		66 -- greater value, inclese drop rate.
}

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

	local rng = memory.readdword(adr_rng)
	local win = memory.readword(adr_win_count)
	local how = memory.readbyte(adr_baboo_today)
	gui.text(x, y   , string.format(" rng:%08X", rng))
	gui.text(x, y+8 , string.format(" win:%d", win))
	gui.text(x, y+16, string.format(" how:%d", how))
end

function Baboo.cheatGene(param, element)
	param = param or 0
	j = element or 24;  -- 24 means HP

	local value
	value = (param * 0x03000000 / 100) + 0x40000000

	print(string.format("param = %3d, value = 0x%08x", param, value))

	for i=0,19 do
		memory.writedword(0x1508D8+j*4+66*4*i, value) -- cheat
	end

end

function Baboo.cheatBabooHP(param)
	param = param or 0
	Baboo.cheatGene(param, 24)
end

function Baboo.cheatBabooYarukiP(param)
	param = param or 0
	Baboo.cheatGene(param, 30)
end

------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
pre_days = 0
ini_st = {}
pre_st = {}
crr_st = {}

f = io.open("baboo_cheat.log", "a")
if f == nil then print("error: Could not open file") end

while true do
	local crr_days
	local yy, mm, dd, fc

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
			-- white baboo
			-- It is relevance of total amount of HP, YarukiP Movement and Drop
			Baboo.cheatBabooHP(31)
			Baboo.cheatBabooYarukiP(31)
			--Baboo.cheatGene(9, 31)  -- Movement, lesser is better
			Baboo.cheatGene(1, 65)  -- Drop, lesser is better

			-- no relevant of white baboo
			--Baboo.cheatGene(90, 0)   -- YuuA
			--Baboo.cheatGene(90, 1)   -- YuuB
			--Baboo.cheatGene(91, 2)   -- Weight
			--Baboo.cheatGene(91, 3)   -- Height
			--Baboo.cheatGene(91, 4)   -- Ude
			--Baboo.cheatGene(91, 5)   -- Ashi
			--Baboo.cheatGene(91, 6)   -- Ago
			--Baboo.cheatGene(91, 7)   -- Wing
			--Baboo.cheatGene(91, 22)  -- Like
			--Baboo.cheatGene(91, 23)  -- DisLike
			--Baboo.cheatGene(91, 25)  -- Seikaku
			--Baboo.cheatGene(91, 26)  -- Kuuhuku
			--Baboo.cheatGene(91, 27)  -- Shokuryo
			--Baboo.cheatGene(91, 28)  -- Sakusen
			--Baboo.cheatGene(91, 29)  -- Tabekata
			--Baboo.cheatGene(91, 32)  -- Favo A
			--Baboo.cheatGene(91, 33)  -- Favo B
			--Baboo.cheatGene(91, 34)  -- Favo C
			--Baboo.cheatGene(91, 35)  -- Favo S

			outputBabooStatus(f)

			pre_st = crr_st
			crr_st = readBabooStatus()

			pre_days = crr_days
			f:flush()
		end

	end
	drawRNG()

	emu.frameadvance()
end

f:close()
