-- Astronoka
-- This is auto hybrid script, also shows hybrid expectation.
-- You can uncomment target_vegee, if needed.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Prepare seeds below
--     ++ plain simaimo   = a lot (99 is recomended)
--     ++ plain kabu      = 30 or more
--     ++ plain hourensou = 30 or more
--   2. Go to hybrid machine room
--   3. Put cursor the first seed
--   4. Start this script
--
-- + This script can
--     ++ evelove multiple attribute each hybrid
--     ++ refer multiple attribute each vegees
--
-- + This script can not
--     ++ manipulate RNG
--     ++ optimize the result

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
--target_vegee = target_vegee_1401_part1
--target_vegee = target_vegee_1401_part2

--target_vegee = target_renkon_m100_m100x3_a
--target_vegee = target_renkon_m100_m100x3_b
target_vegee = target_renkon_m100_m100x5_a
--target_vegee = target_otsu
--target_vegee = target_vegee_test
target_total = #target_vegee
try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 24    -- max level up count
-- <<<


local pete_rank = memory.readbyte(adr_pete_rank)
if pete_rank == 0 then
	Hybrid.expect = Hybrid.expectPete1
end


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
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed::      fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

