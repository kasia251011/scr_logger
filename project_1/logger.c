#include "logger.h"

void detect_signal();
void dump(const void * start_addr, const void * end_addr) ;
void create_dump_file(int signo, siginfo_t* info, void* other);
void change_logger_importance();
void turn_on_of_logger();

logger_t logger;
pthread_mutex_t file_mutex, importance_mutex;
struct sigaction act_sigrtmin_backup, act_sigusr1_backup, act_sigusr2_backup;

int logger_init(pointers_func dump_func) {
  logger.logger_file = fopen("logs.log", "w");
  if(logger.logger_file == NULL) {
      return -2;
  }
  logger.importance = STANDARD;
  logger.isLoggerOn = 1;
  logger.dump_func = dump_func;

  pthread_mutex_init(&file_mutex, NULL);

  detect_signal();

  return 0;
}

void change_logger_importance(int signo, siginfo_t* info, void* other) {
  switch (info->si_value.sival_int) {
    case MIN:
    case STANDARD:
    case MAX:
      logger.importance = info->si_value.sival_int;
      printf("Importance changed to: %d\n", info->si_value.sival_int);
      break;
    default:
      logger.importance = STANDARD;
      break;
  }
}

void turn_on_of_logger() {
  if(logger.isLoggerOn) {
    logger.isLoggerOn = 0;
  } else {
    logger.isLoggerOn = 1;
  }
}

void create_dump_file() {
  struct pointers_t pointers = logger.dump_func();
  dump(pointers.start_addr, pointers.end_addr);

}

int log_log(importance_t importance, char * message, char * filename,  int line) {
  if(logger.logger_file == NULL) return  -1;

  pthread_mutex_lock(&importance_mutex);

  if(importance <= logger.importance && logger.isLoggerOn) {
    pthread_mutex_lock(&file_mutex);
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    fprintf(logger.logger_file, "%-10s %-5d %d-%02d-%02d %02d:%02d:%02d %s\n",filename, line,
      tm->tm_year + 1900, tm->tm_mon + 1, tm->tm_mday,
      tm->tm_hour, tm->tm_min, tm->tm_sec,
      message);
    pthread_mutex_unlock(&file_mutex);
  }

  pthread_mutex_unlock(&importance_mutex);


  return 0;
}
int logger_close() {
    if(logger.logger_file == NULL) return  -1;
    fclose(logger.logger_file);
    sigaction(SIGRTMIN, &act_sigrtmin_backup, NULL);
    sigaction(SIGUSR1, &act_sigusr1_backup, NULL);
    sigaction(SIGUSR2, &act_sigusr2_backup, NULL);
    return 0;
}


void detect_signal() {
  struct sigaction act_sigrtmin, act_sigusr1, act_sigusr2;
  sigset_t set;
  sigfillset(&set);

  act_sigrtmin.sa_sigaction = change_logger_importance;
  act_sigrtmin.sa_mask = set;
  act_sigrtmin.sa_flags = SA_SIGINFO;
  sigaction(SIGRTMIN, &act_sigrtmin, &act_sigrtmin_backup);

  act_sigusr1.sa_sigaction = turn_on_of_logger;
  act_sigusr1.sa_mask = set;
  act_sigusr1.sa_flags = 0;
  sigaction(SIGUSR1, &act_sigusr1, &act_sigusr1_backup);

  act_sigusr2.sa_sigaction = create_dump_file;
  act_sigusr2.sa_mask = set;
  act_sigusr2.sa_flags = 0;
  sigaction(SIGUSR2, &act_sigusr2, &act_sigusr2_backup);

}


void dump(const void * start_addr, const void * end_addr) {
  char filename [1000];
  time_t t = time(NULL);
  struct tm tm = *localtime(&t);
  sprintf(filename, "dump_%d-%02d-%02d_%02d-%02d-%02d",
          tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
          tm.tm_hour, tm.tm_min, tm.tm_sec);

  size_t size = end_addr - start_addr;
  FILE * file = fopen(filename, "wb");
  fwrite(start_addr, 1, size, file);
  fclose(file);
}

