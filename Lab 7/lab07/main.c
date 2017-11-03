#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* sub_string(char* in_string, int start_index, int end_index);

int main() {
	int start_index, end_index;
	char *in_string;
	char *out_string;

	in_string = (char*) malloc(sizeof(char) * 200);

	printf("Enter a string: ");
	scanf("%s", in_string);

	printf("Enter the start index: ");
	scanf("%d", &start_index);

	printf("Enter the end index: ");
	scanf("%d", &end_index);

	out_string = sub_string(in_string, start_index, end_index);

	printf("The substring of the given string is '%s'\n", out_string);

	return 0;
}
