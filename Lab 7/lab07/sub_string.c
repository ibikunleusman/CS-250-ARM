#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* sub_string(char *in_string, int start_index, int end_index) {
	char *out_string;
	int len, i, j = 0;


	// Get length of string
	len = strlen(in_string);

	// Allocate memory for out_string
	out_string = (char*) malloc(sizeof(char) * len);

	/* from start_index - 1 to end_index, copy from in_string into out_string
		and return out_string */
	for (i = start_index - 1; i < end_index; i++)
	{
		out_string[j++] = in_string[i];
	}

	return out_string;
}