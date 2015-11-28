-- Astronoka
-- This script is drawing a baboo DNA to help white.
--
-- + Emulater: psxjin v2.0.2
--
-- + Usage
--   1. Start this script.
--
-- + This script can
--     ++ draw a baboo DNA

require "astronoka_lib"


------------------------------------------------------------
-- functions
------------------------------------------------------------

function drawRNG(x, y)
	x = x or 0
	y = y or 60

	local rng = memory.readdword(adr_rng)
	local win = memory.readword(adr_win_count)
	local how = memory.readbyte(adr_baboo_today)
	gui.text(x, y   , string.format(" rng:%08X", rng))
	gui.text(x, y+8 , string.format(" win:%d", win))
	gui.text(x, y+16, string.format(" how:%d", how))
end

function drawWhite(x, y)
	x = x or 0
	y = y or 60

	local crr_gene_HP       = Baboo.readGene(24)
	local crr_gene_YarukiP  = Baboo.readGene(30)
	local crr_gene_Movement = Baboo.readGene(31)
	local crr_gene_Drop     = Baboo.readGene(65)

	gui.text(x, y+10, string.format(" HP       min = %2d, max = %2d, avg = %2d", pre_gene_HP.min, pre_gene_HP.max, pre_gene_HP.avg))
	gui.text(x, y+20, string.format(" HP       min = %2d, max = %2d, avg = %2d", crr_gene_HP.min, crr_gene_HP.max, crr_gene_HP.avg))

	gui.text(x, y+30, string.format(" YarukiP  min = %2d, max = %2d, avg = %2d", pre_gene_YarukiP.min, pre_gene_YarukiP.max, pre_gene_YarukiP.avg))
	gui.text(x, y+40, string.format(" YarukiP  min = %2d, max = %2d, avg = %2d", crr_gene_YarukiP.min, crr_gene_YarukiP.max, crr_gene_YarukiP.avg))

	gui.text(x, y+50, string.format(" Movement min = %2d, max = %2d, avg = %2d", pre_gene_Movement.min, pre_gene_Movement.max, pre_gene_Movement.avg))
	gui.text(x, y+60, string.format(" Movement min = %2d, max = %2d, avg = %2d", crr_gene_Movement.min, crr_gene_Movement.max, crr_gene_Movement.avg))

	gui.text(x, y+70, string.format(" Drop     min = %2d, max = %2d, avg = %2d", pre_gene_Drop.min, pre_gene_Drop.max, pre_gene_Drop.avg))
	gui.text(x, y+80, string.format(" Drop     min = %2d, max = %2d, avg = %2d", crr_gene_Drop.min, crr_gene_Drop.max, crr_gene_Drop.avg))
end


------------------------------------------------------------
-- main
------------------------------------------------------------

local initial = 1
local begin_fc = emu.framecount()
local begin_date = os.date()
pre_days = 0
pre_rng = 0
pre_gene_HP       = {}
pre_gene_YarukiP  = {}
pre_gene_Movement = {}
pre_gene_Drop     = {}


while true do
	local crr_days
	local yy, mm, dd, fc

	if initial == 1 then
		-- cheat
		--memory.writedword(0x00BE328, 0x891a61bf)

		pre_gene_HP       = Baboo.readGene(24)
		pre_gene_YarukiP  = Baboo.readGene(30)
		pre_gene_Movement = Baboo.readGene(31)
		pre_gene_Drop     = Baboo.readGene(65)
		initial = 0
	end

	if initial == 0 then
		crr_days = memory.readbyte(adr_days)
		if crr_days ~= pre_days then
			yy = memory.readbyte(adr_years) + 1
			mm = crr_days / 28 + 1
			dd = crr_days % 28 + 1
			fc = emu.framecount()

			print(string.format("----- year%d %d/%d , fc = %d -----".."\n", yy, mm, dd, fc))
			drawWhite(0, 90)
			pre_days = crr_days
		end

	end

	drawRNG()
	emu.frameadvance()
end

