printing
printOpenIssue: aCIChange

	stdout 
		print: aCIChange id; tab;
		nextPutAll: aCIChange publicUrl; tab;
		nextPutAll: aCIChange name; lf