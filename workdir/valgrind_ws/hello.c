#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  char *str = malloc(20);
  strcpy(str, "hello");
  printf("%s\n", str);

  FILE *p_file = fopen("test.txt", "w");
  fprintf(p_file, "%s", "hello");
#ifndef NG
  free(str);
  fclose(p_file);
#endif
  return 0;
}