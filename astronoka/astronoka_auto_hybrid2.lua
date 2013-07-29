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
--     ++ optimize the order of hybrid

require "astronoka_target_vegee"

------------------------------------------------------------
-- function
------------------------------------------------------------

function convert2Target(tree)
	local target = {}
	-- if tree.right is a node, switch parent seed because of cursor moving
	if tree.right.left ~= nil and tree.right.right ~= nil then
		target.first = tree.right.property
		target.second = tree.left.property
	else
		target.first = tree.left.property
		target.second = tree.right.property
	end
	target.hybrid = tree.property
	target.retry = 0
	target.done = 0
	return target
end

function hybridPo(tree)
	local target = convert2Target(tree)
	--print(target)
	Hybrid.autoHybrid(target)
	local sum = {str = targetToSummaryString(target), retry = target.retry}
	table.insert(target_tree_summary, sum)
end

function getNodeCountPo(tree)
	target_total = target_total + 1
end

function postorder(tree, func)
	if tree.left ~= nil then postorder(tree.left, func) end  -- left
	if tree.right ~= nil then postorder(tree.right, func) end  -- right

	--print(tree.property)
	if tree.left ~= nil and tree.right ~= nil then
		func(tree)
	end
end


------------------------------------------------------------
-- main
------------------------------------------------------------

-- # you can overwrite defined param >>>>>>>>>>
-- # target setting using array
--target_vegee = target_vegee_1115
--target_vegee = target_vegee_1122
--target_vegee = target_vegee_1209
target_vegee = target_vegee_1305
--target_vegee = target_vegee_1314
--target_vegee = target_vegee_1401_part1
--target_vegee = target_vegee_1401_part2
--target_vegee = target_renkon_m100_m100x3_a
--target_vegee = target_renkon_m100_m100x3_b
--target_vegee = target_renkon_m100_m100x5_a
--target_vegee = target_otsu
--target_vegee = target_vegee_test
--target_total = #target_vegee


-- # target setting using binary tree
--target_tree = target_tree_1115
--target_tree = target_tree_1122
--target_tree = target_tree_1209
--target_tree = target_tree_1305
--target_tree = target_tree_1314
target_tree = target_tree_1401
--target_tree = target_tree_1408


try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 24    -- max level up count
-- <<<<<<<<<<


target_tree_summary = {}
total_retry = 0
initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
local begin_total_reset = memory.readword(adr_total_reset_cnt)
while true do

	if initial == 1 then
		Seed.showAll()
		local pete_rank = memory.readbyte(adr_pete_rank)
		if pete_rank == 0 then
			Hybrid.expect = Hybrid.expectPete1
		end
		for i=1, #target_tree, 1 do
			postorder(target_tree[i], getNodeCountPo)
		end
		initial = 0
	end

	if initial == 0 then
		-- # use array
		--for i=1, #target_vegee, 1 do
		--	Hybrid.autoHybrid(target_vegee[i])
		--end
		--for i=1, #target_vegee, 1 do
		--	print("summary:: "..targetToSummaryString(target_vegee[i]))
		--	total_retry = total_retry + target_vegee[i].retry
		--end

		-- # use binary tree
		for i=1, #target_tree, 1 do
			postorder(target_tree[i], hybridPo)
		end
		for i=1, #target_tree_summary, 1 do
			print("summary:: "..target_tree_summary[i].str)
			total_retry = total_retry + target_tree_summary[i].retry
		end
		break
	end

	emu.frameadvance()
end

local fc = emu.framecount()
local total_reset = memory.readword(adr_total_reset_cnt)
print(string.format("<<< lua bot is finished <<<"))
print(string.format("total retry:: %d, %d", total_reset - begin_total_reset, total_retry))
print(string.format("  start:: %s,  fc = %d", begin_date, begin_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - begin_fc))
emu.speedmode("normal")
emu.pause()

