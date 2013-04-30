as yet unclassified
testContents
	| file path |
	
	file := (self publisherClass new) 
		outputDirectory: FileSystem memory;
		publishValidationResult: 
			((CIValidationResult new) 
				change: ((CITestChange new) name: 'TestEntity' ) ).
	path := file outputDirectory / 'TestEntity', 'xml'.
	
	self assert: (FileDirectory default fileExists: path ).
	self assert: path readStream contents asString = self defaultContent.
	
	path ensureDeleted 
	"filesystem memory"