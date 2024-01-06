CC = i386-elf-gcc
LNK = i386-elf-ld
ASRC = ${wildcard boot/*.asm}
CSRC = ${wildcard kernel/*.c drivers/*.c}
OBJ = ${wildcard tmp/*.o}

all: os.bin

os.bin: $(OBJ) padding
	$(LNK) $(OBJ) -o tmp/os-tmp
	cat tmp/os-tmp tmp/padding > os.bin

padding: padding.asm
	nasm -fbin padding.asm -o tmp/padding

%o: %.asm
	nasm -fbin $< -o $@

%.o: %.c
	$(CC) -ffreestanding -c $< -o $@


