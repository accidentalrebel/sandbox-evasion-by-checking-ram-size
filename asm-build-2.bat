nasm -f win64 -o ram-sandbox-evasion-2.obj ram-sandbox-evasion-2.asm
link ram-sandbox-evasion-2.obj /subsystem:console /out:ram-sandbox-evasion-2.exe msvcrt.lib legacy_stdio_definitions.lib
ram-sandbox-evasion-2.exe
