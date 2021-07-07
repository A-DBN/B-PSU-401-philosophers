/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** tasks
*/

#include "philosophers.h"

void end_philo(philo_t *philo)
{
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher has ended\n", philo->id);
    printf("Philosopher n°%i has ended !\n", philo->id);
    release_chopstick(philo);
    pthread_exit(NULL);
}

void think(philo_t *philo)
{
    int check_left = pthread_mutex_trylock(&philo->chopstick);
    int check_right = pthread_mutex_trylock(&philo->next->chopstick);
    philo->state = THINK;

    if (!check_left) {
        printf("Philosopher n°%i is thinking !\n" , philo->id);
        sleep(5);
        release_chopstick(philo);
            if (!check_right)
                release_chopstick(philo->next);
    } else if (!check_right) {
        printf("Philosopher n°%i is thinking !\n" , philo->id);
        sleep(5);
        release_chopstick(philo->next);
        if (!check_left)
            release_chopstick(philo);
    } else {
        printf("Philosopher n°%i want to think but he hasn't any chopstick \n",
         philo->id);
        wait_tasks(philo);
    }
    eat(philo);
}

void eat(philo_t *philo)
{
    int check_left = pthread_mutex_trylock(&philo->chopstick);
    int check_right = pthread_mutex_trylock(&philo->next->chopstick);
    philo->state = EAT;

    if (!check_left && !check_right) {
        printf("Philosopher n°%i start eating !\n", philo->id);
        sleep(10);
        release_chopstick(philo);
        release_chopstick(philo->next);
        printf("Philosopher n°%i finished eating !\n", philo->id);
        philo->time_eat--;
    } else {
        printf("Philosopher n°%i tried to eat but he hasn't any chopstick\n",
         philo->id);
        if (!check_left)
            release_chopstick(philo);
        if (!check_right)
            release_chopstick(philo->next);
        wait_tasks(philo);
    }
    if (philo->time_eat == 0)
        end_philo(philo);
    rest(philo);
}

void rest(philo_t *philo)
{
    philo->state = REST;
    printf("Philosopher n°%i is now resting !\n", philo->id);
    sleep(10);
    printf("Philosopher n°%i wake up\n", philo->id);
    think(philo);
}

void *start_action(philo_t *philo)
{
    philo->state = rand() % 3 + 1;

    switch(philo->state) {
        case EAT:
            eat(philo);
            break;
        case THINK:
            think(philo);
            break;
        case REST:
            rest(philo);
            break;
    }
    return NULL;
}