# IoSetting
An experimental collection of protos to improve the ergonomics of Io.

# Setup
For simplicity, add an alias to your .bashrc:

	alias iosetting='io -i <path-to-IoSetting.io>'

# Usage

By default IoSetting doesn't do much execpt to implicitly add its containing folder to the importer pathm, which will allow you to load the modules simply by referencing them.

If you want to bulk-load some protos, the following methods are available:

	IoSetting importStd
	IoSetting importExperimental
	IoSetting importAll

```importStd``` imports set of protos that are expected to be fairly stable, including ```Range``` and ```Regex``` from the Io distribution. These two are loaded for convenience since they supply methods to other protos.

```importExperimental``` imports some experimental protos which haven't been very well tested.

# Protos

## Standard Protos

### ```Range```, ```Regex```

As mentioned above, these aren't new. They're loaded so that you won't have to load them separately.

### ```ListLiteral```

This proto augments ```List```, allowing you to write lists in a more pleasing form. Example:

	List [ 1, 2, 3, 4 ]

This isn't always better looking to be honest, but sometimes it genuinely makes the code read better.

### ```MapLiteral```

This proto is like ```ListLiteral``` above as applied to the ```Map``` type. Example:

	Map { [one, 1], [two, 2], [three, 3], [five, 5] }

```MapLiteral``` uses an included ```FatArrow``` proto to construct pairs, auto-quoting the first item (since only ```Sequences``` may be used as ```Map``` keys) and inserts them into a ```Map``` for you. This solves the problem of awkwardly adding keys and values to a when initializing a ```Map```.

## Experimental Protos

### ```SelectMap```

Currently broken. Do not use.

### ```Mapping```

Using ```SelectMap``` might be inefficient if you have a lot of elements to map. I am not sure if this is really true, but I thought this would be a fun challenge. ```Mapping``` augments ```List``` with a method for construting arbitrarily large mappings that are applied element by element without the need to dispatch map several times. Example:

	List [ 1, 2, 3, 4 ] mapping( [1,2], [4,2] )
	// yields list(2,2,3,2)

**TODO:** implement ```mapping``` for ```Map```s.

# Other

## Pretty-printers for Literals

The DSLs for literals include a ```prettyPrint``` function for emitting a homoiconic pretty-printed string of the value in the DSL form. Examples:

	Map { [ one, 2 ] } prettyPrint
	/* yields:
		"Map {
			[one, 2]  }"
	*/

	List [ 1,2,3,4 ] prettyPrint
	/* yeilds:
		"List [
			1,
			2,
			3,
			4  ]" 
	*/

Pretty-printers are will use ```prettyPrint``` on each value if it has the slot, and also make an attept at keeping indentation consistent.

	Map { [a, Map {[b,10]} ], [c, List [1,2,3,4]] } prettyPrint
	/* yields:
		"Map {
			[c, List [
				1, 
				2, 
				3, 
				4  ]],
			[a, Map {
					[b, 10]  }]  }"
	*/

