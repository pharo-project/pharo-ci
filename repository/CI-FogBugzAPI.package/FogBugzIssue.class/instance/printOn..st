printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' ('.
	id printOn: aStream.
	aStream nextPutAll: ' - '.
	title printOn: aStream.
	aStream nextPutAll: ' - '.
	project printOn: aStream.
	aStream nextPutAll: '('.
	self events size printOn: aStream.
	aStream nextPutAll: ' events))'.