tests
testContents
	| file path directory |
	
	directory := FileSystem memory.
	file := (self publisherClass new) 
		outputDirectory: directory;
		publishValidationResult: (CIValidationResult change: (CITestChange new name: 'TestEntity')).
	path := file outputDirectory / 'TestEntity', 'html'.
	
	self assert: (directory exists: path ).
	self assert: path readStream contents asString = self defaultContent.