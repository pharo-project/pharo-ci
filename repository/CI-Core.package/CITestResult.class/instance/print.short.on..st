printing
print: anLongErrorMesssage short: aShortString on: aStream 
	| testCaseString offset |
	
	testCaseString := self currentTestCase printString.
	
	aStream nextPutAll: testCaseString.
	
	"Let's see if we have enough space to print the error"
	offset := 80 - testCaseString size - anLongErrorMesssage size - aShortString size.
	offset < 1
		ifTrue: [ aStream nextPutAll: aShortString. ]
		ifFalse: [ aStream nextPutAll: anLongErrorMesssage ].
		
	aStream
		clear; flush; lf.