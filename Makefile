##
## EPITECH PROJECT, 2021
## B-PSU-401-philosophers
## File description:
## Makefile
##

GCC		=	gcc

SRC		=	src/main.c \
			src/init_threads.c \
			src/tasks.c	\
			src/chopsticks.c \
			src/note.c

OBJ		=	$(SRC:.c=.o)

CFLAGS	=	-W -Wall -Wextra -lpthread -I./include -g

NAME		=	./philo


all:	$(NAME)

$(NAME):	$(OBJ)
			$(GCC) -o $(NAME) $(OBJ) $(CFLAGS)

clean:
			rm -f $(OBJ)

fclean:			clean
			rm -f $(NAME)
			rm -f vgcore.*

re:			fclean all

.PHONY:			all clean fclean re tests_run