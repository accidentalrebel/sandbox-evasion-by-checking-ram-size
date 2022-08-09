nasm -f win64 -o ram-sandbox-evasion.obj ram-sandbox-evasion.asm
link ram-sandbox-evasion.obj /subsystem:console /out:ram-sandbox-evasion.exe msvcrt.lib legacy_stdio_definitions.lib
ram-sandbox-evasion.exe
