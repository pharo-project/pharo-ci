as yet unclassified
testEntity
	| file |
	file := (self publisherClass new) 
		publishValidationResult: 
			((CIValidationResult new) 
				change: ((CITestChange new) name: 'TestEntity' ) ).
	
	self assert: (FileDirectory default fileExists: (file outputDirectory / 'TestEntity', 'xml'))