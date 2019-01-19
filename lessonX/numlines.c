#include <stdio.h>

int main(int argc, char *argv[]) {
  int nl, c;
  int text_on_line = 0;
  
  nl = 0;
  c = getchar();
  while (c != EOF) {
    if (c == '\n') {
      ++nl;
      text_on_line = 0;
    } else {
      text_on_line = 1;
    }
    c = getchar();
  }
  
  /* long way:
     
  if (text_on_line == 1) { 
    printf("number of lines: %d\n", nl + 1);
  } else {
    printf("number of lines: %d\n", nl);
  }
  */
  
  /* short way (kludge!): */
  printf("number of lines: %d\n", nl + text_on_line);
}
