
IoSetting := Object clone do(
	importStd := method(
		Range
		Regex
		ListLiteral
		MapLiteral)
	importExperimental := method(
		Mapping)
	importAll := method(
		self importStd
		self importExperimental)
)
