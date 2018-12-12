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
    int err = sscanf(line, "%d\n", &i);
    if (err < 0) {
      printf("Failed to read line: %s", line);
      fclose(fd);
      free(line);
      return 1;
    }

    sum += i;
  }

  printf("%d\n", sum);
  return 0;
}
