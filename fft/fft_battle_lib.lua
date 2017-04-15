-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This is a library for battle to make pad input easier.
--
-- Usage
--   1. require "fft_battle_lib"
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

adr_text_flag_164908 = 0x164908  -- 2byte  -- Menu_message_display_byte
  -- 0x1C: finished moving

adr_text_flag_1FFE80 = 0x1FFE80  -- 2byte  -- showing msg
  -- 0x00B1: current turn.
  -- 0xFFnn: nn is same as unit's No. 3f before acceptance for input

adr_text_flag_1FFE81 = 0x1FFE81  -- 1byte
  -- 0xFF: 3f before acceptance for input

adr_text_flag_1FFE88 = 0x1FFE88  -- 2byte??  -- showing msg
  -- 0xFFnn: nn is same as unit's No. 3f before acceptance for input
  -- 0x0001: current turn
  -- 0x0002: 1f before arrowed at current turn
  -- 0xFFFF: text end

adr_effect_flag_0960B4 = 0x0960B4  -- 2byte??
  -- cleared_in_ability_effect_routines
  -- 0x00: doing effect
  -- 0x01: done effect

adr_text_flag_096088 = 0x096088  --  ?byte  -- Type of display
  -- 0x10: start to moving
  -- 0x11: 1f after acceptance for change camera


adr_text_flag_0961B8 = 0x0961B8  -- ?byte  -- Action_Phase
  -- 0x01: during skill effect
  -- 0x03: out of skill effect


------------------------------------------------------------
-- Battle
------------------------------------------------------------
Battle = {}

--- This func is not accuracy. because 0xB1 is become multiple times.
function Battle.waitForTurnNextUnit()
	local flag_1FFE80 = memory.readbyte(adr_text_flag_1FFE80)

	-- wait until 2f before arrowed
	while not (0xB1 == flag_1FFE80) do
		fadv(1)
		flag_1FFE80 = memory.readbyte(adr_text_flag_1FFE80)
	end
	fadv(2)
end

--- Check if Unit's turn or not.
-- @return 1:Unit's turn,  0:others turn.
function Battle.checkTurn(adr_unit)
	return memory.readbyte(adr_unit + Bunit.cur_turn)
end

function Battle.waitForTurn(adr_unit)
	local unit_no = memory.readbyte(adr_unit + Bunit.no)
	Battle.waitForTurnUnitNo(unit_no)
end

--- wait until 1f before acceptance for input
function Battle.waitForTurnUnitNo1FBefore(unit_no)
	local flag_1FFE80 = memory.readword(adr_text_flag_1FFE80)
	local unit_no_ff = 0xFF00 + unit_no

	while not (unit_no_ff == flag_1FFE80) do
		fadv(1)
		flag_1FFE80 = memory.readword(adr_text_flag_1FFE80)
	end

	while unit_no_ff == flag_1FFE80 do
		fadv(1)
		flag_1FFE80 = memory.readword(adr_text_flag_1FFE80)
	end
end

--- wait until acceptance for input
function Battle.waitForTurnUnitNo(unit_no)
	Battle.waitForTurnUnitNo1FBefore(unit_no)
	fadv(1)
end

function Battle.waitForEffect(adr_unit)
	local unit_no = memory.readbyte(adr_unit + Bunit.no)
	local unit_no_ff = 0xFF00 + unit_no
	local flag_1FFE80 = memory.readbyte(adr_text_flag_1FFE80)
	local flag_0960B4 = memory.readbyte(adr_effect_flag_0960B4)

	-- wait until acceptance for input
	while not (unit_no_ff == flag_1FFE80 and flag_0960B4 == 1) do
		fadv(1)
		flag_1FFE80 = memory.readbyte(adr_text_flag_1FFE80)
		flag_0960B4 = memory.readbyte(adr_effect_flag_0960B4)
	end
	fadv(2)
end

function Battle.waitForStartingToSkillEffect()
	flag_0961B8 = memory.readword(adr_text_flag_0961B8)
	while flag_0961B8 ~= 0x01 do
		fadv(1)
		flag_0961B8 = memory.readword(adr_text_flag_0961B8)
	end
end

function Battle.waitForFinishedToSkillEffect()
	flag_0961B8 = memory.readword(adr_text_flag_0961B8)
	while flag_0961B8 == 0x01 do
		fadv(1)
		flag_0961B8 = memory.readword(adr_text_flag_0961B8)
	end
end


function Battle.waitForFinishedToMove()
	local flag_164908 = memory.readbyte(adr_text_flag_164908)

	-- wait until acceptance for input
	while not (0x1C == flag_164908) do
		fadv(1)
		flag_164908 = memory.readbyte(adr_text_flag_164908)
	end
end

function Battle.waitForStartingToMove()
	local flag_096088 = memory.readword(adr_text_flag_096088)
	while not (0x10 == flag_096088) do
		fadv(1)
		flag_096088 = memory.readword(adr_text_flag_096088)
	end
end

function Battle.fullWait()
	pressBtn({down=1}, 4)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- full wait
	pressBtn({circle=1}, 1)
end

function Battle.move_act_template()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 1)  -- move
	fadv(8+1)
	
	-- move cursol

	pressBtn({circle=1}, 1)  -- select panel
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({circle=1}, 4)  -- action

	-- use skill

	--fadv(xx)  -- wait for effect
	
	-- arrowed
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function Battle.move_wait_template()
	-- arrowed
	fadv(7)
	pressBtn({circle=1}, 1)  -- move
	fadv(8+1)
	
	-- move cursol

	pressBtn({circle=1}, 1)  -- select panel
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 18)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 9)  -- full wait
	pressBtn({circle=1}, 1)
end

function Battle.act_move_template()
	-- arrowed
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	
	-- use skill

	--fadv(xx)  -- wait for effect

	-- arrowed
	fadv(6)
	pressBtn({circle=1}, 1)  -- move
	fadv(8+1)
	
	-- move cursol

	pressBtn({circle=1}, 1)  -- select panel
	--fadv(xx)  -- wait for moving

	-- arrowed
	fadv(1)  -- wait until 0x164908 = 0x001C
	pressBtn({circle=1}, 1)
	fadv(10+2)
	pressBtn({circle=1}, 2)  -- confirm direction
	pressBtn({circle=1}, 1)
end

function Battle.act_wait_template()
	-- arrowed
	fadv(7)
	pressBtn({down=1}, 2)
	pressBtn({circle=1}, 4)  -- action
	
	-- use skill

	--fadv(xx)  -- wait for effect

	-- arrowed
	fadv(6)
	Battle.fullWait()
end


