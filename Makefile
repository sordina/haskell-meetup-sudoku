
index:
	@ cat index.txt | grep . | sed 's/\([^ ][^ ]*\)\(.*\)$$/\1:1:1: \2/' 1>&2

check:
	@for i in Slides/*.lhs; do ghc -fno-code $$i > /dev/null ; done
