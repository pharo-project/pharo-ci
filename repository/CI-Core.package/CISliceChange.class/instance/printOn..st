printing
printOn: aStream
	aStream nextPutAll: 'SLICE '; print: self id; space.
	aStream nextPutAll: self slice url 