; библиотека для макросов SASM
%include "io64.inc"

section .bss
    array resd 100
    array_len resd 1

section .text
    global main
    main:
    mov rbp, rsp; for correct debugging
        PRINT_STRING "Array length: "
        PRINT_DEC 4, [array_len]
        NEWLINE
  

        PRINT_STRING "Array fill:"

