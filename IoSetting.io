
IoSetting := Object clone do(
	importStd := method(
		Range
		Regex
		ListLiteral
		MapLiteral)
	importExperimental := method(
		SelectMap
		Mapping)
	importAll := method(
		self importStd
		self importExperimental)
)
