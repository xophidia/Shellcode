#!/bin/bash

nasm -f elf32 -o $1.o $1.asm

echo "[+] compilation nasm"

ld -m elf_i386 -o $1 $1.o

echo "[+] Edition de liens"

echo "[+] Shellcode ..."

objdump -d ./$1|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'

echo "[+] Done"
