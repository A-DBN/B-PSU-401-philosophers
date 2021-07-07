/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** main
*/

#include "philosophers.h"

void usage()
{
    printf("USAGE\n\t./philo -p nbr_p -e nbr_e\n\n");
    printf("DESCRIPTION\n");
    printf("\t-p nbr_p number of philosophers\n");
    printf("\t-e nbr_e maximum number of times a philosopher eats before");
    printf(" exiting the program\n");
}

int check_args(int ac, char **av, args_t *args)
{
    opterr = 0;
    static struct option long_opt[] = {
        {"help", no_argument, 0, 'h'},
    };
    for (char c;(c = getopt_long(ac, av, "p:e:hw", long_opt, NULL)) != -1;) {
        switch(c) {
        case 'p':
            args->nb_philo = atoi(optarg);
            break;
        case 'e':
            args->max_eat = atoi(optarg);
            break;
        case 'h':
            usage();
            return 1;
        case '?':
            usage();
            return 84;
        }
    }
    return 0;
}

int check_overflow(args_t *args)
{
    if (args->nb_philo < 0) {
        if (args->nb_philo < INT_MIN)
            return 84;
    } else if (args->nb_philo > 0) {
        if (args->nb_philo > INT_MAX)
            return 84;
    }

    if (args->max_eat < 0) {
        if (args->max_eat < INT_MIN)
            return 84;
    } else if (args->max_eat > 0) {
        if (args->max_eat > INT_MAX)
            return 84;
    }
    return 0;
}

int main(int ac, char **av)
{
    args_t *args;
    philo_t *philo;
    int res;

    if (ac != 2 && ac != 5)
        return 84;
    args = malloc(sizeof(args_t));
    if (args == NULL)
        return -1;
    res = check_args(ac, av, args);
    if (res == 84 || check_overflow(args) == 84)
        return 84;
    if (res == 1)
        return 0;
    if (args->nb_philo < 2 || args->max_eat == 0)
        return 84;
    philo = create_table(args);
    create_threads(philo, args);
    free(philo);
    free(args);
    return 0;
}