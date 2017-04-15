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

local interface = MandaliaRandom

f = io.open(interface.logname, "a")
if f == nil then print("error: Could not open file") end
if interface.logHeader ~= nil then interface.logHeader() end

retry = 4000

for i=0, retry do
	if initial == 1 then
		initial = 0
		fadv(i)

		state = savestate.create()
		savestate.save(state)

		--seed = memory.readdword(adr_rng)
		--base_game_fc = memory.readdword(adr_game_fc)
		--base_cur_session = memory.readdword(adr_cur_session)
		GameTime.init()
	else
		--seed =  next_rng(seed)
		--memory.writedword(adr_rng, seed)

		--base_game_fc = base_game_fc + 1
		--memory.writedword(adr_game_fc, base_game_fc)

		--base_cur_session = base_cur_session + 1
		--memory.writedword(adr_cur_session, base_cur_session)

		GameTime.increment()
	end

	drawRetry(i, x, y)
	interface.pre_attempt()
	if interface.pre_attempt2 ~= nil then interface.pre_attempt2() end

	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	local game_time = GameTime.read()
	local cur_session = memory.readdword(adr_cur_session)

	debugPrint(string.format("----- retry = %d, fc = %d, rng = %08X"
		..", game_time = %s, encountFormula = %d"
		..", cur_session = %d -----", 
		i, fc, rng, 
		GameTime.format(game_time), 
		GameTime.encountFormula(game_time), 
		cur_session))

	interface.attempt()

	-- check results
	if interface.success() then
		debugPrint(string.format("  ***** best state. fc = %d, rng = %08X, game_time = %s *****",
			fc, rng, GameTime.format(game_time)))
		print(string.format("***** best state. retry = %d, rng = %08X, game_time = %s *****",
			i, rng, GameTime.format(game_time)))
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

