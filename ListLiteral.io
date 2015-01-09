
ListLiteral := Object clone do(
	squareBrackets := method(call evalArgs)
	prettyPrint := method(
		head := "List [\n"
		foot := "  ]\n"
		inner := self map(x, 
			"\t" .. (
				if(x hasSlot("prettyPrint"),
					x prettyPrint,
					x asString))) join(",\n")
		head .. inner .. foot)
)

List appendProto(ListLiteral)

