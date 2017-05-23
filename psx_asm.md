PSX asm
=======

The PSX Memory Map
------------------

| 0x0000_0000 - 0x0000_ffff | Kernel (64K)                                   | Kuseg |
| 0x0001_0000 - 0x001f_ffff | User Memory (1.9 Meg)                          | Kuseg |
| 0x1f00_0000 - 0x1f00_ffff | Parallel Port (64K)                            |       |
| 0x1f80_0000 - 0x1f80_03ff | Scratch Pad (1024 bytes)                       |       |
| 0x1f80_1000 - 0x1f80_2fff | Hardware  Registers (8K)                       |       |
| 0x8000_0000 - 0x801f_ffff | Kernel and User Memory Mirror (2 Meg) Cached   | Kseg0 |
| 0xa000_0000 - 0xa01f_ffff | Kernel and User Memory Mirror (2 Meg) Uncached | Kseg1 |
| 0xbfc0_0000 - 0xbfc7_ffff | BIOS (512K)                                    |       |



PSX instruction set
-------------------

* [PSX asm](http://ffhacktics.com/wiki/PSX_instruction_set)
* [R3000命令解説](http://www21.big.or.jp/~dram/kouza/r3000_ex.html)
* [MIPS wikipedia](https://ja.wikipedia.org/wiki/MIPS%E3%82%A2%E3%83%BC%E3%82%AD%E3%83%86%E3%82%AF%E3%83%81%E3%83%A3)



PSX Specification
-----------------

* http://problemkaputt.de/psx-spx.htm


