#include <stdio.h>

int is_lower(char c) {
  /* is c lowercase? */
  return ('a' <= c && c <= 'z');
}

int is_upper(char c) {
  /* is c uppercase? */
  return ('A' <= c && c <= 'Z');
}

char switch_case(char c) {
  /* if c is lowercase, make it uppercase, and vice versa */
  if (is_lower(c)) {
    return 'A' + c - 'a';
  } else if (is_upper(c))
    return 'a' + c - 'A';
  } else {
    return c;
  }
}

int main(int argc, char* argv[]) {
  /* test the switch_case function */
  char capital_B = switch_case('b');
  char lower_x   = switch_case('X');
  char regular_5 = switch_case('5');
  
  putchar(capital_B);
  putchar(lower_x);
  putchar(regular_5);
  putchar('\n');
  
  /* Write a program that capitalizes all letters of a file using the
     functions is_lower, is_upper, and switch_case. */
  
  /*** write answer here ! ***/
}
