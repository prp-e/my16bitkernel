all: my16bitkernel.asm
	nasm -f bin -o my16bitkernel.bin my16bitkernel.asm

img: my16bitkernel.bin
	dd if=my16bitkernel.bin of=my16bitkernel.img

iso: my16bitkernel.img
	mkdir -v cdiso
	mv -v my16bitkernel.img cdiso
	mkisofs -b my16bitkernel.img -no-emul-boot -o my16bitkernel.iso cdiso/

qemu: my16bitkernel.iso
	qemu-system-i386 -cdrom my16bitkernel.iso

clean:
	rm -rvf my16bitkernel.bin
	rm -rvf cdiso
	rm -rvf my16bitkernel.iso
