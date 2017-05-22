-- Astronoka
-- This is auto hybrid script, also shows hybrid expectation.
-- You can uncomment target_vegee, if needed.
--
-- Emulator: psxjin v2.0.2
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

function perm_generate(a, n)
	if n == 0 then
		coroutine.yield(a)
	else
		for i=1,n do

			-- put i-th element as the last one
			a[n], a[i] = a[i], a[n]

			-- generate all permutations of the other elements
			perm_generate(a, n - 1)

			-- restore i-th element
			a[n], a[i] = a[i], a[n]

		end
	end
end

function permutation(a)
	local n = table.getn(a)
	return coroutine.wrap(function () perm_generate(a, n) end)
end



function convert2Target(tree)
	local target = {}
	-- if tree.right is a node, switch parent seed due to reduce cursor moving
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

function hybridizePo(tree)
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

function hybridizeTree(tree)
	Hybrid.keepedSeed = {}
	for i=1, #tree, 1 do
		postorder(tree[i], hybridizePo)
		-- keep hybridized seed
		table.insert(Hybrid.keepedSeed, Hybrid.sd4)
	end
end


function hybridizeTreePerm(tree)
	local state_tmp = savestate.create()
	local state_best = savestate.create()
	local elapsed_fc_best = 0

	-- save start state
	savestate.save(state_tmp)

	for p in permutation(tree) do
		-- load start state
		savestate.load(state_tmp)

		target_tree_summary = {}
		local start_total_reset = memory.readword(adr_total_reset_cnt)
		local start_date = os.date()
		local start_fc = emu.framecount()

		hybridizeTree(p)
		outputSummary(start_total_reset, start_date, start_fc)

		local elapsed_fc = emu.framecount() - start_fc
		print(string.format("elapsed_fc = %d, elapsed_fc_best = %d", elapsed_fc, elapsed_fc_best))
		if elapsed_fc < elapsed_fc_best or elapsed_fc_best == 0 then
			-- save best state
			savestate.save(state_best)
			print("created state_best")

			elapsed_fc_best = elapsed_fc
		end
	end

	-- load best state
	savestate.load(state_best)
end


function getSummary(sreset, sdate, sfc, fname)
	local tbl = {}
	local total_lr = 0
	local total_reset = memory.readword(adr_total_reset_cnt)
	local fc = emu.framecount()

	table.insert(tbl, ">>> print Summary >>>")
	for i=1, #target_tree_summary, 1 do
		table.insert(tbl, "summary:: "..target_tree_summary[i].str)
		total_lr = total_lr + target_tree_summary[i].retry
	end

	table.insert(tbl, string.format(">>> print elapsed >>>"))
	table.insert(tbl, string.format("total retry:: %d, %d", total_reset - sreset, total_lr))
	table.insert(tbl, string.format("  start:: %s,  fc = %d", sdate, sfc))
	table.insert(tbl, string.format("    end:: %s,  fc = %d", os.date(), fc))
	table.insert(tbl, string.format("elapsed:: fc = %d", fc - sfc))
	table.insert(tbl, string.format("<<< hybrid is finished <<<"))
	return tbl
end

function printSummary(sreset, sdate, sfc, fname)
	local tbl = getSummary(sreset, sdate, sfc, fname)
	for i=1, #tbl, 1 do
		print(tbl[i])
	end
end

function outputSummary(sreset, sdate, sfc)
	local fp = io.open("auto_hybrid2.log", "a")
	if fp == nil then print("error: Could not open file") end

	local tbl = getSummary(sreset, sdate, sfc, fname)
	for i=1, #tbl, 1 do
		fp:write(tbl[i] .. "\n")
	end

	fp:flush()
	fp:close()
end

------------------------------------------------------------
-- main
------------------------------------------------------------

-- # you can overwrite defined param >>>>>>>>>>
-- # target setting using array
--target_vegee = target_vegee_1115
--target_vegee = target_vegee_1122
--target_vegee = target_vegee_1209
--target_vegee = target_vegee_1305
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
target_tree = target_tree_1115
--target_tree = target_tree_1122
--target_tree = target_tree_1209
--target_tree = target_tree_1305
--target_tree = target_tree_1314
--target_tree = target_tree_1401
--target_tree = target_tree_1401_typeB
--target_tree = target_tree_1408
--target_tree = target_tree_1416
--target_tree = target_tree_1422
--target_tree = target_tree_1426
target_tree = target_tree_1508

try_cnt1 = 1000  -- max retry count each level up
try_cnt2 = 24    -- max level up count
-- <<<<<<<<<<


target_tree_summary = {}
total_lr = 0  -- @deprecated
initial = 1
init_total_reset = memory.readword(adr_total_reset_cnt)
init_date = os.date()
init_fc = emu.framecount()

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
		--	total_lr = total_lr + target_vegee[i].retry
		--end

		-- # use binary tree
		--hybridizeTree(target_tree)
		--printSummary(init_total_reset, init_date, init_fc)

		-- # permutate target_tree
		hybridizeTreePerm(target_tree)
		
		break
	end

	emu.frameadvance()
end

local fc = emu.framecount()
local total_reset = memory.readword(adr_total_reset_cnt)
print(string.format(">>> print elapsed >>>"))
print(string.format("total retry:: %d, %d", total_reset - init_total_reset, total_lr))
print(string.format("  start:: %s,  fc = %d", init_date, init_fc))
print(string.format("    end:: %s,  fc = %d", os.date(), fc))
print(string.format("elapsed:: fc = %d", fc - init_fc))
print(string.format("<<< lua bot is finished <<<"))
emu.speedmode("normal")
emu.pause()

