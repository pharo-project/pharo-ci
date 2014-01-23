accessing
tagsStringOn: aStream
	self tags
		do: [ :tag | aStream nextPut: $"; nextPutAll: tag asString; nextPut: $" ]
		separatedBy: [ aStream space ]