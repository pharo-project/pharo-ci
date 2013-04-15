accessing
serializer
	^ serializer ifNil: [ self loadSerializer ]