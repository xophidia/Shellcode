---------------------------------
Print a text
---------------------------------

By Xophidia - 2016
Platform: Linux / x64

Length : 50

"\x48\xbb\x68\x69\x20\x61\x6c\x6c\x00\x00\x48\x89\x5c\x24\xf8\x48\x83\xec"
"\x08\x48\x31\xc0\xb0\x01\x48\x31\xff\x40\xb7\x01\x48\x89\xe6\x48\x31\xd2"
"\xb2\x06\x0f\x05\x48\x31\xc0\xb0\x3c\x48\x31\xff\x0f\x05"


global _start


section .text
_start:

        mov rbx, 0x6c6c61206968 ; Hi all
        mov [rsp-8], rbx
        sub rsp, 8
        ; Print
        xor rax, rax
        mov al, 1
        xor rdi, rdi
        mov dil, 1
        mov rsi, rsp
        xor rdx, rdx
        mov rdx, 6
        syscall
        ; exit
        xor rax, rax
        mov al, 60
        xor rdi, rdi
        syscall
