; библиотека для макросов SASM
%include "io64.inc"  

section .bss ;для объявления неинициализированных переменных
    arr: resd 110   ;4-байтных слов
    arr_size: resd 1  ;4-байтных слов


section .text
    global main
    main:
    mov rbp, rsp; for correct debugging
        PRINT_STRING "Array length: "
        GET_DEC 4, [arr_size]
        PRINT_DEC 4, [arr_size]
        NEWLINE    
    fill:
        PRINT_STRING "--Array fill--"
        NEWLINE
        mov ebx, arr  ; загружаем адрес начала массива в ebx
        mov ecx, [arr_size]  ; загружаем размер массива в ecx
        .fill_loop:
            cmp ecx, 0  ; проверяем, если ecx равен 0, то выходим из цикла
            je .end_loop
            PRINT_STRING "elem of array:"
            GET_DEC 4, [ebx]  ; считываем значение и сохраняем в текущей ячейке массива
            GET_CHAR al ; <----------
            PRINT_DEC 4, [ebx]
            NEWLINE
            add ebx, 4  ; переходим к следующей ячейке
            sub ecx, 1  ; уменьшаем счетчик цикла на 1
            jmp .fill_loop  ; переходим в начало цикла
        .end_loop:
            PRINT_STRING "--Array filled--"
            NEWLINE
            ret