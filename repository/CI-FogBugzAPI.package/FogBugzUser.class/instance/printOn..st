printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: '( '.
	self id printOn: aStream.
	aStream nextPutAll: ' - '.
	self username printOn: aStream.
	aStream nextPutAll: ' - '.
	self mail printOn: aStream.
	aStream nextPutAll: ' )'.