front
writePreloadFile: aString

	| stream string |
	string := aString.
	aString ifNil: [ string := '' ].
	stream := FileStream forceNewFileNamed: 'preload.st'.
	stream nextPutAll: string