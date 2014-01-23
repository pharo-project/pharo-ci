accessing
newError
	^ [ 0 notUnderStoodFoo ] on: Error do: [ :err | ^ err freeze ]