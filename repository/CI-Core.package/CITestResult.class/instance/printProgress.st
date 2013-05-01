printing
printProgress
	| string |
	string := '[',currentTest asString, '/', self maxTest asString,']'.
	self stderr 
		startOfLine; right: (80 - string size); nextPutAll: string.