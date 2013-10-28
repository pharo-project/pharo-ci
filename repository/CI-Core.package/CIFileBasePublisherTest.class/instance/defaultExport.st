testing
defaultExport
	| publisher change |
	
	change := CITestChange new
		id: 'TestId';
		name: 'TestName';
		yourself.
	
	publisher := (self publisherClass new) 
		outputDirectory: FileSystem memory workingDirectory;
		publishValidationResult: (CIValidationResult change: change).
		
	^ publisher outputDirectory / 'TestId', self fileExtension.
	