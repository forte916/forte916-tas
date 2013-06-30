-- Astronoka
-- This is auto hybrid script, also shows hybrid expectation.
-- You can uncomment target_vegee table, if needed.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Prepare seeds below
--     ++ plain simaimo = a lot
--     ++ plain kabu    = 30 or more
--     ++ other vegees  = 2 or more
--   2. Go to hybrid machine room
--   3. Put cursol the first seed
--   4. Start this script
--
-- + This script can
--     ++ evelove only one attribute each vegees
--
-- + This script can not
--     ++ refer multiple attribute each vegees
--     ++ use to optimize for speed run
--
-- + Special Thanks
--   http://homepage3.nifty.com/game-sfccode/astronoka.html
--   http://www009.upp.so-net.ne.jp/dreamy/ps/noka.html

--require "astronoka_lib"
require "astronoka_target_vegee"

------------------------------------------------------------
-- main
------------------------------------------------------------

-- overwrite define param
target_vegee = target_vegee_1115

try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 30    -- max level up count


initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
while true do

	if initial == 1 then
		Seed.showAll()
		initial = 0
	end

	print(string.format("initial = %d", initial))
	if initial == 0 then
		--switchDrawSeedProperty()
		for i=1, #target_vegee, 1 do
			goal_flag = false
			Hybrid.autoHybrid(target_vegee[i])
		end
		for i=1, #target_vegee, 1 do
			print("summary::"..targetToString(target_vegee[i]))
		end
		break
	end

	emu.frameadvance()
end

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<< fc=%d", fc))
print(string.format("start:: %s,  %d", begin_date, begin_fc))
print(string.format("  end:: %s,  %d", os.date(), fc))
emu.speedmode("normal")
emu.pause()


