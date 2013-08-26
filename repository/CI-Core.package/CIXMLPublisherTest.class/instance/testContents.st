tests
testContents
	| file path directory |
	
	directory := FileSystem memory.
	file := (self publisherClass new) 
		outputDirectory: directory;
		publishValidationResult: (CIValidationResult change: (CITestChange new name: 'TestEntity')).
	path := file outputDirectory / 'TestEntity', 'xml'.
	
	self assert: (directory exists: path ) description: 'Testing the creation of xml file'.
	self assert: path readStream contents asString equals: self defaultContent.