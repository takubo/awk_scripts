#!/usr/bin/awk -f

BEGIN {
	n = ARGV[1];

	if (ARGV[2] == "g")
		gnuplot = 1

	if (gnuplot) {
		print "set term wxt size 1200, 750"
		print "p \"-\" w l"
	}

	fibonacci(n)

	if (gnuplot) {
		print "e"
		print "pause 5"
	}
}

function fibonacci(n,   i, a, b)
{
	a = 1; b = 0
	for (i = 0; i < n; i++) {
		print a
		a += b
		b = a - b
	}
}
