-- Test scripts.


------------------------------------------------------------
-- functions
------------------------------------------------------------

function read_adr_rng_signed()
	local seed = memory.readdwordsigned(adr_rng)
	print(string.format("  --D seed: %08X, %d, %s", seed, seed, tostring(seed)))
	return seed
end

function test_hoge4()
	local seed = read_adr_rng()
	print(string.format("  --E seed: %08X, %d, %s", seed, seed, tostring(seed)))
	return seed
end

function test_hoge3()
	local seed = memory.readdwordsigned(adr_rng)
	print("  seed: "..seed)
	print(string.format("  --F seed: %08X, %d, %s", seed, seed, tostring(seed)))
end
function read_adr_rng()
	local seed = memory.readdword(adr_rng)
	print(string.format("  --A seed: %08X, %d, %s", seed, seed, tostring(seed)))
	print(string.format("  --A seed: %08X, %u, %s", seed, seed, tostring(seed)))
	return seed
end

function test_hoge2()
	local seed = read_adr_rng()
	print(string.format("  --B seed: %08X, %d, %s", seed, seed, tostring(seed)))
	print(string.format("  --B seed: %08X, %u, %s", seed, seed, tostring(seed)))
	return seed
end

function test_hoge1()
	local seed = memory.readdword(adr_rng)
	print("  seed: "..seed)
	print(string.format("  --C seed: %08X, %d, %s", seed, seed, tostring(seed)))
	print(string.format("  --C seed: %08X, %u, %s", seed, seed, tostring(seed)))
end



------------------------------------------------------------
-- main
------------------------------------------------------------
adr_rng = 0x9010 -- BIOS RNG seed, 4byte
initial = 1

while true do
	fc = emu.framecount()
	rng = memory.readdword(adr_rng)
	print(string.format("%d, %08X", fc, rng))

	if initial == 1 then
		initial = 0
	end

	test_hoge1()
	test_hoge2()
	test_hoge3()
	test_hoge4()

	emu.frameadvance()
end

print(string.format("<<< finished <<<"))
emu.pause()

