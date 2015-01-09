
ListLiteral := Object clone do(
	squareBrackets := method(call evalArgs)
	prettyPrint := method(
		head := "List [\n"
		foot := "  ]\n"
		inner := self map(x asString) join(",\n")
		head .. inner .. foot)
)

List appendProto(ListLiteral)

