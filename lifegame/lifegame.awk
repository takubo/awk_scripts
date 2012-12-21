#!/usr/bin/awk -f

BEGIN {
	row = 21
	col = 71

	live = "*"
	dead = "."

	bank = 0

	for (i = 0; i <= row; i++) {
		for (j = 0; j <= col; j++) {
			cell[bank, i, j] = "."
		}
	}
}

FNR < row {
	for (j = 1; j < col; j++) {
		cell[bank, FNR, j] = substr($0, j, 1)
	}
}

END {
	#ini_cell()

	while(++age) {
		printf("\033[H\033[2J"); #clear screen
		print "Age =", age
		print ""
		disp()
		system("sleep 1")
		print ""
		print ""
		print ""
		print ""
		print ""
		update()
	}

}

function disp(    i, j)
{
	for (i = 1; i < row; i++) {
		for (j = 1; j < col; j++) {
			printf "%c", cell[bank, i, j]
		}
		print ""
	}
}

function update(    old, i, j, n)
{
	bank = bank ? 0 : 1
	old  = bank ? 0 : 1

	for (i = 1; i < row; i++) {
		for (j = 1; j < col; j++) {
			n = count_life(old, i, j)
			cell[bank, i, j] = dead
			if (n == 3) {
				cell[bank, i, j] = live
			}
			if ((n == 2 || n == 3) && cell[old, i, j] == live) {
				cell[bank, i, j] = live
			}
		}
	}
}

function count_life(b, r, c,    i, j, n)
{
	for (i = -1; i <= 1; i++) {
		for (j = -1; j <= 1; j++) {
			if (i == 0 && j == 0) continue
			if (cell[b, r + i, c + j] == live) {
				n++
			}
		}
	}
	return n;
}

function ini_cell()
{
	#
}
