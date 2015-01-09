# IoSetting
An experimental collection of protos to improve the ergonomics of Io.

# Setup
For simplicity, add an alias to your .bashrc:

	alias iosetting='io -i <path-to-IoSetting.io>'

Or override the "io" command:

	alias io='/usr/local/bin/io -i <path-to-IoSetting.io>'

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

Have you ever wanted to succinctly map select values of a ```List``` or ```Map``` to some other values? ```SelectMap``` is for you. Example:

	List [ 0, 0, 1, 2, 3 ] selectMap(0, 1)
	// yields list(1,1,1,2,3)

There are two other methods, ```selectMapDeep``` which does a deep-mapping (down to non- ```Map```/```List``` elements), and ```selectMapShallow```, which doesn't dispatch the ```map``` method at all, just the conditional. Example:

	list(list(1,2,3), 1, 2) selectMapDeep(1, 7)
	// yields list(list(7, 2, 3), 7, 2)
	
	list(1,2,3) selectMapShallow(list(1,2,3), "a")
	// yields "a"

### ```Mapping```

Using ```SelectMap``` might be inefficient if you have a lot of elements to map. I am not sure if this is really true, but I thought this would be a fun challenge. ```Mapping``` augments ```List``` with a method for construting arbitrarily large mappings that are applied element by element without the need to dispatch map several times.

**TODO:** implement ```mapping``` for ```Map```s.

