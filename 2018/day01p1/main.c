#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main() 
{
  FILE *fd = fopen("input.txt", "r");
  if (fd == NULL) {
    printf("Failed to open input.txt");
    return 1;
  }

  char *line = NULL;
  size_t cap = 0;
  int sum = 0;
  while (true) {
    int end = getline(&line, &cap, fd);
    if (end == -1) {
      break;
    }

    int i;
    char signal;
    int err = sscanf(line, "%c%d\n", &signal, &i);
    if (err < 0) {
      printf("Failed to read line: %s", line);
      goto fail;
    }

    if (signal == '+') {
      sum += i;
    } else if (signal == '-') {
      sum -= i;
    } else {
      printf("Unexpected signal %c", signal);
      goto fail;
    }
  }

  printf("%d\n", sum);
  return 0;

fail:
  fclose(fd);
  free(line);
  return 1;
}
