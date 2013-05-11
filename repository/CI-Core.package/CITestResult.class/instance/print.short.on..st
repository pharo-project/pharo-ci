printing
print: anLongErrorMesssage short: aShortString on: aStream 
	
	aStream 
		nextPutAll: anLongErrorMesssage;
		nextPutAll: aShortString.
		
	aStream
		clear; flush; lf.