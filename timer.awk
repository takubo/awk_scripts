#!/usr/bin/awk -f
BEGIN {
	for (i = 4; i >= 0; i--) {
		for (j = 59; j >= 0; j--) {
			#printf "%2d:%2d\n", i, j
			printf "]2;%2d:%2d", i, j
			system("sleep 1")
		}
	}
}
