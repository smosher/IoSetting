FatArrow := Object clone do(
	squareBrackets := method(
		k := call argAt(0) name
		v := call argAt(1) asMessageWithEvaluatedArgs
		list(k,v)
	)
)

MapLiteral := Object clone do(
	curlyBrackets := method(
		env := call sender clone
		x := Map clone
		call message arguments map(arg,
			arg doInContext(FatArrow)) \
			foreach(p,
				x atPut(p first, p second)))

	prettyPrint := method(
		head := "Map {\n"
		foot := "  }\n"
		inner := self map(k,v,
			"\t[#{k}, #{v}]" interpolate) join(",\n")
		head .. inner .. foot)
)

Map appendProto(MapLiteral)

