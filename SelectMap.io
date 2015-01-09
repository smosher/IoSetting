
SelectMapObject := Object clone do(
	selectMap := method(x,y,
		self selectMapShallow(x,y))
	selectMapDeep := method(x,y, 
		self(selectMapShallow(x,y)))
	selectMapShallow := method(x,y,
		if(self == x, y, x))
)

SelectMap := Object clone do(
	selectMap := method(x,y,
		self map(selectMapShallow(x,y)))
	selectMapDeep := method(x,y,
		self map(selctMapDeep(x,y)))
	selectMapShallow := method(x,y,
		if(self == x, y, x))
)

List appendProto(SelectMap)
Map appendProto(SelectMap)
Object appendProto(SelectMapObject)

