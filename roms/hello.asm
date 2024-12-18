; -----------------------------------------------------------------------------
; Program: hello.asm
; Description: A simple "Hello, World!" program for the 6502 CPU, which writes
;              the message "Hello, World!" to the screen or serial output.
;              The program sends each character from a predefined message string.
;
; Start Address: $C000
;
; Compilation Instructions:
;   Step 1: Assemble the source code into an object file
;       ca65 hello.asm -o hello.o
;
;   Step 2: Link the object file with a configuration file to create a binary
;       ld65 -C memory.cfg hello.o -o hello.bin
;
; Requirements:
; - 6502 Assembler (ca65)
; - 6502 Linker (ld65)
; - Configuration file (memory.cfg) defining memory layout
;
; -----------------------------------------------------------------------------

        .org $C000               ; Set program start address to $C000

        LDX #0                   ; Initialize X register to 0
Loop:
        LDA Message,X            ; Load byte from Message array into A register
        BEQ Done                 ; If A == 0 (end of string), branch to Done
        STA $D012                ; Send character to output (e.g., serial at $D012)
        INX                      ; Increment X register
        JMP Loop                 ; Jump back to Loop

Done:
        BRK                      ; End of program

Message:
        .BYTE "Hello, World!", 0 ; Define the message and terminate with 0
