printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: '( '.
	self id printOn: aStream.
	aStream nextPutAll: ' - '.
	self title printOn: aStream.
	aStream nextPutAll: ' )'.