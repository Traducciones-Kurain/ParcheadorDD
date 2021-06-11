chcp 65001

.\res\ctrtool.exe --contents=contents "%~1" || pause
.\res\ctrtool.exe --romfs=romfs.bin .\contents.0000.00000000 || pause
.\res\xdelta3.exe -d -s romfs.bin res\patch.xdelta romfsPatched.bin || pause


set /p id="¿Versión americana (U) o europea (E)? " || pause
If %id%==E (set d=00040000000F1E00) ELSE (set d=00040000000F1400) || pause
mkdir %d% || pause
echo %d% || pause
.\res\ctrtool.exe --romfsdir=%d%\romfs romfsPatched.bin || pause

del romfs.bin
del romfsPatched.bin
del contents.000*