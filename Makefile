compiler=nasm
linker=ld
source=abc.asm
platform=elf64
object_file=abc.o
executable=abc

all: build_object link_target print_message

build_object:
	@$(compiler) $(source) -g -f $(platform) -o $(object_file)

link_target:
	@$(linker) $(object_file) -o $(executable)

print_message:
	@echo "the executable \"$(executable)\" was sucessfull built."
