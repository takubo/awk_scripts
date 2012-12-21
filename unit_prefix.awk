#!/usr/bin/awk -f

BEGIN {
    numeral[0]  = ""
    numeral[1]  = "[K]"
    numeral[2]  = "[M]"
    numeral[3]  = "[G]"
    numeral[4]  = "[T]"
    numeral[5]  = "[P]"
    numeral[6]  = "[E](エクサ)"
    numeral[7]  = "[Z](ゼタ)"
    numeral[8]  = "[Y](ヨタ)"
}

#/^\s*(-\s*)?([0-9]+(( |,)?[0-9])?)+\s*$/ {
/^( |\t)*(-( |\t)*)?([0-9]+(( |,)?[0-9])?)+( |\t)*$/ {
	if (/-/) {
		minus = "-"
	} else {
		minus = ""
	}

	#gsub(/\s|-|,/, "")
	gsub(/ |\t|-|,/, "")

	ans = ""

	len = length($0)
	div = int(len / 3)
	mod = int(len % 3)

	if ( mod ) {
		ans = substr($0, 1, mod) numeral[div]
		$0 = substr($0, mod + 1, len)
	}

	for (i = div; i > 0; i--) {
		ans = ans substr($0, 1, 3) numeral[i - 1]
		$0 = substr($0, 4, len)
	}

	print minus ans
}
