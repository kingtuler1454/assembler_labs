; библиотека для макросов SASM
%include "io64.inc"  

section .bss ;для объявления неинициализированных переменных
    arr: resd 110   ;4-байтных слов
    arr_size: resd 1  ;4-байтных слов
    crc_string: resb 256 ; указывает количество байт, которые необходимо зарезервировать
    string_size: resd 256

    src_result:resb 256
section .data:
    src_result_size: db 256


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
        mov ecx, [arr_size]
        mov ebx, arr  ; загружаем адрес начала массива в ebx

        mov ecx, [arr_size]  ; загружаем размер массива в ecx
            mov ebx, arr  ; загружаем адрес начала массива в ebx
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

    CRC_fill_arr:
        PRINT_STRING "Enter the string for CRC32: "
        GET_STRING [crc_string], 256
        PRINT_STRING [crc_string]
        NEWLINE       
        ret

        mov eax, 0xFFFFFFFF ; src=0xFFFFFFFF
        mov ecx,256

        .out_loop:
            cmp ecx,0
            je .end_loop
            mov ebx, 8
            .inner_loop:
                cmp ebx, 0   ; проверяем, достигли ли мы конца внутреннего цикла
                jne .inner_loop


            
        
        
    