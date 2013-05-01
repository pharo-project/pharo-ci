printing
print: anLongErrorMesssage short: aShortString on: aStream 
	| testCaseString offset |
	testCaseString := self currentTestCase printString.
	
	aStream 
		startOfLine; clearToEnd; nextPutAll: testCaseString.
	
	aStream startOfLine; right: (80 - aShortString size); 
			nextPutAll: aShortString.
			
	"Let's see if we have enough space to print the error"
	offset := 80 - testCaseString size - anLongErrorMesssage size - aShortString size.
	offset < 1
		ifFalse: [ 
			aStream right: offset;
				nextPutAll: anLongErrorMesssage ].
		
	aStream
		clear; flush; lf.