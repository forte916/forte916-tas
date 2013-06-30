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

-- you can overwrite defined param >>>
--target_vegee = target_vegee_1115
--target_vegee = target_vegee_1122
--target_vegee = target_vegee_1209
--target_vegee = target_vegee_1305
--target_vegee = target_vegee_1314

target_vegee = target_renkon_m100_m100x3_a
--target_vegee = target_renkon_m100_m100x3_b
--target_vegee = target_otsu
--target_vegee = target_vegee_test
target_total = #target_vegee
try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 24    -- max level up count
-- <<<


total_retry = 0
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
		for i=1, #target_vegee, 1 do
			goal_flag = false
			Hybrid.autoHybrid(target_vegee[i])
		end
		for i=1, #target_vegee, 1 do
			print("summary:: "..targetToSummaryString(target_vegee[i]))
			total_retry = total_retry + target_vegee[i].retry
		end
		print(string.format("total retry:: %d", total_retry))
		break
	end

	emu.frameadvance()
end

local fc = emu.framecount()
print(string.format("<<< lua bot is finished <<<"))
print(string.format("start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("  end:: %s,  fc = %d", os.date(), fc))
emu.speedmode("normal")
emu.pause()


