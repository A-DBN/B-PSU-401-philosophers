/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** init_threads
*/

#include "philosophers.h"

philo_t *create_table(args_t *args)
{
    philo_t *philo = malloc(sizeof(philo_t) * args->nb_philo);
    
    if (philo == NULL)
        return NULL;
    for (int i = 0; i < args->nb_philo; i++) {
        philo[i].id = i;
        philo[i].next = &philo[i +1];
        philo[i].chopstick = true;
    }
    philo[args->nb_philo - 1].next = &philo[0];
    return philo;
}

int create_threads(philo_t *philo, args_t *args)
{
    pthread_t table[args->nb_philo];

    for (int i = 0; i < args->nb_philo; i++) {
        if (pthread_create(&table[i], NULL, &start_action, &philo[i]) != 0)
            return 1;
    }
    for (int i = 0; i < args->nb_philo; i++)
        pthread_join(table[i], NULL);
    return 0;
}