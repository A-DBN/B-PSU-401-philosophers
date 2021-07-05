/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** note
*/

#include "philosophers.h"

int write_in_file(char *str, int id)
{
    char *msg = malloc(sizeof(char) * (strlen(str) + strlen((char *)id) + 3));
    int fd = open("infos.txt", O_CREAT | O_RDWR | O_APPEND);

    if (fd == -1)
        return 84;
    strcpy(msg, (char *)id);
    strcat(msg, ": ");
    strcat(msg, str);
    if (write(fd, msg, strlen(msg)) != strlen(msg))
        return 84;
    close(fd);
}