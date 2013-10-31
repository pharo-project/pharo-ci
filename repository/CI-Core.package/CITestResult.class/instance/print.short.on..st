printing
print: anLongErrorMesssage short: aShortString on: aStream 
	isQuiet ifTrue: [ ^ self ].
	
	aStream 
		nextPutAll: anLongErrorMesssage;
		nextPutAll: aShortString.
		
	aStream
		clear; flush; lf.