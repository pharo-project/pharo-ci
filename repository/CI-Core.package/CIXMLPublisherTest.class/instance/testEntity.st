tests
testEntity
	| file directory path |
	
	directory := FileSystem memory.
	file := (self publisherClass new) 
		outputDirectory: directory;
		publishValidationResult: (CIValidationResult change: (CITestChange new name: 'TestEntity')).
	path := file outputDirectory / 'TestEntity', 'xml'.
	
	self assert: (directory exists: path ) description: 'Testing the creation of the xml file'.