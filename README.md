# Shellcode #

## Utilisation ##

Le script compile.sh prend en argument le nom du fichier assembleur et fournit le shellcode.

```bash
./compile.sh shellcode
[+] Compilation nasm
[+] Edition de liens
[+] Shellcode ...
"\x31\xc0\xb0\x01\x31\xdb\xb3\x01\xcd\x80"
[+] Done

```

Pour le tester utilisez le fichier testShellcode.c

```c
#include <stdio.h>
#include <string.h>


unsigned char code[] = \
"\x31\xc0\xb0\x01\x31\xdb\xb3\x01\xcd\x80";


int main()
{

        printf("taille %lu\n", strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

        return 0;

}
```
puis compilez avec la commande suivante :
```
gcc -fno-stack-protector -z execstack test_shellcode.c -o test_shellcode
```

Some shellcode x86/x64

## x86 ##

- Print a text
- Open a shell /bin/sh
- Open /etc/passwd
- Open a backdoor on port 12345
- Open a backdoor on port 12345 - polymorphic
- XOR decode
- Change the content of /var/www/html/index.html with your own text (stack version)

## x64 ##

- Print a text
- Flush iptable
