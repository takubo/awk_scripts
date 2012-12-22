#!/bin/sh
awk -f fibonacci.awk $1 g | gnuplot
