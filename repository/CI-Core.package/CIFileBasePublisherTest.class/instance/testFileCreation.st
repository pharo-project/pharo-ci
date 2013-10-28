tests
testFileCreation
	| file |
	
	file := self defaultExport.
	
	self assert: file exists.
	self assert: file readStream contents size > 100.
	
	^ file