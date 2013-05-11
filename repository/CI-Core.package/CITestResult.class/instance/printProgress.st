printing
printProgress
	| maxPositions |
	maxPositions := (self maxTest log + 1) floor.
	self stderr
		nextPut: $[;
		nextPutAll: (currentTest asString padLeftTo: maxPositions);
		nextPut: $/;
		print: self maxTest;
		nextPutAll: '] '.