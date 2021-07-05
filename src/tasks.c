/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** tasks
*/

#include "philosophers.h"

void end_philo(philo_t *philo)
{
    if (philo->args->nb_philo - 1 == 1) {
        pthread_exit(0);
        printf("There is only 1 philosopher left, he can't eat anymore !\n");
        exit(0);
    } else {
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher has ended\n", philo->id);
        printf("Philosopher n°%i has ended !\n", philo->id);
        philo->args->nb_philo--;
        pthread_exit(0);
    }
}

void think(philo_t *philo)
{
    if (philo->chopstick == true) {
        take_chopstick(philo);
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher is thinking\n", philo->id);
        printf("Philosopher n°%i is thinking !\n" , philo->id);
        sleep(5);
        release_chopstick(philo);
    } else if (philo->next->chopstick == true) {
        take_chopstick(philo->next);
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher is thinking\n", philo->id);
        printf("Philosopher n°%i is thinking !\n" , philo->id);
        sleep(5);
        release_chopstick(philo->next);
    } else {
        printf("Philosopher n°%i want to think but he hasn't any chopstick \n",
         philo->id);
         rest(philo);
    }
    eat(philo);
}

void eat(philo_t *philo)
{
    args_t args;

    if (philo->chopstick == true && philo->next->chopstick == true) {
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher is eating\n", philo->id);
        printf("Philosopher n°%i start eating !\n", philo->id);
        take_chopstick(philo);
        take_chopstick(philo->next);
        sleep(10);
        release_chopstick(philo);
        release_chopstick(philo->next);
        //if (philo->args->write_file == 1)
          //  write_in_file("Philosopher finished eating\n", philo->id);
        printf("Philosopher n°%i finished eating !\n", philo->id);
        philo->time_eat++;
    } else {
        printf("Philosopher n°%i tried to eat but he hasn't any chopstick\n",
         philo->id);
         rest(philo);
    }
    if (philo->time_eat == args.max_eat)
        end_philo(philo);
    rest(philo);
}

void rest(philo_t *philo)
{
    //if (philo->args->write_file == 1)
      //      write_in_file("Philosopher is resting\n", philo->id);
    printf("Philosopher n°%i is now resting !\n", philo->id);
    sleep(10);
    //if (philo->args->write_file == 1)
      //      write_in_file("Philosopher wake up\n", philo->id);
    printf("Philosopher n°%i wake up\n", philo->id);
}

void *start_action(philo_t *philo)
{
   int task = rand() % 3 + 1;

    switch(task) {
        case 1:
            eat(philo);
            break;
        case 2:
            think(philo);
            break;
        case 3:
            rest(philo);
            break;
    }
    return NULL;
}