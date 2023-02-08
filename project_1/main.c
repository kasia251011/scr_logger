#include <stdio.h>
#include "logger.h"
#include <string.h>
#include <unistd.h>

struct pointers_t dump_func();

int main() {
  printf("PID: %d\n", getpid());

  logger_init(dump_func);


  for (int i = 0; i < 20; i++) {
    create_log(MAX, "MAX");
    create_log(STANDARD, "STD");
    create_log(MIN, "MIN");
    if(i == 10) {
      union sigval value;
      value.sival_int = 3;
      sigqueue(getpid(), SIGRTMIN, value);

    }
    if(i == 11) {
      kill(getpid(), SIGUSR2);
    }
    if(i == 5 || i == 3) {
      kill(getpid(), SIGUSR1);
    }
    sleep(1);
  }

    logger_close();
    return 0;
}

struct pointers_t dump_func() {
  struct pointers_t pointers;
  char *  str = "kasia00000";
  pointers.start_addr = str;
  pointers.end_addr = str + 9;

  return pointers;
}
