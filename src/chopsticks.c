/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** chopsticks
*/

#include "philosophers.h"

void take_chopstick(philo_t *philo)
{
    pthread_mutex_lock(&chopstick_mut);
    philo->chopstick = false;
    pthread_mutex_unlock(&chopstick_mut);
}

void release_chopstick(philo_t *philo)
{
    pthread_mutex_lock(&chopstick_mut);
    philo->chopstick = true;
    pthread_mutex_unlock(&chopstick_mut);
}