front
writePostloadFile: aString

	| stream string |
	string := aString.
	aString ifNil: [ string := '' ].
	stream := FileStream forceNewFileNamed: 'postload.st'.
	stream nextPutAll: string