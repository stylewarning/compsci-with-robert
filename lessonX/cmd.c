/* cmd.c */
/* Compile with:
   
   gcc -Wall -ansi -pedantic -o cmd cmd.c
   
*/

/* This file is a small command line arguments demo. */


#include <stdio.h>

int main(int argc, char *argv[]) {
  int arg_number;

  /* argc = how many arguments were passed to you?
     argv = what are the arguments?
  */

  printf("Number of args: %d\n", argc);
  
  for (arg_number = 0; arg_number < argc; arg_number++) {
    /* %s prints a string */
    printf("Arg #%d: %s\n", arg_number, argv[arg_number]);
  }
}

