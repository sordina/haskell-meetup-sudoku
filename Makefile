
index:
	@ cat index.txt | grep . | sed 's/\([^ ][^ ]*\)\(.*\)$$/\1:1:1: \2/' 1>&2
