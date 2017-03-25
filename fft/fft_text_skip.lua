-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script can skip text.
--
-- Usage
--   1. Start this script properly.
--

require "psx_lib"
require "fft_lib"

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
-- defines
------------------------------------------------------------
adr_text_flag_037808 = 0x037808
adr_text_flag_037968 = 0x037968
  -- 0x0189: before 1f shown text
  -- 0x0409: unapprove pad input
  -- 0x1409: ???
  -- 0x0589: keep in every 2f until the end of text
  -- 0x0000: the end of text (pad input is available before 3f to change 0x0054)

adr_text_flag_03780C = 0x03780C
adr_text_flag_03796C = 0x03796C
  -- 0x01FF: before 1f shown text
  -- 0x0054: the end of text (pad input is available before 3f to change 0x0054)

adr_text_flag_164938 = 0x164938  -- 2byte??
  -- 0x0073: before 1f shown text
  --       and keep 0x73 in every 2f until the end of text
  -- 0xFFFF: otherwise

adr_text_flag_1FFE80 = 0x1FFE80  -- 2byte??
  -- 0x0073: before 1f shown text
  --       and keep 0x73 until pad input
  -- 0x0000: otherwise

adr_text_flag_1FFE88 = 0x1FFE88
  -- 0x0001: current turn
  -- 0x0002: before 1f arrowed at current turn
  -- 0xFFFF: text end

adr_text_flag_1FFE8C = 0x1FFE8C
  -- 0x0002: before 1f arrowed at current turn

adr_text_flag_1FFE98 = 0x1FFE98
  -- 0x00C0: before 1f shown text
  -- 0x0000: otherwise
adr_text_flag_1FFEA0 = 0x1FFEA0
  -- 0xFF80: before 1f shown text
  -- 0xFFFF: otherwise
adr_text_flag_1FFEA8 = 0x1FFEA8


adr_direction_1D64FE = 0x1D64FE
adr_direction_1D6566 = 0x1D6566
adr_direction_1D65CE = 0x1D65CE
  -- 0x3E00: before 7f shown term of win, before 3f shown congratulations
  -- 0x3E30: before 3f shown ready

adr_direction_1D6532 = 0x1D6532
adr_direction_1D659A = 0x1D659A
adr_direction_1D6602 = 0x1D6602
  -- 0x3E00: before 7f shown term of win
  -- 0x3E12: before 3f shown ready


adr_direction_1D6500 = 0x1D6500
  -- 0x00EC: DIRECT_DEFEAT_X
  -- 0x00AA: DIRECT_READY
  -- 0x008E: DIRECT_CONGRAT
  -- 0x00BB: DIRECT_BONUS_MONEY
  -- 0x00A7: DIRECT_WAR_TROPHIES
  -- 0xD004: DIRECT_END_TROPHIES


------------------------------------------------------------
-- functions
-- @note 
--   * TODO: イベント『士官候補生たち』の最後のセリフ送りは
--           最速は 0x164938 が 0x0030 になったとき
--           このスクリプトでは対応していないので手動で対応が必要
--
------------------------------------------------------------
Text = {}

Text.TEXT_NONE   = 0
Text.TEXTING     = 9
Text.TEXT_END_1f = 1
Text.TEXT_END_3f = 3
Text.TEXT_END_4f = 4
Text.condition = Text.TEXT_NONE
Text.text_end_fc = nil

Text.DIRECT_NONE         = 0
Text.DIRECT_DEFEAT_X     = 1 -- 0x3E00, 0x00EC
Text.DIRECT_READY        = 2 -- 0x3E30, 0x00AA
Text.DIRECT_CONGRAT      = 3 -- 0x3E00, 0x008E
Text.DIRECT_BONUS_MONEY  = 4 -- 0x3E00, 0x00BB
Text.DIRECT_WAR_TROPHIES = 5 -- 0x3E00, 0x00A7
Text.direction = Text.DIRECT_NONE


function Text.getTextFlag()
    return memory.readword(adr_text_flag_037808)
end

function Text.setTextCondition(flag)
	local cur_condition

	cur_condition = bit.band(flag, 0x09)  -- 0x09 is texting

	if Text.condition == Text.TEXTING and flag == 0x1409 then
		print(string.format("flag = 0x%04X, TEXT_END_1f", flag))
 		Text.condition = Text.TEXT_END_1f
		Text.text_end_fc = emu.framecount()
    elseif cur_condition ~= 0 then
		if Text.condition == Text.TEXT_END_3f then
			print(string.format("flag = 0x%04X, TEXT_END_3f to TEXTING", flag))  -- DEBUG::
		end
 		Text.condition = Text.TEXTING
	elseif Text.condition == Text.TEXTING then
 		Text.condition = Text.TEXT_END_3f
	elseif Text.condition == Text.TEXT_END_3f then
 		Text.condition = Text.TEXT_END_4f
		Text.text_end_fc = emu.framecount()
	else
 		Text.condition = Text.TEXT_NONE
	end
end

function Text.skipTextNoRewind()
	if Text.condition == Text.TEXT_END_3f or Text.condition == Text.TEXT_END_1f then
		pressBtn({circle=1}, 1)
		Text.text_end_fc = nil
	end
end

-- @note
--   + 0x037808 が 0x0000 になってから 3f 戻るより
--   + 0x164908 が 0xFFFF になってから 2f 戻るほうが正確かも
--   + 0x037808 が 0x0000 になってから 3f前 or 2f前 の二通りあるため
function Text.skipTextRewind()
	if Text.text_end_fc then
		-- rewind here
		savestate.load(Text.state)

		local fc = emu.framecount()
		print(string.format("fc = %d, end_fc = %d", fc, Text.text_end_fc))

		fadv(Text.text_end_fc - fc - Text.condition)
    	local flag = Text.getTextFlag()
		local flag_hi = bit.band(flag, 0x0500) -- 0x0500 is approval pad input??

		if flag == 0x0409 or flag == 0x0189 then
			print(string.format("flag = 0x%04X, flag_hi = %d, fadv(1)", flag, flag_hi))
			fadv(1)
		elseif flag_hi == 0 then
			print(string.format("flag = 0x%04X, flag_hi = %d, no fadv", flag, flag_hi))
		end
		pressBtn({circle=1}, 1)
		pressBtn({x=1}, 2)
		Text.setTextCondition(Text.getTextFlag())
		Text.text_end_fc = nil
		Text.state = savestate.create()
		savestate.save(Text.state)
	end
end

function Text.drawFlags(x, y)
	x = x or 10
	y = y or 90

    local flag_037808 = memory.readword(adr_text_flag_037808)
    local flag_037968 = memory.readword(adr_text_flag_037968)

    local flag_03780C = memory.readword(adr_text_flag_03780C)
    local flag_03796C = memory.readword(adr_text_flag_03796C)

    local flag_164938 = memory.readword(adr_text_flag_164938)
    local flag_1FFE80 = memory.readword(adr_text_flag_1FFE80)
    local flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)

    local direct_1D64FE = memory.readword(adr_direction_1D64FE)
    local direct_1D6500 = memory.readword(adr_direction_1D6500)

	gui.text(x, y   , string.format(" flag_037808 = %04X", flag_037808))
	gui.text(x, y+8 , string.format(" flag_037968 = %04X", flag_037968))
	gui.text(x, y+16, string.format("        cond = %d", Text.condition))

	gui.text(x, y+24, string.format(" flag_03780C = %04X", flag_03780C))
	gui.text(x, y+32, string.format(" flag_03796C = %04X", flag_03796C))

	gui.text(x, y+40, string.format(" flag_164938 = %04X", flag_164938))
	gui.text(x, y+48, string.format(" flag_1FFE80 = %04X", flag_1FFE80))
	gui.text(x, y+56, string.format(" flag_1FFE88 = %04X", flag_1FFE88))

	gui.text(x, y+64, string.format(" direct_1D64FE = %04X", direct_1D64FE))
	gui.text(x, y+72, string.format(" direct_1D6500 = %04X", direct_1D6500))
	gui.text(x, y+80, string.format("        direct = %d", Text.direction))
end


function Text.skipDirection()
    local direction = memory.readword(adr_direction_1D64FE)
    local kind   = memory.readword(adr_direction_1D6500)

	if Text.direction == Text.DIRECT_NONE
			and direction == 0x3E00
			and kind == 0x00EC then
		print(string.format("direction = 0x%04X, kind = 0x%04X, DIRECT_DEFEAT_X", direction, kind))
		Text.direction = Text.DIRECT_DEFEAT_X
		pressBtn({circle=1}, 1)
	elseif Text.direction == Text.DIRECT_DEFEAT_X
			and direction == 0x3E30
			and kind == 0x00AA then
		print(string.format("direction = 0x%04X, kind = 0x%04X, DIRECT_READY", direction, kind))
		Text.direction = Text.DIRECT_READY
		pressBtn({circle=1}, 1)
		Text.state = savestate.create()
		savestate.save(Text.state)
	elseif Text.direction == Text.DIRECT_NONE
			and direction == 0x3E00
			and kind == 0x008E then
		print(string.format("direction = 0x%04X, kind = 0x%04X, DIRECT_CONGRAT", direction, kind))
		Text.direction = Text.DIRECT_CONGRAT
		pressBtn({circle=1}, 4)   -- show "This operation is completed"
		pressBtn({circle=1}, 1)   -- skip congratulations
	elseif Text.direction == Text.DIRECT_CONGRAT
			and direction == 0x3E00
			and kind == 0x00BB then
		print(string.format("direction = 0x%04X, kind = 0x%04X, DIRECT_BONUS_MONEY", direction, kind))
		Text.direction = Text.DIRECT_BONUS_MONEY
		pressBtn({circle=1}, 4)   -- skip counting
		pressBtn({circle=1}, 1)   -- skip bonus money
	elseif Text.direction == Text.DIRECT_BONUS_MONEY
			and direction == 0x3E00
			and kind == 0x00A7 then
		print(string.format("direction = 0x%04X, kind = 0x%04X, DIRECT_WAR_TROPHIES", direction, kind))
		Text.direction = Text.DIRECT_WAR_TROPHIES
		fadv(6)
		pressBtn({circle=1}, 6)   -- show "War Trophies"
		pressBtn({circle=1}, 6)   -- item1
		pressBtn({circle=1}, 6)   -- item2
		pressBtn({circle=1}, 6)   -- item3
		Text.state = savestate.create()
		savestate.save(Text.state)
	elseif direction == 0xD004 then
		Text.direction = Text.DIRECT_NONE
	elseif direction == 0x0000 then
		Text.direction = Text.DIRECT_NONE
	else
		-- pass
	end
end


------------------------------------------------------------
-- main
------------------------------------------------------------

-- create original state
local state = savestate.create()
savestate.save(state)
savestate.load(state)

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
local fc = emu.framecount()
local rng = memory.readdword(adr_rng)
local event_id = memory.readbyte(adr_event_id)
local flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)

emu.registerbefore(Text.drawFlags)

while event_id > 0 and flag_1FFE88 ~= 0x02 do
--while event_id > 0 do

	if initial == 1 then
		initial = 0
		Text.state = savestate.create()
		savestate.save(Text.state)
	end

    local direction = memory.readword(adr_direction_1D64FE)
	if direction ~= 0x3E00 then
		Text.setTextCondition(Text.getTextFlag())
		Text.skipTextRewind()
		--Text.skipTextNoRewind()
	end

	Text.skipDirection()

	emu.frameadvance()
	event_id = memory.readbyte(adr_event_id)
	flag_1FFE88 = memory.readword(adr_text_flag_1FFE88)
end


fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()


------------------------------------------------------------
-- Note
------------------------------------------------------------

--  32f faster than NoRewind in 『剣士アルガスとの出会い』
-- 167f faster than NoRewind in 『ダイスダーグとの再会』 and 『イグーロス城にて』



