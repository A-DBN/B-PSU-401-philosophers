/*
** EPITECH PROJECT, 2021
** B-PSU-401-philosophers
** File description:
** philosophers
*/

#ifndef PHILOSOPHERS_H_
#define PHILOSOPHERS_H_

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <stdbool.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <limits.h>

#pragma once

typedef enum state_s {
    EAT,
    THINK,
    REST
} state_t;

typedef struct args_s {
    int nb_philo;
    int max_eat;
    //int write_file;
} args_t;

typedef struct philo_s {
    int id;
    state_t state;
    int time_eat;
    pthread_mutex_t chopstick;
    struct philo_s *next;
} philo_t;

philo_t *create_table(args_t *args);    
int create_threads(philo_t *philo, args_t *args);

void *start_action();
void eat(philo_t *philo);
void think(philo_t *philo);
void end_philo(philo_t *philo);
void rest(philo_t *philo);

void take_chopstick(philo_t *philo);
void release_chopstick(philo_t *philo);
void wait_tasks(philo_t *philo);

#endif /* !PHILOSOPHERS_H_ */
