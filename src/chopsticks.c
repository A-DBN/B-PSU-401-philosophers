/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** chopsticks
*/

#include "philosophers.h"

void take_chopstick(philo_t *philo)
{
    pthread_mutex_lock(&philo->chopstick);
}

void release_chopstick(philo_t *philo)
{
    pthread_mutex_unlock(&philo->chopstick);
}

void free_lock(philo_t *philo)
{
    if (&philo->chopstick)
        release_chopstick(philo);
    if (&philo->next->chopstick)
        release_chopstick(philo->next);
}

void wait_tasks(philo_t *philo)
{
    if (philo->state == EAT)
        printf("Philosopher n°%i is waiting for chopstick to eat !\n", philo->id);     
    else
        printf("Philosopher n°%i is waiting for chopstick to think !\n", philo->id);
    while(1) {
        if (philo->state == EAT) {
            if (!pthread_mutex_trylock(&philo->chopstick) && !pthread_mutex_trylock(&philo->next->chopstick)) {
                free_lock(philo);
                eat(philo);
            } else {
                free_lock(philo);
                sleep(1);
            }
        } else if (philo->state == THINK) {
            if (!pthread_mutex_trylock(&philo->chopstick) || !pthread_mutex_trylock(&philo->next->chopstick)) {
                free_lock(philo);
                think(philo);
            } else
                sleep(1);
        }
    }
}