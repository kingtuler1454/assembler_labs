//7. Реализовать вычисление контрольной суммы CRC32 для введенной строки. Вывести полученное значение.
#include <iostream.h>

using namespace std;

int main(){
    int tmp;
    
    cout<<'Enter the size of array: ';
    cin>>tmp;
    int arr[tmp]
    int value;
    for (int i=0; i<tmp;i++)
    {
        cout<<'Enter the '<<i+1<<' element: ';
        cin>>value;
        arr[i]=value;
    }
    


}

#include <stdint.h> // заголовочный файл для использования типов данных с фиксированной длиной
#include <stdlib.h> // заголовочный файл для использования функции malloc

uint32_t crc32(const void *data, size_t length) { // объявление функции crc32, которая принимает указатель на данные и длину буфера данных
    static uint32_t crc_table[256]; // определение статического массива crc_table размером 256 элементов типа uint32_t
    static int init = 0; // объявление статической переменной init типа int и инициализация ее значением 0
    uint32_t crc = 0xFFFFFFFFUL; // объявление переменной crc типа uint32_t и инициализация ее значением 0xFFFFFFFFUL

    if (!init) { // проверка, была ли уже выполнена инициализация crc_table
        for (int i = 0; i < 256; i++) { // цикл for, который проходит через каждый элемент массива crc_table
            uint32_t c = i; // объявление переменной c типа uint32_t и инициализация ее значением i
            for (int j = 0; j < 8; j++) { // вложенный цикл for, который проходит через каждый бит переменной c
                if (c & 1) { // проверка, является ли младший бит переменной c равным 1
                    c = 0xEDB88320L ^ (c >> 1); // изменение значения переменной c по формуле CRC-32
                } else {
                    c = c >> 1; // сдвиг значения переменной c на один бит вправо
                }
            }
            crc_table[i] = c; // присвоение элементу массива crc_table[i] значения переменной c
        }
        init = 1; // установка значения переменной init в 1 для обозначения выполнения инициализации crc_table
    }

    const uint8_t *bytes = (const uint8_t *) data; // объявление указателя bytes на данные типа uint8_t и приведение указателя data к типу const uint8_t *
    for (size_t i = 0; i < length; i++) { // цикл for, который проходит через каждый байт в буфере данных
        crc = crc_table[(crc ^ bytes[i]) & 0xFF] ^ (crc >> 8); // изменение значения переменной crc по формуле CRC-32
    }

    return crc ^ 0xFFFFFFFFUL; // возврат итогового значения crc, которое является контрольной суммой для данного буфера данных
}

