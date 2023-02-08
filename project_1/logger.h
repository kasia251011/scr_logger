#ifndef PROJECT_1_LOGGER_H
#define PROJECT_1_LOGGER_H

#include <stdio.h>
#include <time.h>
#include <pthread.h>
#include <signal.h>
#include <string.h>

#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
#define create_log(IMPORTANCE, MSG) log_log(IMPORTANCE, MSG, __FILENAME__, __LINE__)

struct pointers_t {
  void * start_addr;
  void * end_addr;
};

typedef struct pointers_t (*pointers_func)(void);

typedef enum  {
    MIN = 1,
    STANDARD = 2,
    MAX = 3
} importance_t;

typedef struct {
    FILE * logger_file;
    importance_t importance;
    int isLoggerOn;
    pointers_func dump_func;

} logger_t;

int logger_init(pointers_func dump_func);
int log_log(importance_t importance, char * message, char * filename,  int line);
int logger_close();



#endif //PROJECT_1_LOGGER_H
