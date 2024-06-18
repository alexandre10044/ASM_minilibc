##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

SRC		=	src/memcpy.asm \
			src/memmove.asm \
			src/memset.asm \
			src/strchr.asm \
			src/strcmp.asm \
			src/strcspn.asm \
			src/strlen.asm \
			src/strncmp.asm \
			src/strstr.asm

AS		=	nasm

CC		=	gcc

OBJ		=	$(SRC:.asm=.o)

ASFLAGS	=	-f elf64 -Wall -Ox

NAME	=	libasm.so

all:	$(NAME)

$(NAME): $(OBJ)
	$(CC) -nostdlib -shared -fPIC $(OBJ) -o $(NAME)

%.o : %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:		fclean all

.PHONY: all clean fclean re