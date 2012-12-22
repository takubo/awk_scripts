#!/usr/bin/awk -f

BEGIN {
	n = ARGV[1];

	fibonacci(n)
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
