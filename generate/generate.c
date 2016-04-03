#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int base_time = 1262304000; // 2010-01-01T00:00:00

// char * randomGen(char * type) {
//   char *str = malloc(20);
//   if (strcmp(type, "int") == 0) {
//     sprintf(str, "%d", rand());
//   } else if (strcmp(type, "bigint") == 0) {
//     sprintf(str, "%d", rand());
//   } else if (strcmp(type, "text") == 0) {
//     str[0] = '\'';
//     int i;
//     for (i = 1; i < 10; i++) {
//       str[i] = 'a' + rand()%26; // a-z
//     }
//     str[10] = '\'';
//   } else if (strcmp(type, "timestamp") == 0) {
//     sprintf(str, "%d", base_time + rand()%1000000);
//   } else if (strcmp(type, "float") == 0) {
//     sprintf(str, "%f", (float)rand()/(float)RAND_MAX);
//   }
//   return str;
// }

int main(int argc, char * argv[]) {

  int num_days;
  if (argc<=1) {
    num_days = 1;
  } else {
    num_days = atoi(argv[1]);
  }
  int num_rows = num_days * 1000;

  srand(time(NULL));

  FILE * fp;
  char * line = NULL;
  size_t len = 0;
  ssize_t read;
  char labels[470][35];
  char types[470][10];
  int count = 0;

  fp = fopen("columns.cql", "r");
  if (fp == NULL) {
    printf("columns.cql not found.\n");
    exit(EXIT_FAILURE);
  }

  while ((read = getline(&line, &len, fp)) != -1) {
    char *p = strchr(line, ' ');
    int i = (int)(p - line);
    memcpy( labels[count], &line[0], i );
    memcpy( types[count], &line[i+1], read-i-2 );
    labels[count][i] = '\0';
    types[count][read-i-2] = '\0';
    count++;
  }
  fclose(fp);
  if (line)
    free(line);

  time_t rawtime;
  struct tm * timeinfo;
  char filename [64];
  time(&rawtime);
  timeinfo = localtime (&rawtime);
  strftime(filename, 64, "data_%Y-%m-%d_%H-%M-%S.txt", timeinfo);

  clock_t start = clock(), diff;

  fp = fopen(filename, "w+");
  int n;
  for (n=0; n<num_rows; n++) {
    fprintf(fp, "%d,", n);
    int i;
    for (i=1; i<469; i++) {
      if (strcmp(types[i], "int") == 0) {
        fprintf(fp, "%d,", rand());
      } else if (strcmp(types[i], "bigint") == 0) {
        fprintf(fp, "%d,", rand());
      } else if (strcmp(types[i], "text") == 0) {
        fprintf(fp, "'");
        int i;
        for (i = 1; i < 10; i++) {
          fprintf(fp, "%c", 'a' + rand()%26); // a-z
        }
        fprintf(fp, "',");
      } else if (strcmp(types[i], "timestamp") == 0) {
        fprintf(fp, "%d,", base_time + rand()%1000000);
      } else if (strcmp(types[i], "float") == 0) {
        fprintf(fp, "%f,", (float)rand()/(float)RAND_MAX);
      }
    }
    if (strcmp(types[469], "int") == 0) {
      fprintf(fp, "%d", rand());
    } else if (strcmp(types[469], "bigint") == 0) {
      fprintf(fp, "%d", rand());
    } else if (strcmp(types[469], "text") == 0) {
      fprintf(fp, "'");
      int i;
      for (i = 1; i < 10; i++) {
        fprintf(fp, "%c", 'a' + rand()%26); // a-z
      }
      fprintf(fp, "'");
    } else if (strcmp(types[469], "timestamp") == 0) {
      fprintf(fp, "%d", base_time + rand()%1000000);
    } else if (strcmp(types[469], "float") == 0) {
      fprintf(fp, "%f", (float)rand()/(float)RAND_MAX);
    }
  }
  fclose(fp);

  diff = clock() - start;
  int msec = diff * 1000 / CLOCKS_PER_SEC;
  printf("%d rows generated in %d seconds %d milliseconds.\n", num_rows, msec/1000, msec%1000);

  return 0;
}
