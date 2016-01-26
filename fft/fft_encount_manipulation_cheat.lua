-- ROM: Final Fantasy Tactics (J) (v1.1) [SLPS-00770]
-- Emulater: psxjin v2.0.2
--
-- This script manipulates encounts and enemy status.
--
-- Usage
--   1. Set interface class properly.
--   2. Start this script properly.
--

require "fft_encount_lib"

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
function drawRetry(count, x, y)
	x = x or 0
	y = y or 30

	gui.text(x, y   , string.format(" retry:%d", count))
end

-- @brief increment game clock. similar in dissassemble code below.
--        sub_800425C4 in JPv1.1
--        sub_800434DC in US
function incrementGameClock()
	base_milsecs = base_milsecs + 1
	if base_milsecs > 59 then
		base_milsecs = 0
		base_seconds = base_seconds + 1
		if base_seconds > 59 then
			base_seconds = 0
			base_minutes = base_minutes + 1
			if base_minutes > 59 then
				base_minutes = 0
				base_hours = base_hours + 1
				if base_hours > 999 then
					base_hours = 1000
				end
			end
		end
	end

	memory.writedword(adr_milsecs, base_milsecs)
	memory.writedword(adr_seconds, base_seconds)
	memory.writedword(adr_minutes, base_minutes)
	memory.writedword(adr_hours  , base_hours)
end

function readGameClock()
	base_milsecs = memory.readdword(adr_milsecs)
	base_seconds = memory.readdword(adr_seconds)
	base_minutes = memory.readdword(adr_minutes)
	base_hours   = memory.readdword(adr_hours  )
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
local seed
local base_game_fc
local base_cur_session
base_milsecs = 0
base_seconds = 0
base_minutes = 0
base_hours   = 0

local interface = GainedJpUP

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end

retry = 5000

for i=2000, retry do
	if initial == 1 then
		initial = 0
		fadv(i)

		state = savestate.create()
		savestate.save(state)

		--seed = memory.readdword(adr_rng)
		--base_game_fc = memory.readdword(adr_game_fc)
		--base_cur_session = memory.readdword(adr_cur_session)
		readGameClock()
	else
		--seed =  next_rng(seed)
		--memory.writedword(adr_rng, seed)

		--base_game_fc = base_game_fc + 1
		--memory.writedword(adr_game_fc, base_game_fc)

		--base_cur_session = base_cur_session + 1
		--memory.writedword(adr_cur_session, base_cur_session)

		incrementGameClock()
	end

	drawRetry(i, x, y)
	interface.pre_attempt()
	if interface.pre_attempt2 ~= nil then interface.pre_attempt2() end

	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	local game_fc = memory.readdword(adr_game_fc)
	local cur_session = memory.readdword(adr_cur_session)
	local milsecs = memory.readdword(adr_milsecs)
	local seconds = memory.readdword(adr_seconds)
	local minutes = memory.readdword(adr_minutes)
	local hours   = memory.readdword(adr_hours  )

	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X, game_fc = %d, cur_session = %d, game_time = %dh %dmin %dsec .%dms -----", i, fc, rng, game_fc, cur_session, hours, minutes, seconds, milsecs))

	interface.attempt()

	-- check results
	if interface.success() then
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X *****", fc, rng))
		print(string.format("  ***** best state. retry = %d, rng = %08X *****", i, rng))
		interface.post_attempt()
	end

	f:flush()
	savestate.load(state)
end


fc = emu.framecount()
debugPrint(string.format("<<< lua bot is finished <<<"))
debugPrint(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
debugPrint(string.format("    end:: %s,  fc = %d", os.date(), fc))
debugPrint(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()
f:close()

