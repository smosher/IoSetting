ListLiteral

Mapping := Object clone do(
	mapping := method(
		terms := call message arguments map(doInContext(ListLiteral))
		switchMap := doString("method(x, x switch(" \
			.. terms push("x") flatten join(", ") \
			.. "))")
		self map(x, switchMap(x)))
)

List appendProto(Mapping)

