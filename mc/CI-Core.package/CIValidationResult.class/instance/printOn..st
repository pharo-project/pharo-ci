printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< '( Errors: '; print: self errors size; 
		<< ', Warnings: '; print: self warnings size; 
		<< ', Messages: '; print: self messages size;
		<< ' )'