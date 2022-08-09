nasm -f win64 -o ram-sandbox-evasion-1.obj ram-sandbox-evasion-1.asm
link ram-sandbox-evasion-1.obj /subsystem:console /out:ram-sandbox-evasion-1.exe msvcrt.lib legacy_stdio_definitions.lib
ram-sandbox-evasion-1.exe
