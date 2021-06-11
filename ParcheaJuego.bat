@echo off
chcp 65001

.\res\ctrtool.exe --contents=contents "%~1"
.\res\ctrtool.exe --romfs=romfs.bin .\contents.0000.00000000

.\res\xdelta3.exe -d -f -s romfs.bin res\patch.xdelta romfsPatched.bin

pause

set /p id="¿Versión americana (U) o europea (E)? "

If %id%==E (set d=00040000000F1400) ELSE (set d=00040000000F1E00)

mkdir %d%
.\res\ctrtool.exe --romfsdir=%d%\romfs romfsPatched.bin

del romfs.bin
del romfsPatched.bin
del contents.000*

pause