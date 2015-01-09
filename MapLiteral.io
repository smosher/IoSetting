FatArrow := Object clone do(
	squareBrackets := method(
		k := call argAt(0) name
		v := call evalArgAt(1)
		list(k,v)
	)
)

MapLiteral := Object clone do(
	curlyBrackets := method(
		x := Map clone
		call message arguments map(arg,
			arg doInContext(FatArrow, call sender)) \
			foreach(p,
				x atPut(p first, p second)))

	prettyPrint := method(
		head := "Map {\n"
		foot := "  }\n"
		inner := self map(k,v,
			vprime := if(v hasSlot("prettyPrint"),
				v prettyPrint split("\n") join("\n\t"),
				v asString)
			"\t[#{k}, #{vprime}]" interpolate) join(",\n")
		head .. inner .. foot)
)

Map appendProto(MapLiteral)

