printing
printOn: aStream
	aStream nextPutAll: 'SLICE '; print: self id; space.
	self isLoadable
		ifTrue: [ 	aStream nextPutAll: self slice url ]
		ifFalse: [ aStream nextPutAll: 'without url' ]