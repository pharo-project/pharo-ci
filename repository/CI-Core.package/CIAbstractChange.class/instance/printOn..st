printing
printOn: aStream

	aStream 
		nextPutAll: 'a CIChange(';
		nextPutAll: self name;
		nextPut: $).